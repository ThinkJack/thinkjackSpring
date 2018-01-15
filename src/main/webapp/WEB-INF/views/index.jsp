
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
  <link rel="stylesheet" href="/resources/dist/css/bootstrap.css">
  <link rel="stylesheet" href="/resources/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/dist/css/_bootswatch.scss">
  <link rel="stylesheet" href="/resources/dist/css/_variables.scss">

  <style>

    body {
      background: #eee url('https://subtlepatterns.com/patterns/pw_pattern.png');

    }

    .container {
      display: grid;
      width: 790px;
      height: 700px;
      grid-gap: 1rem;
      grid-template-columns:
              [main-start sidebar-start] 350px
              [sidebar-end content-start] 1fr
              [column3-start] 1fr
              [content-end main-end];
      grid-template-rows:
              [row1-start] 80px
              [row2-start] 1fr
              [row3-start] 1fr
              [row4-start] 100px
              [row4-end];

    }


    .sidebar {
      grid-column: sidebar-start / sidebar-end;
      grid-row: row2-start / row4-start;
    }


    .content-2 {
      grid-column: content-start / column3-start;
      grid-row: row3-start / row4-start;
    }

    .content-3 {
      grid-column: column3-start / content-end;
      grid-row: row3-start / row4-start;
    }

    .footer {
      grid-column: main-start / main-end;
      grid-row: row4-start / row4-end;
    }





    /* OTHER STYLES */

    body {

      display: flex;
      justify-content: center;
      padding: 20px;
    }

    .item {

      box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
      color: #ffffff;
      border-radius: 4px;
      border: 6px solid #171717;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 18px;
      font-weight: bold;
    }

    .header {
      background-color: #1EAAFC;
      background-image: linear-gradient(160deg, #6C52D9 0%, #9B8AE6 127%);
    }

    .sidebar {
      background-image: linear-gradient(203deg, #3EDFD7 0%, #29A49D 90%)
    }

    .content-1,
    .content-2,
    .content-3 {
      background-image: linear-gradient(130deg, #6C52D9 0%, #1EAAFC 85%, #3EDFD7 100%);
    }

    .footer {
      background-color: #6C52D9;
    }

  </style>


</head>
<!--body 부분-->
<body>




  <div class="col-sm-3"></div>
  <div class="container image col-sm-6">
    <h1>Thinkjack</h1>
    <div class="item sidebar">
      <button  type="button" class="btn btn-outline-primary" onclick="location.replace('/edit/editPage')" >
        Editor</button>
    </div>
    <div class="item content-2">Content-2</div>
    <div class="item content-3"><button  type="button" class="btn btn-outline-primary" onclick="location.replace('/main')" >
     Main</button></div>
    <div class="item footer">footer</div>
  </div>
<div class="col-sm-3"></div>



</body>
</html>