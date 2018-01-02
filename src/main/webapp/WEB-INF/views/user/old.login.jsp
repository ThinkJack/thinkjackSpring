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
    <style type="text/css">
        .member {
            font-size: 50px;
            text-shadow: 0 0 10px #666;
            color: #fff;
            margin: 0 auto;
            text-align: center;
            text-transform: capitalize;
            font-family: "맑은 고딕";
            font-style: italic;
        }

        body {
            font-family: "맑은 고딕";
            font-size: 12px;
        }

        .form {
            width: 498px;
            height: 300px;
            border-radius: 25px;
            border: 5px double #999;
            margin: 30px auto;
        }

        .form2 {
            width: 380px;
            min-width: 320px;
            height: 200px;
            margin: 60px auto;
            margin-left:20px;
        }

        .form3 {
            float: left;
            /*   background:#f00;  */
        }

        .form3 label {
            width: 100px;
            height: 20px;
            /*  display: block; */
            float: left;
        }

        .form4 {
            padding: 0px 0px 0px 70px;
        }

        #wrap {
            width: 600px;
            height: 500px;
            margin: 0 auto;
        }

        .clear {
            clear: both;
        }

        input[type="submit"] {
            float: left;
            /*  display:block; */
            height: 50px;
            background: #FFBB00;
            border-radius: 5px;
            border: none;
            font-family: "맑은 고딕";
        }
        input[type="button"] {
            height: 30px;
            background: gray;
            border-radius: 5px;
            /*  width: 140px; */
            font-family:"맑은 고딕";
            margin-top:10px;
            margin-right:20px;
        }
        input[type="checkbox"] {
            margin-top:20px;
        }


    </style>

</head>
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
  <div id="google_id_login"><a href="/user/googleLogin"><img width="230" src="https://techsneak.com/wp-content/uploads/2017/01/login-google.png"/></a></div>
  <div>
      <a class="btn btn-social-icon btn-github" href="/user/githubLogin">
          <span class="fa fa-github">
              Sign in with Github
          </span>
          <i class="fa fa-github"></i></a>
  </div>
  </body>
</html>