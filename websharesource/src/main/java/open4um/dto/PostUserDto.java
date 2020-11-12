package tp.kits3.open4um.dto;

import tp.kits3.open4um.vo.Product;

public class PostUserDto extends Product {
	private String username;
	private String time;
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
}
