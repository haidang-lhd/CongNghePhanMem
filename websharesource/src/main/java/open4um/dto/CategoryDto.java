package  open4um.dto;

public class CategoryDto {
	
	private int ctgid;
	private String ctgname;
	private String ctgdate;
	private String parent;
	
	public int getCtgid() {
		return ctgid;
	}
	public void setCtgid(int ctgid) {
		this.ctgid = ctgid;
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
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	
}
