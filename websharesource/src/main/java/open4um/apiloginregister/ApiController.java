package open4um.apiloginregister;

import java.io.IOException;
import java.util.Collection;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.ClientProtocolException;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import  open4um.config.GoogleUtils;
import  open4um.dto.GooglePojo;
import  open4um.service.UserService;
import  open4um.vo.RoleUser;
import  open4um.vo.User;

 
@Controller
@RequestMapping("/api")
@SessionAttributes("user")
public class ApiController {

	@Autowired
	private UserService userService;

	@Autowired
	private  open4um.config.RestFB restFB;

	@Autowired
	private GoogleUtils googleUtils;

	@RequestMapping("/login")
	public String loggin() {
		return "users/login";
	}

	@RequestMapping("/author")
	public String author(Model model) {

		Collection<? extends GrantedAuthority> allRole = SecurityContextHolder.getContext().getAuthentication()
				.getAuthorities();

		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		 
		User us = userService.selectUser(userDetails.getUsername());
		
		if(us != null) {
			if(us.getMoney() == null) {
				us.setMoney(0.0);
			}
			model.addAttribute("user", us);
		}else {
			User usGmail = userService.selectUserGmail(userDetails.getPassword());
			if(usGmail.getMoney() == null) {
				usGmail.setMoney(0.0);
			}
			model.addAttribute("user", usGmail);
		}
		
		for (GrantedAuthority s : allRole) {
			if (s.toString().equalsIgnoreCase("ROLE_admin")) {
				return "redirect:/admin/";
			}
		}
		return "redirect:/";
	}

	@RequestMapping("/register")
	public String register(User user, Model model, RoleUser roleUser) {
		String hash = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12));
		user.setPassword(hash);
		user.setStatus("active");
		user.setMoney(0.0);
		String us = user.getUsername();
		String[] avatar = {"cn_1.jpg","hn_2.jpg","tn_3.jpg","mn_4.jpg","rn_5.jpg","pn_6.jpg"};
		Random rd = new Random();
		int index_avt = rd.nextInt(6);
		user.setAvatar(avatar[index_avt]);
		userService.insertUser(user);
		user = userService.selectUser(us);

		roleUser.setUserid(user.getUserid());
		roleUser.setRoleid(1);
		userService.insertRoleUser(roleUser);
		model.addAttribute("user", user);
		return "redirect:/";
	}

	@RequestMapping("/loginFB")
	public String logginFB(HttpServletRequest request, Model model) {
		String code = request.getParameter("code");
		String accessToken = "";
		try {
			accessToken = restFB.getToken(code);
		} catch (IOException e) {
			return "users/404";
		}
		com.restfb.types.User user = restFB.getUserInfo(accessToken);

		UserDetails userDetail = restFB.buildUser(user);

		UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null,
				userDetail.getAuthorities());

		 open4um.vo.User userr = userService.selectUserFB(userDetail.getPassword());
		if(userr.getMoney() == null) {
			userr.setMoney(0.0);
		}

		if (userr != null) {
			model.addAttribute("user", userr);
		}
		authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
		SecurityContextHolder.getContext().setAuthentication(authentication);

		return "redirect:/api/author";
	}

	@RequestMapping("/loginGmail")
	public String logginGmail(HttpServletRequest request) throws ClientProtocolException, IOException {
		String code = request.getParameter("code");

		if (code == null || code.isEmpty()) {
			return "users/404";
		}
		
		String accessToken = googleUtils.getToken(code);

		GooglePojo googlePojo = googleUtils.getUserInfo(accessToken);

		UserDetails userDetail = googleUtils.buildUser(googlePojo);
		
		
		UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null,
				userDetail.getAuthorities());

		authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));

		SecurityContextHolder.getContext().setAuthentication(authentication);

		return "redirect:/api/author";

	}
}
