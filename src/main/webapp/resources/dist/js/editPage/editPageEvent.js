//var allEditValue;//html, javascript, css 모두 합친 문자열
//------------------------------------------------------코드 자동 적용 기능

codeHtml.on("change", function () {  //codeHtml에 변동됬을때
    // $('#codeHtml').css("font-family", "Consolas");


    changeSaveImg(2); //save 이미지 파란색을 변경
    clearTimeout(delay); //시간 초기화

    if ($('#autoPreview').is(':checked')) { //미리보기에 체크되있을때
        //setTimeout()에 지정된 함수 실행을 중지
        delay = setTimeout(updatePreview, 3000); //3초뒤에 미리보기 호출
    }

    if ($('#autoSave').is(':checked')) { //자동저장에 체크되있을때
        // clearTimeout(delay);
        if (srcId === "") {
        } else { //srcId가 공백이 아닐시
            delay = setTimeout(codeSave, 3000); //3초뒤 코드 저장
        }
    }

});

codeCss.on("change", function () {
    changeSaveImg(2); //css 펜에 변화발생시 save이미지 파랑색으로 바꿈
    clearTimeout(delay); //delay 시간 초기화
    if ($('#autoPreview').is(':checked')) {
        // clearTimeout(delay);//setTimeout()에 지정된 함수 실행을 중지
        delay = setTimeout(updatePreview, 3000); //3초뒤 미리보기 실행
    }

    if ($('#autoSave').is(':checked')) { //자동저장에 체크되있을시
        if (srcId === "") {
        } else {
            delay = setTimeout(codeSave, 3000); //3초뒤 코드저장
        }
    }
});

codeJavaScript.on("change", function () {
    changeSaveImg(2); //script펜에 변화발생시 save이미지 파랑색으로 바꿈
    clearTimeout(delay); //delay 시간 초기화
    if ($('#autoPreview').is(':checked')) {
        // clearTimeout(delay);//setTimeout()에 지정된 함수 실행을 중지
        delay = setTimeout(updatePreview, 3000);  //3초뒤 코드저장
    }

    if ($('#autoSave').is(':checked')) { //이슈: 자동저장된 url은 미리보기 안됨.
        if (srcId === "") {
        } else {
            delay = setTimeout(codeSave, 3000); //3초뒤 코드저장
        }
    }
});


//codeHtml펜에 키업 이벤트 발생시 마다 위 이벤트키를 제외하고 자동으로 힌트창 보여준다. 수동키인 ctrl+ Space 와 병행사용 가능
codeHtml.on("keyup", function (cm, event) {
    if (!cm.state.completionActive && /*Enables keyboard navigation in autocomplete list*/
        !ExcludedIntelliSenseTriggerKeys[(event.keyCode || event.which).toString()]) {   /*Enter - do not open autocomplete list just after item has been selected in it*/
        var scope = {};
        var preventList = ['StyleFix', 'PrefixFree', 'Html2Jade', 'alert'];
        for (var i in window) {
            if (preventList.indexOf(i) === -1) {
                scope[i] = window[i]
            }
        }
        CodeMirror.commands.autocomplete(cm, null, {completeSingle: false, globalScope: scope});
    }
});

//codeHtml펜에 번호표 옆에 빈칸을 클릭시 codeEdit.js의 makeMarker 를 호출해서 마크 뿌려줌
codeHtml.on("gutterClick", function (cm, n) {
    var info = cm.lineInfo(n);
    cm.setGutterMarker(n, "breakpoints", info.gutterMarkers ? null : makeMarker());
});

