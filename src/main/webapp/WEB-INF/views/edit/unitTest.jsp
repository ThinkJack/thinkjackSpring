<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>unitTest</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="../include/editInclude/editCss.jsp" flush="false"/>

    <style>
        .resultLog{
            color:#EFEFEF;
        }

        .col-6, .col-12 {
            padding-right: 0px;
            padding-left: 0px;
        }

        intext {
            color: #FFFFFF;

        }

        #err {
            color: red;
        }

        .right_view {
            height: calc(100% - 48px);
            overflow: scroll;
        }

        .input_box {
            width: 80px;
        }

        /*.console_body{}*/
        .whole {
            height: 100%;
            padding-top: 70px;
            padding-bottom: 47px;
        }

        .right {
            height: 50%;
        }

        #codeUnitTest {
            height: 100%;
            padding-bottom: 44px;
        }

        #frameUnitTest {
            height: 0px;
            width: 0px;

        }

        .CodeMirror {
             height: 100%;
         }

        .container-fluid {
            overflow: hidden;
        }

    </style>
</head>
<body class="container-fluid">
<%--header--%>
<jsp:include page="../include/editInclude/unitTestHeader.jsp" flush="false"/>

<div class="col-12 row justify-contents-center whole">
    <div class="col-6">
        <div class="col"><p class="h4 text-white code-name">JS</p></div>
        <div class="col" id="codeUnitTest"></div>
    </div>
    <div class="col-6">
        <div class="col unit_test right">
            <div class="col-12 row justify-content-between">
                <div class="col-6 row justify-content-start">
                    <p class="h4 text-white code-name">TestCase</p>
                </div>
                <div class="col-6 row justify-content-end my-1 ">
                    <button id="delete-all" class="unit-header btn btn-outline-dark mx-1">Clear</button>
                    <button id="add-test-case" class="unit-header  btn btn-outline-dark mx-1">AddTestCase</button>
                    <button id="test-all" class="unit-header  btn btn-outline-dark mx-1">TestAll</button>
                </div>
            </div>
            <div class="right_view" id="test-case"></div>
        </div>
        <div class="col right">
            <div class="col-12 row justify-content-between">
                <div class="col-6 row justify-content-start">
                    <p class="h4 text-white code-name">Result</p>
                </div>
                <div class="col-6 row justify-content-end my-1 ">
                    <button id="clear-result-view" class="unit-header btn btn-outline-dark mx-1">Clear
                    </button>
                </div>
            </div>
            <div class="right_view" id="resultView" readonly></div>
        </div>
    </div>
</div>

<iframe id="frameUnitTest"></iframe>

<!--modal 창-->
<jsp:include page="../include/editInclude/editModalSetting.jsp" flush="false"/>
<jsp:include page="../include/editInclude/editModalChangeView.jsp" flush="false"/>
<jsp:include page="../include/editInclude/editModalReply.jsp" flush="false"/>
<!--footer-->
<jsp:include page="../include/editInclude/unitTestFooter.jsp" flush="false"/>


<%--script단--%>
<jsp:include page="../include/editInclude/untitJS.jsp" flush="false"/>


