<%--
  Created by IntelliJ IDEA.
  User r
  Date 2018-01-18
  Time 오후 435
  To change this template use File | Settings | File Templates.

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="modal fade" id="howto-modal" tabindex="-1" role="dialog" aria-labelledby="reply" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #FF9D00">
                <h3 class="modal-title bd text-white">How To Use?!</h3>
                <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="padding-right:45px">--%>
                    <%--&lt;%&ndash;<span aria-hidden="true">&times;</span>&ndash;%&gt;--%>
                <%--</button>--%>
            </div>
            <div class="modal-body hn">
                <div class="row">
                    <div class="col-12">

                        <div class="row">
                            <div class="col-12 removePadding ">
                              <h3 >아래 순서대로 테스트 하실수 있습니다.</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 removePadding">
                                <p>1. 왼쪽에 테스트 코드 작성란에 테스트 할 코드를 작성합니다.
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 removePadding">
                                <p>2. 그 다음에 TestCase 창의 셀렉트 박스에서 테스트할 함수를 선택합니다.
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 removePadding">
                                <p> 3.<button class="btn btn-outline-info mx-1">AddTestCase</button> 버튼을 눌러서 테스트할 케이스를 추가합니다.
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 removePadding">
                                <p>4. 테스트에 진행할 input 값과 output 값을 정하고, 테스트를 합니다.
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 removePadding">
                                <p>5. 테스트에 대한 결과가 Result 창에 나타납니다.
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 removePadding">
                                <p> 6. 테스트 코드를 수정할때에 테스트 케이스가 삭제되길 원치 않으면
                                    <br>&nbsp;&nbsp;&nbsp;&nbsp;`테스트 케이스 자동 삭제`를 헤제하고 테스트 코드를 작성합니다.
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 removePadding">
                                <p>7. 여러 케이스를 모두 확인하고 싶을 때,<button class="btn btn-outline-success mx-1">TestAll</button> 버튼으로 모든 케이스를 테스트 할 수 있습니다.
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="modal-footer" style="background-color: #FF9D00">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
