/**
 * author:TOan
 */
package tp.kits3.open4um.dto;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class ProductRoleDto implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer proid;
	private String title;
	private Integer ctgid;
	private Integer like;
	private Integer views;
	private String datepost;
	private String content;
	private String image;
	private MultipartFile imageEdit;
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public MultipartFile getImageEdit() {
		return imageEdit;
	}

	public void setImageEdit(MultipartFile imageEdit) {
		this.imageEdit = imageEdit;
	}

	private String username;
	private String phone;
	private String avatar;
	private String email;
	private String roleaccount_name;
	private String status;
	private Integer stateid;
	private String statename;
	private Integer userid;
	private Integer roleaccountId;
	private String reason;
	private String ctgname;
	private String ctgdate;
	private Integer parentid;
	private String url;
	private Integer dislikes;
	private Double money;

	public Integer getProid() {
		return proid;
	}

	public ProductRoleDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void setProid(Integer proid) {
		this.proid = proid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getCtgid() {
		return ctgid;
	}

	public void setCtgid(Integer ctgid) {
		this.ctgid = ctgid;
	}

	public Integer getLike() {
		return like;
	}

	public void setLike(Integer like) {
		this.like = like;
	}

	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	public String getDatepost() {
		return datepost;
	}

	public void setDatepost(String datepost) {
		this.datepost = datepost;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
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

	public Integer getStateid() {
		return stateid;
	}

	public void setStateid(Integer stateid) {
		this.stateid = stateid;
	}

	public String getStatename() {
		return statename;
	}

	public void setStatename(String statename) {
		this.statename = statename;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getRoleaccountId() {
		return roleaccountId;
	}

	public void setRoleaccountId(Integer roleaccountId) {
		this.roleaccountId = roleaccountId;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getCtgname() {
		return ctgname;
	}

	public void setCtgname(String ctgname) {
		this.ctgname = ctgname;
	}

	public String getCtgdate() {
		return ctgdate;
	}

	public void setCtgdate(String ctgdate) {
		this.ctgdate = ctgdate;
	}

	public Integer getParentid() {
		return parentid;
	}

	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getDislikes() {
		return dislikes;
	}

	public void setDislikes(Integer dislikes) {
		this.dislikes = dislikes;
	}

	public ProductRoleDto(String title2, String datepost2, String ctgname2, String string, String content2,
			String statename2) {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductRoleDto(Integer proid, String title, Integer ctgid, Integer like, Integer views, String datepost,
			String content, String image, String username, String phone, String avatar, String email,
			String roleaccount_name, String status, Integer stateid, String statename, Integer userid,
			Integer roleaccountId, String reason, String ctgname, String ctgdate, Integer parentid, String url,
			Integer dislikes) {
		super();
		this.proid = proid;
		this.title = title;
		this.ctgid = ctgid;
		this.like = like;
		this.views = views;
		this.datepost = datepost;
		this.content = content;
		this.username = username;
		this.phone = phone;
		this.avatar = avatar;
		this.email = email;
		this.roleaccount_name = roleaccount_name;
		this.status = status;
		this.stateid = stateid;
		this.statename = statename;
		this.userid = userid;
		this.roleaccountId = roleaccountId;
		this.reason = reason;
		this.ctgname = ctgname;
		this.ctgdate = ctgdate;
		this.parentid = parentid;
		this.url = url;
		this.dislikes = dislikes;
	}

	public Double getMoney() {
		return money;
	}

	public void setMoney(Double money) {
		this.money = money;
	}

}
