<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>


<jsp:include page="/WEB-INF/views/include/slidebar.jsp" flush="false"/>
<style>
    td, th {
        text-align: center;
    }
</style>
<div class="row">
    <div class="col-3"></div>

    <div class="col-6">
        <h1 style="text-align: center;"> ${category} 게시판</h1>
            <select name="searchType">
                <option value="n"
                        <c:out value="${cri.searchType == null?'selected':''}"/> >
                    ---</option>
                <option value="t"
                        <c:out value="${cri.searchType eq 't'?'selected':''}"/> >
                    Title</option>
                <option value="c"
                        <c:out value="${cri.searchType eq 'c'?'selected':''}"/> >
                    Content</option>
                <option value="w"
                        <c:out value="${cri.searchType eq 'w'?'selected':''}"/> >
                    Writer</option>
                <option value="tc"
                        <c:out value="${cri.searchType eq 'tc'?'selected':''}"/> >
                    Title OR Content</option>
                <option value="cw"
                        <c:out value="${cri.searchType eq 'cw'?'selected':''}"/> >
                    Content OR Writer</option>
                <option value="tcw"
                        <c:out value="${cri.searchType eq 'tcw'?'selected':''}"/> >
                    Title OR Content OR Writer</option>
            </select>

            <input type="text" name="keyword" id="keywordInput"
                   value="${cri.keyword}">

            <button id="searchBtn">Search</button>
            <button id="newBtn">new Board</button>

        <hr>
        <table class="table">
            <tr>
                <th style="width:10px;">boardId</th>
                <th >TITLE</th>
                <th >WRITER</th>
                <th >REGDATE</th>
                <th style="width:40px;">VIEWCNT</th>
                <th style="width:40px;">HEART</th>
            </tr>
            <c:forEach items="${list}" var="boardVO">
                <tr>
                    <td>${boardVO.boardId}</td>
                    <td><a href='/board/read${pageMaker.makeSearch(pageMaker.cri.page) }&boardId=${boardVO.boardId}&category=${category}'>
                            ${boardVO.boardTitle}</a> </td>
                    <td>${boardVO.boardWriter}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                                        value="${boardVO.boardRegdate}"/></td>
                    <td><span class="badge bg-red">${boardVO.boardViewcnt}</span></td>
                    <td><span class="badge bg-red">${boardVO.boardLikecnt}</span></td>
                </tr>
            </c:forEach>
        </table>

        <div class="text-center">
            <ul class = "pagination">

                <c:if test="${pageMaker.prev}">
                    <li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
                </c:if>

                <c:forEach begin="${pageMaker.startPage}"
                           end = "${pageMaker.endPage}" var="idx">
                    <li <c:out value="${pageMaker.cri.page == idx? 'class=active':'' }"/>>
                        <a href="list${pageMaker.makeSearch(idx)}&category=${category}">${idx}</a>
                    </li	>
                </c:forEach>

                <c:if test="${pageMaker.next&&pageMaker.endPage > 0}">
                    <li>
                        <a href = "list${pageMaker.makeSearch(pageMaker.endPage + 1)}">
                            &raquo;
                        </a>
                    </li>
                </c:if>

            </ul>
        </div>
    </div>
    <div class="col-3"></div>
</div>

<script>
    $(document).ready(
        function () {
            console.log("ggg");
            $('#searchBtn').on(
                "click",
                function (event) {
                    self.location = "list"
                        +'${pageMaker.makeQuery(1)}'
                        +"&searchType="
                        +$("select option:selected").val()
                        +"&keyword=" + encodeURIComponent($('#keywordInput').val())
                        +"&category=" + '${category}';
                }
            );

            $('#newBtn').on(
                "click",
                function (evt) {
                    self.location = "register?category="+'${category}';
                }
            );
        }
    );

</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>