<%--
  Created by IntelliJ IDEA.
  User: r
  Date: 2017-12-07
  Time: 오후 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>

<jsp:include page="/WEB-INF/views/include/slidebar.jsp" flush="false"/>

    <!-- Top menu on small screens -->
    <header class="w3-container w3-top w3-hide-large w3-black w3-xlarge w3-padding-16">
        <span class="w3-left w3-padding">THINK JACK</span>
        <a href="javascript:void(0)" class="w3-right w3-button w3-black" onclick="w3_open()">☰</a>
    </header>
    <!-- Push down content on small screens -->
    <div class="w3-hide-large" style="margin-top:83px"></div>

    <!--내용-->
    <div class="container-fluid">
        <div class="row">
            <div class="col-3 bg-success" style="opacity: 0">25%</div>
            <div class="col-6 bg-warning">
                <div class="container">
                    <div class="jumbotron">
                        <h1>ReleaseNote</h1>
                        <!--검색-->
                        <form class="form-inline">
                            <input class="form-control" type="text" placeholder="Search">
                            <button class="btn btn-success" type="button">Search</button>
                        </form>

                        <!--내용-->
                        <button class="accordion">Section 1</button>
                        <div class="panel">

                            <iframe style="width:400px">
                                <p>슬라이드 어떻게 반응형으로 하지?</p>
                            </iframe>

                        </div>
                        <button class="accordion">Section 1</button>
                        <div class="panel">

                            <iframe style="width:400px">
                                <p>슬라이드 어떻게 반응형으로 하지?</p>
                            </iframe>

                        </div>
                        <button class="accordion">Section 1</button>
                        <div class="panel">

                            <iframe style="width:400px">
                                <p>슬라이드 어떻게 반응형으로 하지?</p>
                            </iframe>

                        </div>
                        <button class="accordion">Section 1</button>
                        <div class="panel">

                            <iframe style="width:400px">
                                <p>슬라이드 어떻게 반응형으로 하지?</p>
                            </iframe>

                        </div>
                        <button class="accordion">Section 1</button>
                        <div class="panel">

                            <iframe style="width:400px">
                                <p>슬라이드 어떻게 반응형으로 하지?</p>
                            </iframe>

                        </div>
                        <button class="accordion">Section 1</button>
                        <div class="panel">

                            <iframe style="width:400px">
                                <p>슬라이드 어떻게 반응형으로 하지?</p>
                            </iframe>

                        </div>
                        <button class="accordion">Section 1</button>
                        <div class="panel">

                            <iframe style="width:400px">
                                <p>슬라이드 어떻게 반응형으로 하지?</p>
                            </iframe>

                        </div>
                        <button class="accordion">Section 1</button>
                        <div class="panel">

                            <iframe style="width:400px">
                                <p>슬라이드 어떻게 반응형으로 하지?</p>
                            </iframe>

                        </div>

                        <!--pagination-->
                        <div class="pagination">
                            <a href="#">&laquo;</a>
                            <a href="#">1</a>
                            <a class="active" href="#">2</a>
                            <a href="#">3</a>
                            <a href="#">4</a>
                            <a href="#">5</a>
                            <a href="#">6</a>
                            <a href="#">&raquo;</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-3 bg-success " style="opacity: 0"></div>
        </div>
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
