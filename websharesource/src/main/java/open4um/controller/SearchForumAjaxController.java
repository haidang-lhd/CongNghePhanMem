package open4um.controller;
 
  
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import  open4um.dto.Search;
import  open4um.service.SearchService;


@Controller
public class SearchForumAjaxController {
	@Autowired
	private SearchService searchsv;
	@RequestMapping (value ="/forum/searchajax/", method = RequestMethod.GET)
	@ResponseBody
	public List<Search> searchAjax (@RequestParam("search") String key) {
		return searchsv.selectSearch(key);
	}
	
}
