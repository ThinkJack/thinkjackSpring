
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>

<div class="row">
        <div class="col-sm-3">
        </div>
        <div class="col-sm-3">
            <div  class="card">
                <div class="card-header">회원정보 수정</div>
                <div class="card-body">
                    <div class="form-group row">
                        <label for="example-text-input" class="col-2 col-form-label">name</label>
                        <div class="col-10">
                            <input class="form-control" type="text" value="Artisanal kale" id="example-text-input">
                        </div>

                        <label for="example-text-input2" class="col-2 col-form-label">PW</label>
                        <div class="col-10">
                            <input class="form-control" type="text" value="Artisanal kale" id="example-text-input2">
                        </div>

                    </div>
                    <div class="card-footer"><button id="modify">수정</button></div>
                </div>
            </div>

            <hr class="w3-opacity">
            <div  class="card2">
                <p>회원탈퇴를 신청합니다</p>
                <div class="card-footer"><button id="remove">탈퇴</button></div>
            </div>
        </div>
        <div class="col-sm-2">
            <div  class="card">
                <div class="card-header">사진</div>
                <div class="card-body">
                    <img src="/resources/images/slide3.JPG" style="width:100% ">
                </div>
                <div class="card-footer"><button id="modify2">수정</button></div>
            </div>
        </div>

        <hr class="w3-opacity">
    </div>
</body>
</html>