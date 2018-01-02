<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>unitTest</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="../include/editInclude/editCss.jsp" flush="false"/>

    <style>
        .col-6{
            padding-right: 0px;
            padding-left : 0px;
        }
        .col-12{
            padding-right: 0px;
            padding-left : 0px;
        }
        intext{
            color: #FFFFFF;
            
        }
        #err{
            color: red;
        }
        .unit_test {
            display: block;
        }
        .test_case {
            overflow: scroll;
            height: 90%;
        }
        .input_box{
            width: 80px;
        }



        .edit-console, .main_view {
            height: 100%;
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
<jsp:include page="../include/editInclude/unitTestHeader.jsp" flush="false"/>
<main role="main" class="main" id="code-main">
    <div class="row container-fluid">
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
                    <div class="col-12 row justify-content-between">
                        <div class="col-6 row justify-content-start">
                        <p class="h4 text-white code-name">TestCase</p>
                        </div>
                        <div class="col-6 row justify-content-end my-1 ">
                        <button id="delete-all" class="unit-header btn btn-outline-dark mx-1" >Clear</button>
                        <button id="add-test-case" class="unit-header  btn btn-outline-dark mx-1" >AddTestCase</button>
                        <button id="test-all" class="unit-header  btn btn-outline-dark mx-1">TestAll</button>
                        </div>
                    </div>
                    <div class="test_case">
                        
                    </div>
                </div>
                <div class="row resize-console"></div>
                <div class="row console-body">
                    <%--console--%>
                    <div class="row edit_console" id="edit-console">
                        <div class="build col">
                            <div class="col-12 row justify-content-between">
                                <div class="col-6 row justify-content-start">
                                    <p class="h4 text-white code-name">Result</p>
                                </div>
                                <div class="col-6 row justify-content-end my-1 ">
                                    <button id="clear-result-view" class="unit-header btn btn-outline-dark mx-1" >Clear</button>
                                </div>
                            </div>
                            <div class="row " id="resultView" readonly></div>
                        </div>
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
<jsp:include page="../include/editInclude/unitTestFooter.jsp" flush="false"/>


<%--script단--%>
<jsp:include page="../include/editInclude/untitJS.jsp" flush="false"/>


<script>
    var before = 0;
    var testFunc;
    var declaration;
    var errors = false;
    codeUnitTest.on("change", function () {
        var origin = codeUnitTest.getValue();
        declaration = origin.substr(origin.indexOf("(")+1,origin.indexOf("{")-origin.indexOf("(")-2);
        // console.log(c);
        // $("#resultView").empty();
        try {
            testFunc = new Function(declaration,
                origin.substr(origin.indexOf("{") + 1, origin.lastIndexOf("}") - origin.indexOf("{") - 1));
            errors = false;
        }catch(err){
            $("#resultView").append("<div><span id='err'>"+err+"</span></div>");
            errors = true;
        }
        if(before != testFunc.length)
            $(".test_case").empty();
        before = testFunc.length;
    });
    $(document).on("click","#add-test-case",function () {
        var inputbox ="";
        for(var i = 0; i < testFunc.length; i++)
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
       $(".test_case").append(testCases);
    });

    function codeTest(input,output) {
        var result = false;
        var functionValue;
        var startTime =  getTimeStamp();
        var errMassage ="";
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
            if(output == functionValue)
                result = true;
        }catch (err){
            errMassage = err;
        }
        finally {
            var runningTime = getTimeStamp() - startTime;
            resultText = "<div>[input : " + input.join() +
                " / output : " + output + "] " +
                "결과 : " + (result ? "성공" : "실패") +
                " (경과시간 : " + runningTime + "ms)<br/>"
                +"<span id='err'>"+errMassage+"</span>"+
                "</div>";
            return resultText;
        }


    }

    function getTimeStamp() {
        return new Date().getMilliseconds();
    }

    $(document).on("click",".test_one",function (){
        var startTime = getTimeStamp();
        var inputs = $(this).parent().find(".inputs");
        var testArguments = new Array;
        for(var i = 0 ; i < inputs.length; i++){
            testArguments.push(inputs[i].value);
        }
        var output = $(this).parent().find(".output");
        var output = output[0].value;
        // console.log(output);

        var result = codeTest(testArguments,output);



        if(!errors) {
            // $("#resultView").empty();
            $("#resultView").append(result);
        }
    });


    $(document).on("click",".delete-case",function () {
        $(this).parent().remove();

    });

    $(document).on("click","#delete-all",function () {
        // $("#resultView").empty();
        $(".test_case").empty();
    });

    $(document).on("click","#clear-result-view",function () {
        $("#resultView").empty();
    })



</script>
</body>
</html>
