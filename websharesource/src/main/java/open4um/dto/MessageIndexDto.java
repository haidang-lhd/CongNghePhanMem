package  open4um.dto;

import java.sql.Timestamp;

public class MessageIndexDto {
	
	private int messid;
	private int senduserid;
	private String sendusername;
	private String content;
	private Timestamp datemsg;
	public int getMessid() {
		return messid;
	}
	public void setMessid(int messid) {
		this.messid = messid;
	}
	public int getSenduserid() {
		return senduserid;
	}
	public void setSenduserid(int senduserid) {
		this.senduserid = senduserid;
	}
	public String getSendusername() {
		return sendusername;
	}
	public void setSendusername(String sendusername) {
		this.sendusername = sendusername;
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
