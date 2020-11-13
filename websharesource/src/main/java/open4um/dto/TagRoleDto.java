package open4um.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class TagRoleDto {
	
	private Integer tagProductid;

    private Integer tagid;

    private Integer productid;
	private String tagname;
	private static final long serialVersionUID = 1L;
    private Integer proid;

    private String title;

    private Integer ctgid;

    private Integer like;

    private Integer views;

    private Timestamp datepost;

    private String content;

    private String image;

    private Integer userid;

    private Integer stateid;

    private String reason;

    private Integer dislikes;
    
    private MultipartFile imagePro;

	public Integer getTagProductid() {
		return tagProductid;
	}

	public void setTagProductid(Integer tagProductid) {
		this.tagProductid = tagProductid;
	}

	public Integer getTagid() {
		return tagid;
	}

	public void setTagid(Integer tagid) {
		this.tagid = tagid;
	}

	public Integer getProductid() {
		return productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public String getTagname() {
		return tagname;
	}

	public void setTagname(String tagname) {
		this.tagname = tagname;
	}

	public Integer getProid() {
		return proid;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getStateid() {
		return stateid;
	}

	public void setStateid(Integer stateid) {
		this.stateid = stateid;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Integer getDislikes() {
		return dislikes;
	}

	public void setDislikes(Integer dislikes) {
		this.dislikes = dislikes;
	}

	public MultipartFile getImagePro() {
		return imagePro;
	}

	public void setImagePro(MultipartFile imagePro) {
		this.imagePro = imagePro;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public TagRoleDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TagRoleDto(Integer tagProductid, Integer tagid, Integer productid, String tagname, Integer proid,
			String title, Integer ctgid, Integer like, Integer views, Timestamp datepost, String content, String image,
			Integer userid, Integer stateid, String reason, Integer dislikes, MultipartFile imagePro) {
		super();
		this.tagProductid = tagProductid;
		this.tagid = tagid;
		this.productid = productid;
		this.tagname = tagname;
		this.proid = proid;
		this.title = title;
		this.ctgid = ctgid;
		this.like = like;
		this.views = views;
		this.datepost = datepost;
		this.content = content;
		this.image = image;
		this.userid = userid;
		this.stateid = stateid;
		this.reason = reason;
		this.dislikes = dislikes;
		this.imagePro = imagePro;
	}
    
    
}
