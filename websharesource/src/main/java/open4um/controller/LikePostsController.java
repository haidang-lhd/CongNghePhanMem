package  open4um.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;

import  open4um.service.LikeProduct;
import  open4um.service.ProductService;
import  open4um.vo.Product;

@Controller
public class LikePostsController {
	@Autowired
	private LikeProduct likeprosv;
	
	@Autowired
	private ProductService productService;

	@RequestMapping (value = "/forum/updatelikeajax/", method = RequestMethod.POST)
	@ResponseBody
	public int likePosts (@RequestBody String idpro) {
		Product listPro =  likeprosv.selectLikeP(Integer.parseInt(idpro));

		listPro.setLike(listPro.getLike()+1);
		productService.update(listPro);
		return listPro.getLike();
	}
}
