package open4um.dao;

  
import java.util.List;

import  open4um.dto.PostDto;
import  open4um.dto.PostUserDto;
import  open4um.vo.Product;

public interface ProductDAO {

	public List<Product> selectAll();
	
	public List<Product> selectExciting();

	public List<Product> search(String key);

	public List<Product> selectCount(String key);
	
	public PostDto selectProduct(int id);
	
	public void update(Product pro);
	
	public Product selectOne(int proid);
	// nguyenthai
	public List<PostUserDto> listPost();
	public List<PostUserDto> listNewPost();
	
	public List<Product> countPost(int id);
}
