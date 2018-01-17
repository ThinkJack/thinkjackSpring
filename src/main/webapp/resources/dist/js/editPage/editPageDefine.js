//코드미러 객체

var codeHtml = CodeMirror(document.getElementById("codeHtml"), {

    mode: "htmlmixed",
    profile: 'xhtml',
    lineNumbers: true,
    scrollbarStyle: "simple",    // 스크롤바 스타일
    keyMap: "sublime",           // 키맵
    matchBrackets: true,         // 괄호강조
    theme: "dracula",            // 테마
    tabSize: 4,                  // 탭키 간격
    highlightSelectionMatches: {showToken: /\w/, annotateScrollbar: true},//단어강조
    indentWithTabs: true,
    electricChars: true,
    resetSelectionOnContextMenu: false,
    smartIndent: true,
    lineWiseCopyCut: true,
    pasteLinesPerSelection: true,
    styleActiveLine: true,
    autoCloseTags: true,
    lineWrapping: true,           // 가로 스크롤바 숨김, 너비에 맞게 줄바꿈.
    extraKeys: {
        "Ctrl-Space": "autocomplete",
        "Ctrl-Q": function (cm) {
            cm.foldCode(cm.getCursor());
        },
        "Shift-Tab": "indentAuto",
        "Esc": "singleSelectionTop",
        "Ctrl-D": "deleteLine"

    },
    foldGutter: true,
    gutters: ["CodeMirror-linenumbers", "breakpoints", "CodeMirror-foldgutter"],
    autofocus: true
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
        // "Shift-Tab": autoFormatSelection
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
        // "Shift-Tab": autoFormatSelection
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
        // "Shift-Tab": autoFormatSelection
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
var srcId, srcWriter, srcComments, srcTitle, srcWriterName, srcRegdate, srcUpdate, viewCnt, likeCnt, srcStatus;
var userId;
var Heart;
var strHtml, strCss, strJs;
var curhref = location.href;

//cdn관련 변수
var cdnCssidx = 1;// 무조건 증가
var cdnCssCnt = 0;
var cdnJsidx = 1;// 무조건 증가
var cdnJsCnt = 0;
var cdnCss = new Array();
var cdnJs = new Array();
var cssLnkSet = "";
var jsLnkSet = "";
var consoleSerchLog = [];
var consoleCur = -1;

var hcl = 0, cjl = 0, cifl = 0; //크기조절 변수
var layoutMode = 0; //0 - top, 1 - left 2 - right
var dragging = false;
// var session = session.getAttribute("login");
var likebt = document.getElementById("likebt");

//--------------------------------------------------------------------------------------------------------------------함수정의부분


//cdn추가 삭제 관련 함수
function cdnCssAdd (str) {
    $("#cdn-css").append("<div class=\"row\" id='cdn-add-css" + cdnCssidx + "'>" +
        "<div class=\"col cdn_div\">\n" +
        "<div class=\"col\">\n" +
        "<img src=\"/resources/images/positionChange.png\">\n" +
        "<input class=\"form-control cdn_input\" type=\"text\" id=\"css-cdn" + cdnCssidx + "\"\n" +
        "placeholder=\"CDN을 추가해 주세요\" value='"+ str + "'>\n" +
        "<button type=\"button\" class=\"close cdn_close\" aria-label=\"Close\"" +
        "onclick='cdnCssDelete(" + cdnCssidx + ");'>\n" +
        "<span aria-hidden=\"true\">&times;</span>\n" +
        "</button>\n" +
        "</div>\n" +
        "</div>" +
        "</div>");
    ++cdnCssidx;
    ++cdnCssCnt;
    cdnChangeCss("cdn-css", cdnCssCnt);
}

function cdnCssDelete(idx) {
    if(cdnCssCnt > 2) {
        $("#cdn-add-css"+ idx).remove();
        --cdnCssCnt;
        cdnChangeCss("cdn-css", cdnCssCnt);
    }else{
        $("#css-cdn"+ idx).val("");
    }
}

function cdnJsAdd (str) {
    $("#cdn-js").append("<div class=\"row\" id='cdn-add-Js" + cdnJsidx + "'>" +
        "<div class=\"col cdn_div\">\n" +
        "<div class=\"col\">\n" +
        "<img src=\"/resources/images/positionChange.png\">\n" +
        "<input class=\"form-control cdn_input\" type=\"text\" id=\"js-cdn" + cdnJsidx + "\"\n" +
        "placeholder=\"CDN을 추가해 주세요\" value='"+ str +"'>\n" +
        "<button type=\"button\" class=\"close cdn_close\" aria-label=\"Close\"" +
        "onclick='cdnJsDelete(" + cdnJsidx + ");'>\n" +
        "<span aria-hidden=\"true\">&times;</span>\n" +
        "</button>\n" +
        "</div>\n" +
        "</div>" +
        "</div>");
    ++cdnJsidx;
    ++cdnJsCnt;
    cdnChangeCss("cdn-js", cdnJsCnt);
}

function cdnJsDelete(idx) {
    if(cdnJsCnt > 2){
        $("#cdn-add-Js"+ idx).remove();
        --cdnJsCnt;
        cdnChangeCss("cdn-js", cdnJsCnt);
    }else{
        $("#js-cdn"+ idx).val("");
    }
}

function cdnChangeCss (id, idx){
    if(idx > 4){
        $("#" + id).css("overflow-y", "scroll");
    }else {
        $("#" + id).css("overflow-y", "auto");
    }
}

function cdnCssJsViewSet(arr, kind) {
    var arrlen = arr.length < 2 ? 2 : arr.length;
    if(kind === "css"){
        for(var i=1; i<=arrlen; i++){
            if(arr[i-1]){
                cdnCssAdd(arr[i-1]);
            }else{
                cdnCssAdd("");
            }
        }
    }else{
        for(var i=1; i<=arrlen; i++){
            if(arr[i-1]){
                cdnJsAdd(arr[i-1]);
            }else{
                cdnJsAdd("");
            }
        }
    }
}

function cdnCssJsValSet(){
    cdnCss = new Array();
    cdnJs = new Array();
    cssLnkSet = "";
    jsLnkSet = "";

    for(var i=1; i<=cdnCssCnt; i++){
        if($("#css-cdn" + i).length){
            if($("#css-cdn" + i).val()){
                cdnCss.push($("#css-cdn" + i).val());
                cssLnkSet += "<link rel='stylesheet' href='" + $("#css-cdn" + i).val() + "'\/>";
                changeSaveImg(2);
            }
        }
    }
    for(var i=1; i<=cdnJsCnt; i++){
        if($("#js-cdn" + i).length) {
            if($("#js-cdn" + i).val()) {
                cdnJs.push($("#js-cdn" + i).val());
                jsLnkSet += "<script src='" + $("#js-cdn" + i).val() + "'><\/script>";
                changeSaveImg(2);
            }
        }
    }
}

//break point
function makeMarker() {
    var marker = document.createElement("div");
    marker.style.color = "#822";
    marker.innerHTML = "●";
    return marker;
}

//------------------------------------------------------미리보기 기능
function updatePreview() {

    $("#resultView").remove();

    var imsi = document.createElement("iframe");
    imsi.setAttribute("class","col");
    imsi.setAttribute("id","resultView");
    imsi.setAttribute("scrolling","yes");
    $("#iframe-body").html(imsi);

    var val = codeHtml.getValue().replace(/<equation>((.*?\n)*?.*?)<\/equation>/ig, function (a, b) {
        return '<img src="http://latex.codecogs.com/png.latex?' + encodeURIComponent(b) + '" />';
    });

    var previewFrame = document.getElementById('resultView');
    var out = previewFrame.contentDocument || previewFrame.contentWindow.document;

    //초기화중

    emojify.run(out);

    var old = out.cloneNode(true);
    var allold = old.getElementsByTagName("*");
    if (allold === undefined) return;

    var allnew = out.getElementsByTagName("*");
    if (allnew === undefined) return;

    for (var i = 0, max = Math.min(allold.length, allnew.length); i < max; i++) {
        if (!allold[i].isEqualNode(allnew[i])) {
            out.scrollTop = allnew[i].offsetTop;
            return;
        }
    }

    clearTimeout(hashto);
    // hashto = setTimeout(updateHash, 1000);


    var cacheWhitelist = ['v2'];

    caches.keys().then(function (keyList) {
        return Promise.all(keyList.map(function (key) {
            if (cacheWhitelist.indexOf(key) === -1) {
                console.log(key);
                return caches.delete(key);
            }
        }));
    });


    var rlt = codeHtml.getOption("mode") === "gfm" ?
        md.render(val) : codeHtml.getValue(); //markdown : html

    out.open();
    out.write(

        cssLnkSet
        +
        "<style>" + codeCss.getValue() + "</style>"
        +
        rlt
        +
        jsLnkSet
        +
        "<script>" + consoleString + "</script>"
        +
        "<script>"
        // +
        // consoleString
        + codeJavaScript.getValue() + "<\/script>"
    );

    out.close();

    consoleView("");
    // editConsoleView.scrollTop = editConsoleView.scrollHeight;
}

var consoleString = "var console=(function(oldCons){\n" +
    "        return {\n" +
    "            log: function(text){\n" +
    "                oldCons.log(text);\n" +
    "                parent.document.getElementById(\"edit-console-view\").innerHTML += \"<p class='console-log' style='color:darkseagreen;'>&nbsp;&nbsp;\\\"\" + text + \"\\\"</p>\";\n" +
    "            },\n" +
    "            info: function (text) {\n" +
    "                oldCons.info(text);\n" +
    "                parent.document.getElementById(\"edit-console-view\").innerHTML += \"<p class='console-log' style='color:dodgerblue;'>&nbsp;&nbsp;\\\"\" + text + \"\\\"</p>\";\n" +
    "            },\n" +
    "            warn: function (text) {\n" +
    "                oldCons.warn(text);\n" +
    "                parent.document.getElementById(\"edit-console-view\").innerHTML += \"<p class='console-log' style='color:yellow;'>&nbsp;&nbsp;\\\"\" + text + \"\\\"</p>\";\n" +
    "            },\n" +
    "            error: function (text) {\n" +
    "                oldCons.error(text);\n" +
    "                parent.document.getElementById(\"edit-console-view\").innerHTML += \"<p class='console-log' style='color:red;'>&nbsp;&nbsp;\\\"\" + text + \"\\\"</p>\";\n" +
    "            }\n" +
    "        };\n" +
    "    }(parent.document.getElementById('resultView').contentWindow.console));\n";

window.onload = function() {
    var previewFrame = document.getElementById('resultView');
    var out = previewFrame.contentDocument || previewFrame.contentWindow.document;
    out.location.reload();
};

// var console=(function(oldCons){
//     return {
//         log: function(text){
//             oldCons.log(text);
//             editConsoleView.innerHTML += "<p class='console-log' style='color:darkseagreen;'>\"" + text + "\"</p>";
//             // Your code
//         },
//         info: function (text) {
//             oldCons.info(text);
//             editConsoleView.innerHTML += "<p class='console-log' style='color:darkseagreen;'>\"" + text + "\"</p>";
//             // Your code
//         },
//         warn: function (text) {
//             oldCons.warn(text);
//             editConsoleView.innerHTML += "<p class='console-log' style='color:darkseagreen;'>\"" + text + "\"</p>";
//             // Your code
//         },
//         error: function (text) {
//             oldCons.error(text);
//             editConsoleView.innerHTML += "<p class='console-log' style='color:darkseagreen;'>\"" + text + "\"</p>";
//             // Your code
//         }
//     };
// }(window.console));


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

// 문자치환
function escapeHtml(text) {
    return text
        .replace(/&lt;/gi, "<")
        .replace(/&gt;/gi, ">")
        .replace(/&#33;/gi, "!")
        .replace(/&#034;/gi, '"')
        .replace(/&quot;/gi, '"')
        .replace(/&#035;/gi, '"')
        .replace(/&#037;/gi, "%")
        .replace(/&amp;/gi, "&")
        .replace(/&#038;/gi, "&")
        .replace(/&#039;/gi, "'");
}

//코드 저장 로직
function codeSave() {
    saveImg.src = "/resources/images/cloud1.png";
    srcId = curhref.replace("https://", "").replace("http://", "").replace(document.location.host + "/edit/editPage", "").replace("/", "");

    if (!saveStatus) {
        jQuery.ajaxSettings.traditional = true;
        $.ajax({
            type: "post",
            url: "/edit/save",
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST"
            },
            dataType: 'text',
            data: JSON.stringify({
                srcId: srcId,
                srcComments: srcComments,
                srcWriter: srcWriter,
                srcTitle: srcTitle,
                srcHtml: codeHtml.getValue(),
                srcCss: codeCss.getValue(),
                srcJavaScript: codeJavaScript.getValue(),
                srcStatus: srcStatus,
                cdnCss: cdnCss,
                cdnJs: cdnJs
            }),
            success: function (getLink) {
                if(srcId === "" && userId === ""){
                    document.cookie = getLink + "=";
                }

                if (srcId === "" || (srcWriter === "0" && "${login.userId}" !== "")) {
                    location.replace("/edit/editPage/" + getLink);
                }
                saveStatus = true;

            }
        });
    }
}

function srcDelete() {
    $.ajax({
        type: "post",
        url: "/edit/delete",
        headers: {
            "Content-Type": "application/json",
            "X-HTTP-Method-Override": "POST"
        },
        // dataType: 'text',
        data: JSON.stringify({
            srcId: srcId,
            srcStatus: srcStatus
        }),
        success: function (result) {
            alert(result);
            location.replace("/");
        }
    });
}

var consoleCategory = [];
var consoleView = function (str) {
    //console.log() 입력시 문자열 작업(정규식)
    var previewFrame = document.getElementById('resultView');

    var temp = consoleLogStr(str);

    if(str !== ""){
        try {
            editConsoleView.innerHTML += "<p class='console-log'> &nbsp;> " + str + "</p>";

            consoleLogView(temp, consoleCategory);
            editConsoleView.innerHTML += "<p class='console-log' style='color:darkorange;'> &nbsp;<· "
                                        + previewFrame.contentWindow.eval(str) + "</p>";
        } catch (err) {
            editConsoleView.innerHTML += "<p class='console-log' style='color:red;'> &nbsp;<· " + "Uncaught " + err.name + " : " + err.message + "</p>"
        }

        editConsoleView.scrollTop = editConsoleView.scrollHeight;
    }
};
function consoleLogView(temp, consoleCategory){


    if (temp !== null) {

        for (i in temp) {
            var color = "";
            if(consoleCategory[i] ==="log"){
                color = "darkseagreen";
            }else if(consoleCategory[i] ==="info"){
                color = "dodgerblue";
            }else if(consoleCategory[i] ==="warn"){
                color = "yellow";
            }else if(consoleCategory[i] ==="error"){
                color = "red";
            }
            editConsoleView.innerHTML += "<p class='console-log' style='color:" + color + ";'>\"" + temp[i] + "\"</p>"
        }
    }
}

//
function consoleLogStr(str) {
    var reg = /console\.(log|info|warn|error)\(\"([\w|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*)\"\)|console\.(log|info|warn|error)\(\'([ㄱ-ㅎ|ㅏ-ㅣ|가-힣|\w]*)\'\)/g;
    var temp = str.match(reg);
    var category = ["log", "info", "warn", "error"];
    for (i in temp) {

        for(j in category){
            if(temp[i].indexOf("console." + category[j] + "(") !== -1){
                consoleCategory[i] = category[j];
                temp[i] = temp[i].replace("console." + category[j] + "(", "");
                temp[i] = temp[i].replace("'", "");
                temp[i] = temp[i].replace("\"", "");
                temp[i] = temp[i].replace("')", "");
                temp[i] = temp[i].replace("\")", "");
                break;
            }
        }
    }
    return temp;
}



$(function () {
    var console=(function(oldCons){
        return {
            log: function(text){
                oldCons.log(text);
                oldCons.log(document.getElementById("edit-console-view").innerHTML);
                document.getElementById("edit-console-view").innerHTML += "<p class='console-log' style='color:darkseagreen;'>&nbsp;&nbsp;\"" + text + "\"</p>";
                // Your code
            },
            info: function (text) {
                oldCons.info(text);
                document.getElementById("edit-console-view").innerHTML += "<p class='console-log' style='color:darkseagreen;'>&nbsp;&nbsp;\"" + text + "\"</p>";
                // Your code
            },
            warn: function (text) {
                oldCons.warn(text);
                document.getElementById("edit-console-view").innerHTML += "<p class='console-log' style='color:darkseagreen;'>&nbsp;&nbsp;\"" + text + "\"</p>";
                // Your code
            },
            error: function (text) {
                oldCons.error(text);
                document.getElementById("edit-console-view").innerHTML += "<p class='console-log' style='color:darkseagreen;'>&nbsp;&nbsp;\"" + text + "\"</p>";
                // Your code
            }
        };
    }(window.console));

    window.console = console;
});

//저장 이미지 변경
function changeSaveImg(idx) {
    if (saveImg !== null) {
        saveImg.src = "/resources/images/cloud" + idx + ".png";
        saveStatus = false;
    }
}

//이미지 색상 체크
function likeImgChange(num) {
    likebt.src = imgPath + "like" + num +".png";
}

//==========================================GFM setting

var URL = window.URL || window.webkitURL || window.mozURL || window.msURL;
navigator.saveBlob = navigator.saveBlob || navigator.msSaveBlob || navigator.mozSaveBlob || navigator.webkitSaveBlob;
window.saveAs = window.saveAs || window.webkitSaveAs || window.mozSaveAs || window.msSaveAs;

// Because highlight.js is a bit awkward at times
var languageOverrides = {
    js: 'javascript',
    html: 'xml'
};

emojify.setConfig({img_dir: 'emoji'});

var md = markdownit({
    html: true,
    linkify: true,
    highlight: function (code, lang) {
        if (languageOverrides[lang]) lang = languageOverrides[lang];
        if (lang && hljs.getLanguage(lang)) {
            try {
                return hljs.highlight(lang, code).value;
            } catch (e) { }
        }
        return '';
    }
})
    .use(markdownitFootnote);

var hashto;

// function update(e) {
//     setOutput(e.getValue());
//
//     clearTimeout(hashto);
// hashto = setTimeout(updateHash, 1000);
// }

// function setOutput(val) {
    // val = val.replace(/<equation>((.*?\n)*?.*?)<\/equation>/ig, function(a, b){
    //     return '<img src="http://latex.codecogs.com/png.latex?' + encodeURIComponent(b) + '" />';
    // });
    //
    // var out = document.getElementById('resultView');
    //
    // var old = out.cloneNode(true);
    // out.innerHTML = md.render(val);
    // return md.render(val);

    // markDownUpdate();
    // emojify.run(out);
    // codeHtml.setValue(md.render(val));


    // var allold = old.getElementsByTagName("*");
    // if (allold === undefined) return;
    //
    // var allnew = out.getElementsByTagName("*");
    // if (allnew === undefined) return;
    //
    // for (var i = 0, max = Math.min(allold.length, allnew.length); i < max; i++) {
    //     if (!allold[i].isEqualNode(allnew[i])) {
    //         out.scrollTop = allnew[i].offsetTop;
    //         return;
    //     }
    // }
// }

// codeHtml.on('change', update(codeHtml.getValue()));

document.addEventListener('drop', function (e) {
    e.preventDefault();
    e.stopPropagation();

    var reader = new FileReader();
    reader.onload = function (e) {
        codeHtml.setValue(e.target.result);
    };

    reader.readAsText(e.dataTransfer.files[0]);
},false );


function saveAsMarkdown() {
    save(codeHtml.getValue(), "untitled.md");
}

function saveAsHtml() {
    save(document.getElementById('resultView').innerHTML, "untitled.html");
}

// document.getElementById('saveas-markdown').addEventListener('click', function () {
//     saveAsMarkdown();
//     hideMenu();
// });

// document.getElementById('saveas-html').addEventListener('click', function () {
//     saveAsHtml();
//     hideMenu();
// });

function save(code, name) {
    var blob = new Blob([code], {type: 'text/plain'});
    if (window.saveAs) {
        window.saveAs(blob, name);
    } else if (navigator.saveBlob) {
        navigator.saveBlob(blob, name);
    } else {
        url = URL.createObjectURL(blob);
        var link = document.createElement("a");
        link.setAttribute("href", url);
        link.setAttribute("download", name);
        var event = document.createEvent('MouseEvents');
        event.initMouseEvent('click', true, true, window, 1, 0, 0, 0, 0, false, false, false, false, 0, null);
        link.dispatchEvent(event);
    }
}


var menuVisible = false;
var menu = document.getElementById('menu');

function showMenu() {
    menuVisible = true;
    menu.style.display = 'block';
}

function hideMenu() {
    menuVisible = false;
    menu.style.display = 'none';
}

// document.getElementById('close-menu').addEventListener('click', function () {
//     hideMenu();
// });


// document.addEventListener('keydown', function (e) {
//     if (e.keyCode == 83 && (e.ctrlKey || e.metaKey)) {
//         alert(111);
//         e.shiftKey ? showMenu() : saveAsMarkdown();
//
//         e.preventDefault();
//         return false;
//     }
//
//     if (e.keyCode === 27 && menuVisible) {
//         hideMenu();
//
//         e.preventDefault();
//         return false;
//     }
// }, {passive: true});


// function updateHash() {
//     window.location.hash = btoa( // base64 so url-safe
//         RawDeflate.deflate( // gzip
//             unescape(encodeURIComponent( // convert to utf8
//                 codeHtml.getValue()
//             ))
//         )
//     );
// }

// if (window.location.hash) {
//     var h = window.location.hash.replace(/^#/, '');
//     if (h.slice(0, 5) == 'view:') {
//         setOutput(decodeURIComponent(escape(RawDeflate.inflate(atob(h.slice(5))))));
//         document.body.className = 'view';
//     } else {
//         codeHtml.setOption(
//             decodeURIComponent(escape(
//                 RawDeflate.inflate(
//                     atob(
//                         h
//                     )
//                 )
//             ))
//         );
//         updatePreview();
//         codeHtml.focus();
//     }
// }
// else {
//     // updatePreview();
//     codeHtml.focus();
// }
// document.write("<script src='//d1l6p2sc9645hc.cloudfront.net/tracker.js' data-gs='GSN-265185-D' async'></script>");


