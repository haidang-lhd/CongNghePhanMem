package   open4um.vo;

import java.sql.Timestamp;

public class Message {

    private Integer messid;

    private Integer senduserid;

    private Integer receiveuserid;

    private String content;

    private Timestamp datemsg;
    
    private String username;
    
    public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getMessid() {
        return messid;
    }

    public void setMessid(Integer messid) {
        this.messid = messid;
    }

    public Integer getSenduserid() {
        return senduserid;
    }

    public void setSenduserid(Integer senduserid) {
        this.senduserid = senduserid;
    }

    public Integer getReceiveuserid() {
        return receiveuserid;
    }

    public void setReceiveuserid(Integer receiveuserid) {
        this.receiveuserid = receiveuserid;
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

     
    public void CopyData(Message param)
    {
        this.messid = param.getMessid();
        this.senduserid = param.getSenduserid();
        this.receiveuserid = param.getReceiveuserid();
        this.content = param.getContent();
        this.datemsg = param.getDatemsg();
    }
}