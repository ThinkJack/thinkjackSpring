<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<head>
    <title>MyBoard</title>
</head>

<jsp:include page="/WEB-INF/views/include/myinfoTab.jsp" flush="false"/>

<style>
    td, th {
        text-align: center;
        overflow:hidden;
        white-space:nowrap;
        text-overflow:ellipsis;

    }



    .table th, .table td {
        vertical-align: inherit;
    }

    table {

        table-layout:fixed;


    }

</style>

<div id="Board" class="tabcontent card mb-3 active">
    <div class="container-fluid removePadding text-center ">
        <div class="row">
            <div class="col-sm-1 removePadding" ></div>
            <div class="col-sm-10 removePadding" >
                <div class="deaf2">
                    <img class=" widthFull float-right"  src="/resources/images/main/mainA.png" style="  background-size:contain;width:auto" >
                </div>
                <div class="form-group">
                    <div class="input-group bd">
                        <div class="input-group-prepend " style="width: 100%;">
                            <%--<div class="form-group ">--%>
                            <label class="mr-1 mt-2 " for="sel1">Select list:</label>
                            <select class="custom-select bd col-3" name="searchType" id="sel1">
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

                            <input type="text" class="form-control bd col-8" placeholder="Search" name="keyword" id="keywordInput"
                                   value="${cri.keyword}" aria-label="Amount (to the nearest dollar)">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-primary bd" id="searchBtn">Search</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group mb-5 bd" >
                    <table class="table">
                        <thead>
                        <tr class="table-dark text-white bd">
                            <th width="15%" >boardId</th>
                            <th width="20%">TITLE</th>
                            <th width="20%">WRITER</th>
                            <th width="20%" style="   text-align: center;" >REGDATE</th>
                            <th width="15%" >VIEWCNT</th>
                            <th width="10%" >HEART</th>
                        </tr>
                        </thead>
                        <c:forEach items="${list}" var="boardVO">
                            <tr>
                                <td>${boardVO.boardCategoryName}</td>
                                <td>${boardVO.boardId}</td>
                                <td class="hn">
                                    <a href='/board/read${pageMaker.makeUserSearch(pageMaker.cri.page) }&boardId=${boardVO.boardId}&category=${boardVO.boardCategoryName}'>
                                            ${boardVO.boardTitle}</a></td>
                                <td><img id="profile${boardVO.boardId}" class="Photo rounded-circle"/>
                                    <script>
                                        $("#profile${boardVO.boardId}").prop("src",getFileInfo("${boardVO.boardWriterProfile}"))
                                    </script>${boardVO.boardWriter}</td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                                                    value="${boardVO.boardRegdate}"/></td>
                                <td><span class="badge bg-red">${boardVO.boardViewcnt}</span></td>
                                <td><span class="badge bg-red">${boardVO.boardLikecnt}</span></td>
                            </tr>
                        </c:forEach>
                    </table>


                    <ul class = "pagination pagination-sm justify-content-center">


                        <c:if test="${pageMaker.prev}">
                            <li class="page-item"><a href="myBoard${pageMaker.makeUserSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
                        </c:if>

                        <c:forEach begin="${pageMaker.startPage}"
                                   end="${pageMaker.endPage}" var="idx">
                            <li class="page-item" <c:out value="${pageMaker.cri.page == idx? 'class=active':'' }"/>>
                                <a class="page-link" href="myBoard${pageMaker.makeUserSearch(idx)}">${idx}</a>
                            </li>
                        </c:forEach>

                        <c:if test="${pageMaker.next&&pageMaker.endPage > 0}">
                            <li class="page-item">
                                <a class="page-link" href="myBoard${pageMaker.makeUserSearch(pageMaker.endPage + 1)}">
                                    &raquo;
                                </a>
                            </li>
                        </c:if>

                    </ul>

                </div>
                <script>
                    $(document).ready(
                        function () {
                            $(".Board").addClass(" active");
                            $('#searchBtn').on(
                                "click",
                                function (event) {
                                    self.location = "myBoard"
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
        </div>
    </div>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />