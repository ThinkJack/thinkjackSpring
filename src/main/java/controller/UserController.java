package controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.github.scribejava.core.model.OAuth2AccessToken;
import common.TempKey;
import github.GithubLoginBo;
import naver.NaverLoginBo;
import org.json.simple.JSONObject;
import common.JsonStringParse;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import org.springframework.social.connect.Connection;

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
import org.springframework.web.bind.annotation.*;

import domain.BoardVO;
import domain.UserVO;
import dto.LoginDTO;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;
import service.UserService;

import java.io.IOException;
import java.net.URLEncoder;


@Controller
@RequestMapping("/user/*")
public class UserController {
	@Inject
	private UserService service;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registerGET(BoardVO board, Model model) throws Exception {
		System.out.println("register GET 진입");
      
    }
	
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String RegisterPost(UserVO user,Model model,RedirectAttributes rttr) throws Exception{
    	System.out.println("regesterPost 진입 ");

    	service.regist(user);
        rttr.addFlashAttribute("authmsg" , "가입시 사용한 이메일로 인증해주 3");

		return "redirect:/";
	}

	@RequestMapping(value = "/authenticate" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody
	String checkDuplicate(HttpServletResponse response, @RequestParam("userEmail") String userEmail, Model model)throws Exception {

		String msg = service.authenticate(userEmail);
		System.out.println("/authenticate 진입"+msg);
		String responseMsg;
		if(msg == "T") {
			responseMsg = "{\"msg\":\""+"사용가능한 이메일 입니다."+"\",\"chk\":\""+"T"+"\"}";
		}else if(msg == "F"){
			responseMsg = "{\"msg\":\""+"인증 대기중인 이메일 입니다. 인증해주세요."+"\"}";
		}else{
			responseMsg = "{\"msg\":\""+"사용이 불가한 이메일 입니다."+"\"}";
		}
		URLEncoder.encode(responseMsg , "UTF-8");

		System.out.println(userEmail);
		System.out.println(responseMsg);
		return responseMsg;

	}

	@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(UserVO user,Model model,RedirectAttributes rttr) throws Exception { // 이메일인증
		System.out.println("cont get user"+user);
		UserVO vo = new UserVO();

		vo=service.userAuth(user);

		if(vo == null) {
			rttr.addFlashAttribute("msg" , "비정상적인 접근 입니다. 다시 인증해 주세요");
			return "redirect:/";

			//페이지 에서 경고창 스크립트
//			<script type="text/javascript">
//					var msg = '${msg}';
//			if(msg){
//				alert(msg);
//			}
//			</script>
		}
		//System.out.println("usercontroller vo =" +vo);
		model.addAttribute("login",vo);

		return "/user/emailConfirm";

	}

	//비밀번호 찾기 기능
    @RequestMapping(value = "/findPassword", method = RequestMethod.GET)
    public void findPasswordGET(BoardVO board, Model model) throws Exception {
        System.out.println("password 찾기 GET 진입");

    }

    @RequestMapping(value = "/findPassword", method = RequestMethod.POST)
    public String findPasswordPost(UserVO user,Model model,RedirectAttributes rttr) throws Exception{
        System.out.println("find passwordPost 진입 ");

        String str= user.getUserEmail();

		String msg = service.authenticate(str);
		System.out.println("/authenticate 진입"+msg);

		if(msg == "T") {
			rttr.addFlashAttribute("msg" , "이메일이 없습니다. 회원가입을 해주세요");
		}else if(msg == "F"){
			rttr.addFlashAttribute("msg" , "인증 대기중인 이메일 입니다. 인증해주세요.");
		}else{
			service.findPassword(user);
			rttr.addFlashAttribute("msg" , "이메일 인증 후 비밀번호를 변경해 주세요");
		}

        return "redirect:/";
    }
    @RequestMapping(value = "/findPasswordConfirm", method = RequestMethod.GET)
    public String passwordSetConfirm(UserVO user, Model model, RedirectAttributes rttr) throws Exception { // 이메일인증
        //System.out.println(userEmail);
		UserVO vo = new UserVO();

		vo=service.userAuth(user);

		if(vo == null) {
			rttr.addFlashAttribute("msg" , "비정상적인 접근 입니다. 다시 인증해 주세요");
			return "redirect:/";
		}

		model.addAttribute("login",vo);

        return "user/setPassword";
    }

	@RequestMapping(value = "/setPassword", method = RequestMethod.GET)
	public void setPassword(UserVO user, Model model, RedirectAttributes rttr) throws Exception {

	}

	@RequestMapping(value = "/setPassword", method = RequestMethod.POST)
	public String setPasswordPost(UserVO user, Model model, RedirectAttributes rttr) throws Exception {
			System.out.println("패스워드 변경 값"+user);
    	try{
			service.modifypassUser(user);
			rttr.addFlashAttribute("msg" , "변경되었습니다. 변경된 패스워드로 로그인해 주세요");
		}catch (Exception e){
			rttr.addFlashAttribute("msg" , "오류가 발생했습니다. 관리자에게 문의 주세요");
		}

		return "redirect:/";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {
		
	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception{
		System.out.println("loginPost");
		UserVO vo = service.login(dto);
		//System.out.println("usercontroller vo =" +vo);
		if(vo == null) {
			return;
		}
		//System.out.println("usercontroller vo =" +vo);
		model.addAttribute("userVO",vo);
		System.out.println(vo);

	}

	@RequestMapping(value = "/loginPost", method = RequestMethod.GET)
	public void loginPOSTGet(LoginDTO dto, HttpSession session, Model model) throws Exception{
		session.setAttribute("dest","/");
	}

	@RequestMapping(value = "/socialLoginPost", method = RequestMethod.GET)
	public void socialLoginPOSTGet(LoginDTO dto, HttpSession session, Model model) throws Exception{

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
	@RequestMapping(value = "/modifyAuthCheck", method = RequestMethod.GET)
	public void ModifyUserAuthGet(UserVO user,Model model) throws Exception{

	}

	@RequestMapping(value = "/modifyAuthCheck", method = RequestMethod.POST)
	public String ModifyUserAuthPost(@ModelAttribute("dto") LoginDTO dto,Model model) throws Exception{
		UserVO vo = service.login(dto);
		if(vo == null) {
			return "user/modifyAuthCheck";
		}
		//System.out.println("usercontroller vo =" +vo);
		model.addAttribute("userVO",vo);

		return "user/modifyUser";

	}

	@RequestMapping(value = "/modifyUser", method = RequestMethod.GET)
	public void ModifyUserGet(UserVO user,Model model) throws Exception{

	}
	@RequestMapping(value = "/modifyUser", method = RequestMethod.POST)
	public String ModifyUserPost(UserVO user,Model model) throws Exception{
		service.modifyUser(user);
		return "redirect:/";
	}
	@RequestMapping (value="/deleteUser",method = RequestMethod.GET)
	public String deleteUser(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		Object obj = session.getAttribute("login");
		System.out.println("obj"+obj);


		UserVO vo = (UserVO)obj;

		service.deleteUser(vo);
		System.out.println("회원 탈퇴");

		if(obj !=null){
			vo=(UserVO) obj;

			session.removeAttribute("login");
			session.invalidate();

			Cookie loginCookie = WebUtils.getCookie(request,"loginCookie");
			if(loginCookie !=null){
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);

			}
		}
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
	public ModelAndView callback(@RequestParam String code, @RequestParam String state, HttpSession session,Model model) throws IOException {
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
		TempKey TK = new TempKey();


		dto.setUserEmail("naver");
		dto.setUserSocialId("n"+userSocialId);
		dto.setUserName(name+"#"+TK.generateNumber(5));

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
			//username이 겹칠 시 userName 변경 페이지로 이동하는 기능 필요
		}



		//소셜아이디로 uid를 찾는 로직 추가 해야함


		if(vo != null) {
			session.setAttribute("login", vo );
			//response.sendRedirect("/");
			//System.out.println(userVO);
			Object dest = session.getAttribute("dest");
			if(dest=="/user/login"){
				session.setAttribute("dest","/");
			}
			System.out.println("postHandle dest: "+dest);

		}else{
			session.setAttribute("dest","/user/login");
		}

		return new ModelAndView("redirect:/user/socialLoginPost", "result", vo);
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
    public String doSessionAssignActionPage(HttpServletRequest request, Model model)throws Exception{
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
		TempKey TK = new TempKey();

        System.out.println(person.getDisplayName());
        dto.setUserEmail("google");
        dto.setUserName(person.getDisplayName()+"#"+TK.generateNumber(5));
        dto.setUserSocialId("g"+person.getId());
        HttpSession session = request.getSession();
		System.out.println("controller dto: "+dto);

		UserVO vo = new UserVO();

		try {
			vo = service.googleLogin(dto);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//username이 겹칠 시 userName 변경 페이지로 이동하는 기능 필요
		}


		if(vo != null) {
			session.setAttribute("login", vo );
			//response.sendRedirect("/");
			//System.out.println(userVO);
			Object dest = session.getAttribute("dest");
			if(dest=="/user/login"){
				session.setAttribute("dest","/");
			}
			System.out.println("postHandle dest: "+dest);

		}else{
			session.setAttribute("dest","/user/login");
		}



//        session.setAttribute("login", vo );
//		model.addAttribute("userVO",vo);
		//System.out.println("getAattributeNames"+session.getAttribute(savedest));
        return "redirect:/user/socialLoginPost";
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
	public ModelAndView githubcallback(@RequestParam String code, @RequestParam String state, HttpSession session,Model model) throws IOException {
		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */
//		System.out.println("/callback 진입 토튼 발급 전 ");
//		System.out.println("session : "+session);
//		System.out.println("state : "+state);
//		System.out.println("code : "+code);

		//토큰 생성
		OAuth2AccessToken oauthToken = githubLoginBo.getAccessToken(session, code, state);

		//System.out.println("github oauthToken 값: "+oauthToken);
		githubapiResult = githubLoginBo.getUserProfile(oauthToken);
		//System.out.println(githubapiResult);

		//JSON 형식을 parsing 하기 위한 준비
		Object obj = null;
		JSONParser parser = new JSONParser();
		try {
			obj = parser.parse(githubapiResult);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//JSON 객체 생성
		JSONObject jsonobj = (JSONObject) obj;

		//System.out.println(jsonobj);
		String name = (String) jsonparse.JsonToString(jsonobj, "login");
		String userSocialId = (String) (jsonparse.JsonToString(jsonobj, "id")+"");


		UserVO vo =new UserVO();
		LoginDTO dto = new LoginDTO();
		TempKey TK = new TempKey();

		dto.setUserEmail("github");
		dto.setUserSocialId("git"+userSocialId);
		dto.setUserName(name+"#"+TK.generateNumber(5));

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

		//세션 생성
		if(vo != null) {
			session.setAttribute("login", vo );
			//response.sendRedirect("/");
			//System.out.println(userVO);
			Object dest = session.getAttribute("dest");
			if(dest=="/user/login"){
				session.setAttribute("dest","/");
			}
			System.out.println("postHandle dest: "+dest);

		}else{
			session.setAttribute("dest","/user/login");
		}

		System.out.println("UserVO "+vo);
		session.setAttribute("login",vo);
		model.addAttribute("userVO",vo);
		return new ModelAndView("redirect:/user/socialLoginPost", "result", vo);
	}

public static void destDefault (UserVO vo){

}


}
