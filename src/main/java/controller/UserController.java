package controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import domain.BoardVO;
import domain.UserVO;
import dto.LoginDTO;
import service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	@Inject
	private UserService service;
	
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registerGET(BoardVO board, Model model) throws Exception {

      
    }
	
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String RegisterPost(UserVO user,Model model) throws Exception{
		service.regist(user);
		return "redirect:/freeBoard/list";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {
		
	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception{
		
		UserVO vo = service.login(dto);
		System.out.println("usercontroller vo =" +vo);
		if(vo == null) {
			return;
		}
		System.out.println("usercontroller vo =" +vo);
		model.addAttribute("userVO",vo);
		
	}
	

}
