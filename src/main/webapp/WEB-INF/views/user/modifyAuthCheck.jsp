<%--
  Created by IntelliJ IDEA.
  User: CHIC
  Date: 2017-12-17
  Time: 오후 3:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>

<form name="login" action="/user/modifyAuthCheck" method="post">
<%--session에 userEmail이 없을 때 소셜 로그인한 ID라고 변경 불가라는 메시지 출력 --%>
    아이디 : <input type="text" name="userEmail" value="${login.userEmail}" readonly /><p>
    비밀번호 : <input type="password" name="userPassword" /><p>
    <input type="submit" value="로그인"/>
    <input type="reset" value="취소"/>
    <div>
        <label>
            <input type="checkbox" name="useCookie"> remember me
        </label>

    </div>
</form>


</body>
</html>