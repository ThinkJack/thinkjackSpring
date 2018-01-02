<%--
  Created by IntelliJ IDEA.
  User: SEOK
  Date: 2017-12-22
  Time: 오후 4:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>소스댓글</title>
    <%@ include file="../include/header.jsp" %>
</head>
<body>
<table style="width:700px">
    <c:forEach var="row" items="${list}">
        <tr>
            <td>
                    ${row.userName}(<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>)
                <br>
                    ${row.replytext}
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
