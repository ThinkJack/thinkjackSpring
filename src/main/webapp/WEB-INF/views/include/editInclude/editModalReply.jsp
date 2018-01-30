<%--
  Created by IntelliJ IDEA.
  User: Uri
  Date: 2017-12-15
  Time: 오전 9:14
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div class="modal fade" id="reply-modal" tabindex="-1" role="dialog" aria-labelledby="reply" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <div class="container modal-title">
                    <div class="row">
                        <div class="col-2 no_padding">
                            <img class="user_img" src="/resources/images/logo.png" id="user-img">
                        </div>
                        <div class="col">
                            <div class="col">
                                <div class="row"><span>A masterpiece by</span></div>
                                <div class="row" id="src-title-reply-modal"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container">

                    <div class="row count_img_view">
                        <div class="col-md-auto count_img_view_inner">
                            <span id="view-count"></span>
                            <i class="fa fa-eye" style="color: gray; font-size: 20px;"></i>
                            <span id="reply-couont"></span>
                            <i class="fa fa-comments" style="color: gray; font-size: 20px;"></i>
                            <span id="like-couont"></span>
                            <i class="fa fa-heart-o" style="color: gray; font-size: 20px;" id="modalSrcLikeImg"></i>
                        </div>
                    </div>
                    <%--설명부분(comment 가져와서 찍기)--%>
                    <div class="row">
                        <div class="row"><h6>DESCRIPTION</h6></div>
                        <div class="row">
                            <textarea class="form-control comment" id="comment-view" rows="5" disabled></textarea>
                        </div>
                        <div class="row">
                            <span class="regdate" id="regdate"></span>
                        </div>
                    </div>
                    <%--댓글 등록 부분--%>
                    <div class="row reply_post">
                        <div class="row"><h6>REPLY</h6></div>
                        <div class="row">
                            <div class="col-2 no_padding">
                                <img class="user_img" src="/resources/images/logo.png" id="reply-user-img">
                            </div>
                            <div class="col">
                                <%--초기값 readonly--%>
                                <textarea readonly id="textarea" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row reply_btn" >
                        <div id="post" class="col btn btn-primary right-button">POST</div>
                    </div>

                    <%--댓글 리스트 부분--%>
                    <div class="row reply_list_view" id="list_view_all">

                    </div>

                    <%--<div  class='text-xs-center' style="text-align: center">--%>
                        <%--<ul id="pagination" class="pagination pagination-sm no-margin " style="display:inline-flex">--%>

                        <%--</ul>--%>
                    <%--</div>--%>
                    <%--<div  class='text-xs-center'>--%>
                        <%--<ul id="pagination" class="pagination justify-content-center">--%>

                        <%--</ul>--%>
                    <%--</div>--%>
                    <p></p>
                    <div  class='text-center'>
                        <ul id="pagination" class="pagination justify-content-center">

                        </ul>
                    </div>



                </div>
                <%--<div  class='text-center'>--%>
                    <%--<ul id="pagination" class="pagination justify-content-center">--%>

                    <%--</ul>--%>
                <%--</div>--%>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="close">Close</button>
            </div>
        </div>
    </div>
</div>


