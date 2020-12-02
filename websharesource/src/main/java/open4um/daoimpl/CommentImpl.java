package  open4um.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import  open4um.config.ConnectionFactory;
import open4um.dao.CommentDAO;
import  open4um.dto.CommentProductDto;
import  open4um.vo.Comment;

@Repository
public class CommentImpl implements CommentDAO {
	
	public List<Comment> selectAll(){
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<Comment> list = session.selectList("mappers.commentMapper.selectAll");
		session.commit();
		session.close();
		return list;
	}
	public List<Comment> selectComment(int id) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<Comment> comment = session.selectList("mappers.commentMapper.selectComment", id);
		session.commit();
		session.close();
		return comment;
	}
	
	public void insert(Comment comment) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.insert("mappers.commentMapper.insert", comment);
		session.commit();
		session.close();
	}
	
	@Override
	public List<CommentProductDto> selectCommentProduct(int id) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<CommentProductDto> comment = session.selectList("mappers.CommentPostDto.selectCommentProduct", id);
		session.commit();
		session.close();
		return comment;
	}
	@Override
	public Comment selectReportComment(int id) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		Comment comment = session.selectOne("mappers.commentMapper.selectReportComment", id);
		session.commit();
		session.close();
		return comment;
	}
}