//codeCss펜에 키업 이벤트 발생시 마다 위 이벤트키를 제외하고 자동으로 힌트창 보여준다. 수동키인 ctrl+ Space 와 병행사용 가능
codeCss.on("keyup", function (cm, event) {
    if (!cm.state.completionActive && /*Enables keyboard navigation in autocomplete list*/
        !ExcludedIntelliSenseTriggerKeys[(event.keyCode || event.which).toString()]) {        /*Enter - do not open autocomplete list just after item has been selected in it*/
        var scope = {};
        var preventList = ['StyleFix', 'PrefixFree', 'Html2Jade', 'alert'];
        for (var i in window) {
            if (preventList.indexOf(i) === -1) {
                scope[i] = window[i]
            }
        }
        CodeMirror.commands.autocomplete(cm, null, {completeSingle: false, globalScope: scope});
    }
});
// codeCss.on("gutterClick", function (cm, n) {
//     var info = cm.lineInfo(n);
//     cm.setGutterMarker(n, "breakpoints", info.gutterMarkers ? null : makeMarker());
// });

//codeJavaScript 펜 키업 이벤트 발생시 마다 위 이벤트키를 제외하고 자동으로 힌트창 보여준다. 수동키인 ctrl+ Space 와 병행사용 가능
codeJavaScript.on("keyup", function (cm, event) {
    if (!cm.state.completionActive && /*Enables keyboard navigation in autocomplete list*/
        !ExcludedIntelliSenseTriggerKeys[(event.keyCode || event.which).toString()]) {        /*Enter - do not open autocomplete list just after item has been selected in it*/
        var scope = {};
        var preventList = ['StyleFix', 'PrefixFree', 'Html2Jade', 'alert'];
        for (var i in window) {
            if (preventList.indexOf(i) === -1) {
                scope[i] = window[i]
            }
        }
        CodeMirror.commands.autocomplete(cm, null, {completeSingle: false, globalScope: scope});
    }
});
// codeUnitTest.on("keyup", function (cm, event) {
//     if (!cm.state.completionActive && /*Enables keyboard navigation in autocomplete list*/
//         !ExcludedIntelliSenseTriggerKeys[(event.keyCode || event.which).toString()]) {        /*Enter - do not open autocomplete list just after item has been selected in it*/
//         var scope = {};
//         var preventList = ['StyleFix', 'PrefixFree', 'Html2Jade', 'alert'];
//         for (var i in window) {
//             if (preventList.indexOf(i) === -1) {
//                 scope[i] = window[i]
//             }
//         }
//         CodeMirror.commands.autocomplete(cm, null, {completeSingle: false, globalScope: scope});
//     }
// });

//codeJavaScript 펜에 번호표 옆에 빈칸을 클릭시 codeEdit.js의 makeMarker 를 호출해서 마크 뿌려줌
codeJavaScript.on("gutterClick", function (cm, n) {
    var info = cm.lineInfo(n);
    cm.setGutterMarker(n, "breakpoints", info.gutterMarkers ? null : makeMarker());
});


//editHeader.jsp script
//pencil 클릭시 input text 보이기
$(function () {
    var pageTitleView = document.getElementById("page-title-view");
    var pageTitleText = document.getElementById("page-title-text");

    $("#pencil").click(function () {
        pageTitleView.style = "display: none;";
        pageTitleText.style = "display: block;";
        document.getElementById("src-title-input").focus();
    });
    //pageTitle input작성 완료후 focus 똔는 enter를 쳤을때
    $("#src-title-input").keydown(function (key) {
        if (key.keyCode == 13) {
            changeTitle(this);
        }
    });
    $("#src-title-input").focusout(function (e) {
        changeTitle(this);
    });
    $("#src-title-modal").keydown(function () {
        changeTitle(this);
    });

    var changeTitle = function (el) {
        changeSaveImg(2);
        srcTitle = el.value;
        document.getElementById("src-title").innerHTML = srcTitle;
        if (el.id === "src-title-modal") {
            document.getElementById("src-title-input").value = srcTitle;
        } else {
            document.getElementById("src-title-modal").value = srcTitle;
        }
        pageTitleView.style = "display: block;";
        pageTitleText.style = "display: none;";
    }
});
//comments 변경시 등록
$(function () {
    $("#modal-comment").on("change", function (e) {
        changeSaveImg(2);
        srcComments = this.value;
        document.getElementById("comment-view").value = srcComments;
    });
});

