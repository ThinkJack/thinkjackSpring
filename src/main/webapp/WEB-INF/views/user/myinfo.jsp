<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: kwak
  Date: 2018. 1. 5.
  Time: AM 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <style>
        body {
            font-family: Arial;
        }

        /* Style the tab */
        .tab {
            overflow: hidden;
            border: 1px solid #ccc;
            background-color: #f1f1f1;
        }

        /* Style the buttons inside the tab */
        .tab button {
            background-color: inherit;
            float: left;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 14px 16px;
            transition: 0.3s;
            font-size: 17px;
        }

        /* Change background color of buttons on hover */
        .tab button:hover {
            background-color: #ddd;
        }

        /* Create an active/current tablink class */
        .tab button.active {
            background-color: #ccc;
        }

        /* Style the tab content */
        .tabcontent {
            display: none;
            padding: 6px 12px;
            border: 1px solid #ccc;
            border-top: none;
        }

        .small-unit {
            float: left;
            width: 200px;
            height: 200px;
            color: black;
           /* background: #333;*/
            margin: 1px;
        }
        .big-area {
            float: left;
            width: 500px;
            margin: 0 10px 0 0;
            padding: 10px;
        /*    background: #999;*/
        }
        p{
            color:black;
        }
    </style>


<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>
<div class="deaf"></div>

<div class="tab">
    <button class="tablinks" onclick="openTab(event, 'Account_information')">Account information</button>
    <button class="tablinks" onclick="openTab(event, 'Board')">Board</button>
    <button class="tablinks" onclick="openTab(event, 'Source_code')">Source code</button>
</div>

<div id="Account_information" class="tabcontent" style="display: block;">
    <p style="text-align: left">사용자 프로필</p>
    <div class="big-area">
        <img id="profile" align="left" class="small-unit" style="width:200px;height:200px;"  src="" alt="Profile image example"/>
        <div class="small-unit"><h4>"${login.userName}"<p style="color:black;">님 반가워요</p></h4> <br><p style="color:black;">${login.userEmail}</p><br><button class="btn btn-outline-secondary" onclick="location.href='/user/modifyUser'">정보변경</button><br><button class="btn btn-outline-secondary" onclick="location.href='/user/setPassAuthCheck'">패스워드 변경</button></div>
        <div class="small-unit"></div>
        <div class="small-unit"></div>
    </div>

    <div class="big-area">
        <div class="small-unit"></div>
        <div class="small-unit"></div>
        <div class="small-unit"></div>
        <div class="small-unit"></div>
    </div>
</div>

<div id="Board" class="tabcontent">
    <select name="searchType">
        <option value="n"
                <c:out value="${cri.searchType == null?'selected':''}"/> >
            ---
        </option>
        <option value="t"
                <c:out value="${cri.searchType eq 't'?'selected':''}"/> >
            Title
        </option>
        <option value="c"
                <c:out value="${cri.searchType eq 'c'?'selected':''}"/> >
            Content
        </option>
        <option value="tc"
                <c:out value="${cri.searchType eq 'tc'?'selected':''}"/> >
            Title OR Content
        </option>
    </select>

    <input type="text" name="keyword" id="keywordInput"
           value="${cri.keyword}">

    <button id="searchBtn">Search</button>

    <hr>
    <table class="table">
        <tr>
            <th style="width:10px;">boardId</th>
            <th>TITLE</th>
            <th>WRITER</th>
            <th>REGDATE</th>
            <th style="width:40px;">VIEWCNT</th>
            <th style="width:40px;">HEART</th>
        </tr>
        <c:forEach items="${list}" var="boardVO">
            <tr>
                <td>${boardVO.boardId}</td>
                <td>
                    <a href='/board/read${pageMaker.makeUserSearch(pageMaker.cri.page) }&boardId=${boardVO.boardId}&category=${boardVO.boardCategoryName}'>
                            ${boardVO.boardTitle}</a></td>
                <td>${boardVO.boardWriter}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                                    value="${boardVO.boardRegdate}"/></td>
                <td><span class="badge bg-red">${boardVO.boardViewcnt}</span></td>
                <td><span class="badge bg-red">${boardVO.boardLikecnt}</span></td>
            </tr>
        </c:forEach>
    </table>

    <div class="text-center">
        <ul class="pagination">

            <c:if test="${pageMaker.prev}">
                <li><a href="myinfo${pageMaker.makeUserSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
            </c:if>

            <c:forEach begin="${pageMaker.startPage}"
                       end="${pageMaker.endPage}" var="idx">
                <li <c:out value="${pageMaker.cri.page == idx? 'class=active':'' }"/>>
                    <a href="myinfo${pageMaker.makeUserSearch(idx)}">${idx}</a>
                </li>
            </c:forEach>

            <c:if test="${pageMaker.next&&pageMaker.endPage > 0}">
                <li>
                    <a href="myinfo${pageMaker.makeUserSearch(pageMaker.endPage + 1)}">
                        &raquo;
                    </a>
                </li>
            </c:if>

        </ul>
    </div>
</div>

<script>
    $(document).ready(
        function () {
            $('#searchBtn').on(
                "click",
                function (event) {
                    self.location = "myinfo"
                        + '${pageMaker.makeQuery(1)}'
                        + "&searchType="
                        + $("select option:selected").val()
                        + "&keyword=" + encodeURIComponent($('#keywordInput').val());
                }
            );
        }
    );

</script>
</div>

<div id="Source_code" class="tabcontent">
    소스코드
</div>

<script>
    function openTab(evt, category) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(category).style.display = "block";
        evt.currentTarget.className += " active";
    }
</script>
<script src="/resources/dist/js/upload.js"></script>
<script>
    $(document).ready(function() {
        // var imgtest;
        var fullName="${login.userProfile}";
        // if(fullName!=="") {
        //     imgtest = getFileInfo(fullName);
        //     console.log(imgtest);
        //     str = imgtest;
        // }else{
        //     str = "/resources/images/123.gif";
        // }
        $("#profile").attr("src",getFileInfo(fullName));
    });
</script>
</body>
</html>