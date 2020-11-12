package tp.kits3.open4um.dto;

import java.sql.Timestamp;

public class CommentProductDto {
	
	private int cmtid;
	private int userid;
	private String username;
	private Timestamp datecmt;
	private String cmtname;
	private int parent;
	private int productid;
	
	public int getCmtid() {
		return cmtid;
	}
	public void setCmtid(int cmtid) {
		this.cmtid = cmtid;
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
	public Timestamp getDatecmt() {
		return datecmt;
	}
	public void setDatecmt(Timestamp datecmt) {
		this.datecmt = datecmt;
	}
	public String getCmtname() {
		return cmtname;
	}
	public void setCmtname(String cmtname) {
		this.cmtname = cmtname;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	
	
}
