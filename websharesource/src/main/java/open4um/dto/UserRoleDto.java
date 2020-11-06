package tp.kits3.open4um.dto;



public class UserRoleDto {
	private int userid;
	private String username;
	private String phone;
	private String avatar;
	private String email;
	private String roleaccount_name ;
	private String status;
	private int money;
	public UserRoleDto() {
		super();
	}
	/**
	 * @param userid
	 * @param username
	 * @param phone
	 * @param email
	 * @param roleaccount_name
	 * @param status
	 * @param money
	 * @param avatar 
	 */
	public UserRoleDto( int userid,String username, String phone, String email, String roleaccount_name,
			String status, int money, String avatar) {
		super();
		
		this.userid = userid;
		this.username = username;
		this.phone = phone;
		this.avatar = avatar;
		this.email = email;
		this.roleaccount_name = roleaccount_name;
		this.status = status;
		this.money = money;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRoleaccount_name() {
		return roleaccount_name;
	}
	public void setRoleaccount_name(String roleaccount_name) {
		this.roleaccount_name = roleaccount_name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}

}
