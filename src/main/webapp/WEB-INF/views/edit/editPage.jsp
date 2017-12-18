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
<!--autoFormatSelection & commentSelection-->
<%--<input type="button" onclick="autoFormatSelection()" value="autoFormatSelection">--%>
<%--<input type="button" onclick="commentSelection(true)" value="commentSelection">--%>


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
                <div class="col"><p class="h4 text-white code-name">Css</p></div>
                <div class="col" id="codeCss"></div>
            </div>
            <div class="resize-code" id="resize-code-2"></div>
            <div class="build col" id="jsBuild">
                <div class="col"><p class="h4 text-white code-name">JavaScript</p></div>
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
                <input type="text" name="command-line" id="command-line" value=""/>
            </div>
        </div>
    </div>
</main>


<!--modal 창-->
<jsp:include page="../include/editInclude/editModalSetting.jsp" flush="false"/>
<jsp:include page="../include/editInclude/editModalChangeView.jsp" flush="false"/>
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
                var commandLineValue = this.value;
                //console.log() 입력시 문자열 작업
                var reg = /console\.log\(\"([\w|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*)\"\)|console\.log\(\'([ㄱ-ㅎ|ㅏ-ㅣ|가-힣|\w]*)\'\)/g;
                var temp = commandLineValue.match(reg);

                for (i in temp) {
                    temp[i] = temp[i].replace("console.log(", "");
                    temp[i] = temp[i].replace("console.log(", "");
                    temp[i] = temp[i].replace("'", "");
                    temp[i] = temp[i].replace("\"", "");
                    temp[i] = temp[i].replace("')", "");
                    temp[i] = temp[i].replace("\")", "");
                }
                //------------------------------------------------

                try {
                    editConsoleView.innerHTML += "<p class='console-log'> > "
                        + commandLineValue + "</p>";
                    if (temp !== null) {
                        for (i in temp) {
                            editConsoleView.innerHTML += "<p class='console-log' style='color:darkseagreen;'>"
                                + temp[i] + "</p>"
                        }
                    }
                    editConsoleView.innerHTML += "<p class='console-log' style='color:darkorange;'> <· "
                        + eval(commandLineValue) + "</p>"
                } catch (err) {
                    // alert(err.message);
                    editConsoleView.innerHTML += "<p class='console-log' style='color:red;'> <· " +
                        "Uncaught " + err.name + " : " + err.message + "</p>"
                } finally {
                    this.value = "";
                }

                editConsoleView.scrollTop = editConsoleView.scrollHeight
            }
        });
    });

    //footer
    //console 버튼 누를때
    $(function () {
        $("#console-button").click(function () {
            if (editConsole.style.display === "none") {
                editConsole.style.display = "block";
                commandLine.style.display = "block";

                jQuery("#console-button").addClass("btn_active");

            } else {
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
    //resize관련 function
    var drag_x1 = false;
    $(function () {
        $("#resize-code-1").on({
            mousedown: function (event) {
                drag_x1 = event.offsetX;
            }
        })
    })

    $(window).resize(function () {
        // width값을 가져오기
        var width_size = window.outerWidth;
        var height_size = window.outerHeight;

        // 800 이하인지 if문으로 확인
        console.log(width_size + " * " + height_size);
    })
</script>
</body>
</html>
