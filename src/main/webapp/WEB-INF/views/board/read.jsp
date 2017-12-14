<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>

<jsp:include page="/WEB-INF/views/include/slidebar.jsp" flush="false"/>
<div class="row">
    <div class="col-3"></div>
    <div class="col-6">

        <form role="form" method="post">
            <input type="hidden" name='category' value="${category}">
            <input type='hidden' name='page' value="${cri.page}">
            <input type='hidden' name='perPageNum' value="${cri.perPageNum}">
            <input type='hidden' name='searchType' value="${cri.searchType}">
            <input type='hidden' name='keyword' value="${cri.keyword}">
        </form>
        <div class="box-body">

            <div style="text-align: right;">
                <button class="heart"  value="true" style="text-align: right;  font-size: 40px;" >♥</button>

            </div>
            <div class="form-group">
                <label>Title</label>
                <input type="text" name='title' class="form-control" value="${boardVO.boardTitle}"
                       readonly="readonly">
            </div>
            <div class="form-group">
                <label>Content</label>
                <textarea type="text" name='content' class="form-control" rows="20"
                          readonly="readonly">${boardVO.boardContent}</textarea>
            </div>
            <div class="form-group">
                <label>Writer</label>
                <input type="text" name='writer' class="form-control" value="${boardVO.boardWriter}"
                       readonly="readonly">
            </div>
        </div>
        <div class="box-footer">
            <button type="submit" class="btn btn-warning modifyBtn">Modify</button>
            <button type="submit" class="btn btn-danger removeBtn">REMOVE</button>
            <button type="submit" class="btn btn-primary goListBtn">GO LIST</button>
        </div>
    </div>
    <div class="col-3"></div>
</div>
<script>
    $(document).ready(function () {
        var formObj = $("form[role='form']");
        var boardid =  "<input type='hidden' name='boardId' value='${boardVO.boardId}'>";

        console.log(formObj);

        $(".modifyBtn").on("click", function () {
            formObj.attr("action", "/board/modify");
            formObj.attr("method", "get");
            formObj.append(boardid);
            formObj.submit();
        });

        $(".removeBtn").on("click", function () {
            formObj.attr("action", "/board/remove");
            formObj.append(boardid);
            formObj.submit();
        });

        $(".goListBtn").on("click", function () {
            formObj.attr("method", "get");
            formObj.attr("action", "/board/list");

            formObj.submit();
        });


        $(".heart").on("click", function () {

            var heart = $(this);

            var heartval = $(this).val();
            var sendData = {'boardId' : '${boardVO.boardId}','heart' : heartval};
            $.ajax({
                url :'/board/heart',
                type :'POST',
                data : sendData,
                success : function(data){
                    heart.val(data);
                    alert(data);
                }
            });
        });
    })
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>