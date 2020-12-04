package  open4um.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import  open4um.dto.PostUserDto;
import  open4um.dto.ProductRoleDto;
import  open4um.dto.SourceDto;
import  open4um.dto.TagRoleDto;
import  open4um.service.CategoryService;
import  open4um.service.ProductService;
import  open4um.service.ProductToanAdminService;
import  open4um.service.SourceService;
import  open4um.service.TagRoleService;
import  open4um.vo.Category;


@Controller
public class ChitietBaiVietController {
	@Autowired
	private SourceService sourceService;

	@Autowired
	private ProductService ProductService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ProductToanAdminService productsv;
	
	@Autowired
	private TagRoleService tagsv;
	
	@RequestMapping(value = "/forum/{proid}/{ctgname}", method = RequestMethod.GET) //    forum/1; forum/2
	public String indexPage(@PathVariable("proid") int proid, @PathVariable("ctgname") String ctgname,Model model
			) {
		System.out.println(proid);
		List<SourceDto> listSource = sourceService.ListSources();
		List<SourceDto> listSourceNew = sourceService.ListSourceNew();
		List<PostUserDto> lPostUser = ProductService.listPost();
		List<PostUserDto> lNewPostUser = ProductService.listNewPost();
		List<Category> lCategory = categoryService.listCategory();
		ProductRoleDto lProduct =productsv.selecttungbaiviet(proid);
		List<ProductRoleDto> lProducttieude = productsv.selecttheotieude(ctgname);
		List<TagRoleDto> tagtheoproid = tagsv.tagtheoproid(proid);
		
		
		model.addAttribute("listSource", listSource);
		model.addAttribute("listSourceNew", listSourceNew);
		model.addAttribute("lPostUser", lPostUser);
		model.addAttribute("lNewPostUser", lNewPostUser);
		model.addAttribute("lCategory", lCategory);
		model.addAttribute("lProduct", lProduct);
		model.addAttribute("lProducttieude", lProducttieude);
		model.addAttribute("tagtheoproid", tagtheoproid);		
		
		
		
	
		
		return "forum/ChiTietBaiViet"; 
	}
}
