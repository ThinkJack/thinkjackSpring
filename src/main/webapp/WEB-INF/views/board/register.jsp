<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>
<link href="/resources/dist/css/board.css" rel="stylesheet">
<style>
    textarea{
        resize: none;
    }
    .selector {word-break:break-all;}

</style>


<div class="row  removePadding justify-content-center" style="padding-top: 100px;">

    <div class="col-md-10 col-lg-7 col-xl-6 cardtext-white list-group ">
        <label class="control-label">

            <c:set var="name" value="${category}" />
            <c:if test="${name eq 'qna'}">
                <h1 class="bd" id="titleList" style="text-align: center;">질문 게시판</h1>
            </c:if>
            <c:if test="${name eq 'free'}">
                <h1 class="bd" id="titleList" style="text-align: center;">자유 게시판</h1>
            </c:if>
            <c:if test="${name eq 'notice'}">
                <h1 class="bd" id="titleList" style="text-align: center;">공지사항</h1>
            </c:if>

        </label>
        <form role="form" method="post" id="registerForm">
            <div class="box-body m-3">

                <div class="form-group text-white bd" style="margin-top: 10px;">
                    <label  style="font-size:1.35rem;" >Title</label>
                    <input type="text" maxlength="25" name='boardTitle' class="form-control inputC hn" placeholder="Enter Title" required>
                </div>
                <div class="form-group text-white bd">
                    <label  style="font-size:1.35rem;">Content</label>
                    <textarea class="form-control " style="padding-top: 5%;" name="boardContent" rows="10" placeholder="Enter ..." required></textarea>
                </div>
                <div class="form-group text-white bd">
                    <label  style="font-size:1.35rem;" >Writer</label>
                    <div class="row" style="background: white">
                        <div class="col-2">
                        <img id='UserProfile' class="rounded photo2 ">
                        </div>
                        <label style="color: black;" class="mt-4 hn"   >${login.userName} </label>
                        <%--<input type="text" name="boardWriter" value="${login.userName} " style="border: 0"--%>
                               <%--class="form-control col-10 hn" placeholder="Enter Writer" readonly>--%>
                    </div>
                    <script>
                        <%--$("#writerProfile").prop("src", getFileInfo("${boardVO.boardWriterProfile}"))--%>
                        $("#UserProfile").prop("src", getFileInfo("${login.userProfile}"))
                    </script>

                </div>
            </div>
            <div class="box-footer m-3 ">
                <button type="submit" class="btn btn-outline-success bd"  style="font-size:1.35rem; float: right">Submit</button>
            </div>
        </form>
    </div>
</div>