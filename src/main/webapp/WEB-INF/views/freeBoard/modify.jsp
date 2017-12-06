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
    <title>Modify</title>
</head>
<body>
<form role="form" method="post" id = "registerForm">
    <div class="box-body">
        <div class="form-group">
            <label>Title</label>
            <input type="text"
                   name='boardTitle'
                   class="form-control"
                   placeholder="Enter Title"
                   value="${boardVO.boardTitle}">
        </div>
        <div class="form-group">
            <label>Content</label>
            <textarea class="form-control" name="boardContent" rows="3"
                      placeholder="Enter ...">${boardVO.boardContent}</textarea>
        </div>
        <div class="form-group">
            <label>Writer</label>
            <input type="text" name="boardWriter"
                   class="form-control" placeholder="Enter Writer"
                   value="${boardVO.boardWriter}" readonly>
        </div>

    </div>

    <!-- /.box-body -->
    <div class="box-footer">
        <div>
            <hr>
        </div>
        <ul class="mailbox-attachments clearfix uploadedList">
        </ul>

        <button type="submit" class="btn btn-primary">Submit</button>
    </div>
</form>
</body>
</html>
