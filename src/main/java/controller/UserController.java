package controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.github.scribejava.core.model.OAuth2AccessToken;
import naver.NaverLoginBo;
import org.json.simple.JSONObject;
import common.JsonStringParse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import domain.BoardVO;
import domain.UserVO;
import dto.LoginDTO;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;
import service.UserService;

import java.io.IOException;
import java.util.Date;

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
		//System.out.println("usercontroller vo =" +vo);
		if(vo == null) {
			return;
		}
		//System.out.println("usercontroller vo =" +vo);
		model.addAttribute("userVO",vo);

		
	}

	@RequestMapping (value="/logout",method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
    	Object obj = session.getAttribute("login");

    	if(obj !=null){
    		UserVO vo=(UserVO) obj;

    		session.removeAttribute("login");
    		session.invalidate();

    		Cookie loginCookie = WebUtils.getCookie(request,"loginCookie");
    		if(loginCookie !=null){
    			loginCookie.setPath("/");
    			loginCookie.setMaxAge(0);
    			response.addCookie(loginCookie);

			}
		}
		return "user/logout";
	}


	@RequestMapping(value = "/modifyUser", method = RequestMethod.GET)
	public String ModifyUserGet(UserVO user,Model model) throws Exception{
		service.modifyUser(user);
		return "redirect:/";
	}
	@RequestMapping(value = "/modifyUser", method = RequestMethod.POST)
	public String ModifyUserPost(UserVO user,Model model) throws Exception{
		service.modifyUser(user);
		return "redirect:/";
	}



	//Login Api======================================================================
	private NaverLoginBo naverLoginBo;
	private String apiResult = null;
	/* NaverLoginBO */
	@Inject
	private void setNaverLoginBO(NaverLoginBo naverLoginBo) {
		this.naverLoginBo = naverLoginBo;
	}

	@Inject
	private JsonStringParse jsonparse;

//	@RequestMapping(value="/naverLogin", method = RequestMethod.GET)
//	public void loginGet(HttpSession session) {
//
//	}

	@RequestMapping(value="/naverLogin", method = RequestMethod.GET)
	public ModelAndView login(HttpSession session) {
		/* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
		String naverAuthUrl = naverLoginBo.getAuthorizationUrl(session);
		System.out.println("naverLogin controller 호출");
		//System.out.println();
		return new ModelAndView("user/naverLogin", "url", naverAuthUrl);
	}

	@RequestMapping(value="/callback",method = RequestMethod.GET)
	public ModelAndView callback(@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {
		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */
	/*	System.out.println("/callback 진입 토튼 발급 전 ");
		System.out.println("session : "+session);
		System.out.println("state : "+state);
		System.out.println("code : "+code);*/

		OAuth2AccessToken oauthToken = naverLoginBo.getAccessToken(session, code, state);

		System.out.println("oauthToken 값: "+oauthToken);
		apiResult = naverLoginBo.getUserProfile(oauthToken);
	     System.out.println(apiResult);

		JSONObject jsonobj = jsonparse.stringToJson(apiResult, "response");

		String userSocialId = jsonparse.JsonToString(jsonobj, "id");
		String name = jsonparse.JsonToString(jsonobj, "nickname");

		UserVO vo =new UserVO();
		LoginDTO dto = new LoginDTO();
		dto.setUserSocialId(userSocialId);
		dto.setUserName(name);

//		System.out.println("======================JSON 파싱값================");
//		System.out.println("name: "+name);
//		System.out.println("id: "+userSocialId );
//		System.out.println("UserVO "+vo);
//		System.out.println("UserVO "+dto);
		try {
			vo = service.naverLogin(dto);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		//소셜아이디로 uid를 찾는 로직 추가 해야함
		System.out.println("UserVO "+vo);
		session.setAttribute("login",vo);
		return new ModelAndView("redirect:/freeBoard/list", "result", vo);
	}


//	@RequestMapping(value = "/naverSuccess", method = RequestMethod.GET)
//	public void naverSuccess (HttpSession session, UserVO user,Model model) throws Exception{
//
//	}
}
