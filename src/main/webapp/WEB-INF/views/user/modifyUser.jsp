<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <body>
  
  <form name="login" action="/user/modifyUserPost" method="post">
    
      아이디 : <input type="text" name="userEmail" /><p>
      이름 : <input type="text" name="userName" /><p>
      현재 비밀번호 : <input type="password" name="userPassword" /><p>
      새 비밀번호 : <input type="password" name="newPassword" /><p>
      <input type="submit" value="정보변경"/>
      <input type="reset" value="취소"/>
     <div>
     <label>

     </label>
     
     </div>
  </form>
  
  </body>
</html>