// HTML Preprocessor 설정  처리제외
$(function () {

    $("#htmlPreprocessor").change(function () {
        // alert(selectedText); //선택된 text
        selectedText = $("#htmlPreprocessor option:selected").text();

        // document.getElementById("htmlPreprocessor");
        // var strUser = e.options[e.selectedIndex].value;

        if (selectedText === "None") {

        }
        else if (selectedText === "Haml") {


        } else if (selectedText === "MarkDown") {
            // alert(this.value);
            // alert(this.text);
            // document.write("<script src=" +
            //     "'/resources/dist/js/editPage/markDown.js'></script>");


            // codeHtml.setValue("");
            // codeHtml.clearHistory();
            // codeHtml.setOption("mode", 'gfm');
            // codeHtml.setOption("lineNumbers", false);
            // codeHtml.setOption("matchBrackets", 'true');
            // codeHtml.setOption("lineWrapping", 'true');
            // codeHtml.setOption("theme", 'base16-light');
            // codeHtml.setOption("extraKeys", {
            //     "Enter":
            //         "newlineAndIndentContinueMarkdownList"
            // });


            // alert(codeHtml.getOption("mode"));


        } else if (selectedText === "Slim") {


        } else if (selectedText === "Pug") {


        }

    });

});


//Setting Behavior부분 함수
$(function () {//---------------------------- tab-size 변경시
    $("#tab-size").change(function () {
        // alert(111);
        var st = $(":input:radio[name=gridRadios]:checked").val(); //라디오버튼 name= gridRadios 선택
        var sp = this.value; // sp변수에 값 저장
        // alert(st);
        // alert(sp);

        if (st === "option1") {  // option1 제외
            // alert('tab-click1');

            codeHtml.setOption("extraKeys", {
                Tab: function (cm) {
                    var spaces = Array(cm.getOption("indentUnit") +
                        parseInt(sp)).join(" ");
                    cm.replaceSelection(spaces);
                }
            });
            codeCss.setOption("extraKeys", {
                Tab: function (cm) {
                    var spaces = Array(cm.getOption("indentUnit") +
                        parseInt(sp)).join(" ");
                    cm.replaceSelection(spaces);
                }
            });
            codeJavaScript.setOption("extraKeys", {
                Tab: function (cm) {
                    var spaces = Array(cm.getOption("indentUnit") +
                        parseInt(sp)).join(" ");
                    cm.replaceSelection(spaces);
                }
            });
        } else if (st === "option2") {

            // codeHtml.setOption("indentWithTabs", true);

            //지정된 크기의 탭사이즈로 변경
            codeHtml.setOption("tabSize", sp);
            codeCss.setOption("tabSize", sp);
            codeJavaScript.setOption("tabSize", sp);

        }
    });
});


