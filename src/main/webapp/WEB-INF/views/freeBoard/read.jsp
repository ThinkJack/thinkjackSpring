<%--
  Created by IntelliJ IDEA.
  User: kwak
  Date: 2017. 12. 6.
  Time: PM 2:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Read</title>
</head>
<script src =""></script>
<body>
<div class="box-body">
    <div class="form-group">
        <label >Title</label>
        <input type="text" name='title' class="form-control" value="${boardVO.boardTitle}"
               readonly="readonly">
    </div>
    <div class="form-group">
        <label >Content</label>
        <textarea type="text" name='content' class="form-control" rows = "3"
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
    <button type="submit" class="btn btn-danger removeBtn" >REMOVE</button>
    <button type="submit" class="btn btn-primary goListBtn">GO LIST</button>
</div>
<script>
    $(document).ready(function () {
        var formObj = $("form[role='form']");

        console.log(formObj);

        $(".modifyBtn").on("click", function () {
            formObj.attr("action","/freeBoard/modify");
            formObj.attr("method","get");
            formObj.submit();
        });

        $(".removeBtn").on("click", function () {
            formObj.attr("action","/freeBoard/remove");
            formObj.submit();
        });

        $(".goListBtn").on("click", function () {
            formObj.attr("method","get");
            formObj.attr("action","/freeBoard/list");
            formObj.submit();
        })
    })
</script>
</body>
</html>
