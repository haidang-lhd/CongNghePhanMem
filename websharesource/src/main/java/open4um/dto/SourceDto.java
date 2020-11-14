package tp.kits3.open4um.dto;

import tp.kits3.open4um.vo.Source;

public class SourceDto extends Source {

	private String ctgname;

	public SourceDto() {
		super();
	}
	
	public SourceDto(String date, String sourcename, String size, String contentdetails, String title, int userid,
			int ctgid, int price, int stateid, String avatar) {
		super(date, sourcename, size, contentdetails, title, userid, ctgid, price , avatar);
	}

	public SourceDto(String date, String sourcename, String size, String contentdetails, String title, int userid,
			int ctgid, int price, int stateid, String ctgname, String avatar) {
		super(date, sourcename, size, contentdetails, title, userid, ctgid, price, avatar);
		this.ctgname = ctgname;
	}

	public String getCtgname() {
		return ctgname;
	} 

	public void setCtgname(String ctgname) {
		this.ctgname = ctgname;
	}
	



	

}
