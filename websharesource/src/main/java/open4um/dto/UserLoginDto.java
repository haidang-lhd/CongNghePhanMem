package tp.kits3.open4um.dto;

import org.springframework.stereotype.Component;

import tp.kits3.open4um.vo.User;

@Component
public class UserLoginDto extends User {
	 
	private int roleid;

	 
	private String roleaccount_name;
	 
 
	public int getRoleid() {
		return roleid;
	}

	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}

	public String getRoleaccount_name() {
		return roleaccount_name;
	}

	public void setRoleaccount_name(String roleaccount_name) {
		this.roleaccount_name = roleaccount_name;
	}

}
