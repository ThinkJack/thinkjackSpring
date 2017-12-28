//코드미러 객체

var codeHtml = CodeMirror(document.getElementById("codeHtml"), {

    mode: "htmlmixed",
    profile: 'xhtml',
    lineNumbers: true,
    scrollbarStyle: "simple",    // 스크롤바 스타일
    keyMap: "sublime",           // 키맵
    matchBrackets: true,         // 괄호강조
    theme: "dracula",            // 테마

    // detectIndentation: true,
    // insertSpaces: true,
    tabSize: 4,                  // 탭키 간격
    highlightSelectionMatches: {showToken: /\w/, annotateScrollbar: true}, // 같은단어강조
    // extraKeys: { "Ctrl-Space": "autocomplete" },
    // indentUnit: 2,
    indentWithTabs: true,
    electricChars: true,
    resetSelectionOnContextMenu: false,
    // smartIndent: true,
    lineWiseCopyCut: true,
    pasteLinesPerSelection: true,
    styleActiveLine: true,

    // tabindex: 2,
    // gutters: ["CodeMirror-linenumbers", "breakpoints"],
    // styleActiveLine: true,
    // wordWrap: true,
    autoCloseTags: true,

    lineWrapping: true,           // 가로 스크롤바 숨김, 너비에 맞게 줄바꿈.
    extraKeys: {
        "Ctrl-Space": "autocomplete",
        "Ctrl-Q": function (cm) {
            cm.foldCode(cm.getCursor());
        },
        "Shift-Tab": autoFormatSelection
    },
    foldGutter: true,
    gutters: ["CodeMirror-linenumbers", "breakpoints", "CodeMirror-foldgutter"],
    // autofocus: true,


    // ,theme: "bespin"
    // cursorScrollMargin: 5,
    // dragDrop:true,
    // lineSeparator: "h1"  //지정단어 나올시 개행처리
    // indentUnit: 4,
    // indentWithTabs: true,
    // moveOnDrag:true,
    // adNew: true,

});


var codeCss = CodeMirror(document.getElementById("codeCss"), {
    mode: "css",
    lineNumbers: true,
    scrollbarStyle: "simple",    // 스크롤바 스타일
    keyMap: "sublime",           // 괄호강조
    matchBrackets: true,         // 괄호강조
    theme: "dracula",            // 테마
    tabSize: 4,                  // 탭키 간격
    lineWrapping: true,           // 가로 스크롤바 숨김, 너비에 맞게 줄바꿈.
    highlightSelectionMatches: {showToken: /\w/, annotateScrollbar: true}, // 같은단어강조
    extraKeys: {
        "Ctrl-Space": "autocomplete",
        "Ctrl-Q": function (cm) {
            cm.foldCode(cm.getCursor());
        },
        "Shift-Tab": autoFormatSelection
    },
    indentUnit: 2,
    indentWithTabs: true,
    electricChars: true,
    resetSelectionOnContextMenu: false,
    smartIndent: true,
    lineWiseCopyCut: true,
    pasteLinesPerSelection: true,
    tabindex: 2,
    styleActiveLine: true,

    foldGutter: true,
    gutters: ["CodeMirror-linenumbers", "breakpoints", "CodeMirror-foldgutter"]
});


var codeJavaScript = CodeMirror(document.getElementById("codeJavaScript"), {
    mode: "javascript",
    lineNumbers: true,
    scrollbarStyle: "simple",    // 스크롤바 스타일
    keyMap: "sublime",           // 키맵
    matchBrackets: true,         // 괄호강조
    theme: "dracula",            // 테마
    tabSize: 4,                  // 탭키 간격
    lineWrapping: true,          // 가로 스크롤바 숨김, 너비에 맞게 줄바꿈.
    highlightSelectionMatches: {showToken: /\w/, annotateScrollbar: true},   // 같은단어강조
    // extraKeys: { ".": "autocomplete" },
    // extraKeys: { "Ctrl-Space": "autocomplete" }, //힌트
    indentUnit: 2,                //들여쓰기
    // indentWithTabs: false,
    electricChars: true,         //중괄호 정렬
    resetSelectionOnContextMenu: false,
    smartIndent: true,
    lineWiseCopyCut: true,
    pasteLinesPerSelection: true,
    tabindex: 2,
    styleActiveLine: true,

    wordWrap: true,
    autoCloseBrackets: true,
    // gutters: ["CodeMirror-linenumbers", "breakpoints"],

    lineWrapping: true,           //Folding
    extraKeys: {
        "Ctrl-Space": "autocomplete",
        "Ctrl-Q": function (cm) {
            cm.foldCode(cm.getCursor());
        },
        "Shift-Tab": autoFormatSelection
    },
    foldGutter: true,
    gutters: ["CodeMirror-linenumbers", "breakpoints", "CodeMirror-foldgutter"]
});

