package open4um.service;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import  open4um.dao.CategoryChiDAO;
import  open4um.dao.CategoryDAO;
import  open4um.daoimpl.CategoryImpl;
import  open4um.vo.Category;

@Service
public class CategoryService implements CategoryChiDAO{
	
	@Autowired
	private CategoryDAO dao;
	@Autowired
	private CategoryChiDAO Cdao;
	@Autowired
	private CategoryImpl categoryImpl;
	
	public List<Category> selectCategoryName() {
		List<Category> list = dao.selectCategoryName();
		return list;
	}
	public List<Category> SelectOneC(int idC) {
		List<Category> list = dao.selectOneC(idC);
		return list;
	}
	//Chi upload
	public List<Category> selectCategoryBySource() {
		List<Category> list = dao.selectCategoryBySource();
		return list;
	}
	
	public Category selectOne(int id) {
		Category list = categoryImpl.selectOne(id);
		return list;
	}
	public List<Category> listCategory(){
		return categoryImpl.listCategory();
	}
	@Override
	public List<Category> selectAll() {
		List<Category> list = Cdao.selectAll();
		return list;
	}
	@Override
	public List<Category> selectCategoryname() {
		List<Category> list = dao.selectCategoryName();
		return list;
	}
	@Override
	public List<Category> selectAllCategory() {
		List<Category> list = Cdao.selectAllCategory();
		return list;
	}
	@Override
	public List<Category> selectParent() {
		List<Category> list = Cdao.selectParent();
		return list;
	}
	@Override
	public void insert(Category cate) {
		Cdao.insert(cate);
	}
	@Override
	public void update(Category cate) {
		Cdao.update(cate);
	}
	@Override
	public void delete(int ctgid) {
		Cdao.delete(ctgid);
	}
	public List<Category> selectAllC() {
		List<Category> listc = dao.selectAllC();
		return listc;
	}
	
	

}
