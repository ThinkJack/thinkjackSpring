<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>unitTest</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="../include/editInclude/editCss.jsp" flush="false"/>

    <style>
        .mx-1 {
            height: 28px;
            margin-top: auto;
            margin-bottom: auto;
            line-height: 1;
        }

        .col-6, .col-12 {
            padding-right: 0px;
            padding-left: 0px;
        }

        .err {
            color: red;
        }

        .right_view {
            height: calc(100% - 50px);
            overflow: auto;
    }

        .input_box {
            width: 80px;
        }

        /*.console_body{}*/
        .whole {
            height: 100%;
            padding-top: 78px;
            padding-bottom: 50px;
        }

        .right {
            height: 50%;
        }

        #codeUnitTest {
            height: 100%;
            padding-bottom: 40px;
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
    <div class="col-6 row justify-content-between">
        <div class="col-6 row justify-content-start">
            <p class="h4 text-white code-name bd">JS</p>
        </div>
        <div class="col-6 row justify-content-end">
            <div class="custom-control custom-checkbox mx-1">
                <input type="checkbox" class="custom-control-input" id="autoremove" checked="">
                <label class="custom-control-label text-white" for="autoremove">테스트 케이스 자동 삭제</label>
            </div>
        </div>

        <div class="col" id="codeUnitTest"></div>
    </div>
    <div class="col-6">
        <div class="col unit_test right">
            <div class="col-12 row justify-content-between">
                <div class="col-3 row justify-content-start">
                    <p class="h4 text-white code-name bd">TestCase</p>
                </div>
                <div class="col-9 row justify-content-end my-1" style="padding: 0px">
                    <select id="functions" class="mx-1"><
                        <option>------</option>
                    </select>
                    <button id="delete-all" class="btn btn-outline-danger mx-1">DELETE ALL</button>
                    <button id="add-test-case" class="btn btn-outline-info mx-1">AddTestCase</button>
                    <button id="test-all" class="btn btn-outline-success mx-1">TestAll</button>
                </div>
            </div>
            <div class="right_view" id="test-case"></div>
        </div>
        <div class="col right">
            <div class="col-12 row justify-content-between">
                <div class="col-6 row justify-content-start ">
                    <p class="h4 text-white code-name bd ">Result</p>
                </div>
                <div class="col-6 row justify-content-end my-1 ">
                    <button id="clear-result-view" class="btn btn-outline-danger mx-1">Clear
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
    var errors = false;
    var frame = document.getElementById("frameUnitTest");
    var out = frame.contentDocument || frame.contentWindow.document;
    var count;
    var functions;
    codeUnitTest.on("change", function () {
        count = 0;
        var javascriptCode = codeUnitTest.getValue();
        if ($("#autoremove").prop("checked"))
            $("#test-case").empty();


        try {
            out.open();
            out.write("<script>" + codeUnitTest.getValue() + "<\/script>");
            out.close();
        } catch (err) {
            console.log(err);
        }


        var pos = 0;
        functions = new Array();
        while (pos !== -1) {
            count++;
            javascriptCode = javascriptCode.substring(pos);
            functions.push(javascriptCode.substring(javascriptCode.indexOf('function') + 8, javascriptCode.indexOf('(')));
            pos = javascriptCode.indexOf('function', pos + 1);
        }

        $("#functions").empty();
        $("#functions").append("<option>" + "------" + "</option>");
        for (var i = 0; i < count; i++)
            $("#functions").append("<option>" + functions[i] + "</option>");

    });

    codeUnitTest.setValue(
        "function test1(){\n" +
        "   return 0;\n" +
        "}");
    var caseNum = 0;
    $(document).on("click", "#add-test-case", function () {
        caseNum++;
        if ($('#functions').val() === "------") {
            alert("테스트 코드를 작성, 선택 해주세요");
            return;
        }

        var functionLength = frame.contentWindow.eval($('#functions').val() + ".length");
        var inputbox = "";
        for (var i = 0; i < functionLength; i++)
            inputbox += "<input type='text' class='form-control input_box inputs mx-1' />";
        var testCases =
            "<div id='case' class='row case m-2 text-white'>" +
            "<span class='input-group-addon mx-1' style='line-height: 1.5'>[ input : </span>" +
            inputbox +
            "<span  class='input-group-addon mx-1' style='line-height: 1.5'>] [ output : </span>" +
            "<input type='text' class='form-control input_box output mx-1' />" +
            "<span  class='input-group-addon mx-1' style='line-height: 1.5'> ]</span>" +
            "<button class='btn btn-outline-info test_one mx-1'>TEST</button>" +
            "<button class='btn btn-outline-danger delete_case mx-1'>DELETE</button>" +
            "</div>";
        $("#test-case").append(testCases);

        $("#case").width(400 +(functionLength * 90));
        $("#case").prop("id","case"+caseNum);


    });

    function codeTest(input, output) {
        var startTime = getTimeStamp();
        try {
            var inputResult = frame.contentWindow.eval($('#functions').val() + "(" + input + ")");
            $("#resultView").append(
                "<div class='text-white'> [ input : " + input
                + " / output : " + output
                + " / result : " + inputResult + " ] "
                + (inputResult === output ? "성공" : "실패")
                + "( 경과시간 : " + (getTimeStamp() - startTime) + "ms)"
                + "</div>");

        } catch (err) {
            $("#resultView").append("<div class='err'>" + err + "</div>");
        }
    }

    function getTimeStamp() {
        return new Date().getMilliseconds();
    }

    $(document).on("click", ".test_one", function () {
        var inputs = $(this).parent().find(".inputs");
        var testArguments = "";

        for (var i = 0; i < inputs.length; i++) {
            try{
                frame.contentWindow.eval(inputs[i].value);
                testArguments += inputs[i].value;
            }catch (notDefind){
                testArguments += "\"" + inputs[i].value + "\""
            }finally {
                if (inputs.length - 1 !== i)
                    testArguments += ",";
            }
        }
        var outputs = $(this).parent().find(".output");
        var output;
        try{
            frame.contentWindow.eval(outputs[0].value);
            output = outputs[0].value;
        }catch (notDefind){
            output += "\"" + outputs[0].value + "\""
        }
        codeTest(testArguments, output);

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
        var startTime = getTimeStamp();
        var testCase = $("#test-case").find(".test_one");
        testCase.trigger("click");
        $("#resultView").append("<div class='resultLog'> "
            + "모든 케이스를 모두 완료했습니다. (소요시간  : "
            + (getTimeStamp() - startTime) + "ms)" + "</div>");

    });
    $(document).ready(function () {
        $("#test-case").bind('DOMNodeInserted', function () {
            $(this).scrollTop($(document).height());

        });

        $("#resultView").bind('DOMNodeInserted', function () {
            $(this).scrollTop($(document).height());

        });
    });


</script>
</body>
</html>