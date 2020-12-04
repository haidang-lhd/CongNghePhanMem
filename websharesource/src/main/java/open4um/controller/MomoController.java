package  open4um.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import  open4um.config.HMAC;
import  open4um.dto.DepositDto;
import  open4um.dto.ResultMomoDto;
import  open4um.service.HistoryMoneyService;
import  open4um.service.UserService;
import  open4um.vo.HistoryMoney;
import  open4um.vo.User;

 

@Controller
public class MomoController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	HistoryMoneyService historyService;
	
	@PostMapping("/api/deposit")
	@ResponseBody
	public ResultMomoDto depositMomo(@RequestBody DepositDto deposit) {
		
		Date date = new Date();
		String partnerCode = "MOMOUEKG20200824";
		String accessKey = "9Q97F7BczH1re1Je";
		String requestId = String.valueOf(date.getTime());
		String amount = String.valueOf(deposit.getMoney());
		String orderId = String.valueOf(date.getTime());
		String orderInfo = String.valueOf(date.getTime()) + "DEPOSIT" + userService.selectOne(deposit.getUsername()).getUserid();
		String returnUrl = "http://localhost:8080/open4um/deposit/success";
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
	
	@GetMapping("/deposit/success")
	public String addMoney(HttpServletRequest req) {
		String partnerCode = req.getParameter("partnerCode");
		String accessKey = req.getParameter("accessKey");
		String responseTime = req.getParameter("responseTime");
		String orderInfo = req.getParameter("orderInfo");
		String amount = req.getParameter("amount");
		if(partnerCode.equalsIgnoreCase("MOMOUEKG20200824") && accessKey.equalsIgnoreCase("9Q97F7BczH1re1Je") && Integer.parseInt(req.getParameter("errorCode")) == 0) {
			String[] id = orderInfo.split("DEPOSIT");
			User user =  userService.selectProfile(Integer.parseInt(id[id.length - 1]));
			user.setMoney(user.getMoney() + Integer.parseInt(amount));
			userService.update(user);
			HistoryMoney his = new HistoryMoney();
			his.setMoney(Double.parseDouble(amount));
			his.setDate(java.sql.Timestamp.valueOf(responseTime));
			his.setDiscription(id[0] + " NAP TIEN");
			his.setUserid(Integer.parseInt(id[id.length - 1]));
			historyService.insert(his);
			return "redirect:/";
		} else {
			System.out.println("Error!!!!");
		}
		return "redirect:/";
	}
}
