<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>
<link href="/resources/dist/css/board.css" rel="stylesheet">
<style>
    textarea{
        resize: none;
    }
    .selector {word-break:break-all;}

</style>


<div class="row  removePadding " style="padding-top: 100px;">
    <div class="col-md-3"></div>
    <div class="col-md-6 cardtext-white list-group ">

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
    <div class="col-md-3"></div>
</div>