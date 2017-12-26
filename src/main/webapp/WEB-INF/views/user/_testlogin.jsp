
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<<head>
    <!--필수 -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!--w3schools-->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <title>Thinkjack</title>

    <!--css파일 연결부분-->
    <link href="/resources/dist/css/common.css" rel="stylesheet">
    <link href="/resources/dist/css/main.css" rel="stylesheet">

    <!--sidenavbar-새로운 게시글 알림-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!--아이콘-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>

<body>
    <div class="container text-center">
        <h3>Login</h3><br>
        <div class="row">
            <div class="col-sm-2">
            </div>
            <div class="col-sm-8">

                <form name="login" action="/user/loginPost" method="post">
                    <div class="form-group">
                        <label  for="userEmail"  class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <%--<div class="form-group has-success has-feedback">--%>
                                <!--<input type="email" class="form-control" id="inputEmail3" placeholder="Email">-->
                                <!--성공-->
                                <input type="text" class="form-control" id="userEmail" name="userEmail" aria-describedby="inputSuccess2Status">
     <%--                           <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                                <span id="inputSuccess2Status" class="sr-only">(success)</span>--%>
                                <!--경고-->
                                <!--<div class="form-group has-warning has-feedback">-->
                                <!--<label class="control-label" for="inputWarning2">ID  warning</label>-->
                                <!--<input type="text" class="form-control" id="inputWarning2" aria-describedby="inputWarning2Status">-->
                                <!--<span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>-->
                                <!--<span id="inputWarning2Status" class="sr-only">(warning)</span>-->
                                <!--</div>-->
                                <!--실패-->
                                <!--<div class="form-group has-error has-feedback">-->
                                <!--<label class="control-label" for="inputError2">ID  error</label>-->
                                <!--<input type="text" class="form-control" id="inputError2" aria-describedby="inputError2Status">-->
                                <!--<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>-->
                                <!--<span id="inputError2Status" class="sr-only">(error)</span>-->
                                <!--</div>-->
                            <%--</div>--%>
                        </div>
                    </div>
                </form>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label  for="userPassword"  class="col-sm-2 control-label">PW</label>
                        <div class="col-sm-10">
                            <%--<div class="form-group has-success has-feedback">--%>
                                <!--<input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">-->
                                <!--성공-->
                                <input type="text" class="form-control" id="userPassword" name="userPassword" aria-describedby="inputSuccess2Status">
                                <%--<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>--%>
                                <%--<span id="inputSuccess2Status2" class="sr-only">(success)</span>--%>
                                <!--경고-->
                                <!--<div class="form-group has-warning has-feedback">-->
                                <!--<label class="control-label" for="inputWarning2">ID  warning</label>-->
                                <!--<input type="text" class="form-control" id="inputWarning2" aria-describedby="inputWarning2Status">-->
                                <!--<span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>-->
                                <!--<span id="inputWarning2Status2" class="sr-only">(warning)</span>-->
                                <!--</div>-->
                                <!--실패-->
                                <!--<div class="form-group has-error has-feedback">-->
                                <!--<label class="control-label" for="inputError2">ID  error</label>-->
                                <!--<input type="text" class="form-control" id="inputError2" aria-describedby="inputError2Status">-->
                                <!--<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>-->
                                <!--

                                span>-->
                                <!--</div>-->

                            <%--</div>--%>
                        </div>
                        <input type="submit" value="로그인"/>
                        <input type="reset" value="취소"/>
                    </div>

                </form>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label    class="col-sm-2 control-label"></label>
                        <div class="col-sm-10">
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
                        </div>

                    </div>
                </form>

                <!--비밀번호 기억하기-->
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> Remember me
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-outline">Sign in</button>
                        <button type="submit" class="btn btn-outline"> Join </button>
                    </div>
                </div>
            </div></div><br>
    </div>
</body>
</html>