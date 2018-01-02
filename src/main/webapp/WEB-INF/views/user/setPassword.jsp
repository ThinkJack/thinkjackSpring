<%--
  Created by IntelliJ IDEA.
  User: CHIC
  Date: 2017-12-22
  Time: 오후 1:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>
    var check=Boolean(${setPassword});
    if(!check){
        alert("비정상적인 접근입니다.");
        self.location = '/main';
    }

    var chkpass=false;
    function checkvalue() {
        //console.log('3번째: '+chpass.userPassword.value);
        //console.log('4번째: '+chpass.chkPassword.value);
        if(chpass.userPassword.value && chpass.chkPassword.value) {
            if(chpass.userPassword.value!=chpass.chkPassword.value){
                $('#pwsame').text('비밀번호가 일치하지 않습니다.');
                $('#pwsame').css("color","red");
                chkpass=false;
            }else if(chpass.userPassword.value===chpass.chkPassword.value) {
                $('#pwsame').text('비밀번호가 일치합니다.');
                $('#pwsame').css("color","#2EFE2E");
                chkpass=true;
            }
        } else {
            $('#pwsame').text('비밀번호와 비밀번호확인을 입력해주세요.');
            $('#pwsame').css("color","red");
            chkpass=false;
        }
    }

    function chpasschk(obj){

        if(!obj.userPassword.value || obj.userPassword.value.trim().length ==0){
            alert("비밀번호를 입력해주세요.");
            obj.userPassword.value ="";
            obj.userPassword.focus();
            return false;
        }
        if(!chkpass){
            alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요");
            return false;
        }

    }


</script>
<h1>TJ 비밀번호 변경</h1>
<form name="chpass"  method="post" onsubmit="return chpasschk(this)">
            <input type="hidden" name="userId" id="userId" value="${userId}" >
    password<input type = "password" name = "userPassword" id="userPassword" onkeyup="checkvalue()" ><br>
    password 확인<input type = "password" name = "chkPassword" id="chkPassword" onkeyup="checkvalue()"><br>
    <p id="pwsame" name="pwsame"  ></p>
    <input type="submit" value="패스워드 변경"/>
</form>

</body>
</html>