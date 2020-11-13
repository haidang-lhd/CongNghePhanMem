package open4um.service;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *	@author Huu Nghia  
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.open4um.dao.ProductDAO;
import tp.kits3.open4um.daoimpl.ProductImpl;
import tp.kits3.open4um.dto.PostDto;
import tp.kits3.open4um.dto.PostUserDto;
import tp.kits3.open4um.vo.Product;

@Service
public class ProductService implements ProductDAO {

	@Autowired
	private ProductImpl dao;

	public List<Product> selectAll() {
		List<Product> list = dao.selectAll();
		return list;
	}

	public List<Product> selectExciting() {
		List<Product> list = dao.selectExciting();
		return list;
	}

	public List<Product> search(String key) {
		List<Product> list = dao.search(key);
		return list;
	}

	public List<Product> selectCount(String key) {
		List<Product> list = dao.selectCount(key);
		return list;
	}

	@Override
	public PostDto selectProduct(int id) {
		PostDto list = dao.selectProduct(id);
		return list;
	}

	@Override
	public void update(Product pro) {
		dao.update(pro);
	}

	@Override
	public Product selectOne(int proid) {
		return dao.selectOne(proid);
	}

// author nguyenthai
	@Override
	public List<PostUserDto> listPost() {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		long time = timestamp.getTime(); 
		
		List<PostUserDto> List = dao.listPost();
		for (PostUserDto item : List) {
			long s = (time - item.getDatepost().getTime());
			long ngay = (s / 60 / 60 / 24 / 1000) ;
			if(ngay > 1) {
				String newNgay = (s / 60 / 60 / 24 / 1000) + " Ngày";
				 
				item.setTime(newNgay);
			}else {
				long Gio = (s / 60 / 60 / 1000);
				if(Gio >= 1) {
					String newGio = (s / 60 / 60 / 1000) + " Giá";
					item.setTime(newGio);
				}else {
					String newPhut = (s / 60  / 1000) + " Phút";
					 
					item.setTime(newPhut);
				}
				
			}
			
		}
		return List;
	}

	@Override
	public List<PostUserDto> listNewPost() {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		long time = timestamp.getTime(); 
		
		List<PostUserDto> List = dao.listNewPost();
		for (PostUserDto item : List) {
			long s = (time - item.getDatepost().getTime());
			long ngay = (s / 60 / 60 / 24 / 1000) ;
			if(ngay > 1) {
				String newNgay = (s / 60 / 60 / 24 / 1000) + " Ngày";
				 
				item.setTime(newNgay);
			}else {
				long Gio = (s / 60 / 60 / 1000);
				if(Gio >= 1) {
					
					String newGio = (s / 60 / 60 / 1000) + " Giá";
					 
					item.setTime(newGio);
				}else {
					String newPhut = (s / 60  / 1000) + " Phút";
					 
					item.setTime(newPhut);
				}
				
			}
			
		}
		return List;
	}

	@Override
	public List<Product> countPost(int id) {
		return dao.countPost(id);
	}

}
