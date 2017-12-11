<%--
  Created by IntelliJ IDEA.
  User: Uri
  Date: 2017-12-08
  Time: 오후 5:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- ChangeView Modal -->
<div class="modal fade" id="ChangeView" tabindex="-1" role="dialog" aria-labelledby="ChangeViewLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="ChangeViewLabel">ChangeView</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <a class="col-sm btn btn-light" href="javascript:;">
                        <img src="/resources/images/left-panel.png">
                    </a>
                    <a class="col-sm btn btn-light" href="javascript:;">
                        <img src="/resources/images/top-panel.png">
                    </a>
                    <a class="col-sm btn btn-light" href="javascript:;">
                        <img src="/resources/images/right-panel.png">
                    </a>
                </div>
                <%--<div class="row">--%>
                    <%--<a class="col btn btn-light" href="javascript:;">--%>
                        <%--<img src="/resources/images/left-panel.png">--%>
                    <%--</a>--%>
                    <%--<a class="col btn btn-light" href="javascript:;">--%>
                        <%--<img src="/resources/images/top-panel.png">--%>
                    <%--</a>--%>
                    <%--<a class="col btn btn-light" href="javascript:;">--%>
                        <%--<img src="/resources/images/right-panel.png">--%>
                    <%--</a>--%>
                <%--</div>--%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>