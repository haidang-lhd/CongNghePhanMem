package  open4um.vo;

public class TagProduct {

    private Integer tag_productid;

    private Integer tagid;

    private Integer productid;
     
    private Integer sourceid;
    
    private String tagname;
    
    

    public TagProduct() {
		super();
	}
    
    
	public TagProduct(Integer tagid, Integer sourceid) {
		super();
		this.tagid = tagid;
		this.sourceid = sourceid;
	}


	

	public Integer getTagProductid() {
		return tag_productid;
	}


	public void setTagProductid(Integer tag_productid) {
		this.tag_productid = tag_productid;
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


	public Integer getSourceid() {
		return sourceid;
	}


	public void setSourceid(Integer sourceid) {
		this.sourceid = sourceid;
	}


	public String getTagname() {
		return tagname;
	}


	public void setTagname(String tagname) {
		this.tagname = tagname;
	}
	
	

	
}