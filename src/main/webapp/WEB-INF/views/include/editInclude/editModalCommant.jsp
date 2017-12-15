<%--
  Created by IntelliJ IDEA.
  User: Uri
  Date: 2017-12-15
  Time: 오전 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="commant-modal" tabindex="-1" role="dialog" aria-labelledby="commant" aria-hidden="true">
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
                                <div class="row"><span>A masterpiece by<span></div>
                                <div class="row" id="user-id"><h4>Name</h4></div>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="container-fluid">
                <div class="row count-img-view">
                    <div class="col-md-auto count-img-view-inner">
                        <span id="view-count">13</span>
                        <img src="/resources/images/view24.png">
                        <span id="like-couont">23</span>
                        <img src="/resources/images/like24-2.png">
                    </div>
                </div>
                <div class="row">
                    <div class="row"></div>
                    <div class="row">
                        <div class="col commant commant-view" id="commant-view"></div>
                        <textarea class="col form-control commant commant-textarea" id="commant" placeholder="Commant를 등록해주세요"></textarea>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary commant-save" id="commant-save">Save</button>
                <button type="button" class="btn btn-warning commant-modify" id="commant-modify">Modify</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

