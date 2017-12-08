
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>

<!-- dark배경ㅡ,가운데위치, 밝은 회색.패팅32 id=about -->
    <div class="w3-container w3-dark-black w3-center w3-text-light-grey w3-padding-32" id="about">
        <!-- About section -->
        <div class="w3-content w3-justify" style="max-width:600px">
            <hr class="w3-opacity">
            <h4><b>About We</b></h4>
            <!--반응형 6:6-->
            <div class="row">
                <div class="col-md-6" id="about1">.col-md-6</div>
                <div class="col-md-6" id="about2" >.col-md-6</div>
            </div>
            <div class="row">
                <div class="col-md-4" ></div>
                <!--Editor 버튼 aboout 부분의 가운데에 위치한다-->
                <!--Editor 버튼을 클릭하면 editorpage로 이동-->
                <div class="col-md-4" ><button class="btn-dark">Editor</button></div>
                <div class="col-md-4" ></div>
            </div>
            <hr class="w3-opacity">
        </div>

        <!--slide 반응형 3:6:3-->
        <div class="row">
            <div class="col-3"></div>
            <div class="col-6">

                <!--슬라이드 부분-->
                <div id="myCarousel" class="carousel slide" data-ride="carousel"  >
                    <ol class="carousel-indicators">
                        <!--슬라이드 1,2.3장-->
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                    <!-- 슬라이드 부분 -->
                    <!--버튼을 누르면 페이지로 이동하고 새로운 업데이트 내용이 이미지 부분에서 보인다-->
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="first-slide" src="/resources/images/slide1.jpg" alt="First slide" >
                            <div class="container">
                                <div class="carousel-caption d-none d-md-block text-left">
                                    <h1>Cumunity</h1>
                                    <p> 코드를 자랑하세요</p>
                                    <p><a class="btn btn-lg btn-primary" href="cummunity.html" role="button">이동</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="second-slide" src="/resources/images/slid2.jpgg" alt="Second slide">
                            <div class="container">
                                <div class="carousel-caption d-none d-md-block">
                                    <h1>QNA</h1>
                                    <p>질문하세요</p>
                                    <p><a class="btn btn-lg btn-primary" href="qnanote.html" role="button">이동</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="third-slide" src="/resources/images/slide3.JPG" alt="Third slide" >
                            <div class="container">
                                <div class="carousel-caption d-none d-md-block text-right">
                                    <h1>Releasenote</h1>
                                    <p>업데이트 상황</p>
                                    <p><a class="btn btn-lg btn-primary" href="#" role="button">이동</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Left and right controls -->
                    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>

        <!--사용한 기술 소개 부분-->
        <h4 class="w3-padding-16">We Use</h4>
        <div class="row">
            <div class="col-3"></div>
            <div class="col-6">
                <hr class="w3-opacity">
                <div class="row slideanim">
                    <div class="col-sm-3 col-xs-12">
                        <div class="panel panel-default text-center">
                            <div class="panel-heading">
                                <h1>language</h1>
                            </div>
                            <div class="panel-body">
                                <p> Java,JavaScript</p>

                            </div>
                        </div>
                    </div>

                    <div class="col-sm-3 col-xs-12">
                        <div class="panel panel-default text-center">
                            <div class="panel-heading">
                                <h1>Native app</h1>
                            </div>
                            <div class="panel-body">
                                <p>Sts,websotorm,Intelij </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-3 col-xs-12">
                        <div class="panel panel-default text-center">
                            <div class="panel-heading">
                                <h1>Server</h1>
                            </div>
                            <div class="panel-body">
                                <p> apachtomcat,node</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-3 col-xs-12">
                        <div class="panel panel-default text-center">
                            <div class="panel-heading">
                                <h1>DB</h1>
                            </div>
                            <div class="panel-body">
                                <p> mysql</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>