package open4um.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tp.kits3.open4um.dto.SourceDto;
import tp.kits3.open4um.service.SourceService;
import tp.kits3.open4um.service.TagService;

@Controller
public class TagController {
	@Autowired
	private SourceService sourcesv;
	@RequestMapping(value = { "/tag/{tagid}" }, method = RequestMethod.GET)
	public String loadSourceTag(Model model, @PathVariable int tagid) {
		List<SourceDto> listsource = sourcesv.selectSourceByTag(tagid); 
		model.addAttribute("listSourceTag",listsource);
		int num = (1 - 1) * 6;
		
		HashMap<String, Integer> hs = new HashMap<String, Integer>();
		hs.put("tagid", tagid);
		hs.put("pageNo", 0);
		List<SourceDto> listSource2 = sourcesv.selectLimitTag(hs);
		
		for(SourceDto item : listSource2) {
			System.out.println(item.getCtgname());
		}
		
		model.addAttribute("listSource", listSource2);
		int count = (int)Math.ceil(1.0*listsource.size()/6);
		
		model.addAttribute("count", count);
		return "users/tag";
		
		
	}
	@RequestMapping(value = "/tag/{tagid}/{pageNo}", method = RequestMethod.GET)
	public String page3(Model model, @PathVariable(name="pageNo") int pageNo, @PathVariable int tagid) {
		
		int num = (pageNo - 1) * 6;
		HashMap<String, Integer> hs = new HashMap<String, Integer>();
		hs.put("tagid", tagid);
		hs.put("pageNo", pageNo);
		List<SourceDto> listSource2 = sourcesv.selectLimitTag(hs);
		model.addAttribute("listSource", listSource2);
		model.addAttribute("chothong", tagid);
		List<SourceDto> listsource = sourcesv.selectSourceByTag(tagid);
		int count2 = listsource.size();
		int count = (int)Math.ceil(1.0 * count2/6);
		model.addAttribute("count", count);
		
		return "users/tag";
	}
	

}
