package  open4um.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import  open4um.config.HMAC;
import  open4um.dto.DownloadDto;
import  open4um.dto.ResultMomoDto;
import  open4um.service.OrderHistoryService;
import  open4um.service.SourceService;
import  open4um.service.UserService;
import  open4um.vo.OrderHistory;
import  open4um.vo.Source;
import  open4um.vo.User;

@Controller
public class SourceController {
	
	@Autowired
	OrderHistoryService his;
	
	@Autowired
	UserService uService;
	
	@PostMapping("/api/history-download")
	@ResponseBody
	public Map checkDownload(@RequestBody DownloadDto download) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("userid", userService.selectOne(download.getUsername()).getUserid());
		map.put("sourceid", download.getSourceid());
		OrderHistory order = his.selectHistory(map);
		
		User us = uService.selectOne(download.getUsername());
		us.getMoney();
		
		Source s = src.selectOne(download.getSourceid());
	
		Map m = new HashMap<String, Object>();
		m.put("money", us.getMoney());
		m.put("price", s.getPrice());
		
		if(order != null) {
			m.put("result", true);
		}
		return m;
	}
	
	@Autowired
	SourceService src;
	
	@PostMapping("/api/download")
	@ResponseBody
	public ResultMomoDto depositMomo(@RequestBody DownloadDto download) {
		Source dto = src.selectOne(download.getSourceid());
		Date date = new Date();
		String partnerCode = "MOMOUEKG20200824";
		String accessKey = "9Q97F7BczH1re1Je";
		String requestId = String.valueOf(date.getTime());
		String amount = String.valueOf(dto.getPrice());
		String orderId = String.valueOf(date.getTime());
		String orderInfo = userService.selectOne(download.getUsername()).getUserid() + "BUY" + download.getSourceid();
		String returnUrl = "http://localhost:8080/open4um/download/success";
		String notifyUrl = "https://google.com.vn";
		String extraData = "OK";

		String secretKey = "KjNXK6Kg1pyzJaSxnrV2aLaGY8PjUGqO";
		String data = "partnerCode=" + partnerCode + "&accessKey=" + accessKey + "&requestId=" + requestId + "&amount=" + amount + "&orderId=" + orderId + "&orderInfo=" + orderInfo + "&returnUrl=" + returnUrl + "&notifyUrl=" + notifyUrl + "&extraData=" + extraData;
		String signature = "";
		try {
			signature = HMAC.encode(secretKey, "partnerCode=" + partnerCode + "&accessKey=" + accessKey + "&requestId=" + requestId + "&amount=" + amount + "&orderId=" + orderId + "&orderInfo=" + orderInfo + "&returnUrl=" + returnUrl + "&notifyUrl=" + notifyUrl + "&extraData=" + extraData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		JSONObject json = new JSONObject();
		
		try {
			json.put("partnerCode", partnerCode);
			json.put("accessKey", accessKey);
			json.put("requestId", requestId);
			json.put("amount", amount);
			json.put("orderId", orderId);
			json.put("orderInfo", orderInfo);
			json.put("returnUrl", returnUrl);
			json.put("notifyUrl", notifyUrl);
			json.put("extraData", extraData);
			json.put("requestType", "captureMoMoWallet");
			json.put("signature", signature);
		} catch (JSONException e) {
			e.printStackTrace();
		}

		try {
			URL url = new URL("https://test-payment.momo.vn/gw_payment/transactionProcessor");
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true);
			connection.setRequestProperty("Content-Type", "application/json");
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Accept", "application/json");
			connection.setConnectTimeout(5000);
			connection.setReadTimeout(5000);
			OutputStreamWriter out = new OutputStreamWriter(connection.getOutputStream());
			out.write(json.toString());
			out.close();

			BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String line;
			StringBuilder sb = new StringBuilder();
			
			while ((line = in.readLine()) != null) {
				sb.append(line);
			}
			
			JSONObject jsonObj = new JSONObject(sb.toString());
			in.close();
			ResultMomoDto momo = new ResultMomoDto();
			momo.setLink(jsonObj.getString("payUrl"));
			return momo;
		} catch (Exception e) {
			System.out.println("\nError while calling Crunchify REST Service");
			System.out.println(e);
		}
		
		return null;
	}
	
	@Autowired
	SourceService sourceService;
	
	@GetMapping("/download/success")
	public String addMoney(HttpServletRequest req) {
		String partnerCode = req.getParameter("partnerCode");
		String accessKey = req.getParameter("accessKey");
		String responseTime = req.getParameter("responseTime");
		String orderInfo = req.getParameter("orderInfo");
		String amount = req.getParameter("amount");
		String[] id = orderInfo.split("BUY");
		String ctgname = src.selectNameCategory(Integer.parseInt(id[id.length - 1]));
		if(partnerCode.equalsIgnoreCase("MOMOUEKG20200824") && accessKey.equalsIgnoreCase("9Q97F7BczH1re1Je") && Integer.parseInt(req.getParameter("errorCode")) == 0) {
			OrderHistory or = new OrderHistory();
			or.setOrderdate(java.sql.Timestamp.valueOf(responseTime));
			or.setUserid(Integer.parseInt(id[0]));
			or.setSourceid(Integer.parseInt(id[id.length - 1]));
			his.insert(or);
			
//			Add money
			Source s = sourceService.selectOne(Integer.parseInt(id[id.length - 1]));
			User us = userService.selectProfile(s.getUserid());
			
			us.setMoney(us.getMoney() + s.getPrice());
			userService.update(us);
			
			return "redirect:/source/" + Integer.parseInt(id[id.length - 1]) + "/" + ctgname;
		} else {
			System.out.println("Error!!!!");
		}
		return "redirect:/source/" + Integer.parseInt(id[id.length - 1]) + "/" + ctgname;
	}
	
	@GetMapping("/download/buy/{sourceid}")
	public String buySourceMoney(HttpServletRequest req, @PathVariable(value = "sourceid") int sourceid) {
			
			UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			User us = userService.selectOne(userDetails.getUsername());
			
//			GET INFO SOURCE
			Source dto = src.selectOne(sourceid);
			
			if(us.getMoney() >= dto.getPrice()) {
				us.setMoney(us.getMoney() - dto.getPrice());
				userService.update(us);
				int userid = us.getUserid();
				
				OrderHistory or = new OrderHistory();
				or.setUserid(userid);
				or.setSourceid(sourceid);
				
				Timestamp timestamp = new Timestamp(System.currentTimeMillis());
				or.setOrderdate(timestamp);
				
				his.insert(or);
				
//				Add money
				Source s = sourceService.selectOne(sourceid);
				User user = userService.selectProfile(s.getUserid());
				user.setMoney(user.getMoney() + s.getPrice());
				userService.update(user);
				
				String ctgname = src.selectNameCategory(sourceid);
				return "redirect:/source/" + sourceid + "/" + ctgname;
			} else {
				return "redirect:/";
			}
	}
	
	@Autowired
	UserService userService;
	
	@GetMapping("/download/{id}")
	public String downloadSource(HttpServletRequest req, HttpServletResponse resp, @PathVariable(value = "id") int id) throws IOException {
		
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int userid = userService.selectOne(userDetails.getUsername()).getUserid();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("userid", userid);
		map.put("sourceid", id);
		OrderHistory order = his.selectHistory(map);
		if(order != null) {
			Source dto = src.selectOne(id);
			String fileName = dto.getSize();
			OutputStream out = resp.getOutputStream();
			File sendFile = new File(req.getServletContext().getRealPath("resources/upload/") + fileName);
			resp.setHeader("Cache-Control", "no-cache");
			resp.addHeader("Content-disposition", "attachment; filename=" + fileName);
			
			FileInputStream in = new FileInputStream(sendFile);
			byte[] buffer = new byte[1024 * 8];
			while(true) {
				int count = in.read(buffer);
				if(count == -1) {
					break;
				}
				out.write(buffer, 0, count);
			}
			in.close();
			out.close();
		}
		return "redirect:/";
	}
}