var codeUnitTest = CodeMirror(document.getElementById("codeUnitTest"), {
    mode: "javascript",
    lineNumbers: true,
    scrollbarStyle: "simple",    // 스크롤바 스타일
    keyMap: "sublime",           // 키맵
    matchBrackets: true,         // 괄호강조
    theme: "dracula",            // 테마
    tabSize: 4,                  // 탭키 간격
    lineWrapping: true,          // 가로 스크롤바 숨김, 너비에 맞게 줄바꿈.
    highlightSelectionMatches: {showToken: /\w/, annotateScrollbar: true},   // 같은단어강조
    // extraKeys: { ".": "autocomplete" },
    // extraKeys: { "Ctrl-Space": "autocomplete" }, //힌트
    indentUnit: 2,                //들여쓰기
    // indentWithTabs: false,
    electricChars: true,         //중괄호 정렬
    resetSelectionOnContextMenu: false,
    smartIndent: true,
    lineWiseCopyCut: true,
    pasteLinesPerSelection: true,
    tabindex: 2,
    styleActiveLine: true,

    wordWrap: true,
    autoCloseBrackets: true,
    // gutters: ["CodeMirror-linenumbers", "breakpoints"],

    lineWrapping: true,           //Folding
    extraKeys: {
        "Ctrl-Space": "autocomplete",
        "Ctrl-Q": function (cm) {
            cm.foldCode(cm.getCursor());
        },
        "Shift-Tab": autoFormatSelection
    },
    foldGutter: true,
    gutters: ["CodeMirror-linenumbers", "breakpoints", "CodeMirror-foldgutter"]
});
// editor.foldCode(CodeMirror.Pos(13, 0));
codeUnitTest.setValue(
    "function testFunction(){\n" +
    "   return 0;\n" +
    "}");

var origin = codeUnitTest.getValue();
var declaration = origin.substr(origin.indexOf("(")+1,origin.indexOf("{")-origin.indexOf("(")-2);
testFunc = new Function(declaration,origin.substr(origin.indexOf("{")+1,origin.lastIndexOf(";")-origin.indexOf("{")));

var codePython = CodeMirror(document.getElementById("codePython"), {
    mode: "python",
    lineNumbers: true,
    extraKeys: {
        "Ctrl-Q": function (cm) {
            cm.foldCode(cm.getCursor());
        },
        "Shift-Tab": autoFormatSelection
    },
    foldGutter: true,
    gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
});

var codeMarkdown = CodeMirror(document.getElementById("codePython"), {
    mode: "markdown",
    lineNumbers: true,
    lineWrapping: true,
    extraKeys: {
        "Ctrl-Q": function (cm) {
            cm.foldCode(cm.getCursor());
        },
        "Shift-Tab": autoFormatSelection
    },
    foldGutter: true,
    gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
});

// 아래 keyup 이벤트 발생시 제외할  키코드 아스키값
var ExcludedIntelliSenseTriggerKeys =
    {
        "8": "backspace",
        "9": "tab",
        "13": "enter",
        "16": "shift",
        "17": "ctrl",
        "18": "alt",
        "19": "pause",
        "20": "capslock",
        "27": "escape",
        "32": "space",
        "33": "pageup",
        "34": "pagedown",
        "35": "end",
        "36": "home",
        "37": "left",
        "38": "up",
        "39": "right",
        "40": "down",
        "45": "insert",
        "46": "delete",
        "48": ")",
        "57": "(",
        "86": "ctrl-v",
        "88": "ctrl-x",
        "91": "left window key",
        "92": "right window key",
        "93": "select",
        "107": "add",
        "109": "subtract",
        "110": "decimal point",
        "111": "divide",
        "112": "f1",
        "113": "f2",
        "114": "f3",
        "115": "f4",
        "116": "f5",
        "117": "f6",
        "118": "f7",
        "119": "f8",
        "120": "f9",
        "121": "f10",
        "122": "f11",
        "123": "f12",
        "144": "numlock",
        "145": "scrolllock",
        "186": "semicolon",
        "187": "equalsign",
        "188": "comma",
        "189": "dash",
        "190": "period",
        "191": "slash",
        "192": "graveaccent",
        "219": "{",
        "220": "backslash",
        "221": "}",
        "222": "quote"
    };
