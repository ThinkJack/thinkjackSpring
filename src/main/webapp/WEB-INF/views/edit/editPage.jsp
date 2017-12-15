<%--
  Created by IntelliJ IDEA.
  User: Uri
  Date: 2017-12-14
  Time: 오후 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EditPage</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="../include/editInclude/editCss.jsp" flush="false"/>
</head>
<body>
    <%--header--%>
    <jsp:include page="../include/editInclude/editHeader.jsp" flush="false"/>

    <!-- main 코드 작성 페이지 -->
    <main role="main" class="main">

        <div class="row container-fluid">
            <div class="row boarderLine"></div>
            <div class="row">
                <div class="build col" id="htmlBuild">
                    <div class="col"><p class="h4 text-white code-name">HTML</p></div>
                    <div class="col" id="codeHtml"></div>
                </div>
                <div class="resize-code" id="resize-code-1"></div>
                <div class="build col" id="cssBuild">
                    <div class="col"><p class="h4 text-white code-name">CSS</p></div>
                    <div class="col" id="codeCss"></div>
                </div>
                <div class="resize-code" id="resize-code-2"></div>
                <div class="build col" id="jsBuild">
                    <div class="col"><p class="h4 text-white code-name">JS</p></div>
                    <div class="col" id="codeJavaScript"></div>
                </div>

            </div>
        </div>
        <div class="row resize-view"></div>
        <%--결과창--%>
        <div class="row main_view">
            <div class="row iframe_body">
                <iframe class="col" id="resultView"></iframe>
            </div>
            <div class="row console_body">
                <div class="row resize-console"></div>
                <%--console--%>
                <div class="row edit-console" id="edit-console">
                    <div class="build col">
                        <div class="col"><p class="h4 text-white code-name">Console</p></div>
                        <div class="col edit-console-view" id="edit-console-view"></div>
                    </div>
                </div>
                <div class="row command-line" id="command-line-view">
                    <span class="arrow">></span>
                    <input type="text" name="command-line" id="command-line" value="" />
                </div>
            </div>
        </div>
    </main>


    <!--modal 창-->
    <jsp:include page="../include/editInclude/editModalSetting.jsp" flush="false"/>
    <jsp:include page="../include/editInclude/editModalChangeView.jsp" flush="false"/>
    <jsp:include page="../include/editInclude/editModalCommant.jsp" flush="false"/>
    <!--footer-->
    <jsp:include page="../include/editInclude/editFooter.jsp" flush="false"/>


    <%--script단--%>
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
                codeHtml.tabSize = this.value;
                codeCss.tabSize = this.value;
                codeJavaScript.tabSize = this.value;
                console.log(codeHtml.tabSize);
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
                    //console.log() 입력시 문자열 작업(정규식)
                    var reg = /console\.log\(\"([\w|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*)\"\)|console\.log\(\'([ㄱ-ㅎ|ㅏ-ㅣ|가-힣|\w]*)\'\)/g;
                    var temp = commandLineValue.match(reg);

                    for(i in temp){
                        temp[i] = temp[i].replace("console.log(", "");
                        temp[i] = temp[i].replace("console.log(", "");
                        temp[i] = temp[i].replace("'", "");
                        temp[i] = temp[i].replace("\"", "");
                        temp[i] = temp[i].replace("')", "");
                        temp[i] = temp[i].replace("\")", "");
                    }

                    try{
                        editConsoleView.innerHTML += "<p class='console-log'> > " + commandLineValue + "</p>";
                        if(temp !== null){
                            for(i in temp){
                                editConsoleView.innerHTML += "<p class='console-log' style='color:darkseagreen;'>" + temp[i] + "</p>"
                            }
                        }
                        editConsoleView.innerHTML += "<p class='console-log' style='color:darkorange;'> <· " + eval(commandLineValue) + "</p>"
                    }catch(err){
                        editConsoleView.innerHTML += "<p class='console-log' style='color:red;'> <· " + "Uncaught " + err.name + " : " + err.message + "</p>"
                    }finally {
                        this.value = "";
                    }

                    editConsoleView.scrollTop = editConsoleView.scrollHeight
                }
            });
        });

        //footer
        //console 버튼 누를때
        $(function() {
            $("#console-button").click(function() {
                if(editConsole.style.display === "none"){
                    editConsole.style.display = "block";
                    commandLine.style.display = "block";

                    jQuery("#console-button").addClass("btn_active");

                }else{
                    editConsole.style.display = "none";
                    commandLine.style.display = "none";
                    jQuery("#console-button").removeClass("btn_active");

                }
            });
        });
        //처음 문서 로드시 콘솔창 숨기기
        $(function () {
            editConsole.style.display = "none";
            commandLine.style.display = "none";
            window.outerWidth;
        });
        //--------------------

//        commant-modal 관련 script

        jQuery("#commant-save").click(function() {
            this.style = "display: none;";
            document.getElementById("commant-modify").style = "display: inline-block;";
        });
    </script>
</body>
</html>
