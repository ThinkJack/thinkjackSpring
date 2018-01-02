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
        "Shift-Tab": autoFormatSelection
    },
    foldGutter: true,
    gutters: ["CodeMirror-linenumbers", "breakpoints", "CodeMirror-foldgutter"],
    autofocus: true
});
// }


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
var srcId, srcComments, srcTitle, srcWriterName, srcRegdate, srcUpdate;
var strHtml, strCss, strJs;
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
    val = codeHtml.getValue();
    val = val.replace(/<equation>((.*?\n)*?.*?)<\/equation>/ig, function (a, b) {
        return '<img src="http://latex.codecogs.com/png.latex?' + encodeURIComponent(b) + '" />';
    });

    var previewFrame = document.getElementById('resultView');
    var out = previewFrame.contentDocument || previewFrame.contentWindow.document;

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
    hashto = setTimeout(updateHash, 1000);


    // -- mode 별 out(미리보기) 선택
    out.open();
    var rlt = codeHtml.getOption("mode") === "gfm" ?
        md.render(val) : codeHtml.getValue(); //markdown : html

    out.write(
        rlt
        +
        "<style>" + codeCss.getValue() + "</style>"
        +
        "<script>" + codeJavaScript.getValue() + "<\/script>"
    );

    consoleView(codeJavaScript.getValue());
    out.close();
}

var saveCode = function () {

    // alert('savecode');

    saveImg.src = "/resources/images/cloud1.png";
    srcId = curhref.replace("http://localhost/edit/editPage", "").replace("/", "");

    if (!saveStatus) {
        $.ajax({
            type: "post",
            url: "/editRest/save",
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST"
            },
            dataType: 'text',
            data: JSON.stringify({
                srcId: srcId,
                srcComments: srcComments,
                srcTitle: srcTitle,
                srcHtml: codeHtml.getValue(),
                srcCss: codeCss.getValue(),
                srcJavaScript: codeJavaScript.getValue()
            }),
            success: function (getLink) {
                if (srcId === "") {
                    location.replace("/edit/editPage/" + getLink);
                }
                saveStatus = true;

                alert("저장이 되었습니다.");
            }
        });
    }

};


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
}, false);


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


document.addEventListener('keydown', function (e) {
    if (e.keyCode == 83 && (e.ctrlKey || e.metaKey)) {
        alert(111);
        e.shiftKey ? showMenu() : saveAsMarkdown();

        e.preventDefault();
        return false;
    }

    if (e.keyCode === 27 && menuVisible) {
        hideMenu();

        e.preventDefault();
        return false;
    }
});


function updateHash() {
    window.location.hash = btoa( // base64 so url-safe
        RawDeflate.deflate( // gzip
            unescape(encodeURIComponent( // convert to utf8
                codeHtml.getValue()
            ))
        )
    );
}

if (window.location.hash) {
    var h = window.location.hash.replace(/^#/, '');
    if (h.slice(0, 5) == 'view:') {
        setOutput(decodeURIComponent(escape(RawDeflate.inflate(atob(h.slice(5))))));
        document.body.className = 'view';
    } else {
        codeHtml.setOption(
            decodeURIComponent(escape(
                RawDeflate.inflate(
                    atob(
                        h
                    )
                )
            ))
        );
        updatePreview();
        codeHtml.focus();
    }
}
else {
    // updatePreview();
    codeHtml.focus();
}
// document.write("<script src='//d1l6p2sc9645hc.cloudfront.net/tracker.js' data-gs='GSN-265185-D' async'></script>");


