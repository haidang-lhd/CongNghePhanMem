package  open4um.daoimpl;


import java.util.List;

 

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import  open4um.config.ConnectionFactory;
import  open4um.dao.CommunitiDAO;
import  open4um.dto.PostDto;
import  open4um.dto.PostUserDto;
import  open4um.dto.PostsDto;
import  open4um.dto.UploadProductDto;
import  open4um.vo.Product;

@Repository
public class CommunitiDaoImpl implements CommunitiDAO{

	
	public void insertPosts(Product product) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.insert("mappers.productMapper.insertUploadPosts",product);
		session.commit();
		session.close();
	}

	public List<PostUserDto> selectAll(int ctgid) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<PostUserDto> list = session.selectList("mappers.postuserMapper.selectAllListPosts",ctgid);
		session.commit();
		session.close();
		return list;
	}



}
