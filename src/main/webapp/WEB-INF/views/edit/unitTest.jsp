<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>EditPage</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="../include/editInclude/editCss.jsp" flush="false"/>

    <style>
        .unit_test {
            display: block;
            padding: 6px;
        }
        .test_case {
            overflow-x: scroll;
            height: 400px;
            /*display: flex;*/
        }
        .input_box{
            width: 100px;
        }
        .btn_case{
            margin: 0px 2px;
        }
        .case{
            margin-top: 2px;
        }
        .test_buttons{
            margin-bottom: 6px;
        }


        .code_layout {
            width: 100%;
        }

        .edit-console, .main_view {
            height: 100%;
        }

        .edit-console-view {
            height: calc(100% - 49px);
        }

        .main_ch {
            height: calc(100% - 74px);
        }

        .CodeMirror {
            height: calc(100% - 62px);
        }

        .main_view .console_body {
            bottom: auto;
        }

        .unit_test {
            height: 50%;
        }

        .console_body {
            height: calc(50% - 96px);
        }

        /*.console_body{}*/

    </style>
</head>
<body>
<%--header--%>
<jsp:include page="../include/editInclude/editHeader.jsp" flush="false"/>

<!-- main 코드 작성 페이지 -->
<main role="main" class="main" id="code-main">

    <div class="row container-fluid main_ch">
        <div class="row boarderLine"></div>
        <div class="row">
            <div class="col">
                <div class="build col" id="jsBuild">
                    <div class="col"><p class="h4 text-white code-name">JS</p></div>
                    <div class="col" id="codeUnitTest"></div>
                </div>
            </div>
            <div class="col resize_code layout-ch"></div>
            <%--결과창--%>
            <div class="col main_view layout" id="layout2">
                <div class="row unit_test" id="">
                    <div class="col "><p class="h4 text-white code-name">TestCase</p></div>
                    <div class="col test_buttons">
                        <button id="delete-all" >Clear</button>
                        <button id="add-test-case" >AddTestCase</button>
                        <button id="test-all">TestAll</button>
                    </div>
                    <div class="test_case">
                        
                    </div>
                </div>
                <div class="row resize-console"></div>
                <div class="row console_body">
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
    $(function () {
        var pageTitleView = document.getElementById("page-title-view");
        var pageTitleText = document.getElementById("page-title-text");

        $("#pencil").click(function () {
            pageTitleView.style = "display: none;";
            pageTitleText.style = "display: block;";
            document.getElementById("page-title-input").focus();
        });
        //pageTitle input작성 완료후 focus 똔는 enter를 쳤을때
        $("#page-title-input").keydown(function (key) {
            if (key.keyCode == 13) {
                changeTitle();
            }
        });

        //focus 떠났을 때
        $("#page-title-input").blur(function () {
            changeTitle();
        });

        var changeTitle = function () {
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

    $(function () {
        $("#command-line").keyup(function (e) {
            if (e.keyCode === 13) {
                consoleView(this.value);
                this.value = "";
            }
        });
    });

    var consoleView = function (str) {
        var commandLineValue = str;
        //console.log() 입력시 문자열 작업(정규식)
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

        try {
            editConsoleView.innerHTML += "<p class='console-log'> &nbsp;> " + commandLineValue + "</p>";
            if (temp !== null) {
                for (i in temp) {
                    editConsoleView.innerHTML += "<p class='console-log' style='color:darkseagreen;'>" + temp[i] + "</p>"
                }
            }
            editConsoleView.innerHTML += "<p class='console-log' style='color:darkorange;'> &nbsp;<· " + eval(commandLineValue) + "</p>"
        } catch (err) {
            editConsoleView.innerHTML += "<p class='console-log' style='color:red;'> &nbsp;<· " + "Uncaught " + err.name + " : " + err.message + "</p>"
        }

        editConsoleView.scrollTop = editConsoleView.scrollHeight
    };


    $(function () {
        $(window).resize(function () {
            //            창크기 width 제한
            if (this.outerWidth <= 450) {
                this.outerWidth = 450;
            }
        });
    });
    $(document).on("click","#add-test-case",function () {

       var testCases =
           "<div class='row case'>" +
           "input : " +
           "<input type='text' class='input_box inputs' />" +
           "ouput : " +
           "<input type='text' class='input_box output' />" +
           "<button class='btn_case test_one'>TEST</button>" +
           "<button class='btn_case delete_case'>DELETE</button>" +
           "</div>";
       $(".test_case").append(testCases);
    });
    $(document).on("click",".test_one",function () {

    });

    $(document).on("click",".delete_case",function () {
        $(this).parent().remove();
    });

    $(document).on("click","#delete-all",function () {
        $(".test_case").empty();
    });
    $(document).ready(function () {
        editConsole.style.display = "block";
        commandLine.style.display = "block";
    })

</script>
</body>
</html>
