<%--
  Created by IntelliJ IDEA.
  User: Uri
  Date: 2017-12-15
  Time: 오전 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

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
                            <span id="view-count">13</span>
                            <img src="/resources/images/view24.png">
                            <span id="reply-couont">23</span>
                            <img src="/resources/images/reply24.png">
                            <span id="like-couont">23</span>
                            <img src="/resources/images/like24-2.png">
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
                                <textarea class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row reply_btn">
                        <div class="col btn btn-primary right-button">POST</div>
                    </div>
                    <%--댓글 리스트 부분--%>
                    <div class="row reply_list_view">
                        <div class="row reply_list" id="reply-list-view">
                            <div class="col-2 no_padding">
                                <img class="user_img" src="/resources/images/logo.png" id="reply-list-user-img">
                            </div>
                            <div class="col">
                                <div class="row reply_user_data_view" id="reply-user-id">
                                    <span class="reply_user_name" id="reply-user-name">Name</span>
                                    <a class="btn btn-outline-secondary btn-sm" href="javascript:;"
                                       id="reply-modify-button">
                                        Modify
                                    </a>
                                    <a class="btn btn-outline-secondary btn-sm" href="javascript:;"
                                       id="reply-save-button">
                                        Save
                                    </a>
                                </div>
                                <div class="form-control reply_content"></div>
                            </div>
                        </div>
                        <div class="row reply_list" id="reply-list-view2">
                            <div class="col-2 no_padding">
                                <img class="user_img" src="/resources/images/logo.png" id="reply-list-user-img2">
                            </div>
                            <div class="col">
                                <div class="row reply_user_data_view" id="reply-user-id2">
                                    <span class="reply_user_name" id="reply-user-name2">Name</span>
                                    <a class="btn btn-outline-secondary btn-sm" href="javascript:;"
                                       id="reply-modify-button2">
                                        Modify
                                    </a>
                                    <a class="btn btn-outline-secondary btn-sm" href="javascript:;" id="reply-save-button2">
                                        Save
                                    </a>
                                </div>
                                <div class="form-control reply_content"></div>
                            </div>
                        </div>
                        <div class="row reply_list" id="reply-list-view3">
                            <div class="col-2 no_padding">
                                <img class="user_img" src="/resources/images/logo.png" id="reply-list-user-img3">
                            </div>
                            <div class="col">
                                <div class="row reply_user_data_view" id="reply-user-id3">
                                    <span class="reply_user_name" id="reply-user-name3">Name</span>
                                    <a class="btn btn-outline-secondary btn-sm" href="javascript:;"
                                       id="reply-modify-button3">
                                        Modify
                                    </a>
                                    <a class="btn btn-outline-secondary btn-sm" href="javascript:;" id="reply-save-button3">
                                        Save
                                    </a>
                                </div>
                                <div class="form-control reply_content"></div>
                            </div>
                        </div>
                        <div class="row reply_list load_view" id="reply-more-list">
                            <div class="load">
                                <div class="line"></div>
                                <div class="line"></div>
                                <div class="line"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
</div>

