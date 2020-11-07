package tp.kits3.open4um.dto;

public class InfoUserDto {
	private int post;
	private int like;
	
	public InfoUserDto() {
		
	}
	
	public InfoUserDto(int post, int like) {
		super();
		this.post = post;
		this.like = like;
	}
	public int getPost() {
		return post;
	}
	public void setPost(int post) {
		this.post = post;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	
	
}
