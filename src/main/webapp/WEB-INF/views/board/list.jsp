<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>

<style>
    td, th {
        text-align: center;
    }
</style>
<div class="deaf2 "></div>
<div class="row text-center">

    <div class="col-xs-3 "></div>

    <%--제목부분--%>

    <div class="col-xs-6 borderLB removePadding  " style="background-color:#fff;">
        <h1 style="text-align: center;"> ${category} 게시판</h1>
    </div>

    <div class="col-xs-3 "></div>
</div>

<div class="row removePadding">
    <div class="col-xs-3 "></div>

    <div class="col-xs-6 removePadding">
        <%--검색부분--%>
        <div >

            <div class="row removePadding">
                <div class="col-xs-10 removePadding pt6 ">

                    <form class="navbar-form  " role="search">
                        <div class="form-group">
                            <%--<label for="sel1">Select list :</label>--%>
                            <select  class="form-control" name="searchType" id="sel1">
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

                            <input type="text" class="form-control"  placeholder="Search" name="keyword" id="keywordInput"
                                   value="${cri.keyword}">
                            <button type="submit" class="btn btn-default" id="searchBtn">Search</button>
                        </div>
                    </form>

                </div>

                <div class="col-xs-2  removePadding borderR pt6" style="background-color:#9a86fd;">

                    <button class="btn-12 nb" id="newBtn">new Board</button>
                </div>
            </div>
        </div>
        <%--col-lo-6끝--%>
    </div>
    <div class="col-xs-3  ">

    </div>
</div>

<div class="row removePadding">
    <div class="col-xs-3 removePadding"></div>
    <div class="col-xs-6 pt4 borderR removePadding ">
        <%--게시글 목록--%>
        <div class="row removePadding "" ">
            <table class="table">
                <thead class="theadDark removePadding">
                    <tr>
                        <th style="width:10px;">boardId</th>
                        <th >TITLE</th>
                        <th >WRITER</th>
                        <th >REGDATE</th>
                        <th style="width:40px;">VIEWCNT</th>
                        <th style="width:40px;">HEART</th>
                    </tr>
                </thead>
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
            <%--게시글 pagination --%>
            <div class="text-center">
                <ul class = "pagination">

                    <c:if test="${pageMaker.prev}">
                        <li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">
                            &laquo;
                        </a></li>
                    </c:if>

                    <c:forEach begin="${pageMaker.startPage}"
                               end = "${pageMaker.endPage}" var="idx">
                        <li <c:out value="${pageMaker.cri.page == idx? 'class=active':'' }"/>>
                            <a href="list${pageMaker.makeSearch(idx)}&category=${category}">${idx}</a>
                        </li   >
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
            <%--페이지 네이션 끝--%>
        </div>
    </div>
    <div class="col-xs-3 pt4"></div>

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