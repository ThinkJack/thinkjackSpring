
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<!--필수(삭제 x ) -->
<head>
  <title>introPage</title>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <link href=/resources/dist/css/bootstrap.min.css rel="stylesheet">
  <style>
    @import 'https://fonts.googleapis.com/css?family=Raleway';
    * {
      padding: 0;
      margin: 0;
      box-sizing: border-box;
      /*font-family: Helvetica, sans-serif;*/
      transition: all 0.3s ease-in-out
    }

    a{
      color:#fff;
    }

    a:hover{

      text-decoration: none;
    }
    /*box있는 container*/
    .image {
      /*background-color:#aa0000;*/
      height: 70%;
      width: 100%;
      display: flex;
      align-items: stretch;
      align-content: space-around;
      padding: 0;
      margin: 0;
    }

    .box {
      /*양옆 박스의 늘어나는 길이*/
      flex:0.5;
      /*전체 글 색상*/
      color: #FFFFFF;
      display: flex;
      align-content: center;
      align-items: center;
      flex-flow: wrap;
      overflow: hidden;
      cursor: pointer;

    }

    .box:hover {
      flex-grow:6;
    }

    .rightBt {
      /*color: #fff;*/
      margin: auto;
      font: 900 1vw/45px Hobo Std;
      text-transform: uppercase;
      letter-spacing: 5px;
      text-shadow: -1px 1px 1px rgba(0,0,0,0.5);
      width: 260px;
      height: 260px;
      background-color: #0E1112;
      margin-left:0;
      text-align: center;
      position: relative;
      /*top:39%;*/
      writing-mode:tb-rl
    }

    .leftBt {
      color: #fff;
      margin: auto;
      font: 900 1vw/45px  Hobo Std;
      text-transform: uppercase;
      letter-spacing: 5px;
      text-shadow: -1px 1px 1px rgba(0,0,0,0.5);
      width: 260px;
      height: 260px;
      background-color:#0E1112;
      margin-right:0;
      text-align: center;
      position: relative;
      /*top:-39%;*/
      writing-mode:tb-rl
    }

    .centerBt {

      margin: auto;
      font: 700 2vw/45px  Hobo Std;
      text-transform: uppercase;
      letter-spacing: 5px;
      /*가운데 부분 이미지사이즈*/
      width: 1000px;
      height: 100%;
      text-shadow: -1px 1px 1px rgba(0,0,0,0.5);
      /*background-color:#fff;*/
      text-align: center;
    }


    .box:first-of-type {
      /*background: linear-gradient(to top, rgba(41, 128, 185, 1), rgba(41, 128, 185, 0.7))*/
      /*,url('/resources/images/intro2.jpg') no-repeat center;*/
      /*background-size: cover;*/
      /*background-color: #888888;*/

    }

    .box:nth-of-type(2) {
      /*background-color: #0E1112;*/
      /*background: linear-gradient(to top, rgba(127, 140, 141, 1.0), rgba(127, 140, 141, 0.7)),*/
      /*url('https://s9.postimg.org/7k45gm47z/image.jpg') no-repeat center;*/
      /*background-size: cover;*/
      /*background-color:red;*/
      flex-grow:2
    }

    .box:last-of-type {
      /*background:linear-gradient(to top, rgba(192,192,192,0.3), rgba(255,0,0,0.3)),*/
      /*url('/resources/images/intro (2).jpg') no-repeat center;*/
      background-size: cover;
      /*background-color:red;*/

    }

    .maintitle{
      /*color: #0E1112;*/
      font: 700 6vw/45px Hobo Std;
      text-transform: uppercase;
      letter-spacing: 5px;
      text-shadow: -1px 1px 1px rgba(0,0,0,0.5);
      text-align: center;
      position: relative;
      top:65%;

    }

    @media screen and (max-width:500px) {

     a {font-size: 30px !important}

      .container {display: block;}

      .box {
        display: flex;
        width: 100%;
        /*height: 25vh;*/
      }
    }

  </style>
</head>
<!--body 부분-->
<body>
<div class="container text-center" style="height: 20%">
  <a class="maintitle">Thinkjack</a>
</div>
<div class="row content">
  <div class="col-sm-3"></div>


    <div class="container image col-sm-6">
      <div class="box">

        <div  class=leftBt href="/edit/editPage" >
          <a href="/edit/editPage">Editor</a>
        </div>
      </div>
      <div class="box" style="">
        <div class="centerBt">

            <%--<iframe frameborder="0" height="100%" width="100%"--%>
                    <%--src="https://www.youtube.com/embed/aQsy17K84Ls?&version=3&loop=1&playlist=aQsy17K84Ls&autoplay=1&controls=0"frameborder="0"></iframe>--%>
        </div>
      </div>



      <div class="box">
        <div class=rightBt >
          <a href="/main">Main</a>
        </div>
      </div>
    </div>
  </div>
  <div class="col-sm-3"></div>


</body>
</html>