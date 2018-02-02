<%--
  Created by IntelliJ IDEA.
  User: Uri
  Date: 2017-12-08
  Time: 오후 5:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- script 단 -->

<!--alt-->
<!-- script 단 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> <!-- jQuery lib   -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script> <!--ajax lib-->
<!-- codemirror 기본 -->
<script src="/resources/codemirror/lib/codemirror.js"></script> <!-- 코드편집기본 lib   -->
<!--edit-->
<script src="/resources/codemirror/addon/edit/closetag.js"></script> <!-- 코드편집시 /div>, /p> 등 자동 닫힘    -->
<script src="/resources/codemirror/addon/edit/closebrackets.js"></script> <!--코드편집시 ')', '}' 자동 닫힘    -->
<script src="/resources/codemirror/addon/edit/continuelist.js"></script> <!-- Markdown specific    -->
<script src="/resources/codemirror/addon/edit/matchbrackets.js"></script> <!--(, { 입력시 ), } 자동완성    -->
<script src="/resources/codemirror/addon/edit/matchtags.js"></script> <!-- <div , <p 등 태그 입력시 /div>, /p> 매칭    -->
<script src="/resources/codemirror/addon/edit/trailingspace.js"></script> <!-- CSS 클래스 cm-trailingspace를 줄 끝의 공백 뻗기에 추가   -->
<!--folding-->
<script src="/resources/codemirror/addon/fold/foldcode.js"></script> <!-- 주어진 라인에 코드폴드 스타트  -->
<script src="/resources/codemirror/addon/fold/foldgutter.js"></script> <!-- indicating the blocks that can be folded  -->
<script src="/resources/codemirror/addon/fold/brace-fold.js"></script> <!-- When the brace-fold addon is loaded, that defines a helper named brace in the fold namespace   -->
<script src="/resources/codemirror/addon/fold/xml-fold.js"></script> <!-- xml fold-->
<script src="/resources/codemirror/addon/fold/indent-fold.js"></script> <!--  들여쓰기 fold   -->
<script src="/resources/codemirror/addon/fold/markdown-fold.js"></script> <!-- markdown fold   -->
<script src="/resources/codemirror/addon/fold/comment-fold.js"></script> <!--  주석 fold  -->
<!-- mode -->
<script src="/resources/codemirror/mode/xml/xml.js"></script> <!-- xml mode   -->
<script src="/resources/codemirror/mode/javascript/javascript.js"></script> <!-- js mode   -->
<script src="/resources/codemirror/mode/css/css.js"></script> <!--css mode    -->
<script src="/resources/codemirror/mode/htmlmixed/htmlmixed.js"></script> <!--  mixed mode   -->
<script src="/resources/codemirror/mode/python/python.js"></script> <!--  python mode  -->
<script src="/resources/codemirror/mode/markdown/markdown.js"></script> <!--  markdown mode  -->
<!-- 스크롤바 -->
<script src="/resources/codemirror/addon/scroll/simplescrollbars.js"></script> <!-- 심플 scrollbars   -->
<!-- <script src="/resources/codemirror/addon/scroll/annotatescrollbar.js"></script>
<script src="/resources/codemirror/addon/scroll/scrollpastend.js"></script>  -->
<!-- 키맵 -->
<script src="/resources/codemirror/keymap/sublime.js"></script> <!--  sublime 키맵모드 지정  -->
<!-- 같은단어 강조 -->
<script src="/resources/codemirror/addon/search/match-highlighter.js"></script> <!-- 매칭됬을때 하이라이트 기능   -->
<!-- autocomplete -->
<script src="/resources/codemirror/addon/hint/show-hint.js"></script> <!-- 힌트 보여주기   -->
<script src="/resources/codemirror/addon/hint/html-hint.js"></script> <!-- html 힌트   -->
<script src="/resources/codemirror/addon/hint/css-hint.js"></script> <!--  css 힌트  -->
<script src="/resources/codemirror/addon/hint/javascript-hint.js"></script> <!-- js 힌트   -->
<script src="/resources/codemirror/addon/hint/xml-hint.js"></script> <!-- xml 힌트   -->

<!-- addon\comment -->
<script src="/resources/codemirror/addon/comment/comment.js"></script> <!-- 주석기능   -->
<script src="/resources/codemirror/addon/comment/continuecomment.js"></script> <!-- 계속주석기능    -->
<!-- addon\dialog -->
<script src="/resources/codemirror/addon/dialog/dialog.js"></script> <!-- 간단한 유저 텍스트입력 기능    -->
<script src="/resources/codemirror/addon/search/search.js"></script> <!-- 서치기능   -->
<script src="/resources/codemirror/addon/search/searchcursor.js"></script> <!-- 서치/리플레이스 기능구현에 사용   -->
<script src="/resources/codemirror/addon/search/jump-to-line.js"></script> <!-- 해당 라인 이동   -->
<!--addon\tern-->
<script src="/resources/codemirror/addon/tern/tern.js"></script> <!-- Provides integration with the Tern JavaScript analysis engine    -->
<!-- script src="/resources/codemirror/addon/tern/worker.js"></script -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script> <!--부트스트랩 lib    -->
<!--full screen>-->
<!-- script src="/resources/codemirror/codebox/addon/display/fullscreen.js"></script -->
<!--Formatting-->
<script src="/resources/codemirror/lib/util/formatting.js"></script> <!-- 오토포매팅 -->
<!-- script src="/codebox/js/lib/beautify.js"></script -->
<!-- script src="/resources/codemirror/js/lib/beautify-css.js"></script -->

<!--스크립트 define & event 분리참조-->
<!-- script src="/resources/dist/js/editPage/editPageDefine.js"></script -->
<script src="/resources/dist/js/editPage/JSAlgorithmEvent.js"></script> <!--  유닛테스트 이벤트 js모음  -->
<!-- 프로필 이미지 관련-->
<script src="/resources/dist/js/upload.js"></script>