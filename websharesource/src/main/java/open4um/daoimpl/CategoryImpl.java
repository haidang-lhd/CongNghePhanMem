package tp.kits3.open4um.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import tp.kits3.open4um.config.ConnectionFactory;
import tp.kits3.open4um.dao.CategoryChiDAO;
import tp.kits3.open4um.vo.Category;

@Repository
public class CategoryImpl implements CategoryChiDAO {

	@Override
	public List<Category> selectAll() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<Category> list =  session.selectList("mappers.categoryMapper.selectAll");
		session.close();
		return list;
	}
	
	@Override
	public List<Category> selectCategoryname() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<Category> list =  session.selectList("mappers.categoryMapper.selectCategoryname");
		session.close();
		return list;
	}

	@Override
	public Category selectOne(int id) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		Category list =  session.selectOne("mappers.categoryMapper.selectOne", id);
		session.close();
		return list;
	}

	@Override
	public List<Category> listCategory() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<Category> list =  session.selectList("mappers.categoryMapper.selectLCategory");
		session.close();
		return list;
	}

	@Override
	public List<Category> selectAllCategory() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<Category> list =  session.selectList("mappers.categoryDtoMapper.selectAllCategory");
		session.close();
		return list;
	}

	@Override
	public List<Category> selectParent() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<Category> list =  session.selectList("mappers.categoryMapper.selectParent");
		session.close();
		return list;
	}

	@Override
	public void insert(Category cate) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.insert("mappers.categoryMapper.insert", cate);
		session.commit();
		session.close();
	}

	@Override
	public void update(Category cate) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.update("mappers.categoryMapper.update", cate);
		session.commit();
		session.close();
	}

	@Override
	public void delete(int ctgid) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.delete("mappers.categoryMapper.delete", ctgid);
		session.commit();
		session.close();
	}

}