//Setting Behavior부분 함수
$(function () {//---------------------------- option button 변경시


    $('input[type=radio][name=gridRadios]').change(function () { //라디오버튼 name= gridRadios 선택
        // alert('gridRadios');

        //id: tab-size요소 선택
        var e = document.getElementById("tab-size");
        //현재 리스트박스의 탭사이즈 값 가져오기.
        var strUser = e.options[e.selectedIndex].value;
        // alert (this.value);

        // var sp = this.value;
        if (this.value === "option1") { //option1일때 제외
            // alert('a');


            codeHtml.setOption("extraKeys", {
                Tab: function (cm) {
                    var spaces = Array(cm.getOption("indentUnit") +
                        parseInt(strUser)).join(" ");
                    cm.replaceSelection(spaces);
                }
            });
            codeCss.setOption("extraKeys", {
                Tab: function (cm) {
                    var spaces = Array(cm.getOption("indentUnit") +
                        parseInt(strUser)).join(" ");
                    cm.replaceSelection(spaces);
                }
            });


            codeJavaScript.setOption("extraKeys", {


                "Ctrl-Space": "autocomplete",
                "Ctrl-Q": function (cm) {
                    cm.foldCode(cm.getCursor());
                },
                "Ctrl-Alt-F": autoFormatSelection,


                Tab: function (cm) {

                    cm.execCommand("insertSoftTab"); //백탭을 스페이스로

                    // var spaces = Array(cm.getOption("indentUnit") +
                    //     parseInt(strUser)).join(" ");
                    // cm.replaceSelection(spaces);
                    // cm.execCommand("defaultTab");
                    // cm.execCommand("indentMore");
                    // cm.execCommand("newlineAndIndent")

                }



            });


        } else if (this.value === "option2") {
            // alert('b');
            // codeHtml("tabSize", strUser);
            codeHtml.setOption("extraKeys", {
                Tab: function (cm) {
                    cm.execCommand("defaultTab"); //indent tab키로 설정시 백스페이스를 기본탭으로


                }
                // ,

                // "Ctrl-Space": "autocomplete",
                // "Ctrl-Q": function (cm) {
                //     cm.foldCode(cm.getCursor());
                // },
                // "Ctrl-Alt-F": autoFormatSelection
            });

            codeCss.setOption("extraKeys", {
                Tab: function (cm) {
                    cm.execCommand("defaultTab"); //indent tab키로 설정시 백스페이스를 기본탭으로
                },

                // "Ctrl-Space": "autocomplete",
                // "Ctrl-Q": function (cm) {
                //     cm.foldCode(cm.getCursor());
                // },
                // "Ctrl-Alt-F": autoFormatSelection
            });


            codeJavaScript.setOption("extraKeys", {

                // "Ctrl-Space": "autocomplete",
                // "Ctrl-Q": function (cm) {
                //     cm.foldCode(cm.getCursor());
                // },
                // "Ctrl-Alt-F": autoFormatSelection,


                "Tab": function (cm) {

                    cm.execCommand("defaultTab"); //indent tab키로 설정시 백스페이스를 기본탭으로

                }
                // ,
                // "Shift-Tab": function (cm) {
                //     cm.indentSelection("subtract");
                // }
            });




        }
    });

});


$(function () {
    $("#run").click(function () { // run button 실행
        updatePreview();
    });
});


$(function () {
    $("#command-line").keyup(function (e) {
        if (e.keyCode === 13) {
            consoleView(this.value);
            this.value = "";
        }
    });
});


//footer
//console 버튼 누를때
$(function () {
    $("#console-button").click(function () {
        if (editConsole.style.display === "none") {
            editConsole.style.display = "block";
            commandLine.style.display = "block";

            jQuery("#console-button").addClass("btn_active");

        } else {
            editConsole.style.display = "none";
            commandLine.style.display = "none";
            jQuery("#console-button").removeClass("btn_active");

        }
    });
});
//처음 문서 로드시 콘솔창 숨기기
$(function () {
    editConsole.style.display = "none";
    commandLine.style.display = "none";

});
//--------------------



//setting 모달 닫힐때 이벤트
$(function () {
    $("#setting").on("hide.bs.modal", function () {


        cdnCssJsValSet();

        updatePreview();
    });
});

