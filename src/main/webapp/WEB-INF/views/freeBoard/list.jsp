
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>--%>
<script src="https://unpkg.com/vue"></script>


<%--<jsp:include page="/WEB-INF/views/include/slidebar.jsp" flush="false"/>--%>


<table >
    <thead>
    <tr>
        <th>글번호</th><th>제목</th><th>작성자</th><th>조회수</th><th>좋아요</th>
    </tr>
    </thead>
    <tbody id ="board">
   <tbody-in></tbody-in>
   <tr v-for="vo in BoardVO ":key="vo.boardId">
       <td>{{vo.boardId}}</td>
       <td>{{vo.boardTitle}}</td>
       <td>{{vo.boardWriter}}</td>
       <td>{{vo.boardViewcnt}}</td>
       <td>{{vo.boardLikecnt}}</td>
   </tr>
    </tbody>
</table>


<script>
    var boardVO = ${list};

    var listvm = new Vue({
        el : "#board",
        data : boardVO

    });
    Vue.component("tds",{
        tamplate : '<td>ssss<td>',
        method :{
            title : function (vo) {
                console.log("vo");
            }
        }

    })

</script>





<%--<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>--%>