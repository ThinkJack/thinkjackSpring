<%--
  Created by IntelliJ IDEA.
  User: Uri
  Date: 2017-12-14
  Time: 오후 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<%--%>
<%--response.setHeader("Cache-Control","no-cache");--%>
<%--response.setHeader("Pragma","no-cache");--%>
<%--response.setDateHeader("Expires",0);--%>
<%--%>--%>


<html>
<head>
    <title>EditPage</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%--<meta http-equiv="Cache-Control" content="no-cache"/>--%>
    <%--<meta http-equiv="Expires" content="0"/>--%>
    <%--<meta http-equiv="Pragma" content="no-cache"/>--%>


    <jsp:include page="../include/editInclude/editCss.jsp" flush="false"/>
</head>
<body>
    <%--header--%>
    <jsp:include page="../include/editInclude/editHeader.jsp" flush="false"/>

    <!-- main 코드 작성 페이지 -->
    <main role="main" class="main" id="code-main">

        <div class="row container-fluid main_ch">
            <div class="row boarderLine"></div>
            <div class="row layout" id="layout1">
                <div class="build col code_layout" id="htmlBuild">
                    <div class="col"><p class="h4 text-white code-name">HTML</p></div>
                    <div class="col" id="codeHtml"></div>
                </div>
                <div class="col resize_code layout-ch" id="resize-code-1" ></div>
                <div class="build col code_layout" id="cssBuild">
                    <div class="col"><p class="h4 text-white code-name">CSS</p></div>
                    <div class="col" id="codeCss"></div>
                </div>
                <div class="col resize_code layout-ch" id="resize-code-2"></div>
                <div class="build col code_layout" id="jsBuild">
                    <div class="col"><p class="h4 text-white code-name">JS</p></div>
                    <div class="col" id="codeJavaScript"></div>
                </div>
            </div>
            <div class="row resize_view" id="resize-view"></div>
            <%--결과창--%>
            <div class="row main_view layout" id="layout2">
                <div class="row iframe_body iframeWrapper" id="iframe-body">
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
        </div>
    </main>


    <!--modal 창-->
    <jsp:include page="../include/editInclude/editModalSetting.jsp" flush="false"/>
    <jsp:include page="../include/editInclude/editModalChangeView.jsp" flush="false"/>
    <jsp:include page="../include/editInclude/editModalReply.jsp" flush="false"/>
    <!--footer-->
    <jsp:include page="../include/editInclude/editFooter.jsp" flush="false"/>


    <%--script단--%>
    <jsp:include page="../include/editInclude/editJS.jsp" flush="false"/>

    <script>
        //변수선언
        var imgPath = "/resources/images/";
        //---------console관련 변수
        var editConsoleView = document.getElementById("edit-console-view");
        var editConsole = document.getElementById("edit-console");
        var commandLine = document.getElementById("command-line-view");

        var htmlBuild = document.getElementById("htmlBuild");
        var cssBuild = document.getElementById("cssBuild");
        var jsBuild = document.getElementById("jsBuild");
        var codeMLayout = document.getElementsByClassName("CodeMirror");

        var codeMain = document.getElementById("code-main");
        var resizeView = document.getElementById("resize-view");
        var iframeBody = document.getElementById("iframe-body");
        var layout1 = document.getElementById("layout1");
        var layout2 = document.getElementById("layout2");
        var resizeCode1 = document.getElementById("resize-code-1");
        var resizeCode2 = document.getElementById("resize-code-2");
        var codeMirrorLayout = document.getElementsByClassName("CodeMirror");
        var codeLayout = document.getElementsByClassName("code_layout");

        var hcl = 0, cjl = 0, cifl = 0; //크기조절 변수
        var layoutMode = 0; //0 - top, 1 - left 2 - right
        var dragging = false;

        //editHeader.jsp script
        //pencil 클릭시 input text 보이기
        $(function () {
            var pageTitleView = document.getElementById("page-title-view");
            var pageTitleText = document.getElementById("page-title-text");

            $("#pencil").click(function(){
                pageTitleView.style = "display: none;";
                pageTitleText.style = "display: block;";
                document.getElementById("page-title-input").focus();
            });
            //pageTitle input작성 완료후 focus 똔는 enter를 쳤을때
            $("#page-title-input").keydown(function (key) {
                if(key.keyCode == 13) {
                    changeTitle();
                }
            });

            //focus 떠났을 때
            $("#page-title-input").blur(function () {
                changeTitle();
            });

            var changeTitle = function(){
                var title = document.getElementById("page-title-input");
                document.getElementById("page-title").innerHTML = title.value;
                pageTitleView.style = "display: block;";
                pageTitleText.style = "display: none;";
            }
        });


        //좋아요 버튼 이미지 변경
        var likebt = function () {
            var likebtEl = document.getElementById("likebt");
            if (0 < likebtEl.src.indexOf("1")) {
                likebtEl.src = imgPath + "like2.png"
            } else {
                likebtEl.src = imgPath + "like1.png"
            }
        };

    //Setting Behavior부분 함수
    $(function () {//---------------------------- tab-size 변경시
        $("#tab-size").change(function () {
            // alert(111);
            var st = $(":input:radio[name=gridRadios]:checked").val();
            var sp = this.value;
            if (st === "option1") {

                codeHtml.setOption("extraKeys", {
                    Tab: function (cm) {
                        var spaces = Array(cm.getOption("indentUnit") +
                            parseInt(sp)).join(" ");
                        cm.replaceSelection(spaces);
                    }
                });
            } else if (st === "option2") {

                // $("#gridRadios1").prop("checked", true);
                codeHtml.setOption("tabSize", this.value);
                codeCss.setOption("tabSize", this.value);
                codeJavaScript.setOption("tabSize", this.value);
            }
        });
    });

    //Setting Behavior부분 함수
    $(function () {//---------------------------- option button 변경시
        $('input[type=radio][name=gridRadios]').change(function () {
            alert(222);

            //현재 리스트박스의 탭사이즈 값 가져오기.
            var e = document.getElementById("tab-size");
            var strUser = e.options[e.selectedIndex].value;

            // var sp = this.value;
            if (this.value === "option1") {
                // alert('a');

                codeHtml.setOption("extraKeys", {
                    Tab: function (cm) {
                        var spaces = Array(cm.getOption("indentUnit") +
                            parseInt(strUser)).join(" ");
                        cm.replaceSelection(spaces);
                    }
                });
            } else if (this.value === "option2") { // have to: option1 갖다오면 백탭안됨
                // alert('b');
                // codeHtml.setOption("indentWithTabs", true);
                codeHtml.setOption("tabSize", strUser);
                codeCss.setOption("tabSize", strUser);
                codeJavaScript.setOption("tabSize", strUser);
                console.log(strUser);

            }
        });
    });

    $(function () { //--자동저장
        if ($('#autoSave').is(':checked')) {
            // alert(1);
        } else {
            // alert(2);
        }
    });

    $(function () {
        if ($('#autoPreview').is(':checked')) {//첫 로딩시 상태
        } else {
            var runstyle = document.getElementById("run");
            runstyle.style = "visibility: visible;"
        }

        $("#autoPreview").click(function () { //클릭시 상태
            var runstyle = document.getElementById("run");
            if (this.checked) {
                runstyle.style = "visibility: hidden;"
            } else {
                runstyle.style = "visibility: visible;"
            }
        });
    });


    $(function () {
        $("#run").click(function () { // run button 실행
            updatePreview();
        });
    });

    // command line  enter 입력시 이벤트
    //    var makeConsole = new Console();

        $(function () {
            $("#command-line").keyup(function (e) {
                if (e.keyCode === 13) {
                    consoleView(this.value);
                    this.value = "";
                }
            });
        });

        var consoleView = function(str) {
            var commandLineValue = str;
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
                editConsoleView.innerHTML += "<p class='console-log'> &nbsp;> " + commandLineValue + "</p>";
                if(temp !== null){
                    for(i in temp){
                        editConsoleView.innerHTML += "<p class='console-log' style='color:darkseagreen;'>" + temp[i] + "</p>"
                    }
                }
                editConsoleView.innerHTML += "<p class='console-log' style='color:darkorange;'> &nbsp;<· " + eval(commandLineValue) + "</p>"
            }catch(err){
                editConsoleView.innerHTML += "<p class='console-log' style='color:red;'> &nbsp;<· " + "Uncaught " + err.name + " : " + err.message + "</p>"
            }

            editConsoleView.scrollTop = editConsoleView.scrollHeight
        };


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

        });
        //--------------------

        //창 크기조절 관련
        $(function () {
            $(window).resize(function () {
                //            창크기 width 제한
                if (this.outerWidth <= 450) {
                    this.outerWidth = 450;
                }
            });
        });


        //layout 관련 script
        $(function () {


            $("#left-layout").click(function () {
                codeMain.style = "height: calc(100% - 9px);";
                iframeBody.style = "height: calc(100% - 50px);";
                layout2,style = "height: 100%;";
                layout1.className = "col-4 layout";
                resizeView.className = "col resize_view";
                resizeView.style = "height:100%; max-width: 5px; cursor: col-resize;";
                layout2.className = "col main_view layout";
                resizeCode1.style = "max-width: 100%; height: 5px; cursor: row-resize;";
                resizeCode2.style = "max-width: 100%; height: 5px; cursor: row-resize;";

                for(i in codeMirrorLayout) {
                    codeMirrorLayout[i].style = "height: calc(30% - 52px);";
                }

                for(i in codeLayout){
                    codeLayout[i].style = "width: 100%;";
                }
            });

            $("#top-layout").click(function () {
                codeMain.style = "height: 100%;";
                iframeBody.style = "height: calc(100% - 417px);";
                layout2,style = "height: calc(100% - 417px);";
                layout1.className = "row layout";
                resizeView.className = "row resize_view";
                resizeView.style = "height:5px; max-width: 100%; cursor: row-resize;";
                layout2.className = "row main_view layout";
                resizeCode1.style = "max-width: 5px; height: ; cursor: col-resize;";
                resizeCode2.style = "max-width: 5px; height: ; cursor: col-resize;";

                for(i in codeMirrorLayout){
                    codeMirrorLayout[i].style = "height: 300px";
                }

                for(i in codeLayout){
                    codeLayout[i].style = "width: 33.1%;";
                }
            });

            $("#right-layout").click(function () {
                codeMain.style = "height: calc(100% - 9px);";
                iframeBody.style = "height: calc(100% - 50px);";
                layout2,style = "height: 100%;";
                layout1.className = "col-4 order-12 layout";
                resizeView.className = "col order-6 resize_view";
                resizeView.style = "height:100%; max-width: 5px; cursor: col-resize;";
                layout2.className = "col order-1 main_view layout";
                resizeCode1.style = "max-width: 100%; height: 5px; cursor: row-resize;";
                resizeCode2.style = "max-width: 100%; height: 5px; cursor: row-resize;";

                for(i in codeMirrorLayout){
                    codeMirrorLayout[i].style = "height: calc(30% - 52px);";
                }

                for(i in codeLayout){
                    codeLayout[i].style = "width: 100%;";
                }
            });
        });


        //화면 영역 조절관련 function
        jQuery("#resize-code-1").mousedown(function(e) {
            e.preventDefault();
            dragging = true;
            var startP = (hcl !== 0 ? hcl + e.pageX : e.pageX);

            $(window).mousemove(function (e) {

                hcl = startP - e.pageX;

                console.log(cssBuild.offsetWidth);
                if (htmlBuild.offsetWidth < 80 || cssBuild.offsetWidth < 80) {

                }else{
                    htmlBuild.style = "width: calc(33.1% - " + hcl + "px);";
                    cssBuild.style = "width: calc(33.1% + " + hcl + "px);";
                }

            });
        });

        jQuery("#resize-code-2").mousedown(function(e) {
            e.preventDefault();
            dragging = true;
            var startP = (cjl !== 0 ? cjl + e.pageX : e.pageX);

            $(window).mousemove(function (e) {

                cjl = startP - e.pageX;

                if (-350 < cjl && cjl < 350) {
                    cssBuild.style = "width: calc(33.1% - " + cjl + "px);";
                    jsBuild.style = "width: calc(33.1% + " + cjl + "px);";
                }

            });
        });

        jQuery("#resize-view").mousedown(function(e) {
            e.preventDefault();
            dragging = true;
            var startP = (cifl !== 0 ? cifl + e.pageY : e.pageY);

            $(window).mousemove(function (e) {
                cifl = startP - e.pageY;
//                if (-350 < cifl && cifl < 350) {
                for(i in codeMLayout){
                    codeMLayout[i].style = "height: calc(100% - " + (753 + cifl)+ "px);";
                }

                iframeBody.style = "height: calc(100% - " + (488 - cifl) + "px);"
            });

            $('.iframeWrapper').mousemove(function (e) {
                cifl = startP - e.pageY;
                for(i in codeMLayout){
                    codeMLayout[i].style = "height: calc(100% - " + (753 + cifl)+ "px);";
                }

                iframeBody.style = "height: calc(100% - " + (488 - cifl) + "px);"
            });
        });

        jQuery(window).mouseup(function (e) {
            $(window).unbind('mousemove');
            $('.iframeWrapper').unbind('mousemove');
            dragging = false;
        });

        jQuery('.iframeWrapper').mouseup(function(e) {
            $(window).unbind('mousemove');
            $('.iframeWrapper').unbind('mousemove');
            dragging = false;
        })

//        $('.iframeWrapper').on('mouseup', function (e) {
//            dragging = false;
//        });

//        jQuery(function ($) { // DOM ready
//
//            $('.iframeWrapper').on('mousemove', function(e) {
//                e.preventDefault();
//                alert('test');
//            });
//
//        });
    </script>
</body>
</html>
