package tp.kits3.open4um.dto;

import java.sql.Timestamp;

public class PostDto {
	private int proid;
	private String title;
	private String username;
	private String avatar;
	private String image; // image of product
	private Timestamp datepost;
	private String content;
	private int like;
	private int ctgid;
	private int stateid;
	
	public int getProid() {
		return proid;
	}
	public void setProid(int proid) {
		this.proid = proid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public Timestamp getDatepost() {
		return datepost;
	}
	public void setDatepost(Timestamp datepost) {
		this.datepost = datepost;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public int getCtgid() {
		return ctgid;
	}
	public void setCtgid(int ctgid) {
		this.ctgid = ctgid;
	}
	public String getImages() {
		return image;
	}
	public void setImages(String image) {
		this.image = image;
	}
	public int getStateid() {
		return stateid;
	}
	public void setStateid(int stateid) {
		this.stateid = stateid;
	}
	

}
