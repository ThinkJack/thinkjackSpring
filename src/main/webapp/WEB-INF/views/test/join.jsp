
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <!--필수 -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!--w3schools-->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <!--bootstrap-->
    <script src="/resources/dist/js/bootstrap.js"></script>
    <link href=/resourcesdist/css/bootstrap.min.css rel="stylesheet">
    <title>Login</title>

    <!--css파일 연결부분-->
    <link href="/resources/dist/css/common.css" rel="stylesheet">

    <!--아이콘-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>

<body>
    <div class="container text-center">
        <h3>Register</h3><br>
        <div class="row">
            <div class="col-sm-2">
            </div>
            <div class="col-sm-8">
                <form class="form-horizontal">
                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 control-label" for="email">Email</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" id="email" placeholder="Small input">
                        </div>
                    </div>

                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 control-label" for="name">Name</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" id="name" placeholder="Small input">
                        </div>
                    </div>

                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 control-label" for="password">PW</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" id="password" placeholder="Small input">
                        </div>
                    </div>

                    <div class="form-group form-group-sm">
                        <label class="col-sm-2 control-label" for="checkpw">PW 확인</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" id="checkpw" placeholder="Small input">
                        </div>
                    </div>

                </form>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label    class="col-sm-2 control-label"></label>
                        <div class="col-sm-10">
                            <button type="button" class="btn btn-default btn-lg btn-block">페이스북으로 가입</button>
                            <button type="button" class="btn btn-default btn-lg btn-block">구글 가입</button>
                            <button type="button" class="btn btn-default btn-lg btn-block">카카오로 가입</button>
                        </div>
                    </div>
                </form>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-outline"> Join </button>
                    </div>
                </div>
            </div></div><br>
    </div>
</body>
</html>