
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

    <!-- 내용-->
    <div class="w3-container w3-content w3-opacity" style="max-width:1400px;margin-top:80px">
        <!-- The Grid -->
        <div class="w3-row">
            <!-- Left Column -->
            <div class="w3-col m3">
                <!-- 왼쪽 공간-->
                <div class="w3-container w3-margin-bottom w3-hide-small">
                </div>
            </div>
            <!-- 가운데 내용 -->
            <div class="w3-col m7">
                <div class="w3-row-padding">
                    <div class="w3-col m12">
                        <div class="w3-card w3-round w3-white">
                            <div class="w3-container w3-padding">
                                <p contenteditable="true" class="w3-border w3-padding">검색</p>
                                <button type="button" class="w3-button w3-theme"><i class="fa fa-pencil"></i>검색</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
                    <img src="/resources/images/slide1.jpg" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
                    <span class="w3-right w3-opacity">1 min</span>
                    <h4>John Doe</h4><br>
                    <hr class="w3-clear">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                    <div class="w3-row-padding" style="margin:0 -16px">
                        <div class="w3-half">
                            <img src="/resources/images/slide1.jpg" style="width:100%" alt="Northern Lights" class="w3-margin-bottom">
                        </div>
                        <div class="w3-half">
                            <img src="/resources/images/slide1.jpg" style="width:100%" alt="Nature" class="w3-margin-bottom">
                        </div>
                    </div>
                    <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up2"></i>  Like</button>
                    <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment2"></i>  Comment</button>
                </div>

                <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
                    <img src="/resources/images/slide1.jpg" alt="Avatar2" class="w3-left w3-circle w3-margin-right" style="width:60px">
                    <span class="w3-right w3-opacity">16 min</span>
                    <h4>Jane Doe</h4><br>
                    <hr class="w3-clear">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                    <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up3"></i>  Like</button>
                    <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment3"></i>  Comment</button>
                </div>

                <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
                    <img src="/resources/images/logo.png" alt="Avatar3" class="w3-left w3-circle w3-margin-right" style="width:60px">
                    <span class="w3-right w3-opacity">32 min</span>
                    <h4>Angie Jane</h4><br>
                    <hr class="w3-clear">
                    <p>Have you seen this?</p>
                    <img src="/resources/images/logo.png" style="width:100%" class="w3-margin-bottom">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                    <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button>
                    <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button>
                </div>
            </div>

            <!-- 오른쪽 -->
            <div class="w3-col m2">
                <div class="w3-card w3-round w3-white w3-center">
                    <div class="w3-container">
                        <img src="/resources/images/slide1.jpg" alt="Avatar" style="width:50%"><br>
                        <span>Jane Doe</span>
                        <div class="w3-row w3-opacity">
                            <div class="w3-half">
                                <button class="w3-button w3-block w3-grey w3-section" title="Accept"><i class="fa fa-check"></i></button>
                            </div>
                            <div class="w3-half">
                                <button class="w3-button w3-block w3-black w3-section" title="Decline"><i class="fa fa-remove"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="w3-card w3-round w3-white w3-padding-32 w3-center">
                </div>
                <br>
                <div class="w3-card w3-round w3-white w3-padding-32 w3-center">
                </div>
                <br>
            </div>
            <!-- End Grid -->
        </div>
        <!-- End Page Container -->
    </div>
    <br>


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


<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>
