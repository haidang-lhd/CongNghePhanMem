package open4um.controller;

import java.io.File;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import tp.kits3.open4um.dto.ProductRoleDto;
import tp.kits3.open4um.dto.UserRoleDto;
import tp.kits3.open4um.service.CategoryToanAdminService;
import tp.kits3.open4um.service.MessageToanAdminService;
import tp.kits3.open4um.service.OrderHistoryService;
import tp.kits3.open4um.service.ProductService;
import tp.kits3.open4um.service.ProductToanAdminService;
import tp.kits3.open4um.service.SourceToanAdminService;
import tp.kits3.open4um.service.UserToanAdminService;
import tp.kits3.open4um.vo.Message;
import tp.kits3.open4um.vo.OrderHistory;
import tp.kits3.open4um.vo.Product;
import tp.kits3.open4um.vo.Source;
import tp.kits3.open4um.vo.User;

@Controller
public class AdminToanController {
	@Autowired
	private UserToanAdminService usersv;
	@Autowired
	private ProductToanAdminService productsv;
	@Autowired
	private SourceToanAdminService sourcesv;
	@Autowired
	private MessageToanAdminService messagesv;
	@Autowired
	private OrderHistoryService orderhistorysv;
	@Autowired
	private CategoryToanAdminService categorytoanadminsv;
	@Autowired
	private ProductService productService;

	// author:Toan
	@RequestMapping(value = { "/admin/" }, method = RequestMethod.GET)
	public String Index(Model model, Model model1, Model model2, Model model3, Model model4, Model model5) {
		List<User> list = usersv.selectuserName();
		int i = list.size();
		model.addAttribute("name", i);

		List<UserRoleDto> list4 = usersv.selectthanhviencu();
		model4.addAttribute("listuser", list4);

		List<Source> list1 = sourcesv.selectsourceName();
		int i1 = list1.size();
		model1.addAttribute("sourcename", i1);

		List<Message> list2 = messagesv.selectMessageName();
		int i2 = list2.size();
		model2.addAttribute("messagename", i2);

		List<OrderHistory> list3 = orderhistorysv.selectOrderHistoryName();
		int i3 = list3.size();
		model3.addAttribute("orderhistoryname", i3);

		List<ProductRoleDto> list5 = productsv.selectdanhsachbaiviet();
		model5.addAttribute("listproduct", list5);

		return "admin/index";

	}

	@RequestMapping(value = { "/admin/quanlybaiviet/list/" }, method = RequestMethod.GET)
	public String listbaiviet(Model model5, Model model1) {
		List<ProductRoleDto> list5 = productsv.selectdanhsachbaiviet();
		model5.addAttribute("listproduct", list5);

		List<ProductRoleDto> list1 = productsv.selectdanhsachbaiviet();
		model1.addAttribute("listproduct", list1);

		List<ProductRoleDto> list7 = productsv.selectaccountdanhsachbaiviet();
		int i = list7.size();
		model1.addAttribute("accountallbaiviet", i);

		List<ProductRoleDto> list2 = productsv.selectduyet();
		model1.addAttribute("duyet", list2);
		List<ProductRoleDto> list4 = productsv.selectaccountduyet();
		int i1 = list4.size();
		model1.addAttribute("accountduyet", i1);

		List<ProductRoleDto> list3 = productsv.selectchuaduyet();
		model1.addAttribute("chuaduyet", list3);
		List<ProductRoleDto> list6 = productsv.selectaccountchuaduyet();
		int i2 = list6.size();

		model1.addAttribute("accountchuaduyet", i2);

		return "admin/danhsachbaiviet";
	}
	@RequestMapping("/admin/quanlybaiviet/{idPost}")
	public String postDetails(@PathVariable int idPost, Model m) {
		ProductRoleDto productRoleDto = productsv.postDetails(idPost);
		m.addAttribute("productRoleDto", productRoleDto);
		return "admin/postDetails";
	}

	@PostMapping("/admin/quanlybaiviet/")
	public String updatePost(ProductRoleDto productRoleDto) {
		MultipartFile multipartFile = productRoleDto.getImageEdit();
		String nameFileImg = multipartFile.getOriginalFilename();
		productRoleDto.setImage(nameFileImg);
		Product pro = new Product();
		pro = productService.selectOne(productRoleDto.getProid());
		
		if (productRoleDto.getImage().equals("")) {
			productRoleDto.setImage(pro.getImage());
		} else {
			try {

				String fileName = nameFileImg;
				File file = new File(
						"C:/Users/PC13/eclipse-workspace/kits-03-tpjk3n1dev2/open4um/src/main/webapp/resources/images",
						fileName);
				multipartFile.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("upload file failed!!!");
			}
		}

		productsv.updatePostDetails(productRoleDto);

		return "redirect:/admin/quanlybaiviet/list/";
	}
	
	@GetMapping("/admin/quanlybaiviet/add/")
	public String addPostAdmin() {
		return "admin/addbaiviet";
	}
	@PostMapping("/admin/quanlybaiviet/add")
	public String postDataNews(Product product) throws ParseException {

		MultipartFile multipartFile = product.getImagePro();
		String nameFileImg = multipartFile.getOriginalFilename();
		product.setImage(nameFileImg);
		product.setStateid(1);
		try {
			String fileName = nameFileImg;
			File file = new File(
					"C:/Users/PC13/eclipse-workspace/kits-03-tpjk3n1dev2/open4um/src/main/webapp/resources/images",
					fileName);
			multipartFile.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("upload file failed!!!");
		}
		productsv.insertPro(product);
		return "redirect:/admin/quanlybaiviet/list/";
	}
	
	@GetMapping("/admin/quanlybaiviet/del/{idPost}")
	public String delPost(@PathVariable int idPost) {
		 
		productsv.deletePost(idPost);
		return "redirect:/admin/quanlybaiviet/list/";
	}
}
