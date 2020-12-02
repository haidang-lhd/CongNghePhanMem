package  open4um.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import  open4um.dao.CategoryDAO;
import  open4um.daoimpl.CategoryToanImpl;
import  open4um.vo.Category;
@Service
public class CategoryToanAdminService {
	@Autowired
	private CategoryToanImpl impl;
	public List<Category> selectAll() {
		List<Category> list = impl.selectAll();
		return list;
	}
}
