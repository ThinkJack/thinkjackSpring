<%--
  Created by IntelliJ IDEA.
  User: Uri
  Date: 2017-12-08
  Time: 오후 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%--header--%>
<jsp:include page="../include/editInclude/editHeader.jsp" flush="false"/>

<!-- main 코드 작성 페이지 -->
<main role="main" class="main">
    <div class="borderRowLine"></div>
    <div class="container-fluid">
        <div class="row">
            <div class="build col" id="htmlBuild">
                <div class="col"><p class="h4 text-white code-name">HTML</p>

                </div>
                <div class="col" id="codeHtml"></div>
            </div>
            <div class="borderColLine"></div>
            <div class="build col" id="cssBuild">
                <div class="col"><p class="h4 text-white code-name">Css</p></div>
                <div class="col" id="codeCss"></div>
            </div>
            <div class="borderColLine"></div>
            <div class="build col" id="jsBuild">
                <div class="col name"><p class="h4 text-white code-name">JavaScript</p></div>
                <div class="col" id="codeJavaScript"></div>
            </div>

        </div>
    </div>
    <div class="borderRowLine"></div>
    <%--결과창--%>
    <div class="row content_row">
        <iframe class="col" id="resultView"></iframe>
    </div>

    <div class="borderRowLine"></div>
    <%--console--%>
    <div class="row content_row edit-console" id="edit-console">
        <div class="build col">
            <div class="col"><p class="h4 text-white code-name">Console</p></div>
            <div class="col edit-console-view" id="edit-console-view"></div>
        </div>
    </div>
    <div class="row command-line edit-console" id="command-line-view">
        <span class="arrow">></span><textarea rows="1" id="command-line"></textarea>
    </div>
</main>


<!--model 창-->
<jsp:include page="../include/editInclude/editModalSetting.jsp" flush="false"/>
<jsp:include page="../include/editInclude/editModalChangeView.jsp" flush="false"/>

<jsp:include page="../include/editInclude/editJS.jsp" flush="false"/>

<script>
    //변수선언
    var imgPath = "/resources/images/";
    var resultView = document.getElementById("resultView");
    //---------console관련 변수
    var editConsoleView = document.getElementById("edit-console-view");
    var editConsole = document.getElementById("edit-console");
    var commandLine = document.getElementById("command-line-view");
    //좋아요 버튼 이미지 변경
    var likebt = function () {
        var likebt = document.getElementById("likebt");
        if (0 < likebt.src.indexOf("1")) {
            likebt.src = imgPath + "like2.png"
        } else {
            likebt.src = imgPath + "like1.png"
        }
    };

    //Setting Behavior부분 함수
    $(function () {//----------------------------code tabsize 변경
        $("#tab-size").change(function () {
            codeHtml.tabsize = this.value;
            codeCss.tabsize = this.value;
            codeJavaScript.tabsize = this.value;
        });
    });

    $(function () {
        $("#autoPreview").click(function () {
            var runstyle = document.getElementById("run");
            if (this.checked) {
                runstyle.style = "visibility: visible;"
            } else {
                runstyle.style = "visibility: hidden;"
            }
        });
    });
    // command line  enter 입력시 이벤트
//    var makeConsole = new Console();

    $(function () {
        $("#command-line").keyup(function (e) {
            if (e.keyCode === 13) {
                var commandLineValue = this.value;
                try{
                    editConsoleView.innerHTML += "<p class='console-log'> > " + commandLineValue + "</p>"
                    editConsoleView.innerHTML += "<p class='console-log'>   " + eval(commandLineValue) + "</p>"
                    console.log();
                }catch(err){
                    alert(err.message);
                }finally {
                    this.value = "";
                }
            }
        });
    });

    //footer
    //console 버튼 누를때
    $(function() {
       $("#console-button").click(function() {
           if(editConsole.style.display === "none"){
               editConsole.style.display = "flex";
               commandLine.style.display = "flex";
               resultView.style.height = "300px";
           }else{
               editConsole.style.display = "none";
               commandLine.style.display = "none";
               resultView.style.height = "568px";
           }
       });
    });
    $(function () {
        editConsole.style.display = "none";
        commandLine.style.display = "none";
    });
    //--------------------
</script>
<!--footer-->
<jsp:include page="../include/editInclude/editFooter.jsp" flush="false"/>
