<%--
  Created by IntelliJ IDEA.
  User: kwak
  Date: 2017. 12. 3.
  Time: PM 4:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>registerPage</title>
</head>
<body>
<form role="form" method="post" id = "registerForm">
    <div class="box-body">
        <div class="form-group">
            <label>Title</label>
            <input type="text"
                   name='title'
                   class="form-control"
                   placeholder="Enter Title">
        </div>
        <div class="form-group">
            <label>Content</label>
            <textarea class="form-control" name="content" rows="3"
                      placeholder="Enter ..."></textarea>
        </div>
        <div class="form-group">
            <label>Writer</label>
            <input type="text" name="writer"
                   class="form-control" placeholder="Enter Writer">
        </div>

        <div class="form-group">
            <label>Category</label>
            <input type="text" name="categoryname" value="free"
                   class="form-control" placeholder="Enter Writer" readonly>
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
