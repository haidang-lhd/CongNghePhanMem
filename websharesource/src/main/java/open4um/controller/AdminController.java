
package open4um.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import tp.kits3.open4um.dto.UserLoginDto;
import tp.kits3.open4um.service.UserService;
@Controller
public class AdminController {
	@Autowired
	private UserService userService;
	
	
	
	@RequestMapping(value = "/admin/listuser/", method = RequestMethod.GET)
	public String loadUser(Model model) {
		List<UserLoginDto> listUser = userService.findAll();
		model.addAttribute("listUser", listUser);
	
		return "admin/listuser"; // .jsp	
	}
	
	@RequestMapping(value = "/edit/", method = RequestMethod.POST)
	public String edit(UserLoginDto userdto,RedirectAttributes rd) {
		userService.update(userdto);
		return  "redirect:/admin/listuser/";
	}
	
	
}
