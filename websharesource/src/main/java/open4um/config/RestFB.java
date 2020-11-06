package tp.kits3.open4um.config;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Version;

import tp.kits3.open4um.dto.UserLoginDto;
import tp.kits3.open4um.service.UserService;
import tp.kits3.open4um.vo.RoleUser;

/*
 * 
 */

@Component
public class RestFB {
	public static String FACEBOOK_APP_ID = "1041055959643557";
	public static String FACEBOOK_APP_SECRET = "314f18ba0e60fc7093975ca7f990f4ed";
	public static String FACEBOOK_REDIRECT_URL = "https://localhost:8443/open4um/api/loginFB";
	public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";
	
	@Autowired
	private UserService userService;
	
	public String getToken(final String code) throws ClientProtocolException, IOException {
		String link = String.format(FACEBOOK_LINK_GET_TOKEN, FACEBOOK_APP_ID, FACEBOOK_APP_SECRET,
				FACEBOOK_REDIRECT_URL, code);
		String response = Request.Get(link).execute().returnContent().asString();
		
		ObjectMapper mapper = new ObjectMapper();
		
		JsonNode node = mapper.readTree(response).get("access_token");
		
		
		return node.textValue();
	}

	public com.restfb.types.User getUserInfo(final String accessToken) {
		FacebookClient facebookClient = new DefaultFacebookClient(accessToken, FACEBOOK_APP_SECRET, Version.LATEST);
		return facebookClient.fetchObject("me", com.restfb.types.User.class);
	}

	public UserDetails buildUser(com.restfb.types.User user) {
		
		boolean enabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;
		UserDetails userDetail;
		
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		List<UserLoginDto> listUs = userService.selectLoginFB(user.getId());
		
		if(listUs.size() > 0) {
			for (UserLoginDto item : listUs) {
				authorities.add(new SimpleGrantedAuthority("ROLE_" + item.getRoleaccount_name()));
			}
			
		}else {		
			tp.kits3.open4um.vo.User userFB = new tp.kits3.open4um.vo.User();
			String[] avatar = {"cn_1","hn_2.jpg","tn_3.jpg","mn_4.jpg","rn_5.jpg","pn_6.jpg"};
			Random rd = new Random();
			int index_avt = rd.nextInt(6);
			userFB.setFbid(user.getId());
			userFB.setUsername(user.getName());
			userFB.setStatus("active");
			userFB.setAvatar(avatar[index_avt]);
			int row = userService.insertUserFB(userFB);
			
			userFB  = userService.selectUserFB(user.getId());
			
			RoleUser roleUser = new RoleUser();
			roleUser.setRoleid(1);
			roleUser.setUserid(userFB.getUserid());
			int row1 = userService.insertRoleUser(roleUser);
			
			List<UserLoginDto> listUsNew = userService.selectLoginFB(user.getId());
			
			for (UserLoginDto item : listUsNew) {
				authorities.add(new SimpleGrantedAuthority("ROLE_" + item.getRoleaccount_name()));
			}
		}
		userDetail = new User(user.getName(), user.getId(), enabled, accountNonExpired, credentialsNonExpired,
				accountNonLocked, authorities);
		return userDetail;
	}
}
