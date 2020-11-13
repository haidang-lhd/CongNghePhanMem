package open4um.dao;

import java.util.List;

import tp.kits3.open4um.dto.CommentProductDto;
import tp.kits3.open4um.vo.Comment;

public interface CommentDAO {

	public List<Comment> selectAll();
	
	public List<Comment> selectComment(int id);
	
	public Comment selectReportComment(int id);
	
	public List<CommentProductDto> selectCommentProduct(int id);
	
	public void insert(Comment comment);
	
}
