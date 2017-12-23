package interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EditPageInterceptor extends HandlerInterceptorAdapter{

    private static final Logger logger = LoggerFactory.getLogger(EditPageInterceptor.class);

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();

        if(session.getAttribute("login")==null) {
            logger.info("current user is not logined");

            saveSrcDest(request);
        }
        return super.preHandle(request, response, handler);
    }

    private void saveSrcDest(HttpServletRequest req){
        System.out.println("EditPageInterceptor saveSrcDest 진입");
        String uri = req.getRequestURI();

        if(req.getMethod().equals("GET")){
            logger.info("dest: "+ uri);
            req.getSession().setAttribute("dest",uri);
        }
        System.out.println("dest: " + uri);
    }
}
