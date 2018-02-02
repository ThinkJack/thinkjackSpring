<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <link rel="shortcut icon" href="
    /resources/images/favicon/idea.ico" type="image/x-icon" />
    <link rel="icon"  href="/resources/images/favicon/idea.ico"  type="image/x-icon"  />
    <title>JSAlgorithm</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="../edit/editInclude/editCss.jsp" flush="false"/>

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
        #codeJSAlgorithm {
            height: 100%;
            padding-bottom: 40px;
        }
        #frameJSAlgorithm {
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
<jsp:include page="../edit/editInclude/JSAlgorithmHeader.jsp" flush="false"/>

<div class="col-12 row justify-contents-center whole">
    <div class="col-6 row justify-content-between">
        <div class="col-6 row justify-content-start">
            <p class="h4 text-white code-name bd">TestCode(JS)</p>
        </div>
        <div class="col-6 row justify-content-end">
            <div class="custom-control custom-checkbox mx-1">
                <input type="checkbox" class="custom-control-input" id="autoremove" checked="">
                <label class="custom-control-label text-white" for="autoremove">테스트 케이스 자동 삭제</label>
            </div>
        </div>

        <div class="col" id="codeJSAlgorithm"></div>
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

<iframe id="frameJSAlgorithm"></iframe>

<!--modal 창-->
<jsp:include page="../edit/editInclude/editKeyMapModal.jsp" flush="false"/>
<jsp:include page="../edit/editInclude/JSAlgorithmHowtoModal.jsp" flush="false"/>
<!--footer-->
<jsp:include page="../edit/editInclude/JSAlgorithmFooter.jsp" flush="false"/>


<%--script단--%>
<jsp:include page="../edit/editInclude/unitJS.jsp" flush="false"/>


