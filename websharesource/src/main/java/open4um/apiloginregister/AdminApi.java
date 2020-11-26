package open4um.apiloginregister;

 * */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tp.kits3.open4um.dto.UserLoginDto;
import tp.kits3.open4um.service.UserService;
import tp.kits3.open4um.vo.User;

@Controller
@RequestMapping("/api")
public class AdminApi {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/data", method = RequestMethod.GET)
	@ResponseBody
	public List<UserLoginDto> getAll(Model model) {
		return userService.findAll();
	}
	
	@RequestMapping(value = "/dataUser", method = RequestMethod.GET)
	@ResponseBody
	public List<UserLoginDto> showform (@RequestParam int userid,User user,UserLoginDto userrole, Model model) {
		System.out.println(userid);
		List<UserLoginDto> list = userService.findOneByRole(userid);
		model.addAttribute("listUser", list);
		System.out.println(list);
		return list;
	}
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	@ResponseBody
	public List<UserLoginDto> search(@RequestParam String username,UserLoginDto userrole, Model model) {
		System.out.println(username);
		List<UserLoginDto> list1 = userService.search(username);
		model.addAttribute("listUser", list1);
		System.out.println(list1);
		return list1 ;
	}

}
