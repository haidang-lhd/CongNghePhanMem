package open4um.apiloginregister;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import tp.kits3.open4um.service.SourceService;
import tp.kits3.open4um.vo.Source;

@Controller
public class PostApi {
	static int dem = 1;
	@Autowired
	private SourceService sourceService;

	@PostMapping("/post/page")
	@ResponseBody
	public List<Source> readMore(@RequestBody int page) {
		int limit = 2 * dem;
		int offset = page * limit;
		List<Source> ListSource = sourceService.ListMoreSource(limit, offset);
		dem++;
		if(ListSource.size() <= 1) {
			dem = 1;
		}
		Gson gson = new Gson();
		gson.toJson(ListSource);
		return ListSource;
	}
	@PostMapping("/search")
	@ResponseBody
	public List<Source> ListSearchSource(@RequestBody String key){
		List<Source> ListSource = sourceService.ListSearchSource(key);
		Gson gson = new Gson();
		gson.toJson(ListSource);
		return ListSource;
	}
}
