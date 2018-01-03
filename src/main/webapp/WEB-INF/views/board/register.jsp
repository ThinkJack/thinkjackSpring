<%@ page contentType="text/html;charset=utf-8" language="java" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>


<jsp:include page="/WEB-INF/views/include/slidebar.jsp" flush="false"/>
<div class="row">
    <div class="col-3"></div>
    <div class="col-6">
        <form role="form" method="post" id="registerForm">
            <div class="box-body">
                <div class="form-group">
                    <label>Title</label>
                    <input type="text"
                           name='boardTitle'
                           class="form-control"
                           placeholder="Enter Title"
                           required>
                </div>
                <div class="form-group">
                    <label>Content</label>
                    <textarea class="form-control" name="boardContent" rows="20"
                              placeholder="Enter ..."
                              required></textarea>
                </div>
                <div class="form-group">
                    <label>Writer</label>
                    <input type="text" name="boardWriter" value="${login.userName}"
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
    </div>
    <div class="col-3"></div>
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>