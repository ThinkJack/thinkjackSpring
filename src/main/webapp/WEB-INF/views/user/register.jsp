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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>

        var chkid=false;
console.log(signup);
        function checkvalue() {
            console.log('3번째: '+signup.userPassword.value);
            console.log('4번째: '+signup.chkPassword.value);
            if(signup.userPassword.value && signup.chkPassword.value) {
                if(signup.userPassword.value!=signup.chkPassword.value){
                    $('#pwsame').text('비밀번호가 일치하지 않습니다.');
                    $('#pwsame').css("color","red");
                }else if(signup.userPassword.value===signup.chkPassword.value) {
                    $('#pwsame').text('비밀번호가 일치합니다.');
                    $('#pwsame').css("color","#2EFE2E")
                }
            } else {
                $('#pwsame').text('비밀번호와 비밀번호확인을 입력해주세요.');
                $('#pwsame').css("color","red");

            }

        }


        function signinchk(obj){
		    if(!obj.userEmail.value || obj.userEmail.value.trim().length ==0){
		        alert("이메일이 입력되지 않았습니다.");
		        obj.userEmail.value ="";
		        obj.userEmail.focus();
		        return false;
			}
            if(!chkid){
                alert("이메일 중복체크를 실행해주세요.");
                obj.userEmail.focus();
                return false;
            }
            if(!obj.userPassword.value || obj.userPassword.value.trim().length ==0){
                alert("비밀번호를 입력해주세요.");
                obj.userPassword.value ="";
                obj.userPassword.focus();
                return false;
            }
            if(!obj.userName.value || obj.userName.value.trim().length ==0){
                alert("이름을 입력해주세요.");
                obj.userName.value ="";
                obj.userName.focus();
                return false;
            }

		}





	</script>
	<script>


        $(document).on('click','#authenticate',function(){
            var userEmail = $('#userEmail').val();

            var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

            if(!userEmail || userEmail.trim().length ==0){
                alert("이메일이 입력되지 않았습니다.");
                return false;
            }
            if(regex.test(userEmail) === false) {
                alert("잘못된 이메일 형식입니다.");
                return false;
            } else {


            $.ajax({
                url:'/user/authenticate',
                type:'POST',
                data: {'userEmail' : userEmail},
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                dataType : "json",

                success:function(data){
                    console.log("success")
                    alert(decodeURIComponent(data.msg))
                    if(data.chk == "T"){
                        chkid=true;
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown){

                    alert('서버와의 통신이 원할하지 않습니다.\n다시 시도 해 주십시오.' );
                }
            }); }
        });

	</script>
</head>
<body>

<h1>TJ 회원가입</h1>
<form name="signup"  method="post" onsubmit="return signinchk(this)">
	email<input type = "text" name = "userEmail" id="userEmail"><button type="button" id="authenticate">중복체크</button><br>
	name<input type = "text" name = "userName" ><br>
	password<input type = "password" name = "userPassword" id="userPassword" onkeyup="checkvalue()" ><br>
	password 확인<input type = "password" name = "chkPassword" id="chkPassword" onkeyup="checkvalue()"><br>
	<p id="pwsame" name="pwsame"  ></p>
	<input type = "submit" value = "회원가입">
</form>


</body>
</html>
