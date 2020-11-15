package open4um.controller;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import  open4um.service.CategoryService;
import  open4um.service.ProductService;
import  open4um.vo.Category;
import  open4um.vo.Product;

@Controller
public class SearchForumController {

	@Autowired
	private CategoryService categorysv;
	@Autowired
	private ProductService productsv;
	
	@RequestMapping (value = "/forum/search/" , method = RequestMethod.POST)
	public String searchForum(@RequestParam("keyword") String key,Model model) {
		List<Category> listC = categorysv.selectCategoryName();
		List<Product> listP = productsv.search(key);
		List<Product> listExc = productsv.selectExciting();
		List<Product> ListCount = productsv.selectCount(key);

		model.addAttribute("listCategory", listC);
		model.addAttribute("listProduct", listP);
		model.addAttribute("listExciting", listExc);
		model.addAttribute("ListCount", ListCount);
		
		return "forum/searchForum";
	}
}
