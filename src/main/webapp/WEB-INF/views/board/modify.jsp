<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>
<link href="/resources/dist/css/board.css" rel="stylesheet">



<div class="row  removePadding " style="padding-top: 100px;">
    <div class="col-md-3"></div>
    <div class="col-md-6 cardtext-white list-group ">

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
    <div class="col-sm-3"></div>
</div>

