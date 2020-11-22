package  open4um.dto;

public class AddReportDto {
	
	private String reportname;
	private String username;
	private int productid;
	private String reportdate;
	private int cmtid;
	
	public String getReportname() {
		return reportname;
	}
	public void setReportname(String reportname) {
		this.reportname = reportname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getReportdate() {
		return reportdate;
	}
	public void setReportdate(String reportdate) {
		this.reportdate = reportdate;
	}
	public int getCmtid() {
		return cmtid;
	}
	public void setCmtid(int cmtid) {
		this.cmtid = cmtid;
	}
	
}
