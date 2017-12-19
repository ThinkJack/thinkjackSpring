package controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.github.scribejava.core.model.OAuth2AccessToken;
import github.GithubLoginBo;
import naver.NaverLoginBo;
import org.json.simple.JSONObject;
import common.JsonStringParse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
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
		System.out.println(naverAuthUrl);
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
		dto.setUserEmail("naver");
		dto.setUserSocialId("n"+userSocialId);
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

    //google 로그인 컨트롤러

	/* GoogleLogin */
	@Inject
	private GoogleConnectionFactory googleConnectionFactory;
	@Inject
	private OAuth2Parameters googleOAuth2Parameters;



	@RequestMapping(value = "/googleLogin", method = { RequestMethod.GET, RequestMethod.POST })
    public String doGoogleSignInActionPage(HttpServletResponse response, Model model) throws Exception{
        OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();

//		googleOAuth2Parameters.setRedirectUri("http://localhost:8080/user/googleLogincallback");
        String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
        System.out.println("/user/googleLogincallback, url : " + url);
        model.addAttribute("url",url);

        return "user/googleLogin";

    }


    @RequestMapping(value = "/googleLogincallback")
    public String doSessionAssignActionPage(HttpServletRequest request)throws Exception{
        System.out.println("/user/googleLogincallback");
        String code = request.getParameter("code");

		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code , googleOAuth2Parameters.getRedirectUri(),
				null);

		String accessToken = accessGrant.getAccessToken();
		Long expireTime = accessGrant.getExpireTime();
		if (expireTime != null && expireTime < System.currentTimeMillis()) {
			accessToken = accessGrant.getRefreshToken();
			System.out.printf("accessToken is expired. refresh token = {}", accessToken);
		}
		Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();

		PlusOperations plusOperations = google.plusOperations();
		Person person = plusOperations.getGoogleProfile();

		//System.out.println("UserVO 전");

        LoginDTO dto = new LoginDTO();


        System.out.println(person.getDisplayName());
        dto.setUserEmail("google");
        dto.setUserName(person.getDisplayName());
        dto.setUserSocialId("g"+person.getId());
        HttpSession session = request.getSession();
		System.out.println("controller dto: "+dto);

		UserVO vo = new UserVO();
        vo = service.googleLogin(dto);



        session.setAttribute("login", vo );

		//System.out.println("getAattributeNames"+session.getAttribute(savedest));
        return "redirect:/freeBoard/list";
    }

//======================================github login ==================================================


	private GithubLoginBo githubLoginBo;
	private String githubapiResult = null;

	/* githubLoginBO */

	@Inject
	private void setGithubLoginBo(GithubLoginBo githubLoginBo) {
		this.githubLoginBo = githubLoginBo;
	}

	@RequestMapping(value="/githubLogin", method = RequestMethod.GET)
	public ModelAndView githublogin(HttpSession session) {
		/* github 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
		String githubAuthUrl = githubLoginBo.getAuthorizationUrl(session);
		System.out.println("github Login controller 호출");
		System.out.println(githubAuthUrl);
		return new ModelAndView("user/githubLogin", "url", githubAuthUrl);
	}

	@RequestMapping(value="/githubcallback",method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView githubcallback(@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {
		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */
		System.out.println("/callback 진입 토튼 발급 전 ");
		System.out.println("session : "+session);
		System.out.println("state : "+state);
		System.out.println("code : "+code);

		OAuth2AccessToken oauthToken = githubLoginBo.getAccessToken(session, code, state);

		System.out.println("github oauthToken 값: "+oauthToken);
		githubapiResult = githubLoginBo.getUserProfile(oauthToken);
		System.out.println(githubapiResult);

		JSONObject jsonobj = jsonparse.stringToJson(githubapiResult, "response");

		String userSocialId = jsonparse.JsonToString(jsonobj, "id");
		String name = jsonparse.JsonToString(jsonobj, "nickname");

		UserVO vo =new UserVO();
		LoginDTO dto = new LoginDTO();
		dto.setUserEmail("github");
		dto.setUserSocialId("git"+userSocialId);
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




}
