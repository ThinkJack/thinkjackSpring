<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">--%>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>
<style>
    #profileimg{
        width: 320px;
        height: 320px;
    }
    #profile-wrap {
        position: absolute;
        margin: 0 auto;
        top: 12%; bottom: 0; left: 0; right: 0;
        text-align: center;
        height: 320px;
        width: 320px;
        z-index: 5;
    }
    .profile-overlay {
        position: absolute;
        margin: 0 auto;
        margin-top: 10px;
        top: 0; bottom: 0; left: 0; right: 0;
        z-index: 2;
        border-radius: 50%;
        display: block;
        width: 280px;
        height: 280px;
        -webkit-box-shadow: inset 0px 0px 10px 0px rgba(0, 0, 0, 0.4);
        -moz-box-shadow: inset 0px 0px 10px 0px rgba(0, 0, 0, 0.4);
        box-shadow: inset 0px 0px 10px 0px rgba(0, 0, 0, 0.4);
    }
    .profile-image {
        position: absolute;
        margin: 0 auto;
        margin-top: 10px;
        top: 0; bottom: 0; left: 0; right: 0;
        z-index: 0;
        display: block;
        height: 280px;
        width: 280px;
        border-radius: 50%;
        /*background: url(http://goltermann.design/wp-content/themes/goltermann/images/jaschagoltermann.png) 0 -30px;*/
        background-size: 100%;
        overflow: hidden;
        -webkit-box-shadow: 0 0 0px 15px rgba(0, 0, 0, .2);
        -moz-box-shadow: 0 0 0px 15px rgba(0, 0, 0, .2);
        box-shadow: 0 0 0px 15px rgba(0, 0, 0, .2);
        transition: all ease 0.3s;
    }
    #profile-wrap:hover .profile-image {
        background-position: 0 -29px;
        border-radius: 0;
        margin-top: -15px;
        /*height: 460px;*/
        /*width: 320px;*/
        height: 320px;
        width: 320px;

        z-index: 1;
        -webkit-box-shadow: 0 0 0px 15px rgba(0, 0, 0,.2),
        inset 0px -100px 100px -90px rgba(0, 0, 0, 1);
        -moz-box-shadow: 0 0 0px 15px rgba(0, 0, 0,.2),
        inset 0px -100px 100px -90px rgba(0, 0, 0, 1);
        box-shadow: 0 0 0px 15px rgba(0, 0, 0,.2),
        inset 0px -100px 100px -90px rgba(0, 0, 0, 1);
    }
    #profile-wrap:hover .profile-name h2 {
        font-size: 36px;
        margin-top: 280px;
    }

    #profile-wrap:hover .profile-name h2 span {
        opacity: 0;
    }
    #profile-wrap:hover .profile-social {
        opacity: 1;
        margin-top: -35px;
    }
    #profile-wrap:hover .pulse1{
        border: 2px solid rgba(255, 255, 255, 0);
        box-shadow: inset 0px 0px 15px 10px rgba(0, 0, 0, 0);
    }
    #profile-wrap:hover .pulse2{
        border: 10px solid rgba(0, 0, 0, 0);
        box-shadow: inset 0px 0px 12px 5px rgba(255, 255, 255, 0);
    }

    .profile-name h2 {
        position: relative;
        padding: 15px;
        text-transform: uppercase;
        font-size: 46px;
        font-weight: 800;
        color: #fff;
        text-shadow: 0px 0px 20px rgba(0, 0, 0, 0.8);
        margin: 0;
        margin-top: 295px;
        z-index: 5;
        transition: all ease 0.3s;
    }
    .profile-name h2 span {
        color: #000000;
        font-size: 18px;
        display: block;
        font-weight: 400;
        margin: 5px;
        transition: all ease 0.3s;
    }


    .pulse1 {
        position: absolute;
        /*width: 270px;*/
        /*height: 270px;*/
        width: 320px;
        height: 320px;
        margin: auto;
        /*top: -158px;*/
        top: -30px;
        left: 0;
        bottom: 0;
        right: 0;
        z-index: 2;
        opacity: 0;
        border: 2px solid rgba(255, 255, 255, .1);
        -webkit-animation: pulsejg1 4s linear infinite;
        animation: pulsejg1 4s linear infinite;
        -webkit-border-radius: 50%;
        -moz-border-radius: 50%;
        border-radius: 50%;
        box-shadow: inset 0px 0px 15px 10px rgba(0, 0, 0, .6);
        box-sizing: border-box;
        transition: all ease 0.8s;
    }
    .pulse2 {
        position: absolute;
        /*width: 260px;*/
        /*height: 260px;*/
        width: 320px;
        height: 320px;
        margin: auto;
        /*top: -158px;*/
        top: -30px;
        left: 0;
        bottom: 0;
        right: 0;
        z-index: 2;
        opacity: 0;
        border: 10px solid rgba(0, 0, 0, .4);
        -webkit-animation: pulsejg2 4s linear infinite;
        animation: pulsejg2 4s linear infinite;
        -webkit-border-radius: 50%;
        -moz-border-radius: 50%;
        border-radius: 50%;
        box-shadow: inset 0px 0px 12px 5px rgba(255, 255, 255, .8);
        box-sizing: border-box;
        transition: all ease 0.8s;
    }
    @-webkit-keyframes pulsejg1 {
        0% {
            -webkit-transform: scale(.6);
            opacity: 0
        }
        50% {
            -webkit-transform: scale(.6);
            opacity: 0
        }
        60% {
            -webkit-transform: scale(.9);
            opacity: .1
        }
        70% {
            -webkit-transform: scale(1.1);
            opacity: .25
        }
        80% {
            -webkit-transform: scale(1.25);
            opacity: .1
        }
        100% {
            -webkit-transform: scale(1.4);
            opacity: 0
        }
    }
    @keyframes pulsejg1 {
        0% {
            transform: scale(.6);
            opacity: 0
        }
        50% {
            transform: scale(.6);
            opacity: 0
        }
        60% {
            transform: scale(.9);
            opacity: .1
        }
        70% {
            transform: scale(1.1);
            opacity: .25
        }
        80% {
            transform: scale(1.25);
            opacity: .1
        }
        100% {
            transform: scale(1.4);
            opacity: 0
        }
    }
    @-webkit-keyframes pulsejg2 {
        0% {
            -webkit-transform: scale(.6);
            opacity: 0
        }
        40% {
            -webkit-transform: scale(.8);
            opacity: .05
        }
        50% {
            -webkit-transform: scale(1);
            opacity: .1
        }
        60% {
            -webkit-transform: scale(1.1);
            opacity: .3
        }
        80% {
            -webkit-transform: scale(1.2);
            opacity: .1
        }
        100% {
            -webkit-transform: scale(1.3);
            opacity: 0
        }
    }
    @keyframes pulsejg2 {
        0% {
            transform: scale(.6);
            opacity: 0
        }
        40% {
            transform: scale(.8);
            opacity: .05
        }
        50% {
            transform: scale(1);
            opacity: .1
        }
        60% {
            transform: scale(1.1);
            opacity: .3
        }
        80% {
            transform: scale(1.2);
            opacity: .1
        }
        100% {
            transform: scale(1.3);
            opacity: 0
        }
    }
