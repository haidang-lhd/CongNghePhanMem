package  open4um.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import  open4um.config.ConnectionFactory;
import  open4um.dao.TagroleDao;
import  open4um.dto.TagRoleDto;
import  open4um.vo.Product;


@Repository
public class TagroleImpl implements TagroleDao{
	public List<TagRoleDto> tagtheoproid(int proid) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<TagRoleDto> list1 = session.selectList("mappers.tagRoleMapper.tagtheoproid", proid);
		session.commit();
		session.close();
		return list1;
	}

	public List<TagRoleDto> likebaiviet() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<TagRoleDto> list1 = session.selectList("mappers.tagRoleMapper.likebaiviet");
		session.commit();
		session.close();
		return list1;
	}

	public void updatelike(int proid) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.update("mappers.productMapper.like",proid);
		session.commit();
		session.close();
	}
	
	
	
	public void updatelike2(int proid) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.update("mappers.productMapper.like2",proid);
		session.commit();
		session.close();
		
	}

	public void updatedislike(int proid) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.update("mappers.productMapper.dislike1",proid);
		session.commit();
		session.close();
		
	}

	public void updatedislike2(int proid) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.update("mappers.productMapper.dislike2",proid);
		session.commit();
		session.close();
	}
}
