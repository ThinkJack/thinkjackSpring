<%--
  Created by IntelliJ IDEA.
  User: kwak
  Date: 2017. 10. 18.
  Time: PM 7:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Home</title>
</head>
<body>

<h1>첫번째 회원가입</h1>
<form action = "/user/register" method="post">
	email<input type = "userEmail" name = "email"><br>
	password<input type = "userPassword" name = "password"><br>
	name<input type = "text" name = "userName"><br>
	<input type = "submit" value = "회원가입">
</form>

</body>
</html>
