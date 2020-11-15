package open4um.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import  open4um.dto.Upload;
import  open4um.service.UploadService;
import open4um.service.UserService;
 
@Controller
public class UploadController {
	@Autowired
	private UploadService uploadS;
	@Autowired
	private UserService userS;
	/**
	 * 
	 * @param  list upload
	 * @return
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String upload(Model model) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<Upload> list = uploadS.selectUpload(userS.selectOne(userDetails.getUsername()).getUserid());
		model.addAttribute("userName", userS.selectProfile(userS.selectOne(userDetails.getUsername()).getUserid()));
		model.addAttribute("uplist", list);
		return "users/upload";
	}
	/**
	 * 
	 * @param   search upload
	 * @return
	 */
	@RequestMapping(value = "/search-upload", method = RequestMethod.GET)
	public String searchUpload(Model model, @RequestParam("freeText") String freeText) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int id = userS.selectOne(userDetails.getUsername()).getUserid();
		List<Upload> listSearch = uploadS.selectSearch(id, freeText);
		model.addAttribute("userName", userS.selectProfile(userS.selectOne(userDetails.getUsername()).getUserid()));
		model.addAttribute("uplist", listSearch);
		return "users/upload";
	}
	/* It deletes record for the given id in URL */
	@RequestMapping(value="/upload/{id}",method = RequestMethod.GET)    
    public String delete(Model model , @PathVariable("id") Integer Id ){    
		uploadS.delete(Id); 
        return "redirect:/upload";    
    }
}