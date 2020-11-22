package  open4um.vo;

public class Rating {

    private Integer rateid;

    private Integer ratevalue;

    private String ratename;

    private Integer sourceid;
    
    private float avgStart;
    
    private String url;
    
    public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getQuantityStart() {
		return quantityStart;
	}

	public void setQuantityStart(Integer quantityStart) {
		this.quantityStart = quantityStart;
	}

	private Integer quantityStart;
    
    public float getAvgStart() {
		return avgStart;
	}

	public void setAvgStart(float avgStart) {
		this.avgStart = avgStart;
	}

	public Integer getRateid() {
        return rateid;
    }

    public void setRateid(Integer rateid) {
        this.rateid = rateid;
    }

    public Integer getRatevalue() {
        return ratevalue;
    }

    public void setRatevalue(Integer ratevalue) {
        this.ratevalue = ratevalue;
    }

    public String getRatename() {
        return ratename;
    }

    public void setRatename(String ratename) {
        this.ratename = ratename;
    }

    public Integer getSourceid() {
        return sourceid;
    }

    public void setSourceid(Integer sourceid) {
        this.sourceid = sourceid;
    }

   
    public void CopyData(Rating param)
    {
        this.rateid = param.getRateid();
        this.ratevalue = param.getRatevalue();
        this.ratename = param.getRatename();
        this.sourceid = param.getSourceid();
    }
}