package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.UserVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("LoginInterceptor postHandle 진입");
		HttpSession session = request.getSession();

		ModelMap modelMap = modelAndView.getModelMap();
		Object userVO = modelMap.get("userVO");
		//System.out.println("userVo"+userVO);
		//System.out.println(userVO);
		UserVO vo=(UserVO)userVO;
		System.out.println(vo);
		FlashMap flashMap = new FlashMap();
		if(vo == null) {
			flashMap.put("msg" , "아이디 또는 비밀번호가 일치하지 않습니다.");
			//System.out.println("아이디 비밀번호 실패");
			session.setAttribute("dest","/user/login");
			FlashMapManager flashMapManager = RequestContextUtils.getFlashMapManager(request);
			flashMapManager.saveOutputFlashMap(flashMap, request, response);
			return;
		}else if(vo.getUserState()==0){
			flashMap.put("msg" , "인증 대기 중인 아이디 입니다. 메일에 접속해 인증해주세요");
			//System.out.println("인증대기");
			session.setAttribute("dest","/user/login");
			FlashMapManager flashMapManager = RequestContextUtils.getFlashMapManager(request);
			flashMapManager.saveOutputFlashMap(flashMap, request, response);
			return;
		}else if(vo.getUserState()==2){
			flashMap.put("msg" , "탈퇴된 회원입니다. 관리자에게 문의해주세요");
			//System.out.println("탈퇴");
			session.setAttribute("dest","/user/login");
			FlashMapManager flashMapManager = RequestContextUtils.getFlashMapManager(request);
			flashMapManager.saveOutputFlashMap(flashMap, request, response);
			return;
		}

		if(vo.getUserState()==1||vo.getUserState()==9) {
			session.setAttribute(LOGIN, userVO);
			//response.sendRedirect("/");
			//System.out.println(userVO);
			Object dest = session.getAttribute("dest");
			if(dest=="/user/login"||dest==""||dest==null){
				session.setAttribute("dest","/");
			}
			//System.out.println("postHandle dest: "+dest);

		}else{
			session.setAttribute("dest","/user/login");
		}
	}


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub

		System.out.println("Logininterceptor preHandle 진입");
		HttpSession session = request.getSession();
		//System.out.println("LOGIN :"+session.getAttribute(LOGIN));
		if(session.getAttribute(LOGIN) != null) {
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		
		return true;
	}
	
	

}
