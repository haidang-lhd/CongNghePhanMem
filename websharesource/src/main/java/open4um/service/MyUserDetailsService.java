package  open4um.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import  open4um.dto.UserLoginDto;

public class MyUserDetailsService implements UserDetailsService {

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		 
		UserService sv = new UserService();

		List<UserLoginDto> userr = sv.selectLogin(username);
		
		if (userr.size() == 0) {
			throw new UsernameNotFoundException("User not found!");

		} else {
			Set<GrantedAuthority> grantedAuthorities = new HashSet<GrantedAuthority>();

			for (UserLoginDto item : userr) {
				 
				grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_" + item.getRoleaccount_name()));
			}
			return new User(userr.get(0).getUsername(), userr.get(0).getPassword(), grantedAuthorities);
		}
	}

}
