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
	email<input type = "text" name = "userEmail"><button id="authenticate">중복체크</button><br>
	password<input type = "password" name = "userPassword"><br>
	name<input type = "text" name = "userName"><br>
	<input type = "submit" value = "회원가입">
</form>
<script>
    $(document).on('click','#authenticate',function(){
        var userEmail = $('#userEmail').val()
        $.ajax({
            url:'/user/authenticate',
            type:'POST',
            data: {'userEmail' : userEmail},
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            dataType : "json",

            success:function(data){
                console.log("success")
                alert(decodeURIComponent(data.msg))
            },
            error: function (XMLHttpRequest, textStatus, errorThrown){

                alert('서버와의 통신이 원할하지 않습니다.\n다시 시도 해 주십시오.' );
            }
        });
    });
</script>
</body>
</html>
