
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<!--필수(삭제 x ) -->
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <!--w3schools-->
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <!--bootstrap-->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
  <link href=/resources/dist/css/bootstrap.min.css rel="stylesheet">
  <title>Main</title>

  <!--css파일 파일과 연결시켜 줍니다.-->
  <link href="/resources/dist/css/common.css" rel="stylesheet">
</head>
<!--body 부분-->
<body>
<div class="container text-center">
  <!--이미지 타이틀 내용 (글씨체는 나중에 추가)-->
  <h3>ThinkJack</h3>
  <!--공간을 br로 띄어 씀-->
  <br>
  <!--반응형 6:6-->
  <div class="row">
    <div class="col-6">
      <!--메인 이미지 왼쪽-->
      <img src="/resources/images/slide1.jpg" style="width:100%" alt="Image">
      <!--editor로 가는 버튼-->
      <button href="#" >Editor</button>
    </div>
    <div class="col-6">
      <!--메인 이미지 오른쪽-->
      <img src="/resources/images/slide1.jpg"  style="width:100%" alt="Image">
      <!--Home으로 가는 버튼-->
      <button href="#">Main</button>
    </div>
  </div>
</div>
</body>
</html>