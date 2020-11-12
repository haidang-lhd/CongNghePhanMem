package tp.kits3.open4um.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

public class Comment {

    private Integer cmtid;

    private String cmtname;

    private Timestamp datecmt;

    private Integer userid;

    private Integer like;

    private Integer dislikes;

    private Integer parent;

    private Integer productid;

    private Integer sourceid;

    public Comment() {
	}

	public Comment(String cmtname, String datecmt, Integer userid, Integer parent, Integer productid) {
		super();
		this.cmtname = cmtname;
		this.datecmt = java.sql.Timestamp.valueOf(datecmt);
		this.userid = userid;
		this.parent = parent;
		this.productid = productid;
	}
	
	public Comment(String cmtname, String datecmt, Integer userid, Integer productid) {
		super();
		this.cmtname = cmtname;
		this.datecmt = java.sql.Timestamp.valueOf(datecmt);
		this.userid = userid;
		this.parent = parent;
		this.productid = productid;
	}
    
	public Integer getCmtid() {
        return cmtid;
    }

    public void setCmtid(Integer cmtid) {
        this.cmtid = cmtid;
    }

    public String getCmtname() {
        return cmtname;
    }

    public void setCmtname(String cmtname) {
        this.cmtname = cmtname;
    }

    public Timestamp getDatecmt() {
        return datecmt;
    }

    public void setDatecmt(Timestamp datecmt) {
        this.datecmt = datecmt;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getLike() {
        return like;
    }

    public void setLike(Integer like) {
        this.like = like;
    }

    public Integer getDislikes() {
        return dislikes;
    }

    public void setDislikes(Integer dislikes) {
        this.dislikes = dislikes;
    }

    public Integer getParent() {
        return parent;
    }

    public void setParent(Integer parent) {
        this.parent = parent;
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public Integer getSourceid() {
        return sourceid;
    }

    public void setSourceid(Integer sourceid) {
        this.sourceid = sourceid;
    }

    // Comment 모델 복사
    public void CopyData(Comment param)
    {
        this.cmtid = param.getCmtid();
        this.cmtname = param.getCmtname();
        this.datecmt = param.getDatecmt();
        this.userid = param.getUserid();
        this.like = param.getLike();
        this.dislikes = param.getDislikes();
        this.parent = param.getParent();
        this.productid = param.getProductid();
        this.sourceid = param.getSourceid();
    }
}