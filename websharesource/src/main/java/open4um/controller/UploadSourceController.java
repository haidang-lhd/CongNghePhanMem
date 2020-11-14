package open4um.controller;

 

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import tp.kits3.open4um.dto.SourceDto;
import tp.kits3.open4um.service.CategoryService;
import tp.kits3.open4um.service.RatingService;
import tp.kits3.open4um.service.SourceService;
import tp.kits3.open4um.service.TagService;
import tp.kits3.open4um.service.UserService;
import tp.kits3.open4um.vo.Rating;
import tp.kits3.open4um.vo.Source;
import tp.kits3.open4um.vo.Tag;
import tp.kits3.open4um.vo.TagProduct;




@SuppressWarnings("unused")
@Controller

public class UploadSourceController {
	@Autowired
	private SourceService sourceservice;
	@Autowired
	private CategoryService categoryservice; // new categoryservice()
	@Autowired
	private UserService userService;
	@Autowired
	private RatingService ratingService;
	public Long filesize;
	@Autowired
	private TagService tagService;
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value ="/insertsource", method = RequestMethod.POST)
	public String insertSource(@RequestParam(value = "action", required = false) String action,
			@RequestParam(value="sourcename", required = true) String sourcename, 
			@RequestParam(value="ctgid", required = true) int ctgid,
			@RequestParam(value = "size", required = true) MultipartFile size, 
			@RequestParam(value="contentdetails", required = true) String contentdetails,
			@RequestParam(value="avatar", required = true) MultipartFile avatar, 
			/* @RequestParam(value="ctgname", required = true) String ctgname, */
			@RequestParam(value="price", required = true) String price,
			@RequestParam(value="tags-3", required = true) String tag,
			HttpServletRequest request,  Model model)
			{

				
				if(action.equals("add")) {
					String date= LocalDateTime.now().toString(); 

					//System.out.print(date);	
//					category category = new category(ctgname);
//					categoryservice.insertCategory(category);
					
					if (size != null) {
						try {
							InputStream inputStream = size.getInputStream();				
							if (inputStream == null)
								System.out.println("File inputstream is null");
							//load img built path
							String path = request.getServletContext().getRealPath("resources/images/");
							System.out.println(path);
							FileUtils.forceMkdir(new File(path));
							System.out.println(path + size.getOriginalFilename());
							File upload = new File (path + size.getOriginalFilename());
							size.transferTo(upload);
							IOUtils.closeQuietly(inputStream);
						} catch (IOException ex) {
							System.out.println("Error saving uploaded file");
						}
						filesize = size.getSize();
					}
					if (avatar != null) {
						try {
							InputStream inputStream = avatar.getInputStream();				
							if (inputStream == null)
								System.out.println("File inputstream is null");
							//load img built path
							String path = request.getServletContext().getRealPath("resources/images/");
							System.out.println(path);
							FileUtils.forceMkdir(new File(path));
							File upload = new File (path + avatar.getOriginalFilename());
							System.out.println(avatar.getOriginalFilename());
							avatar.transferTo(upload);
							IOUtils.closeQuietly(inputStream);
						} catch (IOException ex) {
							System.out.println("Error saving uploaded file");
						}
						
					}
					
					String[] listtag = tag.split(",");
//					LUU ID TAG LIST
					
					List<Integer> tgid = new ArrayList<Integer>();
					System.out.println("jooo: " + listtag.length);
					for(int i = 0; i<listtag.length; i++) {
						System.out.println("s");
						Tag tg = tagService.selectTag(listtag[i]);
						System.out.println("abc: " + tg);
						if(tg == null) {
							Tag tag1 = new Tag(listtag[i]);
							System.out.println("a: " + tag1.getTagname());
							tagService.insert(tag1);
							Tag tg2 = tagService.selectTag(listtag[i]);
							System.out.println("b: " + tg2.getTagname());
							tgid.add(tg2.getTagid());
						} else {
							tgid.add(tg.getTagid());
						}
					}
					
					int price1 = Integer.parseInt(price);
					//System.out.println("ID: "+category.getCtgid());
					Source source = new Source(date,sourcename,size.getOriginalFilename(),contentdetails,String.valueOf(filesize),1,ctgid,price1,avatar.getOriginalFilename());
					sourceservice.add(source);
					Source cuc = sourceservice.selectA(source.getSourcename());
					System.out.println(cuc.getSourceid());
					for(Integer item : tgid) {
						TagProduct tgproduct = new TagProduct(item, cuc.getSourceid());
						tagService.insertTagProduct(tgproduct);
					}
					return "redirect:/";
				}
				return "";
				
	}
//	@RequestMapping(value = "/insertsource/list", method = RequestMethod.GET)
//	public String showList(Model model) {
//		List<source> listSource = sourceservice.getAll();
//		model.addAttribute("listsource",listSource);
//		return "users/unsual";
//	}
//	@ResponseBody
//	public String downloadImg(HttpServletRequest request) {
//		Source source = (Source) request.getSession()
//				.getAttribute("source");
//		if (source != null)
//			return source.getAvatar();
//		else
//			return null;
//	}

	
	@RequestMapping(value="/source/{sourceid}/{ctgname}", method=RequestMethod.GET)
	public String test1(@PathVariable int sourceid, @PathVariable String ctgname, Model model, SourceDto source) {
		
	 
		Rating avgStart = ratingService.avgStart(sourceid);
		List<Rating> lRating = ratingService.countSumStart(sourceid);
		if(avgStart != null) {
			model.addAttribute("avgStart", Math.ceil(avgStart.getAvgStart()));	
			model.addAttribute("sourceid", avgStart.getSourceid());	
		} 
		if(lRating.size() > 0) {
			model.addAttribute("lRating", lRating);
		}
		
		Source src = sourceservice.showOne(sourceid);
		
		Timestamp stamp =  java.sql.Timestamp.valueOf(src.getDate());
		src.setDate(new SimpleDateFormat("dd/MM/yyyy").format(stamp));
		
		
		float mb = 0;
		if(src.getTitle() != null) {
			
			mb = Float.parseFloat(src.getTitle());
			
			DecimalFormat df = new DecimalFormat("#.##");

		    float sizeMb = 1024.0f * 1024.0f;

	        mb = Float.valueOf(df.format(mb / sizeMb));
		    
		}
		
		src.setTitle(String.valueOf(mb));
		
		model.addAttribute("listSourceOne", src);
		List<SourceDto> source2 = sourceservice.showSourceTheSame(ctgname);
		
		model.addAttribute("listSourceTheSame",source2);
		model.addAttribute("listTag",tagService.selectTagBySource(sourceid));
		return "users/showone";	
	}
	
	@PostMapping("/rating/add")
	public String uploadRating (Rating rating) {
		 
		String[] arrUrll = rating.getUrl().split("/");
		String url = arrUrll[arrUrll.length - 3] +"/" + arrUrll[arrUrll.length - 2]  +"/"+ arrUrll[arrUrll.length - 1];
		System.out.println(url);
		int row;
		try {
			row = ratingService.uploadRating(rating);
		} catch (Exception e) {
			return "redirect:/404";
		}
		return "redirect:/"+url;
	}
}

	
	

	


