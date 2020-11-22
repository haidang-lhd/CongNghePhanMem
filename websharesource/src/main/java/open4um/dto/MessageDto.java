package  open4um.dto;

import java.sql.Timestamp;

import org.springframework.stereotype.Repository;

@Repository
public class MessageDto {
	private String username;
	private String content;
	private Timestamp datemsg;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getDatemsg() {
		return datemsg;
	}
	public void setDatemsg(Timestamp datemsg) {
		this.datemsg = datemsg;
	}
	
}
