package open4um.dto;

public class Search {
	private int ctgid;
	private String title;
	private String ctgname;
	private int views;
	private String url;
	
	public Search() {
		super();
	}
	
	public Search(int ctgid, String title, String ctgname, int views, String url) {
		super();
		this.ctgid = ctgid;
		this.title = title;
		this.ctgname = ctgname;
		this.views = views;
		this.url = url;
	}

	public int getCtgid() {
		return ctgid;
	}

	public void setCtgid(int ctgid) {
		this.ctgid = ctgid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCtgname() {
		return ctgname;
	}

	public void setCtgname(String ctgname) {
		this.ctgname = ctgname;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	
}