<script>
    var before = 0;
    var testFunc;
    var declaration;
    var errors = false;
    var frame = document.getElementById("frameUnitTest");
    var out = frame.contentDocument || frame.contentWindow.document

    codeUnitTest.on("change", function () {
        var origin = codeUnitTest.getValue();
        declaration = origin.substr(origin.indexOf("(") + 1, origin.indexOf("{") - origin.indexOf("(") - 2);
        // console.log(c);
        // $("#resultView").empty();
        try {
            testFunc = new Function(declaration,
                origin.substr(origin.indexOf("{") + 1, origin.lastIndexOf("}") - origin.indexOf("{") - 1));
            errors = false;
        } catch (err) {
            $("#resultView").append("<div><span id='err'>" + err + "</span></div>");
            errors = true;
        }
        if (before != testFunc.length)
            $("#test-case").empty();
        before = testFunc.length;

        //Uritest-----------------------------------------------------------------------------------------------
        out.open();
        out.write("<script>" + testFunc + "<\/script>");
        out.close();

        console.log(frame.contentWindow.eval("anonymous()"));

    });
    $(document).on("click", "#add-test-case", function () {
        var inputbox = "";
        for (var i = 0; i < testFunc.length; i++)
            inputbox += "<input type='text' class='form-control input_box inputs' />";
        var testCases =
            "<div class='row case m-2'>" +
            "<span class='input-group-addon'>input : </span>" +
            inputbox +
            "<span  class='input-group-addon'>ouput : </span>" +
            "<input type='text' class='form-control input_box output' />" +
            "<button class='btn btn-outline-dark test_one' >TEST</button>" +
            "<button class='btn btn-outline-dark delete_case'>DELETE</button>" +
            "</div>";
        $("#test-case").append(testCases);
    });

    function codeTest(input, output) {
        var result = false;
        var functionValue;
        var startTime = getTimeStamp();
        var errMassage = "";
        try {
            switch (input.length) {
                case 0 :
                    functionValue = testFunc();
                    break;
                case 1 :
                    functionValue = testFunc(
                        input[0]);
                    break;
                case 2 :
                    functionValue = testFunc(
                        input[0],
                        input[1]);
                    break;
                case 3 :
                    functionValue = testFunc(
                        input[0],
                        input[1],
                        input[2]);
                    break;
                case 4 :
                    functionValue = testFunc(
                        input[0],
                        input[1],
                        input[2],
                        input[3]);
                    break;
                case 5 :
                    functionValue = testFunc(
                        input[0],
                        input[1],
                        input[2],
                        input[3],
                        input[4]);
                    break;
                case 6 :
                    functionValue = testFunc(
                        input[0],
                        input[1],
                        input[2],
                        input[3],
                        input[4],
                        input[5]);
                    break;
                case 7 :
                    functionValue = testFunc(
                        input[0],
                        input[1],
                        input[2],
                        input[3],
                        input[4],
                        input[5],
                        input[6]);
                    break;
                case 8 :
                    functionValue = testFunc(
                        input[0],
                        input[1],
                        input[2],
                        input[3],
                        input[4],
                        input[5],
                        input[6],
                        input[7]);
                    break;
            }
            if (output == functionValue)
                result = true;
        } catch (err) {
            errMassage = err;
        }
        finally {
            var runningTime = getTimeStamp() - startTime;
            resultText = "<div class='resultLog'>[input : " + input.join() +
                " / output : " + output + "] " +
                "결과 : " + (result ? "성공" : "실패") +
                " (경과시간 : " + runningTime + "ms)<br/>"
                + "<span id='err'>" + errMassage + "</span>" +
                "</div>";
            return resultText;
        }


    }

    function getTimeStamp() {
        return new Date().getMilliseconds();
    }

    $(document).on("click", ".test_one", function () {
        var startTime = getTimeStamp();
        var inputs = $(this).parent().find(".inputs");
        var testArguments = new Array;
        for (var i = 0; i < inputs.length; i++) {
            testArguments.push(inputs[i].value);
        }
        var output = $(this).parent().find(".output");
        var output = output[0].value;
        // console.log(output);

        var result = codeTest(testArguments, output);


        if (!errors) {
            // $("#resultView").empty();
            $("#resultView").append(result);
        }
    });


    $(document).on("click", ".delete_case", function () {
        $(this).parent().remove();

    });

    $(document).on("click", "#delete-all", function () {
        // $("#resultView").empty();
        $("#test-case").empty();
    });

    $(document).on("click", "#clear-result-view", function () {
        $("#resultView").empty();
    });
    $(document).on("click", "#test-all", function () {
        var testCase = $("#test-case").find(".test_one");
            testCase.trigger("click");
    });
    $(document).ready(function () {
        $("#test-case").bind('DOMNodeInserted',function () {
            $(this).scrollTop($(document).height());

        });

        $("#resultView").bind('DOMNodeInserted',function () {
            $(this).scrollTop($(document).height());

        });
    });



</script>
</body>
</html>
