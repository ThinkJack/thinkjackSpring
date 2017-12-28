<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style>
        .fileDrop{
            z-index: 8;
            width:30%;
            height:200px;
            border:1px solid black;
        }
        .uploadedList{
            z-index: 6;
            width:100%;
            height:200px;
            border:1px solid black;
        }

        small{
            margin-left:3px;
            font-weight:bold;
            color:grey;
        }
        form{
            z-index:1;
        }
    </style>
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

</head>
  <body>
  <h3>Profile Image</h3>
  <div class="fileDrop">
      <div class="uploadedList"></div>
  </div>

  <form class="modifyUser" name="login" action="/user/modifyUser" method="post">

      <input type="hidden" name="userId" value="${login.userId}" readonly/>
      아이디 : <input type="text" name="userEmail" value="${login.userEmail}" readonly/><p>
      이름 : <input type="text" name="userName" value="${login.userName}"/><p>
      <input type="hidden" id="userProfile" name="userProfile">
      <input type="submit" value="정보변경"/>
      <input type="reset" value="취소"/>
     <div>
     <label>

     </label>
     
     </div>
  </form>

  <script>
      $(".fileDrop").on("dragenter dragover",function (event) {
          event.preventDefault();
      });
      $(".fileDrop").on("drop",function (event) {
          event.preventDefault();

          var files = event.originalEvent.dataTransfer.files;

          var file = files[0];
          //console.log(file);
          var formData = new FormData();

          formData.append("file",file);

          $.ajax({
              url:'/uploadAjax',
              data:formData,
              dataType:'text',
              processData:false,
              contentType:false,
              type:'POST',
              success:function (data) {
                  var str="";

                  if(checkImageType(data)){
                      str="<div>"+"<img style='width:100%;height:200px;' src='http://localhost:8080/displayFile?fileName="+data+"'/>"+"</div>";
                  }else{
                      str="<script>"+"alert('이미지 파일 아닙니다. JPG | GIF |')"+"<\/script>";
                  }
                  $(".uploadedList").empty();
                  $(".uploadedList").append(str);
                  $("#userProfile").val(data);
              }
          });

      });

      function checkImageType(fileName) {
          // i 는 정규식의 대소문자 구별 없다는 표현
          var pattern = /jpg$|gif$|png$|jpeg$/i;
          return fileName.match(pattern);
      }
  </script>
  </body>
</html>