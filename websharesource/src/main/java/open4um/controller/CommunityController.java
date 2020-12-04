package  open4um.controller;


 

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import  open4um.dto.PostDto;
import  open4um.dto.PostUserDto;
import  open4um.dto.PostsDto;
import  open4um.dto.UploadProductDto;
import  open4um.service.CategoryService;
import  open4um.service.CommunityService;
import  open4um.service.ProductService;
import  open4um.service.UserService;
import  open4um.vo.Category;
import  open4um.vo.Product;

@Controller
public class CommunityController {
	@Autowired
	private UserService userService;
	@Autowired
	private CommunityService commnunitisv;
	@Autowired
	private ProductService productsv;
	@Autowired
	private CategoryService categorysv;
	
	@RequestMapping(value = "/forum/{ctgid}/", method = RequestMethod.GET)
	public String Community(Model model, @PathVariable("ctgid") int ctgid ) {
		List<PostUserDto> Listposts = commnunitisv.selectAll(ctgid);
		List<Product> listExc = productsv.selectExciting();
		List<Category> list = categorysv.selectCategoryName();
		model.addAttribute("Listposts",Listposts);
		model.addAttribute("listExciting", listExc);
		model.addAttribute("listCategory", list);
		
		return "forum/disscuss";

	}
	@RequestMapping (value = "/insertPosts/", method = RequestMethod.POST)
	public String uploadFile(HttpServletRequest request,
							Model model, UploadProductDto uploadProduct,
							@RequestParam("inputimage") MultipartFile image,
							@RequestParam("title") int ctg,
							@RequestParam("textarea-frames") String content, HttpServletResponse response) {
		LocalDateTime date= LocalDateTime.now();
		Timestamp datetime = Timestamp.valueOf(date);
		try {
			int stateid = 1;
			UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();    // get user
			int userid = userService.selectUser(userDetails.getUsername()).getUserid();
			MultipartFile multipartFile = image;
			String imagename = multipartFile.getOriginalFilename();
			uploadProduct.setImage("/resources/images/" + imagename);
			File file = new File("D:\\team1\\nghia\\open4um\\src\\main\\webapp\\resources\\images",imagename);
			multipartFile.transferTo(file);
			
			commnunitisv.insertPosts(ctg,datetime,content, imagename,userid,stateid);

		} catch (Exception e) {
			e.printStackTrace();
		}

			return "redirect:/forum/";
			
	}

}
