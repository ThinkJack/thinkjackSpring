
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>네이버로그인</title>
</head>
<body>
<%--<%
    String clientId = "kZCaMLW0PXwWWwQ91Ix3";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8080/user/callback", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
%>
<a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>--%>

<script>
    self.location = '${url}';
</script>
</body>
</html>

<%--
<html lang="ko">
<head>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head>
<body>
<!-- 네이버아이디로로그인 버튼 노출 영역 -->
<div id="naverIdLogin"></div>
<!-- //네이버아이디로로그인 버튼 노출 영역 -->

<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
    var naverLogin = new naver.LoginWithNaverId(
        {
            clientId: "kZCaMLW0PXwWWwQ91Ix3",
            callbackUrl: "http://localhost:8080/user/callback",
            isPopup: false, /* 팝업을 통한 연동처리 여부 */
            loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
        }
    );

    /* 설정정보를 초기화하고 연동을 준비 */
    naverLogin.init();

</script>
<!-- // 네이버아이디로로그인 초기화 Script -->
</body>
</html>--%>
