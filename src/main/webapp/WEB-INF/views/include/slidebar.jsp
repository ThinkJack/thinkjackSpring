<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-bar-block  w3-black w3-animate-left w3-text-grey w3-collapse w3-top w3-center" style="z-index:3;width:300px;font-weight:bold" id="mySidebar"><br>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <!--로고 -->
        <h3 class="w3-padding-64 w3-center">
                <img src="/resources/images/logo.png" style="width:80px" >
        </h3>

        <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-hide-large">CLOSE</a>

           <!--간단한 회원정보-->
        <button class="accordion">MyPage</button>
        <div class="panel">
                <img src="/resources/images/logo.png" style="width:200px"  >

                <div class="mypage">
                        <div class="col-sm-6">ID</div>
                        <div class="col-sm-6" >asfsfa@gmail.com</div>
                </div>
                <div class="mypage">
                        <div class="col-sm-6">name</div>
                        <div class="col-sm-6" >sdaggd</div>
                </div>
        </div>

        <button class="accordion">게시판</button>
        <div class="panel">
                <!--글 클릭하면 해당 게시판으로 이동-->
                <a href="#" onclick="w3_close()" class="w3-bar-item w3-button">Cumunity</a>
                <a href="#" onclick="w3_close()" class="w3-bar-item w3-button">QNA</a>
        </div>


        <!--새글 기능-->
        <div class="row">
                <div class="col-12">
                        <p>Alerts</p>
                        <div class="alert alert-secondary alert-dismissable fade show">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <strong>새로운글!</strong>새글이다~
                        </div>
                        <div class="alert alert-dark alert-dismissable fade show">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <strong>새로운글!</strong> 새글이다~
                        </div>
                </div>
        </div>
</nav>

<%--accordion--%>
<script>
    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].onclick = function(){
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.display === "block") {
                panel.style.display = "none";
            } else {
                panel.style.display = "block";
            }
        }
    }
</script>
