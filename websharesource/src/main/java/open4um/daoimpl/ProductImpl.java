package  open4um.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import  open4um.config.ConnectionFactory;
import  open4um.dao.ProductDAO;
import  open4um.dto.PostDto;
import  open4um.dto.PostUserDto;
import  open4um.vo.Product;

@Repository
public class ProductImpl implements ProductDAO {
	
	public List<Product> selectAll() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<Product> list = session.selectList("mappers.productMapper.selectAll");
		session.commit();
		session.close();
		return list;
	}
	
	public List<Product> selectExciting() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<Product> list = session.selectList("mappers.productMapper.selectExciting");
		session.commit();
		session.close();
		return list;
	}

	public List<Product> search(String key) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<Product> list = session.selectList("mappers.productMapper.search",key);
		session.commit();
		session.close();
		return list;
	}

	public List<Product> selectCount(String key) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<Product> list = session.selectList("mappers.productMapper.selectCount",key);
		session.commit();
		session.close();
		return list;
	}

	@Override
	public PostDto selectProduct(int id) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		PostDto list = session.selectOne("mappers.PostDtoMapper.selectPost", id);
		session.commit();
		session.close();
		return list;
	}
	
	@Override
	public void update(Product pro) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.update("mappers.productMapper.update", pro);
		session.commit();
		session.close();
	}

	@Override
	public Product selectOne(int proid) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		Product list = session.selectOne("mappers.productMapper.selectOne", proid);
		session.commit();
		session.close();
		return list;
	}

	@Override
	public List<PostUserDto> listPost() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<PostUserDto> list = session.selectList("mappers.postuserMapper.selectAllListPost");
		session.commit();
		session.close();
		return list;
	}

	@Override
	public List<PostUserDto> listNewPost() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<PostUserDto> list = session.selectList("mappers.postuserMapper.selectAllListNewPost");
		session.commit();
		session.close();
		return list;
	}

	@Override
	public List<Product> countPost(int id) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<Product> list = session.selectList("mappers.productMapper.countPost", id);
		session.commit();
		session.close();
		return list;
	}
}
