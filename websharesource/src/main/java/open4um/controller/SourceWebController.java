 
package  open4um.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import  open4um.dto.SourceDto;
import  open4um.service.CategoryService;
import  open4um.service.SourceService;

@Controller
public class SourceWebController {
	// Injection: create other object in this class
	@Autowired
	HttpSession session;
	
	@Autowired
	private SourceService sourceservice;
	

	@Autowired
	private CategoryService categoryervice;
	
	@RequestMapping(value = "/sourceweb", method = RequestMethod.GET)
	public String indexPage(Model model) {
		List<SourceDto> listSource = sourceservice.selectBySourceWeb();
		
		int num = (1 - 1) * 6;
		
		List<SourceDto> listSource2 = sourceservice.selectLimitSourceWeb(num);
		
		//List<category> listCate = categoryservice.getBycategory(parentid);
		model.addAttribute("listSource", listSource2);
		int count = (int)Math.ceil(1.0*listSource.size()/6);
		
		model.addAttribute("count", count);
		return "users/sourceweb"; // .jsp
	}
	
	@RequestMapping(value = "/sourceweb/{pageNo}", method = RequestMethod.GET)
	public String indexPage2(Model model, @PathVariable(name="pageNo") int pageNo) {
		
		int num = (pageNo - 1) * 6;
		List<SourceDto> list = sourceservice.selectLimitSourceWeb(num);
		model.addAttribute("listSource", list);
		
		//model.addAttribute("listSource", sourceservice.selectLimit((pageNo - 1) * 3));
		
		List<SourceDto> list2 = sourceservice.selectBySourceWeb();
		int count2 = list2.size();
		int count = (int)Math.ceil(1.0 * count2/6);
		model.addAttribute("count", count);
		return "users/sourceweb";
	}
}
