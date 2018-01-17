<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">--%>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>

<%--<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>--%>
<script src="/resources/dist/js/upload.js"></script>
<script>

    //수정 권한 확인
    var check = Boolean(${modify});
    var socialId = Boolean(${socialID});
    if (!check && !socialId) {
        self.location = '/user/modifyAuthCheck';
    }
    var chkName = true;
    $(document).ready(function () {
        //console.log( "ready!" );
        var imgtest;
        var fullName = "${login.userProfile}";
        if (fullName !== "") {
            imgtest = getFileInfo(fullName);
            console.log(imgtest);
            str = "<div>" + "<img id='profileimg' class='img-responsive rounded-circle' src=" + imgtest + "/>" + "</div>";
        } else {
            str = "<div>" + "<img id='profileimg' class='img-responsive rounded-circle' src='/resources/images/123.gif'/>" + "</div>";
        }
        $(".uploadedList").append(str);
    });
    function checkvalue() {
        chkName = false;
    }
    function signinchk(obj) {
        if (!obj.userName.value || obj.userName.value.trim().length == 0) {
            alert("이름을 입력해주세요.");
            obj.userName.value = "";
            obj.userName.focus();
            return false;
        }
        if (!chkName) {
            alert("이름 중복체크를 실행해주세요.");
            obj.userName.focus();
            return false;
        }
    }
</script>
<script>
    $(document).on('click', '#authenticateName', function () {
        var userName = $('#userName').val();
        var oldName = "${login.userName}";
        console.log(userName);
        if (!userName || userName.trim().length > 20) {
            alert("이름을 20자 이내로 입력해 주세요.");
            return false;
        }
        if (userName == oldName) {
            alert("현재 사용 중인 이름입니다.");
            return chkName = true;
        } else if (!userName || userName.trim().length == 0) {
            alert("유저 네임이 입력되지 않았습니다.");
            return false;
        } else {
            $.ajax({
                url: '/user/authenticateName',
                type: 'POST',
                data: {'userName': userName},
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                dataType: "json",
                success: function (data) {
                    console.log("success")
                    alert(decodeURIComponent(data.msg))
                    if (data.chk == "T") {
                        alert('사용 가능한 이름입니다.');
                        chkName = true;
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert('서버와의 통신이 원할하지 않습니다.\n다시 시도 해 주십시오.');
                }
            });
        }
    });
</script>
<link href="/resources/dist/css/login.css" rel="stylesheet">
<div  id="modifyUser">
    <div class="wrapper fadeInDown text-center">
        <div class="card border-secondary mb-3" style="max-width: 30rem; max-height: 45rem;" id="formContent">

            <section class="grid-1 big-area" style="margin-left: 5rem;" >

                <div class="panel panel-title">
                    <h1 class="bd">Profile Image</h1>
                    <p>사용자 프로필을 수정하세요</p>
                </div>


                <form class="modifyUser" name="login" action="/user/modifyUser" method="post" enctype="multipart/form-data"
                      onsubmit="return signinchk(this)">
                    <%--<div class="panel panel-1 "></div>--%>
                    <%--<div class="panel panel-2  "></div>--%>
                    <%--<div class="panel panel-3 "></div>--%>
                    <%--<div class="panel panel-4"></div>--%>
                    <%--<div class="panel panel-5 "></div>--%>
                    <%--<div class="panel panel-6 "></div>--%>
                    <div class="panel panel-7"  style="max-width: 20rem;" >
                        <p class="hn" style=" margin: 0">"${login.userName}"님 반가워요~</p>
                    </div>
                    <div class="panel panel-8 text-white" style="max-width: 20rem; max-height: 40rem;background-color:#000">

                        <div class="small-unit">
                            <div class="fileDrop ">
                                <div class="uploadedList" style="padding-top:30px;">

                                </div>
                            </div>
                            <p class="mt-1">사진 파일 위에 Drag&Drop 으로 사진을 올려 놓으세요</p>

                        </div>

                    </div>
                    <input class="hn" type='file' id="imgInp" name="file"/><input type="button" value="기본 프로필 사용" id="filecancle" /><br>


                    <div class="small-unit mt-5" style="height: 200px">
                        <input type="hidden" name="userId" value="${login.userId}" readonly/>
                        <div class="form-group">
                            <div class="form-group">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend hn">
                                        <span class="input-group-text input-group-height" class="input-group-addon">E-mail ID</span>
                                    </div>
                                    <input type="text" class="input-group-text input-group-height" name="userEmail" id="userEmail" value="${login.userEmail}" aria-describedby="basic-addon1" readonly/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group mb-6">
                                <div class="input-group-prepend hn">
                                    <span class="input-group-text input-group-height" class="input-group-addon">user name</span>
                                </div>
                                <input type="text" class="input-group-text input-group-height" aria-label="Amount (to the nearest dollar)"
                                       name="userName" id="userName" value="${login.userName}" onkeyup="checkvalue()"/>
                                <div class="input-group-append">
                                    <button type="button" class="input-group-text input-group-height" id="authenticateName">중복체크</button>
                                </div>
                                <div class="small-unit mt-3 " style="margin-left: 20%">
                                    <input type="submit" class="btn btn-outline-primary hn input-group-text" value="정보변경"/>
                                    <input type="reset" class="btn btn-outline-danger input-group-text" value="취소"/>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="test" value="${login.userProfile}"/><br>
                        <input type="hidden" id="userProfile" name="userProfile">

                    </div>
                </form>
            </section>
        </div>
    </div>
</div>



<script>
    $(".fileDrop").on("dragenter dragover", function (event) {
        event.preventDefault();
    });
    $(".fileDrop").on("drop", function (event) {
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
        $('#userProfile').val("");
    });
    $("input[type='file']").on('change',function () {
        $('#userProfile').val("");
    })
    $('#filecancle').click(function() {   //취소버튼눌렀을때 파일업로드칸 선택한거 비우기
        $('#userProfile').val('basic');
        // 파일컴포넌트에 변경 이벤트 바인딩
        str = "<div>" + "<img id='profileimg' class='img-responsive' src='/resources/images/123.gif'/>" + "</div>";
        $(".uploadedList").empty();
        $(".uploadedList").append(str);
        // $("#imgInp").change(function(){
        //     //alert("change");
        //     readURL(this);
        // });
    });
    function checkImageType(fileName) {
        // i 는 정규식의 대소문자 구별 없다는 표현
        var pattern = /jpg$|gif$|png$|jpeg$/i;
        return fileName.match(pattern);
    }
    $(function () {
        $("#imgInp").on('change', function () {
            var filename = document.getElementById('imgInp').value; //파일을 추가한 input 박스의 값
            if (!checkImageType(filename)) { //확장자를 확인합니다.
                alert('이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');
                return;
            }
        });
        $("#imgInp").on('change', function () {
            readURL(this);
        });
    });
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                str = "<div>" + "<img id='profileimg' class=' rounded-circle img-responsive ' src='" + e.target.result + "'/>" + "</div>";
                console.log();
                $(".uploadedList").empty();
                $(".uploadedList").append(str);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>