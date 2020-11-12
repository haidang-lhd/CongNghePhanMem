package tp.kits3.open4um.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.open4um.dao.CommentDAO;
import tp.kits3.open4um.daoimpl.CommentImpl;
import tp.kits3.open4um.dto.CommentProductDto;
import tp.kits3.open4um.vo.Comment;

@Service
public class CommentService implements CommentDAO {
	
	@Autowired
	private CommentImpl dao;
	public List<Comment> selectAll(){
		return dao.selectAll();
	}
	
	@Override
	public List<Comment> selectComment(int id) {
		return dao.selectComment(id);
	}
	
	@Override
	public void insert(Comment comment) {
		dao.insert(comment);
	}
	
	@Override
	public List<CommentProductDto> selectCommentProduct(int id) {
		return dao.selectCommentProduct(id);
	}
	
	@Override
	public Comment selectReportComment(int id) {
		return dao.selectReportComment(id);
	}
}