//layout 관련 script
// $(function () {
//
//
//     $("#left-layout").click(function () {
//         codeMain.style = "height: calc(100% - 9px);";
//         iframeBody.style = "height: calc(100% - 50px);";
//         layout2.style = "height: 100%;";
//         layout1.className = "col-4 layout";
//         resizeView.className = "col resize_view";
//         resizeView.style = "height:100%; max-width: 5px; cursor: col-resize;";
//         layout2.className = "col main_view layout";
//         resizeCode1.style = "max-width: 100%; height: 5px; cursor: row-resize;";
//         resizeCode2.style = "max-width: 100%; height: 5px; cursor: row-resize;";
//
//         for (i in codeMirrorLayout) {
//             codeMirrorLayout[i].style = "height: calc(30% - 52px);";
//         }
//
//         for (i in codeLayout) {
//             codeLayout[i].style = "width: 100%;";
//         }
//     });
//
//     $("#top-layout").click(function () {
//         codeMain.style = "height: 100%;";
//         iframeBody.style = "height: calc(100% - 417px);";
//         layout2.style = "height: calc(100% - 417px);";
//         layout1.className = "row layout";
//         resizeView.className = "row resize_view";
//         resizeView.style = "height:5px; max-width: 100%; cursor: row-resize;";
//         layout2.className = "row main_view layout";
//         resizeCode1.style = "max-width: 5px; height: ; cursor: col-resize;";
//         resizeCode2.style = "max-width: 5px; height: ; cursor: col-resize;";
//
//         for (i in codeMirrorLayout) {
//             codeMirrorLayout[i].style = "height: 300px";
//         }
//
//         for (i in codeLayout) {
//             codeLayout[i].style = "width: 33.1%;";
//         }
//     });
//
//     $("#right-layout").click(function () {
//         codeMain.style = "height: calc(100% - 9px);";
//         iframeBody.style = "height: calc(100% - 50px);";
//         layout2.style = "height: 100%;";
//         layout1.className = "col-4 order-12 layout";
//         resizeView.className = "col order-6 resize_view";
//         resizeView.style = "height:100%; max-width: 5px; cursor: col-resize;";
//         layout2.className = "col order-1 main_view layout";
//         resizeCode1.style = "max-width: 100%; height: 5px; cursor: row-resize;";
//         resizeCode2.style = "max-width: 100%; height: 5px; cursor: row-resize;";
//
//         for (i in codeMirrorLayout) {
//             codeMirrorLayout[i].style = "height: calc(30% - 52px);";
//         }
//
//         for (i in codeLayout) {
//             codeLayout[i].style = "width: 100%;";
//         }
//     });
// });


//화면 영역 조절관련 function
// jQuery("#resize-code-1").mousedown(function (e) {
//     e.preventDefault();
//     dragging = true;
//     var startP = (hcl !== 0 ? hcl + e.pageX : e.pageX);
//
//     $(window).mousemove(function (e) {
//
//         hcl = startP - e.pageX;
//
//         console.log(cssBuild.offsetWidth);
//         if (htmlBuild.offsetWidth < 80 || cssBuild.offsetWidth < 80) {
//
//         } else {
//             htmlBuild.style = "width: calc(33.1% - " + hcl + "px);";
//             cssBuild.style = "width: calc(33.1% + " + hcl + "px);";
//         }
//
//     });
// });
//
// jQuery("#resize-code-2").mousedown(function (e) {
//     e.preventDefault();
//     dragging = true;
//     var startP = (cjl !== 0 ? cjl + e.pageX : e.pageX);
//
//     $(window).mousemove(function (e) {
//
//         cjl = startP - e.pageX;
//
//         if (-350 < cjl && cjl < 350) {
//             cssBuild.style = "width: calc(33.1% - " + cjl + "px);";
//             jsBuild.style = "width: calc(33.1% + " + cjl + "px);";
//         }
//
//     });
// });
//
// jQuery("#resize-view").mousedown(function (e) {
//     e.preventDefault();
//     dragging = true;
//     var startP = (cifl !== 0 ? cifl + e.pageY : e.pageY);
//
//     $(window).mousemove(function (e) {
//         cifl = startP - e.pageY;
// //                if (-350 < cifl && cifl < 350) {
//         for (i in codeMLayout) {
//             codeMLayout[i].style = "height: calc(100% - " + (753 + cifl) + "px);";
//         }
//
//         iframeBody.style = "height: calc(100% - " + (488 - cifl) + "px);"
//     });
//
//     $('.iframeWrapper').mousemove(function (e) {
//         cifl = startP - e.pageY;
//         for (i in codeMLayout) {
//             codeMLayout[i].style = "height: calc(100% - " + (753 + cifl) + "px);";
//         }
//
//         iframeBody.style = "height: calc(100% - " + (488 - cifl) + "px);"
//     });
// });

jQuery(window).mouseup(function (e) {
    $(window).unbind('mousemove');
    $('.iframeWrapper').unbind('mousemove');
    dragging = false;
});

jQuery('.iframeWrapper').mouseup(function (e) {
    $(window).unbind('mousemove');
    $('.iframeWrapper').unbind('mousemove');
    dragging = false;
});


