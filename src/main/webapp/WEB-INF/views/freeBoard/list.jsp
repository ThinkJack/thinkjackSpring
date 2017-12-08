<%--
  Created by IntelliJ IDEA.
  User: kwak
  Date: 2017. 12. 3.
  Time: PM 5:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ListPage</title>
    <script
            src="https://code.jquery.com/jquery-3.2.1.js"
            integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
            crossorigin="anonymous"></script>
</head>
<body>
${login.userId}'/'${login.userName},/${login.userState} /${login.userPassword}님 환영합니다.<br>
${list[0].boardId}/${list[0].boardTitle}/${list[0].boardWriter}/${list[0].boardViewcnt}

<div>

    <input type="button" value="logout" onclick="javascript:window.location='../user/logout'" />
</div>


</body>
</html>
