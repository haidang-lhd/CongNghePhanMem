package tp.kits3.open4um.config;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import tp.kits3.open4um.dto.GooglePojo;
import tp.kits3.open4um.dto.UserLoginDto;
import tp.kits3.open4um.service.UserService;
import tp.kits3.open4um.vo.RoleUser;
/*
 * 
 */
@Component
public class GoogleUtils {
	public static String GOOGLE_CLIENT_ID = "1055902144348-1m5kde8jfcivc66mku9rhtktgc5j1835.apps.googleusercontent.com";
	public static String GOOGLE_CLIENT_SECRET = "KPFLh_nx7REljh5VA5FYDr0j";
	public static String GOOGLE_REDIRECT_URI = "https://localhost:8443/open4um/api/loginGmail";
	public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
	public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
	public static String GOOGLE_GRANT_TYPE = "authorization_code";

	@Autowired
	private UserService userService;

	public String getToken(final String code) throws ClientProtocolException, IOException {
		String response = Request.Post(GOOGLE_LINK_GET_TOKEN)
				.bodyForm(Form.form().add("client_id", GOOGLE_CLIENT_ID).add("client_secret", GOOGLE_CLIENT_SECRET)
						.add("redirect_uri", GOOGLE_REDIRECT_URI).add("code", code).add("grant_type", GOOGLE_GRANT_TYPE)
						.build())
				.execute().returnContent().asString();
		ObjectMapper mapper = new ObjectMapper();
		JsonNode node = mapper.readTree(response).get("access_token");
		return node.textValue();
	}

	public GooglePojo getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
		String link = GOOGLE_LINK_GET_USER_INFO + accessToken;
		String response = Request.Get(link).execute().returnContent().asString();
		ObjectMapper mapper = new ObjectMapper();
		GooglePojo googlePojo = mapper.readValue(response, GooglePojo.class);

		return googlePojo;
	}

	public UserDetails buildUser(GooglePojo googlePojo) {

		boolean enabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;

		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

		List<UserLoginDto> listUsGmail = userService.selectLoginGmail(googlePojo.getId());

		if (listUsGmail.size() > 0) {
			for (UserLoginDto item : listUsGmail) {
				authorities.add(new SimpleGrantedAuthority("ROLE_" + item.getRoleaccount_name()));
			}
			 
		} else {
			String[] avatar = {"cn_1.jpg","hn_2.jpg","tn_3.jpg","mn_4.jpg","rn_5.jpg","pn_6.jpg"};
			Random rd = new Random();
			int index_avt = rd.nextInt(6);
			String usG = googlePojo.getEmail();
			String[] arrUs = usG.split("@");
			String name =arrUs[0];
			tp.kits3.open4um.vo.User usGmail = new tp.kits3.open4um.vo.User();
			usGmail.setUsername(name);
			usGmail.setStatus("active");
			usGmail.setEmailid(googlePojo.getId());
			usGmail.setEmail(googlePojo.getEmail());
			usGmail.setAvatar(avatar[index_avt]);
			userService.insertUserGmail(usGmail);
			usGmail = userService.selectUserGmail(googlePojo.getId());
			
			RoleUser roleUserGmail = new RoleUser();
			roleUserGmail.setUserid(usGmail.getUserid());
			roleUserGmail.setRoleid(1);
			userService.insertRoleUserGmail(roleUserGmail);
			List<UserLoginDto> listUsGmailNew = userService.selectLoginGmail(usGmail.getEmailid());
			for (UserLoginDto item : listUsGmailNew) {
				authorities.add(new SimpleGrantedAuthority("ROLE_" + item.getRoleaccount_name()));
			}
		}

		UserDetails userDetail = new User(googlePojo.getEmail(), googlePojo.getId(), enabled, accountNonExpired,
				credentialsNonExpired, accountNonLocked, authorities);

		return userDetail;
	}

}