$(function () {
    if ($('#autoPreview').is(':checked')) { //첫 로딩시 상태
    } else {
        var runstyle = document.getElementById("run");
        runstyle.style = "visibility: visible;"
    }

    $("#autoPreview").click(function () { //클릭시 상태
        var runstyle = document.getElementById("run");
        if (this.checked) {
            runstyle.style = "visibility: hidden;"
        } else {
            runstyle.style = "visibility: visible;"
        }
    });
});


//좋아요 버튼 이미지 변경
$(function () {
    $("#like").click(function (e) {
        $.ajax({
            type: "post",
            url: "/edit/like",
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST"
            },
            dataType: 'json',
            data: JSON.stringify({
                srcId: srcId
            }),
            success: function (success) {
                if (success.result === 0) {
                    //좋아요 추가시
                    likeImgChange("fa-heart-o", "fa-heart", "red");
                } else {
                    //좋아요 취소시
                    likeImgChange("fa-heart", "fa-heart-o", "gray");
                }

                document.getElementById("like-couont").innerHTML = success.srcLikeCnt;
            }
        });
    });
});

//창 크기조절 관련

// save & update
$("#saveCode").click(function (e) {
    codeSave();

});


$("#login").click(function (e) {
    if (window.sessionStorage) {
        if (srcId !== "") {
            sessionStorage.setItem('srcId', srcId);
        }
    }
    self.location = '/user/login'
});

$('input[name="visibility"]').on("change", function (e) {
    srcStatus = this.value;
});

$("#src-delete").click(function (e) {
    srcDelete();
});
// $('input[name="genderS"]:checked')

//=================SrcReply===============================================
$(function () {

    //총 댓글 갯수
    // var replyTotCnt = pageMaker.getTotalCount();

    //댓글등록 회원권한
    replyPage = 1; //기본리스트페이지 1페이지 지정
    if (srcId !== "") {  //저장됬을때
        getPage("/srcReply/" + srcId + "/" + replyPage); //rest 호출
    }


    if (userId == "") { //비회원일시
        $("#textarea").val("로그인 하세요!");
        $("#textarea").click(function () {
            alert("로그인 후 이용가능합니다!");
        });
        $("#post").click(function () {
            alert("로그인 후 이용가능합니다!");
        });


    } else {
        $("#textarea").removeAttr('readonly').val("");//로그인시 readonly속성제거

        //등록 & 전체목록
        $("#post").click(function (e) {
            var replyText = $("#textarea").val(); //id textarea초기화
            if (replyText !== "") { //댓글내용이 있을때
                $.ajax({
                    type: "post",
                    url: "/srcReply/srcInsert.do",// srcReply콘트롤러 srcInsert.do메서드 호출"
                    headers: {
                        "Content-Type": "application/json",
                        "X-HTTP-Method-Override": "POST"
                    },
                    dataType: 'text', //응답타입

                    data: JSON.stringify({ //요청 내용
                        srcId: srcId,
                        replyText: replyText,
                        replyWriter: userId,
                        replyStatus: srcStatus
                    }),


                    error: function () {
                        alert("등록에러");
                        // if (userId == "") then
                        // alert("로그인 후 이용가능합니다!");
                    },

                    success: function (result) {
                        // console.log("result:" + result);
                        alert("등록 되었습니다.");
                        // getPageList(); //전체목록
                        replyPage = 1; //보여줄페이지 1페이지 지정
                        getPage("/srcReply/" + srcId + "/" + replyPage); //rest
                        $("#textarea").val(""); //textarea 초기화


                    }
                });
            } else {
                alert("내용을 입력하세요!");
                $("#textarea").focus(); //포커스 지정
            }

        });


        //삭제
        $("#list_view_all").on("click", "#reply-delete-button", function (e) {


            var reply = $(this);
            var replyId = reply.attr("data-rno"); //#reply-delete-button data-rno추가


            $.ajax({
                type: 'delete',
                url: '/srcReply/srcDelete.do/' + replyId, //rest

                headers: {
                    "Content-Type": "application/json",
                    "X-HTTP-Method-Override": "DELETE"
                },
                dataType: 'text', //리턴타입

                error: function () {
                    // if (userId == " ") then
                    // alert("로그인 후 이용가능합니다!");

                },


                success: function (result) {
                    console.log("result: " + result);
                    if (result === 'SUCCESS') {
                        alert("삭제 되었습니다");
                        // getPageList();
                        getPage("/srcReply/" + srcId + "/" + replyPage); // rest


                    }
                },

                "change": function () {

                }
            })


        });


        //수정
        $("#list_view_all").on("click", "#reply-modify-button", function (e) { //동적생성된  선택자 #reply-modify-button에게 위임처리
            var reply = $(this);  // #reply-modify-button의 현재값 저장
            var rno; //리플게시글 번호(Reply_id)
            rno = reply.attr("data-rno");  // data-rno 속성 값 저장
            // alert(rno);
            var replytext = $('#' + rno).val(); // 동적 rno id값 저장
            // alert(replytext);

            $.ajax({
                type: 'put',
                url: '/srcReply/srcUpdate.do/' + rno, //reset

                headers: { //요청데이터타입: json , 수정: PUT
                    "Content-Type": "application/json",
                    "X-HTTP-Method-Override": "PUT"
                },
                data: JSON.stringify({ // 요청내용
                    srcId: srcId,
                    replyText: replytext,
                    replyId: rno
                }),

                dataType: 'text', //응답데이터 :text

                error: function () {
                    // if (userId == " ") then
                    // alert("로그인 후 이용가능합니다!");

                },

                success: function (result) {
                    console.log("result: " + result);
                    if (result === 'SUCCESS') {
                        alert("수정 되었습니다");
                        // getPageList();
                        getPage("/srcReply/" + srcId + "/" + replyPage);//rest호출
                    }
                }
            })
        });

    }//if

    $(".pagination").on("click", "li a", function (event) {//페이지네이션

        event.preventDefault();

        replyPage = $(this).attr("href"); //li태그 href속성값 읽어오기

        getPage("/srcReply/" + srcId + "/" + replyPage); //rest호출
        // getPageList("/srcReply/"+srcId+"/"+replyPage);

    }); //else


});


