<%--
  Created by IntelliJ IDEA.
  User: Uri
  Date: 2017-12-14
  Time: 오후 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<footer class="footer">
    <nav class="navbar navbar-expand">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="btn btn-outline-secondary btn-sm" href="javascript:;" id="console-button">
                    Console
                </a>
            </li>
            <c:if test="${SrcVO.srcId ne null}">
                <li class="nav-item active">
                    <a class="btn btn-outline-secondary btn-sm" href="javascript:;" data-toggle="modal" data-target="#reply-modal">
                        Reply
                    </a>
                </li>
            </c:if>
            <li class="nav-item active">
                <a class="btn btn-outline-secondary btn-sm" href="javascript:;" data-toggle="modal" data-target="#keymap-modal">
                    Shortcuts
                </a>
            </li>
        </ul>
    </nav>
</footer>