</style>

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
            str = "<div>" + "<img id='profileimg' class='img-responsive' src='" + imgtest + "'/>" + "</div>";
        } else {
            str = "<div>" + "<img id='profileimg' class='img-responsive ' src='/resources/images/123.gif'/>" + "</div>";
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
                        //alert('사용 가능한 이름입니다.');
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

        <form class="modifyUser card" name="login" action="/user/modifyUser" method="post" enctype="multipart/form-data" onsubmit="return signinchk(this)">
            <div id="profile-wrap">
                <div class="pulse1"></div>
                <div class="pulse2"></div>
                <div class="profile-overlay"></div>
                <div class="profile-image " style="z-index: 1000" >



                    <div >
                        <div class="small-unit">
                            <div class="fileDrop ">
                                <div class="uploadedList" >

                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

            <div class="profile-name hn">
                <h2  class="bd">Profile Image<span class="hn" ><span style="color:darkslategray">Drag&Drop</span> 사용자 프로필을 수정하세요<br>
            </span>
                </h2>
                <span class="row" style="color:mediumseagreen">
                    <input class="col-5 hn " style="margin-left: 100px" type='file' id="imgInp" name="file" />
                    <input class="col-3 btn btn-primary p-0" type="button" value="기본 프로필 사용" id="filecancle" />
                </span>
            </div>

            <div class=" mt-5" >
                <input type="hidden" name="userId" value="${login.userId}" readonly/>

                <div class=" form-group">
                    <div class="row input-group mb-3" style="margin-left: 17%" >
                        <div class=" input-group-prepend bd">
                            <span class=" input-group-text input-group-height " class="input-group-addon" style="border:0">E-mail ID</span>
                        </div>
                        <input type="text" style="border:0" class="col-6 input-group-text input-group-height" name="userEmail" id="userEmail" value="${login.userEmail}" aria-describedby="basic-addon1" readonly/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row input-group "  style="margin-left:17%">
                        <div class="input-group-prepend bd">
                            <span class="input-group-text input-group-height" class="input-group-addon"  style="border:0">user name</span>
                        </div>
                        <input type="text" maxlength="20" class="col-4 input-group-text input-group-height " aria-label="Amount (to the nearest dollar)"  style="border:0"
                               name="userName" id="userName" value="${login.userName}" onkeyup="checkvalue()"/>
                        <div class="input-group-append">
                            <%--<button type="button" class="input-group-text input-group-height" id="authenticateName">중복체크</button>--%>
                            <button type="button" class="btn btn-primary" id="authenticateName" style="font-size: 16px">중복체크</button>
                        </div>
                    </div>
                    <br>
                    <div class="row" style="width:100%">
                        <div class="col-2"></div>
                        <input type="submit" class="col-4 btn btn-primary " value="정보변경"/>
                        <button type="button" class="col-4 btn btn-primary text-white"  onclick="location.href='/user/myinfo' ">취소</button>
                        <div class="col-2"></div>
                    </div>
                </div>
                <%--<input type="hidden" name="test" value="${login.userProfile}"/><br>--%>
                <input type="hidden" id="userProfile" name="userProfile">
            </div>
        </form>
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
                str = "<div>" + "<img id='profileimg' class=' img-responsive ' src='" + e.target.result + "'/>" + "</div>";
                console.log();
                $(".uploadedList").empty();
                $(".uploadedList").append(str);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>