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
<script src="/resources/codemirror/addon/edit/closetag.js"></script><!-- 코드편집시 /div>, /p> 등 자동 닫힘    -->
<script src="/resources/codemirror/addon/edit/closebrackets.js"></script><!--코드편집시 ')', '}' 자동 닫힘    -->
<%--<script src="/resources/codemirror/addon/edit/continuelist.js"></script>--%> <!-- Markdown specific    -->
<script src="/resources/codemirror/addon/edit/matchbrackets.js"></script> <!--(, { 입력시 ), } 자동완성    -->
<script src="/resources/codemirror/addon/edit/matchtags.js"></script> <!-- <div , <p 등 태그 입력시 /div>, /p> 매칭    -->
<script src="/resources/codemirror/addon/edit/trailingspace.js"></script> <!-- CSS 클래스 cm-trailingspace를 줄 끝의 공백 뻗기에 추가   -->
<!--folding-->
<script src="/resources/codemirror/addon/fold/foldcode.js"></script> <!-- 주어진 라인에 코드폴드 스타트  -->
<script src="/resources/codemirror/addon/fold/foldgutter.js"></script>  <!-- indicating the blocks that can be folded  -->
<script src="/resources/codemirror/addon/fold/brace-fold.js"></script>  <!-- When the brace-fold addon is loaded, that defines a helper named brace in the fold namespace   -->
<script src="/resources/codemirror/addon/fold/xml-fold.js"></script> <!-- xml fold-->
<script src="/resources/codemirror/addon/fold/indent-fold.js"></script>  <!--  들여쓰기 fold   --><!--  들여쓰기 fold   -->
<%--<script src="/resources/codemirror/addon/fold/markdown-fold.js"></script>--%>
<script src="/resources/codemirror/addon/fold/comment-fold.js"></script> <!--  주석 fold  -->
<!-- mode -->
<script src="/resources/codemirror/mode/xml/xml.js"></script> <!-- xml 모드 -->
<script src="/resources/codemirror/mode/javascript/javascript.js"></script> <!-- js모드 -->
<script src="/resources/codemirror/mode/css/css.js"></script> <!-- css모드 -->
<script src="/resources/codemirror/mode/htmlmixed/htmlmixed.js"></script> <!-- htmlmixed 모드 -->
<script src="/resources/codemirror/mode/python/python.js"></script> <!--python모드 -->
<%--<script src="/resources/codemirror/mode/markdown/markdown.js"></script> <!-마크다운 모드 -->--%>
<!-- 스크롤바 -->
<script src="/resources/codemirror/addon/scroll/simplescrollbars.js"></script> <!--심플 스크롤바 -->
<!-- <script src="/resources/codemirror/addon/scroll/annotatescrollbar.js"></script>
<script src="/resources/codemirror/addon/scroll/scrollpastend.js"></script>  -->
<!-- 키맵 -->
<script src="/resources/codemirror/keymap/sublime.js"></script> <!--키맵: 서브라임 -->
<!-- 같은단어 강조 -->
<script src="/resources/codemirror/addon/search/match-highlighter.js"></script> <!--매칭 하이라이트 -->
<!-- autocomplete -->
<script src="/resources/codemirror/addon/hint/show-hint.js"></script> <!--힌트창 보이기 -->
<script src="/resources/codemirror/addon/hint/html-hint.js"></script> <!--html힌드 -->
<script src="/resources/codemirror/addon/hint/css-hint.js"></script> <!--css 힌트 -->
<script src="/resources/codemirror/addon/hint/javascript-hint.js"></script> <!--js 힌트 -->
<script src="/resources/codemirror/addon/hint/xml-hint.js"></script> <!--xml 힌트 -->

<!-- addon\comment -->
<script src="/resources/codemirror/addon/comment/comment.js"></script> <!-- 주석 -->
<script src="/resources/codemirror/addon/comment/continuecomment.js"></script> <!--지속적 주석-->
<!-- addon\dialog -->
<script src="/resources/codemirror/addon/dialog/dialog.js"></script> <!--간단한 유저 input  -->
<script src="/resources/codemirror/addon/search/search.js"></script> <!--찾기 -->
<script src="/resources/codemirror/addon/search/searchcursor.js"></script> <!--찾고나서 커서위치 -->
<script src="/resources/codemirror/addon/search/jump-to-line.js"></script> <!--라인 이동 -->
<!--addon\tern-->
<script src="/resources/codemirror/addon/tern/tern.js"></script> <!--통합전환 -->
<!-- <script src="/resources/codemirror/addon/tern/worker.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script> <!--부트스트랩 lib -->
<!--full screen>-->
<%--<script src="/resources/codemirror/codebox/addon/display/fullscreen.js"></script>--%>
<!--Formatting-->
<script src="/resources/codemirror/lib/util/formatting.js"></script> <!--포매팅 -->
<%--<script src="/codebox/js/lib/beautify.js"></script>--%>
<%--<script src="/resources/codemirror/js/lib/beautify-css.js"></script>--%>


<!--GFM MarkDown -->
<%--<script src="/resources/codemirror/gfm/markdown-it.js"></script>--%>
<%--<script src="/resources/codemirror/gfm/markdown-it-footnote.js"></script>--%>
<%--<script src="/resources/codemirror/gfm/highlight.pack.js"></script>--%>
<%--<script src="/resources/codemirror/gfm/emojify.js"></script>--%>
<%--<script src="/resources/codemirror/lib/codemirror.js"></script>--%>
<%--<script src="/resources/codemirror/gfm/overlay.js"></script>--%>
<%--<script src="codemirror/mode/xml/xml.js"></script>--%>
<%--<script src="/resources/codemirror/mode/markdown/markdown.js"></script>--%>
<%--<script src="/resources/codemirror/mode/gfm/gfm.js"></script>--%>
<%--<script src="/resources/codemirror/mode/javascript/javascript.js"></script>--%>
<%--<script src="codemirror/mode/css/css.js"></script>--%>
<%--<script src="codemirror/mode/htmlmixed/htmlmixed.js"></script>--%>
<%--<script src="codemirror/addon/edit/continuelist.js"></script>--%>
<%--<script src="/resources/codemirror/gfm/rawinflate.js"></script>--%>
<%--<script src="/resources/codemirror/gfm/rawdeflate.js"></script>--%>
<%--<link rel="stylesheet" href="codemirror/theme/base16-light.css">--%>
<%--<link rel="stylesheet" href="/resources/codemirror/lib/codemirror.css">--%>
<%--<link rel="stylesheet" href="/resources/codemirror/gfm/default.css">--%>
<!--GFM MarkDown-->

<!--haml------>
<%--<script src="/resources/codemirror/mode/haml/haml.js"></script>--%>
<%--<script src="/resources/codemirror/mode/ruby/ruby.js"></script>--%>
<!--haml------>

<!--스크립트 define & event 분리참조-->
<script src="/resources/dist/js/editPage/editPageDefine.js"></script>
<script src="/resources/dist/js/editPage/editPageEvent.js"></script>
<script src="/resources/dist/js/editPage/jquery.jscroll.js"></script>

<%--<script src="//d1l6p2sc9645hc.cloudfront.net/tracker.js" data-gs="GSN-265185-D" async></script>--%>
<script src="/resources/dist/js/upload.js"></script>