<script>
    var frame = document.getElementById("frameJSAlgorithm");
    var out = frame.contentDocument || frame.contentWindow.document;
    var functions;



    codeJSAlgorithm.on("change", function () { // js code 가 변경될때,
        // clearTimeout(delay);
        // delay = setTimeout(codeJSAlgorithm, 3000);

        var javascriptCode = codeJSAlgorithm.getValue(); // 문자열을 가져옴
        if ($("#autoremove").prop("checked")) // 테스트 케이스 자동삭제가 켜져있는지 확인
            $("#test-case").empty(); // 켜져있으면 비워줌
        try {

             delay = setTimeout(Preview, 3000); //3초지연 미리보기

             function Preview(){
                out.open(); // out 객체를연다.
                out.write("<script>" + javascriptCode + "<\/script>"); // out 객체에 javascript의 값을 주입한다.
                out.close(); // out 객체를 닫는다.
             }

        } catch (err) {
            $("#resultView").append(err); // 에러를 reultView 찍어줌
        }

        functions = new Array(); // 빈배열을 생성 여기에 function에 이름만 담는다.
        pos = javascriptCode.indexOf('function', 0); // 첫번째 function을 찾는다.
        var count = 1;
        while (pos !== -1) {  // indexOf로 찾았을때 다음값이 없을때까지

            javascriptCode = javascriptCode.substring(pos); // javascript코드를 자름
            if(javascriptCode.substring(javascriptCode.indexOf('function') +8   , javascriptCode.indexOf('(')).trim() !== "") {
                functions.push(javascriptCode.substring(javascriptCode.indexOf('function') +8, javascriptCode.indexOf('(')));
            }
            count++; //함수의 갯수를 담아둠
            pos = javascriptCode.indexOf('function',count); //계속해서 function 을 찾는다.
            // 자른 Javascropt 코드중에서 function의 이름만 가져와서 배열에 추가

        }
        $("#functions").empty(); // 셀렉트 박스를 비우고
        $("#functions").append("<option>" + "------" + "</option>"); // 기본셋팅
        for (var i = 0; i < functions.length; i++) // 반복문으로 function의 이름만 출력해준다.
            $("#functions").append("<option>" + functions[i] + "</option>");
    });
    codeJSAlgorithm.setValue( // 처음에 페이지가 열리면 기본적으로 이값이 써있다.
        "function test1(){\n" +
        "   return 0;\n" +
        "}");
    var caseNum = 0;
    $(document).on("click", "#add-test-case", function () { // add-test-case 버튼을 눌럿을때,
        caseNum++;
        if ($('#functions').val() === "------") { // 셀렉트 박스가 선택 되어있어야 한다.
            alert("테스트 코드를 작성, 선택 해주세요");
            return;
        }
        var functionLength = frame.contentWindow.eval($('#functions').val() + ".length"); // function의 매개변수의 갯수를 알아낸다.
        var inputbox = "";
        for (var i = 0; i < functionLength; i++) //매개변수 만큼의 input box를 생성한다.
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
        $("#case").width(420 + (functionLength * 90)); // testcase 의 길이를 조정해서 한 라인에 모두들어가게 만들어준다.
        $("#case").prop("id","case"+caseNum); // 헷깔리지 않게 id를 구분해준다.
    });
    function codeTest(input, output) {
        var startTime = getTimeStamp();
        try {
            var result;
            var inputResult = frame.contentWindow.eval($('#functions').val() + "(" + input + ")");
            try{
                result = frame.contentWindow.eval(inputResult);
            }catch (notDefind){
                result = "\"" + inputResult + "\"";
            }
            console.log(output);
            console.log(result);
            // function의 결과값을 저장한다.
            $("#resultView").append(
                "<div class='text-white'> [ input : " + input // input값을 찍어줌
                + " / output : " + output // output값을 찍어줌
                + " / result : " + result + " ] " // 결과값을찍어줌
                + ((result == output ) || ( JSON.stringify(result) === JSON.stringify(output) ) ? "성공" : "실패")// 두 값이 맞는지 판별함
                + " ( 경과시간 : " + (getTimeStamp() - startTime) + "ms)" // 경과시간을 알려줌
                + "</div>");
        } catch (err) {
            $("#resultView").append("<div class='err'>" + err + "</div>"); // err발생시 err를 찍어줌
        }
    }
    function getTimeStamp() {
        return new Date().getMilliseconds();
    }
    $(document).on("click", ".test_one", function () { // test-one 을 클릭했을때, 개별테스트 진행
        var inputs = $(this).parent().find(".inputs"); // input 값을 찾아서
        var testArguments = "";
        for (var i = 0; i < inputs.length; i++) {
            try{
                testArguments += frame.contentWindow.eval(inputs[i].value); //
            }catch (notDefind){ // input 값이 notdefind 애러가 난다면, 문자열로 치환해준다.
                testArguments += "\"" + inputs[i].value + "\""
            }finally {
                if (inputs.length - 1 !== i) // 끝의 값이 아니라면 ,를 붙여줌
                    testArguments += ",";
            }
        }

        var output= "";
        var outputs = $(this).parent().find(".output");
        console.log(frame.contentWindow.eval(outputs[0].value));
        try{
            output = frame.contentWindow.eval(outputs[0].value);
        }catch (notDefind){
            output = "\"" + outputs[0].value + "\"";
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
    $(document).on("click", "#test-all", function () { // 모든 case 를 한번에 측정한다.
        var ALLCaseStartTime = getTimeStamp();
        var testCase = $("#test-case").find(".test_one");
        testCase.trigger("click"); // testcase를 모두 가져와서 test_one버튼을 클릭하게 함.
        $("#resultView").append("<div class='text-white '> "
            + "모든 케이스를 모두 완료했습니다. (소요시간  : "
            + (getTimeStamp() - ALLCaseStartTime) + "ms)" + "</div>");
    });
    $(document).ready(function () { // 변경이 감지되면 자동으로 스크롤을 최하위로 내려주는 함수들
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