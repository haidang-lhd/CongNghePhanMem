package  open4um.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import  open4um.service.TagRoleService;

@Controller
@ResponseBody
public class AjaxDislikeController {
	@Autowired
	TagRoleService trrsv;

	@RequestMapping(value = "/dislike1", method = RequestMethod.GET)
	public String like(@RequestParam("idpost") String id) {
		trrsv.updatedislike(Integer.parseInt(id));
		return "dislikes";
	}

	
	@RequestMapping(value = "/dislike2", method = RequestMethod.GET)
	public String like2(@RequestParam("idpost") String id) {
		trrsv.updatedislike2(Integer.parseInt(id));
		return "dislikes";
	}
}
