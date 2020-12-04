package  open4um.controller;
 
 

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import  open4um.service.CategoryService;
import  open4um.service.ProductService;
import  open4um.vo.Category;
import  open4um.vo.Product;



@Controller
public class NewsCnttController{ 
	
	@Autowired
	private CategoryService categorysv;
	@Autowired
	private ProductService productsv;
	
	int idC = 3; // ctgid = 3
	
	@RequestMapping (value = "/forum/thaoluanchung/news/", method = RequestMethod.GET)
	public String newsCntt (Model model) {	
		List<Category> listC = categorysv.SelectOneC(idC); 	
		List<Product> listPro = productsv.selectAll();
		List<Product> listExc = productsv.selectExciting();
		
		model.addAttribute("listCategory", listC);
		model.addAttribute("listProduct", listPro);
		model.addAttribute("listExciting", listExc);
		
		return "forum/forumcategory";
	}
}
