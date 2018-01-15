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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<!-- codemirror 기본 -->
<script src="/resources/codemirror/lib/codemirror.js"></script>
<!--edit-->
<script src="/resources/codemirror/addon/edit/closetag.js"></script>
<script src="/resources/codemirror/addon/edit/closebrackets.js"></script>
<script src="/resources/codemirror/addon/edit/continuelist.js"></script>
<script src="/resources/codemirror/addon/edit/matchbrackets.js"></script>
<script src="/resources/codemirror/addon/edit/matchtags.js"></script>
<script src="/resources/codemirror/addon/edit/trailingspace.js"></script>
<!--folding-->
<script src="/resources/codemirror/addon/fold/foldcode.js"></script>
<script src="/resources/codemirror/addon/fold/foldgutter.js"></script>
<script src="/resources/codemirror/addon/fold/brace-fold.js"></script>
<script src="/resources/codemirror/addon/fold/xml-fold.js"></script>
<script src="/resources/codemirror/addon/fold/indent-fold.js"></script>
<script src="/resources/codemirror/addon/fold/markdown-fold.js"></script>
<script src="/resources/codemirror/addon/fold/comment-fold.js"></script>
<!-- mode -->
<script src="/resources/codemirror/mode/xml/xml.js"></script>
<script src="/resources/codemirror/mode/javascript/javascript.js"></script>
<script src="/resources/codemirror/mode/css/css.js"></script>
<script src="/resources/codemirror/mode/htmlmixed/htmlmixed.js"></script>
<script src="/resources/codemirror/mode/python/python.js"></script>
<script src="/resources/codemirror/mode/markdown/markdown.js"></script>
<!-- 스크롤바 -->
<script src="/resources/codemirror/addon/scroll/simplescrollbars.js"></script>
<!-- <script src="/resources/codemirror/addon/scroll/annotatescrollbar.js"></script>
<script src="/resources/codemirror/addon/scroll/scrollpastend.js"></script>  -->
<!-- 키맵 -->
<script src="/resources/codemirror/keymap/sublime.js"></script>
<!-- 같은단어 강조 -->
<script src="/resources/codemirror/addon/search/match-highlighter.js"></script>
<!-- autocomplete -->
<script src="/resources/codemirror/addon/hint/show-hint.js"></script>
<script src="/resources/codemirror/addon/hint/html-hint.js"></script>
<script src="/resources/codemirror/addon/hint/css-hint.js"></script>
<script src="/resources/codemirror/addon/hint/javascript-hint.js"></script>
<script src="/resources/codemirror/addon/hint/xml-hint.js"></script>

<!-- addon\comment -->
<script src="/resources/codemirror/addon/comment/comment.js"></script>
<script src="/resources/codemirror/addon/comment/continuecomment.js"></script>
<!-- addon\dialog -->
<script src="/resources/codemirror/addon/dialog/dialog.js"></script>
<script src="/resources/codemirror/addon/search/search.js"></script>
<script src="/resources/codemirror/addon/search/searchcursor.js"></script>
<script src="/resources/codemirror/addon/search/jump-to-line.js"></script>
<!--addon\tern-->
<script src="/resources/codemirror/addon/tern/tern.js"></script>
<!-- <script src="/resources/codemirror/addon/tern/worker.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<!--full screen>-->
<%--<script src="/resources/codemirror/codebox/addon/display/fullscreen.js"></script>--%>
<!--Formatting-->
<script src="/resources/codemirror/lib/util/formatting.js"></script>
<%--<script src="/codebox/js/lib/beautify.js"></script>--%>
<%--<script src="/resources/codemirror/js/lib/beautify-css.js"></script>--%>


<!--GFM MarkDown-->
<script src="/resources/codemirror/gfm/markdown-it.js"></script>
<script src="/resources/codemirror/gfm/markdown-it-footnote.js"></script>
<script src="/resources/codemirror/gfm/highlight.pack.js"></script>
<script src="/resources/codemirror/gfm/emojify.js"></script>
<%--<script src="codemirror/lib/codemirror.js"></script>--%>
<script src="/resources/codemirror/gfm/overlay.js"></script>
<%--<script src="codemirror/mode/xml/xml.js"></script>--%>
<script src="/resources/codemirror/mode/markdown/markdown.js"></script>
<script src="/resources/codemirror/mode/gfm/gfm.js"></script>
<%--<script src="codemirror/mode/javascript/javascript.js"></script>--%>
<%--<script src="codemirror/mode/css/css.js"></script>--%>
<%--<script src="codemirror/mode/htmlmixed/htmlmixed.js"></script>--%>
<%--<script src="codemirror/addon/edit/continuelist.js"></script>--%>
<script src="/resources/codemirror/gfm/rawinflate.js"></script>
<script src="/resources/codemirror/gfm/rawdeflate.js"></script>
<%--<link rel="stylesheet" href="codemirror/theme/base16-light.css">--%>
<link rel="stylesheet" href="/resources/codemirror/lib/codemirror.css">
<link rel="stylesheet" href="/resources/codemirror/gfm/default.css">

<!--haml------>
<script src="/resources/codemirror/mode/haml/haml.js"></script>
<script src="/resources/codemirror/mode/ruby/ruby.js"></script>


<!--스크립트 define & event 분리참조-->
<script src="/resources/dist/js/editPage/editPageDefine.js"></script>
<script src="/resources/dist/js/editPage/editPageEvent.js"></script>
<script src="//d1l6p2sc9645hc.cloudfront.net/tracker.js" data-gs="GSN-265185-D" async></script>
<script src="/resources/dist/js/upload.js"></script>


