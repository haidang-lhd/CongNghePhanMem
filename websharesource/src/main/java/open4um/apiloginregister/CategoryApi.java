package tp.kits3.open4um.apiloginregister;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tp.kits3.open4um.service.CategoryService;
import tp.kits3.open4um.service.SourceService;
import tp.kits3.open4um.vo.Category;
import tp.kits3.open4um.vo.Source;

@Controller
@RequestMapping("/api")
public class CategoryApi {
	@Autowired 
	private CategoryService catesv;
	
	@Autowired
	private SourceService sourcesv;
	
	@RequestMapping(value="/showCate", method= RequestMethod.GET)
	@ResponseBody
	public List<Category> showCategory(Model model){
		return catesv.selectCategoryBySource();
	}
	
	
	

}
