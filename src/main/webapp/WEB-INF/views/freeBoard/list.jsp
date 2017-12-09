
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>--%>
<script src="https://unpkg.com/vue"></script>


<%--<jsp:include page="/WEB-INF/views/include/slidebar.jsp" flush="false"/>--%>

<div id =list>
<table id="board">
    <thead>
    <tr>
        <th>글번호</th><th>제목</th><th>작성자</th><th>조회수</th><th>좋아요</th>
    </tr>
    </thead>
    <tbody id="contacts">
    <tr v-for="boardVO in BoardVO" >
        <td>{{boardVO.boardId}}</td>
        <td  v-on:click ="test">{{boardVO.boardTitle}}</td>
        <td>{{boardVO.boardWriter}}</td>
        <td>{{boardVO.boardViewcnt}}</td>
        <td>{{boardVO.boardLikecnt}}</td>
    </tr>
    </tbody>
</table>
</div>

<script>
    var boardVO = ${list};

    var listvm = new Vue({
        el : "#board",
        data : boardVO,


    })

</script>





<%--<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>--%>