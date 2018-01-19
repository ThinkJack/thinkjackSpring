<%--
  Created by IntelliJ IDEA.
  User r
  Date 2018-01-18
  Time 오후 435
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="modal fade" id="keymap-modal" tabindex="-1" role="dialog" aria-labelledby="reply" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title bd">Shoutcuts</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body ">
                <div class="row">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-6 removePadding">
                                <kbd>ctrl</kbd> + <kbd>F</kbd> = <var>Find</var>
                            </div>
                            <div class="col-6 removePadding">
                                <a class="ml-3" >문자열 검색</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 removePadding">
                                <kbd>ctrl</kbd> + <kbd>G</kbd> = <var>Find Next</var>
                            </div>
                            <div class="col-6 removePadding">
                                <a class="ml-3" >검색된 다음 문자열</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 removePadding">
                                <kbd>ctrl</kbd> + <kbd>Shift</kbd> + <kbd>G</kbd> = <var>Find Prev</var>
                            </div>
                            <div class="col-6 removePadding">
                                <a class="ml-3" >검색된 이전 문자열</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 removePadding">
                                <kbd>ctrl</kbd> + <kbd>A</kbd> = <var>selectAll</var>
                            </div>
                            <div class="col-6 removePadding">
                                <a class="ml-3" > 전체 내용을 선택 </a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 removePadding">
                                <kbd>ctrl</kbd> + <kbd>D</kbd> = <var>Delete Line</var>
                            </div>
                            <div class="col-6 removePadding">
                                <a class="ml-3">한줄지우기</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 removePadding">
                                <kbd>ctrl</kbd> + <kbd>Z</kbd> = <var>Undo</var>
                            </div>
                            <div class="col-6 removePadding">
                                <a class="ml-3"><p class="removePadding ml-3">마지막 변경을 취소</p></a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 removePadding">
                                <kbd>ctrl</kbd> + <kbd>Shift</kbd> + <kbd>Z</kbd> = <var>Redo</var>
                            </div>
                            <div class="col-6 removePadding">
                                <a class="ml-3" ><p class="removePadding ml-3">마지막 변경 사항을 다시 실행</p></a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 removePadding">
                                <kbd>ctrl</kbd> + <kbd>Shift</kbd> + <kbd>F</kbd> =  <var>Replace</var>
                            </div>
                            <div class="col-6 removePadding">
                                <a class="ml-3" >대체하기</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 removePadding">
                                <kbd>ctrl</kbd> + <kbd>Shift</kbd> + <kbd>R</kbd> =  <var>Replace All</var>
                            </div>
                            <div class="col-6 removePadding">
                                <a class="ml-3" >전체 대체하기</a>
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
