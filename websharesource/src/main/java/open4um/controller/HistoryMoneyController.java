package  open4um.controller;
/**
 * @author Thong
 */
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import  open4um.service.HistoryMoneyService;
import  open4um.service.UserService;
import  open4um.vo.HistoryMoney;
@Controller
public class HistoryMoneyController {
	@Autowired
	private HistoryMoneyService historyS;
	@Autowired UserService userS;
	/**
	 * 
	 * @param  listInput
	 * @return
	 */
	@RequestMapping(value="/historymoney", method = RequestMethod.GET)
	public String historyMoney(Model model) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<HistoryMoney> list = historyS.selectAll(userS.selectOne(userDetails.getUsername()).getUserid());
		model.addAttribute("historyMoney", list);
		model.addAttribute("userName", userS.selectProfile(userS.selectOne(userDetails.getUsername()).getUserid()));
		return "users/history-input";
	}
	/**
	 * 
	 * @param Thong searchInput
	 * @return
	 */
	@RequestMapping(value="/search-input", method = RequestMethod.GET)
	public String searchInput(Model model, @RequestParam("searchInput") String searchInput) {
		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<HistoryMoney> listSearch = historyS.selectSearch(userS.selectOne(userDetails.getUsername()).getUserid(), searchInput);
		model.addAttribute("historyMoney", listSearch);
		model.addAttribute("userName", userS.selectProfile(userS.selectOne(userDetails.getUsername()).getUserid()));
		return "users/history-input";
	}
	/* It deletes record for the given id in URL */
	@RequestMapping(value="/historymoney/{id}",method = RequestMethod.GET)    
    public String delete(Model model , @PathVariable("id") Integer Id ){    
		historyS.delete(Id); 
        return "redirect:/historymoney";    
    }
}