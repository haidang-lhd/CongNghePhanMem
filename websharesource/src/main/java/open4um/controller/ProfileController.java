package open4um.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import tp.kits3.open4um.service.UserService;
import tp.kits3.open4um.vo.User;
/**
 * 
 * 
 *
 */
@Controller
public class ProfileController {
	@Autowired
	private UserService userS;
	
	/**
	 * 
	 * @param Thong view profile
	 * @return
	 */
	@RequestMapping(value="/profile", method = RequestMethod.GET)
	private String reversation(Model model){
		model.addAttribute("editProfile", new User());
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("userName", userS.selectProfile(userS.selectOne(userDetails.getUsername()).getUserid()));
		return "users/profile";
	}
	/**
	 * 	
	 * @param Thong edit profile
	 * @return
	 */
	@RequestMapping(value = "/editprofile", method = RequestMethod.POST)
	private String book(@ModelAttribute("editProfile") User user, Model model) {
		userS.update(user);
		model.addAttribute("editProfile", new User());
		return "redirect:/profile";
	}
	//Thong edit Avatar
		@RequestMapping(value = "/editAvatar", method = RequestMethod.POST)
		public String uploadFile(User user, Model model, HttpServletRequest req) {
			try {
				MultipartFile multipartFile = user.getMultipartFile();
				UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				User u = userS.selectOne(userDetails.getUsername());
				String avatarName = multipartFile.getOriginalFilename();
				u.setAvatar("/resources/images/"+avatarName);
				userS.update(u);
				File file = new File(req.getServletContext().getRealPath("resources/upload/"), avatarName);
				multipartFile.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "redirect:/profile";
		}
}