var delay;

var saveStatus = true //저장 유도관련 변수
var saveImg = document.getElementById("save-img"); //save 이미지 변경 관련 변수
var imgPath = "/resources/images/";
//---------console관련 변수
var editConsoleView = document.getElementById("edit-console-view");
var editConsole = document.getElementById("edit-console");
var commandLine = document.getElementById("command-line-view");

var htmlBuild = document.getElementById("htmlBuild");
var cssBuild = document.getElementById("cssBuild");
var jsBuild = document.getElementById("jsBuild");
var codeMLayout = document.getElementsByClassName("CodeMirror");

var codeMain = document.getElementById("code-main");
var resizeView = document.getElementById("resize-view");
var iframeBody = document.getElementById("iframe-body");
var layout1 = document.getElementById("layout1");
var layout2 = document.getElementById("layout2");
var resizeCode1 = document.getElementById("resize-code-1");
var resizeCode2 = document.getElementById("resize-code-2");
var codeMirrorLayout = document.getElementsByClassName("CodeMirror");
var codeLayout = document.getElementsByClassName("code_layout");
var srcId, srcComments, srcTitle;
var curhref = location.href;


var hcl = 0, cjl = 0, cifl = 0; //크기조절 변수
var layoutMode = 0; //0 - top, 1 - left 2 - right
var dragging = false;
// var session = session.getAttribute("login");



//--------------------------------------------------------------------------------------------------------------------함수정의부분

//break point
function makeMarker() {
    var marker = document.createElement("div");
    marker.style.color = "#822";
    marker.innerHTML = "●";
    return marker;
}

//------------------------------------------------------미리보기 기능
function updatePreview() {

    var previewFrame = document.getElementById('resultView');
    //iframe의 document객체 받아오기
    var preview = previewFrame.contentDocument || previewFrame.contentWindow.document;


    preview.open();

    preview.write(
        codeHtml.getValue()
        +
        "<style>" + codeCss.getValue() + "</style>"
        +
        "<script>" + codeJavaScript.getValue() + "<\/script>"
    );
    // alert(codeHtml.getValue());
    // document.getElementById('resultView').innerHTML =     codeHtml.getValue();
    // +
    // "<style>" + codeCss.getValue() + "</style>" +
    // "<script>" + codeJavaScript.getValue() + "<\/script>";
    consoleView(codeJavaScript.getValue());

    preview.close();


}



//Folding
// codeHtml.foldCode(CodeMirror.Pos(0, 0));
// codeHtml.foldCode(CodeMirror.Pos(34, 0));
// codeJavaScript.foldCode(CodeMirror.Pos(13, 0));
// codeCss.foldCode(CodeMirror.Pos(0, 0));
// codeCss.foldCode(CodeMirror.Pos(34, 0));



//autoFormatSelection, commentSelection
// CodeMirror.commands["selectAll"](codeHtml);

function getSelectedRange() {
    return {from: codeHtml.getCursor(true), to: codeHtml.getCursor(false)};
}
function getSelectedRange1() {
    return {from: codeCss.getCursor(true), to: codeCss.getCursor(false)};
}
function getSelectedRange2() {
    return {from: codeJavaScript.getCursor(true), to: codeJavaScript.getCursor(false)};
}
function getSelectedRange3() {
    return {from: codeUnitTest.getCursor(true), to: codeUnitTest.getCursor(false)};
}

//--shift+tab
function autoFormatSelection() {
    var range = getSelectedRange();
    codeHtml.autoFormatRange(range.from, range.to);
    var range1 = getSelectedRange1();
    codeCss.autoFormatRange(range1.from, range1.to);
    var range2 = getSelectedRange2();
    codeJavaScript.autoFormatRange(range2.from, range2.to);
    var range3 = getSelectedRange2();
    codeUnitTest.autoFormatRange(range3.from, range3.to);
}
//--ctrl+/
// function commentSelection(isComment) {
//     var range = getSelectedRange();
// codeHtml.commentRange(isComment, range.from, range.to);
// codeCss.autoFormatRange(range.from, range.to);
// codeJavaScript.autoFormatRange(range.from, range.to);
// }