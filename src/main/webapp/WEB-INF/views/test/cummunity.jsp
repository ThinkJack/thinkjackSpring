<%@ page language="java" contentType="text/html;charset=UTF-8" %>


<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>

<jsp:include page="/WEB-INF/views/include/slidebar.jsp" flush="false"/>


    <!--내용-->
    <div class="w3-container w3-dark w3-center w3-text-light-grey w3-padding-32" id="about">
        <!--메뉴 bar-->
        <div class="w3-content w3-justify" ">
            <hr class="w3-opacity">
            <h4 class="w3-padding-16">자신의 코드를 올려주세요</h4>
            <div class="w3-row-padding" style="margin:0 -32px">

                <div class="w3-half">
                    <ul class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
                        <li class="w3-black w3-xlarge w3-padding-16">title</li>
                        <li class="w3-padding-64">table or image</li>
                        <li class="w3-padding-32">설명</li>
                        <li class="w3-light-grey w3-padding-16">
                            <button class="w3-button w3-white w3-padding-small">버튼</button>
                        </li>
                    </ul>
                </div>
                <div class="w3-half">
                    <ul class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
                        <li class="w3-black w3-xlarge w3-padding-16">title</li>
                        <li class="w3-padding-64">table or image</li>
                        <li class="w3-padding-32">설명</li>
                        <li class="w3-light-grey w3-padding-16">
                            <button class="w3-button w3-white w3-padding-small">버튼</button>
                        </li>
                    </ul>
                </div>
                <div class="w3-half">
                    <ul class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
                        <li class="w3-black w3-xlarge w3-padding-16">title</li>
                        <li class="w3-padding-64">table or image</li>
                        <li class="w3-padding-32">설명</li>
                        <li class="w3-light-grey w3-padding-16">
                            <button class="w3-button w3-white w3-padding-small">버튼</button>
                        </li>
                    </ul>
                </div>
                <div class="w3-half">
                    <ul class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
                        <li class="w3-black w3-xlarge w3-padding-16">title</li>
                        <li class="w3-padding-64">table or image</li>
                        <li class="w3-padding-32">설명</li>
                        <li class="w3-light-grey w3-padding-16">
                            <button class="w3-button w3-white w3-padding-small">버튼</button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!--pagination-->
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4 w3-center">
            <div class="pagination">
                <a href="#">&laquo;</a>
                <a href="#">1</a>
                <a class="active" href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">&raquo;</a>
            </div>
        </div>
        <div class="col-4"></div>
    </div>

    <script>
        var acc = document.getElementsByClassName("accordion");
        var i;

        for (i = 0; i < acc.length; i++) {
            acc[i].onclick = function(){
                this.classList.toggle("active");
                var panel = this.nextElementSibling;
                if (panel.style.display === "block") {
                    panel.style.display = "none";
                } else {
                    panel.style.display = "block";
                }
            }
        }
    </script>

<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>
