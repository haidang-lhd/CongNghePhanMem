package  open4um.controller;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import  open4um.dto.MessageDto;
import  open4um.dto.MessageIndexDto;
import  open4um.service.MessageService;
import  open4um.service.UserService;
import  open4um.vo.Message;
import  open4um.vo.User;
 
@Controller
public class MessageController {
	@Autowired
	private MessageService messageS;
	@Autowired
	private UserService userSevice;
	@Autowired
	MessageService dao;
	
	@Autowired
	MessageService messageService;
	//jsonMessage  
	@RequestMapping(value="/thong", method = RequestMethod.GET)
	@ResponseBody
	public List<MessageDto> selectAll(){
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<MessageDto> listdto = new ArrayList<MessageDto>();
			for(Message item: messageS.selectAll(userSevice.selectOne(userDetails.getUsername()).getUserid())) {
				MessageDto dto = new MessageDto();
				if(item.getSenduserid() == userSevice.selectOne(userDetails.getUsername()).getUserid()) {
					dto.setUsername(userSevice.selectProfile(item.getReceiveuserid()).getUsername());
				}
				else {
					dto.setUsername(userSevice.selectProfile(item.getSenduserid()).getUsername());
				}
				dto.setContent(item.getContent());
				dto.setDatemsg(item.getDatemsg());
				item.getMessid();
				listdto.add(dto);	
			}		
			return listdto;
		}
		
	//ListMessage Thong
	@RequestMapping(value = "/chatting")
	public String chat(Model model) {    
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("userName", userSevice.selectProfile(userSevice.selectOne(userDetails.getUsername()).getUserid()));
		int myid = userSevice.selectOne(userDetails.getUsername()).getUserid();
		List<User> list = userSevice.selectAll();
		List<User> listAll = new ArrayList<User>();
		for(User item: list) {
			if(item.getUserid() != myid) {
				listAll.add(item);
			}
		}
		for(User items: listAll) {
		}
		model.addAttribute("listAll", listAll);
		return "users/chatting";
	}
	
	@GetMapping("/api/message")
	@ResponseBody
	public List<MessageIndexDto> Message() {
		Map<Integer, Integer> map = new HashMap<>();
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<Message> list = dao.selectMessage(userSevice.selectOne(userDetails.getUsername()).getUserid());
		int id = userSevice.selectOne(userDetails.getUsername()).getUserid();
		for(Message item : list) {
			if(item.getSenduserid() == id) {
				map.put(item.getReceiveuserid(), item.getMessid());
			} else {
				map.put(item.getSenduserid(), item.getMessid());
			}
		}
		Map<Integer, Integer> sortedByCount = map.entrySet()
                .stream()
                .sorted(Map.Entry.comparingByValue(Comparator.reverseOrder()))
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue, (e1, e2) -> e1, LinkedHashMap::new));
		List<MessageIndexDto> result = new ArrayList<MessageIndexDto>();
		Set set = sortedByCount.keySet();
        for (Object key : set) {
            MessageIndexDto dto = new MessageIndexDto();
            dto.setMessid(map.get(key));
            dto.setSenduserid(Integer.parseInt(key.toString()));
            dto.setSendusername(userSevice.selectProfile(Integer.parseInt(key.toString())).getUsername());     
            dto.setContent(messageService.selectOne(map.get(key)).getContent());
            dto.setDatemsg(messageService.selectOne(map.get(key)).getDatemsg());
            result.add(dto);
        }
		return result;
	}
	//boxchat  
	@GetMapping(value="/boxchat/{receiveid}")
	public String boxchat(Model model, @PathVariable("receiveid") Integer receiveuserid){
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int senduserid=	 userSevice.selectOne(userDetails.getUsername()).getUserid();
		List<Message> list = messageS.selectChatting(senduserid, receiveuserid);
		List<MessageIndexDto> result = new ArrayList<MessageIndexDto>();
		for(Message item: list) {
			MessageIndexDto dto = new MessageIndexDto();
			dto.setMessid(item.getMessid());
			dto.setContent(item.getContent());
			dto.setDatemsg(item.getDatemsg());
			dto.setSenduserid(item.getSenduserid());
			dto.setSendusername(userSevice.selectProfile(item.getSenduserid()).getUsername());
			result.add(dto);
		}
		model.addAttribute("boxchat",result);
		model.addAttribute("urlboxchat",receiveuserid);
		return "users/chatbox";
	}
	@PostMapping(value="/boxchat/{receiveid}")
	public String insertchat(Model model, @PathVariable("receiveid") Integer receiveuserid, @RequestParam(value="user-input") String content) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		int senduserid = userSevice.selectOne(userDetails.getUsername()).getUserid();
		Message mess = new Message();
		mess.setSenduserid(senduserid);
		mess.setReceiveuserid(receiveuserid);
		mess.setContent(content);
		messageS.insert(mess);
		return "redirect:/boxchat/{receiveid}";
	}
}
