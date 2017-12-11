<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <body>
  
  <form name="login" action="/user/loginPost" method="post">
    
      아이디 : <input type="text" name="userEmail" /><p>
      비밀번호 : <input type="password" name="userPassword" /><p>
      <input type="submit" value="로그인"/>
      <input type="reset" value="취소"/>
     <div>
     <label>
     <input type="checkbox" name="useCookie"> remember me
     </label>
     
     </div>
  </form>
  <div>
  <a href="/user/naverLogin"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
  </div>
  </body>
</html>