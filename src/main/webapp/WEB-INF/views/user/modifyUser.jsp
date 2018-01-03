<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style>
        .fileDrop{
            z-index: 8;
            width:300px;
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
        div p{
            opacity: 0.5;
            filter: alpha(opacity=50);
        }
    </style>
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="/resources/upload.js"></script>
    <script>

        //수정 권한 확인
        var check=Boolean(${modify});
        var socialId=Boolean(${socialID});
        if(!check||!socialId){
            self.location = '/user/modifyAuthCheck';
        }
        var chkName=true;
    $(document).ready(function() {
    //console.log( "ready!" );

    var imgtest;
    var fullName="${login.userProfile}";
    if(fullName!=="") {
        imgtest = getFileInfo(fullName);
        console.log(imgtest);
        str = "<div>" + "<img style='width:300px;height:200px;' src=" + imgtest + "/>" + "</div>";
    }else{
        str = "<div>" + "<img style='width:300px;height:200px;' src='/resources/images/123.gif'/>" + "</div>";
    }
    $(".uploadedList").append(str);


    });


        function checkvalue() {
            chkName=false;
        }


        function signinchk(obj){

            if(!obj.userName.value || obj.userName.value.trim().length ==0){
                alert("이름을 입력해주세요.");
                obj.userName.value ="";
                obj.userName.focus();
                return false;
            }
            if(!chkName){
                alert("이름 중복체크를 실행해주세요.");
                obj.userName.focus();
                return false;
            }
        }

    </script>
    <script>
        $(document).on('click','#authenticateName',function(){
            var userName = $('#userName').val();
            var oldName="${login.userName}";
            console.log(userName);

            if(!userName || userName.trim().length >10){
                alert("이름을 10자 이내로 입력해 주세요.");
                return false;
            }


            if(userName==oldName){
                alert(" 사용 가능한 이름입니다.");
                return chkName=true;
            }else if(!userName || userName.trim().length ==0){
                alert("유저 네임이 입력되지 않았습니다.");
                return false;
            } else {
                $.ajax({
                    url:'/user/authenticateName',
                    type:'POST',
                    data: {'userName' : userName},
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                    dataType : "json",

                    success:function(data){
                        console.log("success")
                        alert(decodeURIComponent(data.msg))
                        if(data.chk == "T"){
                            alert('사용 가능한 이름입니다.' );
                            chkName=true;
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
  <h3>Profile Image</h3>
  <div class="fileDrop">
      <div class="uploadedList"></div>
  </div>

  <p>사진 파일 위에 Drag&Drop 으로 사진을 올려 놓으세요</p>
  <form class="modifyUser" name="login" action="/user/modifyUser" method="post" enctype="multipart/form-data" onsubmit="return signinchk(this)">
      <input type="hidden" name="userId" value="${login.userId}" readonly/>
      아이디 : <input type="text" name="userEmail" id="userEmail"  value="${login.userEmail}" readonly/><br>
      이름 : <input type="text" name="userName" id="userName" value="${login.userName}" onkeyup="checkvalue()" /><button type="button" id="authenticateName">중복체크</button><br>
      <input type="text" name="test" value="${login.userProfile}" /><br>
      <input type='file' id="imgInp" name="file" />
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
         // console.log(file);
          // var formData = new FormData();
          //
          // formData.append("file",file);

          //file / 에 집어 넣기
          $("input[type='file']")
              .prop("files", files)  // put files into element
              .closest("form");
             // .submit();
         // console.log(file);
          // $.ajax({
          //     url:'/uploadAjax',
          //     data:formData,
          //     dataType:'text',
          //     processData:false,
          //     contentType:false,
          //     type:'POST',
          //     success:function (data) {
          //         var str="";
          //
          //         if(checkImageType(data)){
          //             str="<div>"+"<img style='width:300px;height:200px;' src='http://localhost:8080/displayFile?fileName="+data+"'/>"+"</div>";
          //         }else{
          //             str="<script>"+"alert('이미지 파일 아닙니다. JPG | GIF |')"+"<\/script>";
          //         }
          //         $(".uploadedList").empty();
          //         $(".uploadedList").append(str);
          //         $("#userProfile").val(data);
          //     }
          // });

      });

      function checkImageType(fileName) {
          // i 는 정규식의 대소문자 구별 없다는 표현
          var pattern = /jpg$|gif$|png$|jpeg$/i;
          return fileName.match(pattern);
      }


      $(function() {
          $("#imgInp").on('change', function(){
          var  filename = document.getElementById('imgInp').value; //파일을 추가한 input 박스의 값
          if(!checkImageType(filename)){ //확장자를 확인합니다.
              alert('이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');
              return;
          }
          });

          $("#imgInp").on('change', function(){
              readURL(this);
          });
      });

      function readURL(input) {
          if (input.files && input.files[0]) {
              var reader = new FileReader();

              reader.onload = function (e) {
                  str = "<div>" + "<img style='width:300px;height:200px;' src='" + e.target.result + "'/>" + "</div>";
                  console.log();
                  $(".uploadedList").empty();
                  $(".uploadedList").append(str);
              }

              reader.readAsDataURL(input.files[0]);
          }
      }
  </script>
  </body>
</html>