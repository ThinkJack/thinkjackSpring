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
    <jsp:include page="../include/editInclude/editCSS.jsp" flush="false"/>



</head>
<body>
    <%--header--%>
    <jsp:include page="../include/editInclude/editHeader.jsp" flush="false"/>

    <!-- main 코드 작성 페이지 -->
    <main role="main">
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
        <div class="row">
            <iframe class="col" id="resultView"></iframe>
        </div>
    </main>

    <!--footer-->
    <jsp:include page="../include/editInclude/editFooter.jsp" flush="false"/>

    <!--model 창-->
    <jsp:include page="../include/editInclude/editSettingModal.jsp" flush="false"/>
    <jsp:include page="../include/editInclude/editChangeViewModal.jsp" flush="false"/>

    <jsp:include page="../include/editInclude/editJS.jsp" flush="false"/>


    <script>

    </script>
</body>
</html>