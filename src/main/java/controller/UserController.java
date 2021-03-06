package controller;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.github.scribejava.core.model.OAuth2AccessToken;
import common.TempKey;
import common.UploadFileUtils;
import domain.*;
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

import dto.LoginDTO;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;
import service.SrcService;
import service.UserService;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;


@Controller
@RequestMapping("/user/*")
public class UserController {

	@Inject
	private UserService service;

	@Inject
	private SrcService srcService;
	//유저 등록
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registerGET(BoardVO board, Model model) throws Exception {
		//System.out.println("register GET 진입");
      
    }

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String RegisterPost(UserVO user,Model model,RedirectAttributes rttr) throws Exception{
    	//System.out.println("regesterPost 진입 ");
    	service.regist(user);
        rttr.addFlashAttribute("msg" , "가입시 사용한 이메일로 인증해주세요");
		return "redirect:/";
	}

    //유저 email 중복 체크
	@RequestMapping(value = "/authenticate" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody
	String checkDuplicate(HttpServletResponse response, @RequestParam("userEmail") String userEmail, Model model)throws Exception {

		String msg = service.authenticate(userEmail);
		//System.out.println("/authenticate 진입"+msg);
		String responseMsg;
		if(msg == "T") {
			responseMsg = "{\"msg\":\""+"사용가능한 이메일 입니다."+"\",\"chk\":\""+"T"+"\"}";
		}else if(msg == "F"){
			responseMsg = "{\"msg\":\""+"인증 대기중인 이메일 입니다. 인증해주세요."+"\"}";
		}else{
			responseMsg = "{\"msg\":\""+"사용이 불가한 이메일 입니다."+"\"}";
		}
		URLEncoder.encode(responseMsg , "UTF-8");
		//System.out.println(userEmail);
		//System.out.println(responseMsg);
		return responseMsg;
	}

    //유저 네임 중복 체크
    @RequestMapping(value = "/authenticateName" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    public @ResponseBody
    String checkDuplicateName(HttpServletResponse response, @RequestParam("userName") String userName, Model model)throws Exception {
        //System.out.println("/authenticateName 진입");
        String msg = service.authenticateName(userName);
       // System.out.println("/authenticateName 진입"+msg);
        String responseMsg;
        if(msg == "T") {
            responseMsg = "{\"msg\":\""+"사용가능한 이름 입니다."+"\",\"chk\":\""+"T"+"\"}";
        }else{
            responseMsg = "{\"msg\":\""+"중복된 이름 입니다. 다시 설정해 주세요"+"\"}";
        }
        URLEncoder.encode(responseMsg , "UTF-8");
        //System.out.println(userName);
        //System.out.println(responseMsg);
        return responseMsg;

    }
	//이메일 인증 코드 검증
	@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(UserVO user,Model model,RedirectAttributes rttr) throws Exception { // 이메일인증
		//System.out.println("cont get user"+user);
		UserVO vo = new UserVO();
		vo=service.userAuth(user);
		if(vo == null) {
			rttr.addFlashAttribute("msg" , "비정상적인 접근 입니다. 다시 인증해 주세요");
			return "redirect:/";
		}
		//System.out.println("usercontroller vo =" +vo);
		model.addAttribute("login",vo);
		return "/user/emailConfirm";
	}

	//비밀번호 찾기 기능
    @RequestMapping(value = "/findPassword", method = RequestMethod.GET)
    public void findPasswordGET(UserVO user, Model model) throws Exception {
        //System.out.println("password 찾기 GET 진입");

    }
	//이메일 확인 후
    @RequestMapping(value = "/findPassword", method = RequestMethod.POST)
    public String findPasswordPost(UserVO user,Model model,RedirectAttributes rttr) throws Exception{
        //System.out.println("find passwordPost 진입 ");
		//userEmail 값으로 회원 여부 확인 requestparam 으로 변경??
        String str= user.getUserEmail();
		String msg = service.authenticate(str);
		//System.out.println("/authenticate 진입"+msg);
        //계정 상태에 따른 메시지
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
    //비밀번호 찾기 이메일 인증 코드 검증
    @RequestMapping(value = "/findPasswordConfirm", method = RequestMethod.GET)
    public String passwordSetConfirm(UserVO user, Model model, RedirectAttributes rttr) throws Exception { // 이메일인증
       // System.out.println("컨트롤러 입력 정보: "+user);
		UserVO vo=service.userAuthFindPassword(user);
        //System.out.println("controller 서비스에서 받은: "+vo);
		if(vo == null) {
			rttr.addFlashAttribute("msg" , "비정상적인 접근 입니다. 다시 인증해 주세요");
			return "redirect:/";
		}
		int id=vo.getUserId();
        rttr.addFlashAttribute("setPassword",true);
		rttr.addFlashAttribute("userId",id);

		//model.addAttribute("userId",id);
		//rttr.addAttribute("login",vo);
		//System.out.println("Confirm VO : "+vo);

        return "redirect:setPassword";
    }

    @RequestMapping(value = "/setPassAuthCheck", method = RequestMethod.GET)
    public void setPassUserAuthGet(UserVO user,Model model) throws Exception{

    }
    @RequestMapping(value = "/setPassAuthCheck", method = RequestMethod.POST)
    public String setPassUserAuthPost(@ModelAttribute("dto") LoginDTO dto,Model model,RedirectAttributes rttr) throws Exception{
        //System.out.println(dto);
        UserVO vo = service.login(dto);
       // System.out.println(vo);
        if(vo == null) {
            return "user/setPassAuthCheck";
        }
        //System.out.println("usercontroller vo =" +vo);
        model.addAttribute("userVO",vo);
        //model.addAttribute("modify",true);
        int id=vo.getUserId();
        rttr.addFlashAttribute("userId",id);
        //패스워드 권한 인증 코드 전송
        rttr.addFlashAttribute("setPassword",true);
        return "redirect:/user/setPassword";

    }

	@RequestMapping(value = "/setPassword", method = RequestMethod.GET)
	public void setPassword(UserVO user, Model model, RedirectAttributes rttr) throws Exception {

	}
	//패스워드 변경
	@RequestMapping(value = "/setPassword", method = RequestMethod.POST)
	public String setPasswordPost(UserVO user, Model model, RedirectAttributes rttr) throws Exception {
			//System.out.println("패스워드 변경 값"+user);
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
	public void loginPOST(LoginDTO dto, HttpSession session, Model model,RedirectAttributes rttr) throws Exception{
		//System.out.println("loginPost");
		UserVO vo = service.login(dto);
		//System.out.println("usercontroller vo =" +vo);
		if(vo == null) {
			rttr.addFlashAttribute("msg" , "아이디 또는 비밀번호가 일치하지 않습니다.");
			System.out.println("아이디 비밀번호 실패");
			model.addAttribute("userVO",vo);
			return;
		}else if(vo.getUserState()==0){
			rttr.addFlashAttribute("msg" , "인증 대기 중인 아이디 입니다.\n 메일에 접속해 인증해주세요");
			System.out.println("인증대기");
			model.addAttribute("userVO",vo);
			return;
		}else if(vo.getUserState()==2){
			rttr.addFlashAttribute("msg" , "탈퇴된 회원입니다. \n 관리자에게 문의해주세요");
			System.out.println("탈퇴");
			model.addAttribute("userVO",vo);
			return;
		}else if(vo.getUserState()==9) {
			rttr.addFlashAttribute("msg", "관리자 계정입니다. \n 환영합니다.");
			System.out.println("관리자 로그인");
			model.addAttribute("userVO", vo);
			return;
		}
		//System.out.println("usercontroller vo =" +vo);
		model.addAttribute("userVO",vo);

		//rttr.addFlashAttribute("msg","로그인 되었습니다.");
		//System.out.println(vo);

	}

	@RequestMapping(value = "/loginPost", method = RequestMethod.GET)
	public void loginPOSTGet(LoginDTO dto, HttpSession session, Model model) throws Exception{
		//바로 login
    	session.setAttribute("dest","/");
	}

	@RequestMapping(value = "/socialLoginPost", method = RequestMethod.GET)
	public void socialLoginPOSTGet(LoginDTO dto, HttpSession session, Model model) throws Exception{
       //소셜 id 정보 변경 관련 권한
        session.setAttribute("socialID","true");
        session.setAttribute("modify","true");
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
		return "/user/logout";
	}
	//mypage 페이지
    @RequestMapping(value = "/myinfo", method = RequestMethod.GET)
	public void myinfo() throws Exception {
	}

	@RequestMapping(value = "/myBoard", method = RequestMethod.GET)
	public void myBoard(@ModelAttribute("cri") UserCriteria cri,
					   Model model,
                       HttpServletRequest httpRequest) throws Exception {

		cri.setUserId(((UserVO) httpRequest.getSession().getAttribute("login")).getUserId());

		model.addAttribute("list", service.boardSearch(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(service.boardSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);
    }

	@RequestMapping(value = "/mySourceCode", method = RequestMethod.GET)
	public void mySourceCode(@ModelAttribute("cri") UserCriteria cri,
							 HttpServletRequest httpRequest,
							 Model model) throws Exception {

		cri.setUserId(((UserVO) httpRequest.getSession().getAttribute("login")).getUserId());

		if (cri.getPerPageNum() == 10) {
			cri.setPerPageNum(6);
		}

		List<SrcVO> list = service.selectSrcList(cri);
		model.addAttribute("list", list);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.srcListSearchCount(cri));
		System.out.println(pageMaker);
		model.addAttribute("pageMaker", pageMaker);

	}

    //유저 정보변경 권한 체크
	@RequestMapping(value = "/modifyAuthCheck", method = RequestMethod.GET)
	public void ModifyUserAuthGet(UserVO user,Model model) throws Exception{

	}

	@RequestMapping(value = "/modifyAuthCheck", method = RequestMethod.POST)
	public String ModifyUserAuthPost(@ModelAttribute("dto") LoginDTO dto,Model model,RedirectAttributes rttr) throws Exception{

    	//System.out.println(dto);
    	UserVO vo = service.login(dto);
		//System.out.println(vo);
		if(vo == null) {
			return "user/modifyAuthCheck";
		}
		//System.out.println("usercontroller vo =" +vo);
		model.addAttribute("userVO",vo);
		//model.addAttribute("modify",true);
		rttr.addFlashAttribute("modify",true);
		return "redirect:/user/modifyUser";

	}
	//유저 정보변경 인증후 변경 페이지
	@RequestMapping(value = "/modifyUser", method = RequestMethod.GET)
	public void ModifyUserGet(UserVO user,Model model) throws Exception{

	}

	//업로드 파일의 경로 설정
	@Resource(name="uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/modifyUser", method = RequestMethod.POST, produces = "text/plane;charset=UTF-8")
	public String ModifyUserPost(UserVO user,Model model,RedirectAttributes rttr,HttpSession session, MultipartFile file) throws Exception{
		//profile 정보 확인
        String test=user.getUserProfile();
        //user 정보 저장
		String userId= user.getUserId()+"";
		UserVO ssvo = (UserVO)session.getAttribute("login");

		String ssuserId =ssvo.getUserId()+"";


		//System.out.println("userId"+userId);
		//System.out.println("ssuserId"+ssuserId);
		if(!userId.equals(ssuserId)){
			rttr.addFlashAttribute("msg","비정상적인 접근입니다. 경고");
			System.out.println("uid 다름");
			return "redirect:/user/modifyAuthCheck";
		}

		if(userId.equals(ssuserId)){
		String imagedefualt=user.getUserProfile();
		//System.out.println(imagedefualt);
		String defualtprofile ="basic";
		//file 업로드 여부 확인
		if(!file.isEmpty()) {
            String uploadedFileName = UploadFileUtils.uploadFile(uploadPath,
                    file.getOriginalFilename(),
                    file.getBytes(),
                    userId);
           System.out.println("파일 업로드 완료");
            user.setUserProfile(uploadedFileName);
        }else{
			//System.out.println("imagedefualt: "+imagedefualt);
			if(imagedefualt.equals("basic")){
				user.setUserProfile(null);
				//System.out.println("basic"+user.getUserProfile());
			}else {

				//프로필 업로드 하지 않을 때 원래 정보를 저장
				UserVO vot = (UserVO) session.getAttribute("login");
				user.setUserProfile(vot.getUserProfile());
				//System.out.println("no basic"+user.getUserProfile());
			}
		    }


    	UserVO vo=service.modifyUser(user);

		//System.out.println("modifyUser"+vo);
		session.setAttribute("login",vo);
		//model.addAttribute("login",vo);
		rttr.addFlashAttribute("msg" , "회원 정보가 변경되었습니다.");
		}
		return "redirect:/user/myinfo";
	}

	//유저 탈퇴
	@RequestMapping (value="/deleteUser",method = RequestMethod.GET)
	public String deleteUser(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		Object obj = session.getAttribute("login");
		//System.out.println("obj"+obj);
		UserVO vo = (UserVO)obj;
		service.deleteUser(vo);
		System.out.println("회원 탈퇴");
		//탈퇴 후 로그인 정보 로그 아웃
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

//oauth2 로그인 방식
	//Login Api======================================================================
	private NaverLoginBo naverLoginBo;
	private String apiResult = null;
	/* NaverLoginBO */
	@Inject
	private void setNaverLoginBO(NaverLoginBo naverLoginBo) {
		this.naverLoginBo = naverLoginBo;
	}

	//JSON과 STRING 분석 메서드 사용
	@Inject
	private JsonStringParse jsonparse;

	@RequestMapping(value="/naverLogin", method = RequestMethod.GET)
	public ModelAndView login(HttpSession session) {
		/* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
		String naverAuthUrl = naverLoginBo.getAuthorizationUrl(session);
		//System.out.println("naverLogin controller 호출");
		//System.out.println(naverAuthUrl);
		return new ModelAndView("user/naverLogin", "url", naverAuthUrl);
	}
	//API 에서 토큰을 받을 콜백 주소
	@RequestMapping(value="/callback",method = RequestMethod.GET)
	public ModelAndView callback(@RequestParam String code, @RequestParam String state, HttpSession session,Model model) throws IOException {
		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */
	/*	System.out.println("/callback 진입 토튼 발급 전 ");
		System.out.println("session : "+session);
		System.out.println("state : "+state);
		System.out.println("code : "+code);*/

		OAuth2AccessToken oauthToken = naverLoginBo.getAccessToken(session, code, state);
		apiResult = naverLoginBo.getUserProfile(oauthToken);

		JSONObject jsonobj = jsonparse.stringToJson(apiResult, "response");

		String userSocialId = jsonparse.JsonToString(jsonobj, "id");
		String name = jsonparse.JsonToString(jsonobj, "nickname");

		UserVO vo =new UserVO();
		LoginDTO dto = new LoginDTO();
		TempKey TK = new TempKey();


		dto.setUserEmail("naver"+"#"+TK.generateNumber(6));
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
			if(dest=="/user/socialLoginPost"){
				session.setAttribute("dest","/");
			}
			//System.out.println("postHandle dest: "+dest);
			if(dest==null){
				session.setAttribute("dest","/");
			}

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
       // System.out.println("/user/googleLogincallback, url : " + url);
        model.addAttribute("url",url);

        return "user/googleLogin";

    }


    @RequestMapping(value = "/googleLogincallback")
    public String doSessionAssignActionPage(HttpServletRequest request, Model model)throws Exception{
        //System.out.println("/user/googleLogincallback");
        String code = request.getParameter("code");

		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code , googleOAuth2Parameters.getRedirectUri(),
				null);

		String accessToken = accessGrant.getAccessToken();
		Long expireTime = accessGrant.getExpireTime();
		if (expireTime != null && expireTime < System.currentTimeMillis()) {
			accessToken = accessGrant.getRefreshToken();
			//System.out.printf("accessToken is expired. refresh token = {}", accessToken);
		}
		Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();

		PlusOperations plusOperations = google.plusOperations();
		Person person = plusOperations.getGoogleProfile();

//		System.out.println("UserVO 전");
//		System.out.println("person getId: "+person.getId());


        LoginDTO dto = new LoginDTO();
		TempKey TK = new TempKey();

  //      System.out.println(person.getDisplayName());
        dto.setUserEmail("google"+"#"+TK.generateNumber(6));
        dto.setUserName(person.getDisplayName()+"#"+TK.generateNumber(5));
        dto.setUserSocialId("g"+person.getId());
        HttpSession session = request.getSession();
//		System.out.println("controller dto: "+dto);

		UserVO vo = new UserVO();

		try {
			vo = service.googleLogin(dto);

		} catch (Exception e) {
			e.printStackTrace();
			//username이 겹칠 시 userName 변경 페이지로 이동하는 기능 필요
		}


		if(vo != null) {
			session.setAttribute("login", vo );
			//response.sendRedirect("/");
			//System.out.println(userVO);
			Object dest = session.getAttribute("dest");
			if(dest=="user/socialLoginPost"){
				session.setAttribute("dest","/");
			}
			//System.out.println("postHandle dest: "+dest);
			if(dest==null){
				session.setAttribute("dest","/");
			}
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
	//	System.out.println("github Login controller 호출");
	//	System.out.println(githubAuthUrl);
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

		System.out.println(jsonobj);
		String name = (String) jsonparse.JsonToString(jsonobj, "login");
		String userSocialId = (String) (jsonparse.JsonToString(jsonobj, "id")+"");


		UserVO vo =new UserVO();
		LoginDTO dto = new LoginDTO();
		TempKey TK = new TempKey();

		dto.setUserEmail("github"+"#"+TK.generateNumber(6));
		dto.setUserSocialId("git"+userSocialId);
		dto.setUserName(name+"#"+TK.generateNumber(5));

		System.out.println("======================JSON 파싱값================");
		System.out.println("name: "+name);
		System.out.println("id: "+userSocialId );
		System.out.println("UserVO "+vo);
		System.out.println("UserVO "+dto);
		try {
			vo = service.naverLogin(dto);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		//세션 생성
		if(vo != null) {
			session.setAttribute("login", vo );
			Object dest = session.getAttribute("dest");
			if(dest=="/user/socialLoginPost"){
				session.setAttribute("dest","/");
			}
			System.out.println("postHandle dest: "+dest);
			if(dest==null){
				session.setAttribute("dest","/");
			}
		}else{
			session.setAttribute("dest","/user/login");
		}
		session.setAttribute("login",vo);
		model.addAttribute("userVO",vo);
		return new ModelAndView("redirect:/user/socialLoginPost", "result", vo);
	}


}
