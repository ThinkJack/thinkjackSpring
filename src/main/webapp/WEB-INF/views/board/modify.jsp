<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>
<link href="/resources/dist/css/board.css" rel="stylesheet">



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

        <form role="form" method="post" id = "registerForm">
            <div class="box-body m-3">
                <div class="form-group text-white bd" style="margin-top: 10px;">
                    <input type="text"
                           name='boardId' class="form-control"
                           value="${boardVO.boardId}" hidden>

                    <label  style="font-size:1.35rem;" >Title</label>
                    <input type="text"
                           maxlength="25"
                           name='boardTitle'
                           class="form-control inputC hn"
                           placeholder="Enter Title"
                           value="${boardVO.boardTitle}"
                           required>
                </div>
                <div class="form-group text-white bd">
                    <label  style="font-size:1.35rem;">Content</label>
                    <textarea style="padding-top: 5%;" class="form-control" name="boardContent" rows="10"
                              placeholder="Enter ..."
                              required>${boardVO.boardContent}</textarea>
                </div>
                <div class="form-group text-white bd">
                    <label  style="font-size:1.35rem;" >Writer</label>
                    <div class="form-control" style="background: white">
                        <img id='writerProfile' class="rounded photo2">
                        <label class="hn ml-3" style="color: black;">${boardVO.boardWriter}</label>
                    </div>
                    <script>
                        $("#writerProfile").prop("src", getFileInfo("${boardVO.boardWriterProfile}"))
                    </script>

                </div>

            </div>

            <!-- /.box-body -->
            <div class="box-footer m-3 ">
                <button type="submit" class="btn btn-outline-success bd"  style="font-size:1.35rem; float: right;">Submit</button>
            </div>
        </form>
    </div>
</div>

