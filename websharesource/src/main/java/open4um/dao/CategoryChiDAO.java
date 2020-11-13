package open4um.dao;

import java.util.List;

import tp.kits3.open4um.vo.Category;

public interface CategoryChiDAO {
	public List<Category> selectAll();
	
	public List<Category> selectAllCategory();
	
	public List<Category> selectParent();
	
	public List<Category> selectCategoryname();
	
	public Category selectOne(int id);
	
	public List<Category> listCategory();
	
	public void insert(Category cate);
	
	public void update(Category cate);
	
	public void delete(int ctgid);
}
