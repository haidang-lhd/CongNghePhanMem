package  open4um.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import  open4um.service.TagRoleService;

import  open4um.vo.Product;

// open4um/like
@Controller
@ResponseBody
public class AjaxLikeController {
	@Autowired
	TagRoleService trrsv;

	@RequestMapping(value = "/like1", method = RequestMethod.GET)
	public String like(@RequestParam("idpost") String id) {
		trrsv.updatelike(Integer.parseInt(id));
		return "like";
	}

	
	@RequestMapping(value = "/like2", method = RequestMethod.GET)
	public String like2(@RequestParam("idpost") String id) {
		trrsv.updatelike2(Integer.parseInt(id));
		return "like";
	}
}
