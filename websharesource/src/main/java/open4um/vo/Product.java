package open4um.vo;

import java.io.Serializable;
import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class Product implements Serializable{
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
    
    private String time;
    
    public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public MultipartFile getImagePro() {
		return imagePro;
	}

	public void setImagePro(MultipartFile imagePro) {
		this.imagePro = imagePro;
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

    // 
    public void CopyData(Product param)
    {
        this.proid = param.getProid();
        this.title = param.getTitle();
        this.ctgid = param.getCtgid();
        this.like = param.getLike();
        this.views = param.getViews();
        this.datepost = param.getDatepost();
        this.content = param.getContent();
        this.image = param.getImage();
        this.userid = param.getUserid();
        this.stateid = param.getStateid();
        this.reason = param.getReason();
        this.dislikes = param.getDislikes();
    }
}