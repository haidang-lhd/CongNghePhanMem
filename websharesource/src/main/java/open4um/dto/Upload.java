package tp.kits3.open4um.dto;

import java.sql.Timestamp;
/**
 * 
 * @author Thong
 *
 */
public class Upload {
	private String sourcename;
	private Timestamp date;
	private Double price;
	private String statename;
	private String ctgname;
	private Integer userid;
	private Integer sourceid;
	private Integer ctgid;
	private Integer stateid;
	
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getSourcename() {
		return sourcename;
	}
	public void setSourcename(String sourcename) {
		this.sourcename = sourcename;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getStatename() {
		return statename;
	}
	public void setStatename(String statename) {
		this.statename = statename;
	}
	public String getCtgname() {
		return ctgname;
	}
	public void setCtgname(String ctgname) {
		this.ctgname = ctgname;
	}
	
	public Integer getSourceid() {
		return sourceid;
	}
	public void setSourceid(Integer sourceid) {
		this.sourceid = sourceid;
	}
	
	public Integer getCtgid() {
		return ctgid;
	}
	public void setCtgid(Integer ctgid) {
		this.ctgid = ctgid;
	}
	
	public Integer getStateid() {
		return stateid;
	}
	public void setStateid(Integer stateid) {
		this.stateid = stateid;
	}
	@Override
	public String toString() {
		return "Upload [sourcename=" + sourcename + ", date=" + date + ", price=" + price + ", statename=" + statename
				+ ", ctgname=" + ctgname + "]";
	}
	
}
