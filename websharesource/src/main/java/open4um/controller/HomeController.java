package open4um.controller;

 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
 
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import  open4um.dto.PostUserDto;
import  open4um.dto.SourceDto;
import  open4um.service.CategoryService;
import  open4um.service.ProductService;
import  open4um.service.SourceService;
import  open4um.service.UserService;
import  open4um.vo.Category;
import  open4um.vo.Source;

 
@Controller
public class HomeController {

	@Autowired
	private SourceService sourceService;

	@Autowired
	private ProductService ProductService;
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value = { "/home", "/" }, method = RequestMethod.GET)
	public String Index(Model model) {
		List<SourceDto> listSource = sourceService.ListSources();
		List<SourceDto> listSourceNew = sourceService.ListSourceNew();
		List<PostUserDto> lPostUser = ProductService.listPost();
		List<PostUserDto> lNewPostUser = ProductService.listNewPost();
		List<Category> lCategory = categoryService.listCategory();
		 
		model.addAttribute("listSource", listSource);
		model.addAttribute("listSourceNew", listSourceNew);
		model.addAttribute("lPostUser", lPostUser);
		model.addAttribute("lNewPostUser", lNewPostUser);
		model.addAttribute("lCategory", lCategory);
		return "users/index";
	}
	
	@GetMapping("/login")
	public String login() {
		return "users/login";
	}
	
	
	
	@GetMapping("/403")
	@ResponseBody
	public String error() {
		return "403 not found";
	}
	
	@GetMapping("/register")
	public String register() {
		return "users/register";
	}
	
	

}
