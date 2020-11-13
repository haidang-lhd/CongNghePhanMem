package open4um.vo;

public class Tag {

    private Integer tagid;

    private String tagname;
    
    public Tag() {
    	
    }
    
    public Tag(String tagname) {
		super();
		this.tagname = tagname;
	}

	public Integer getTagid() {
        return tagid;
    }

    public void setTagid(Integer tagid) {
        this.tagid = tagid;
    }

    public String getTagname() {
        return tagname;
    }

    public void setTagname(String tagname) {
        this.tagname = tagname;
    }

    // 
    public void CopyData(Tag param)
    {
        this.tagid = param.getTagid();
        this.tagname = param.getTagname();
    }
}