// $(function () {
//     $('html, body').css({'overflow': 'hidden', 'height': '100%'}); // 모달팝업 중 html,body의 scroll을 hidden시킴
//     $('#list_view_all').on('scroll touchmove mousewheel', function (event) { // 터치무브와 마우스휠 스크롤 방지
//         // if($(window).scrollTop() == $(document).height() - $(window).height()){
//         //     alert(111);
//         // }
//         event.preventDefault();
//         event.stopPropagation();
//         return false;
//     });
// });


// $(function () {
//     $("#list_view_all").jscroll({
//         autoTrigger: true,
//         loadingHtml: '<div class="row reply_list load_view" id="reply-more-list">' +
//         '<div class="load">' +
//         '<div class="line"></div>' +
//         '<div class="line"></div>' +
//         '<div class="line"></div>' +
//         '</div>' +
//         '</div>',
//         nextSelector: 'a.nextPage:last'
//     })
// });


$(function () {

    $("#reply-scroll").scroll(function () {
        console.log($("#reply-scroll").height());
        console.log(this.scroll);
        console.log(this.scrollTop);
    });
});


$(function () {
    $("#command-line").keydown(function (e) {

        if (e.keyCode === 13) {
            consoleSerchLog.unshift(this.value);// 배열 앞에 추가
            consoleCur = -1;
        } else if (e.keyCode === 38) {
            if (consoleSerchLog.length - 1 !== consoleCur) {
                consoleCur++;
                this.value = consoleSerchLog[consoleCur];
            }

        } else if (e.keyCode === 40) {
            if (consoleCur > 0) {
                consoleCur--;
                this.value = consoleSerchLog[consoleCur];
            } else {
                if (consoleCur === 0) {
                    consoleCur--;
                }
                this.value = ""
            }
        }
    });
});

$(function () {
    $("#console-clear").click(function () {
        editConsoleView.innerHTML = "";
    });
});

