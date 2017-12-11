<%--
  Created by IntelliJ IDEA.
  User: Uri
  Date: 2017-12-08
  Time: 오후 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EditPage</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/dist/css/tether.min.css">
    <%--<link rel="stylesheet" href="/resources/dist/css/bootstrap.css" />--%>
    <!-- 코드미러 -->
    <link rel="stylesheet" href="/resources/codemirror/lib/codemirror.css" />
    <!-- theme -->
    <link rel="stylesheet" href="/resources/codemirror/theme/night.css">
    <link rel="stylesheet" href="/resources/codemirror/theme/bespin.css">
    <link rel="stylesheet" href="/resources/codemirror/theme/dracula.css">
    <!-- 스크롤바 -->
    <link rel="stylesheet" href="/resources/codemirror/addon/scroll/simplescrollbars.css">
    <!-- autocomplete -->
    <link rel="stylesheet" href="/resources/codemirror/addon/hint/show-hint.css">
    <!-- addon\dialog -->
    <link rel="stylesheet" href="/resources/codemirror/addon/dialog/dialog.css">

    <link href="/resources/dist/css/editCss.css" rel="stylesheet">
</head>
<body>
    <%--header--%>
    <jsp:include page="../include/editInclude/editHeader.jsp" flush="false"/>

    <!-- main 코드 작성 페이지 -->
    <main role="main" class="main">
        <div class="borderRowLine"></div>
        <div class="container-fluid">
            <div class="row">
                <div class="build col" id="htmlBuild">
                    <div class="col"><p class="h4 text-white">HTML</p></div>
                    <div class="col" id="codeHtml"></div>
                </div>
                <div class="borderColLine"></div>
                <div class="build col" id="cssBuild">
                    <div class="col"><p class="h4 text-white">Css</p></div>
                    <div class="col" id="codeCss"></div>
                </div>
                <div class="borderColLine"></div>
                <div class="build col" id="jsBuild">
                    <div class="col"><p class="h4 text-white">JavaScript</p></div>
                    <div class="col" id="codeJavaScript"></div>
                </div>

            </div>
        </div>
        <div class="borderRowLine"></div>
        <div class="row content_row">
            <iframe class="col" id="resultView"></iframe>
        </div>
    </main>

    <!--footer-->
    <jsp:include page="../include/editInclude/editFooter.jsp" flush="false"/>

    <!--model 창-->
    <jsp:include page="../include/editInclude/editModalSetting.jsp" flush="false"/>
    <jsp:include page="../include/editInclude/editModalChangeView.jsp" flush="false"/>


    <jsp:include page="../include/editInclude/editJS.jsp" flush="false"/>

    <script>

    </script>
</body>
</html>
