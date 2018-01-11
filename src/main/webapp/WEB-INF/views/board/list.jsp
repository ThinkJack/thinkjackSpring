<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>

<style>
    td, th {
        text-align: center;
    }
</style>
<div class="deaf2"></div>

<div class="container-fluid removePadding text-center">
    <div class="row">
        <div class="col-sm-3 removePadding"></div>
        <div class="col-sm-6 removePadding" >

            <%--<div class="form-group">--%>
                <label class="control-label">   <h1 style="text-align: center;"> ${category} 게시판</h1> </label>

                <div class="deaf2">
                    <img class=" widthFull float-right"  src="/resources/images/main/mainA.png" style="  background-size:contain;width:auto" >
                </div>
                <div class="form-group">
                    <div class="input-group ">
                        <div class="input-group-prepend">
                            <%--<div class="form-group ">--%>
                            <label class="mr-1" for="sel1">Select list:</label>
                            <select  class="custom-select" name="searchType" id="sel1">
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
                            <%--</div>--%>

                            <input type="text" class="form-control" placeholder="Search" name="keyword" id="keywordInput"
                                   value="${cri.keyword}" aria-label="Amount (to the nearest dollar)">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-secondary " id="searchBtn">Search</button>
                            </div>
                                <div class="input-group-append " style="margin-left: 10rem !important;">
                                <button class="btn btn-secondary " id="newBtn">new Board</button>
                                </div>
                        </div>

                    </div>

                </div>

            <%--</div>--%>

            <%-- list 부분--%>


            <%--게시글 목록--%>

            <table class="table table-hover">
                <thead>
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

            <ul class = "pagination pagination-sm justify-content-center">

                <c:if test="${pageMaker.prev}">
                    <li class="page-item"><a class="page-link" href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&category=${category}">&laquo;</a></li>
                </c:if>

                <c:forEach begin="${pageMaker.startPage}"
                           end = "${pageMaker.endPage}" var="idx">
                    <li class="page-item" <c:out value="${pageMaker.cri.page == idx? 'class=active':'' }"/>>
                        <a class="page-link" href="list${pageMaker.makeSearch(idx)}&category=${category}">${idx}</a>
                    </li   >
                </c:forEach>

                <c:if test="${pageMaker.next&&pageMaker.endPage > 0}">
                    <li class="page-item">
                        <a class="page-link" href = "list${pageMaker.makeSearch(pageMaker.endPage + 1)}&category=${category}">
                            &raquo;
                        </a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
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