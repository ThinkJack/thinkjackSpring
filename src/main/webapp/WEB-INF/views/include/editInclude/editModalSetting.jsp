<%--
  Created by IntelliJ IDEA.
  User: Uri
  Date: 2017-12-08
  Time: 오후 5:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Modal -->
<div class="modal fade" id="setting" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">ThinkJack Setting</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-pills">
                    <c:if test="${((login ne null)) and (SrcVO.srcWriter eq login.userId) or
                        ((login ne null) and (SrcVO.srcId eq null)) or
                        ((login eq null) and (SrcVO.srcId ne null) and !(empty cookie.get(SrcVO.srcId))) or
                        ((login eq null) and (SrcVO.srcId eq null))}">
                        <li class="nav-item">
                            <a class="nav-link btn-light" data-toggle="tab" href="#settingInfo">Information</a>
                        </li>
                    </c:if>
                    <%--<li class="nav-item">--%>
                        <%--<a class="nav-link btn-light" data-toggle="tab" href="#settingHtml">HTML</a>--%>
                    <%--</li>--%>
                    <li class="nav-item">
                        <a class="nav-link btn-light" data-toggle="tab" href="#settingCss">CSS</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn-light" data-toggle="tab" href="#settingJS">JavaScript</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn-light" data-toggle="tab" href="#settingSet">Setting</a>
                    </li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <c:if test="${((login ne null)) and (SrcVO.srcWriter eq login.userId) or
                        ((login ne null) and (SrcVO.srcId eq null)) or
                        ((login eq null) and (SrcVO.srcId ne null) and !(empty cookie.get(SrcVO.srcId))) or
                        ((login eq null) and (SrcVO.srcId eq null))}">
                        <div class="tab-pane active container" id="settingInfo">
                            <div class="form-check">
                                <label>Code Title</label>
                                <div>
                                    <label class="form-check-label setting_info">
                                        <input class="form-control" type="text" id="src-title-modal" maxlength="50">
                                    </label>
                                </div>
                            </div>
                            <div class="form-check">
                                <label>Discription</label>
                                <div>
                                    <label class="form-check-label setting_info">
                                        <textarea class="form-control comment" id="modal-comment" rows="5"><c:out value="${SrcVO.srcComments}" default=""/></textarea>
                                    </label>
                                </div>
                            </div>
                            <div class="form-check">
                                <label>Visibility</label>
                                <div>
                                    <label class="form-check-label">
                                        <input class="form-check-input" onchange="changeSaveImg(2)" type="radio" id="visibility1" name="visibility" value="1" checked>
                                        public
                                    </label>
                                    <label class="form-check-label">
                                        <input class="form-check-input" onchange="changeSaveImg(2)" type="radio" id="visibility0" name="visibility" value="0">
                                        private
                                    </label>
                                </div>
                            </div>
                        <c:if test="${SrcVO.srcId ne null}">
                            <div class="form-check">
                                <label>Delete Source</label>
                                <div>
                                    <div class="form-check">
                                        <button type="button" class="btn btn-danger" id="src-delete">Delete</button>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        </div>

                        <%--<div class="tab-pane container" id="settingHtml">--%>
                        <div class="tab-pane container" id="settingCss">
                    </c:if>
                    <c:if test="${!(((login ne null)) and (SrcVO.srcWriter eq login.userId) or
                                ((login ne null) and (SrcVO.srcId eq null)) or
                                ((login eq null) and (SrcVO.srcId ne null) and !(empty cookie.get(SrcVO.srcId))) or
                                ((login eq null) and (SrcVO.srcId eq null)))}">
                        <%--<div class="tab-pane container active" id="settingHtml">--%>
                        <div class="tab-pane container active" id="settingCss">
                    </c:if>
                            <%--<div class="row">--%>
                                <%--<div class="row">--%>
                                    <%--<label for="htmlPreprocessor">HTML Preprocessor</label>--%>
                                <%--</div>--%>
                                <%--<div class="row">--%>
                                    <%--<select id="htmlPreprocessor" class="form-control">--%>
                                        <%--<option selected value="0">None</option>--%>
                                        <%--<option value="1">Haml</option>--%>
                                        <%--<option value="2">MarkDown</option>--%>
                                        <%--<option value="3">Slim</option>--%>
                                        <%--<option value="4">Pug</option>--%>
                                    <%--</select>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="tab-pane container" id="settingCss">--%>
                            <div class="row">
                                <%--<label for="cssPreprocessor">CSS Preprocessor</label>--%>
                                <label >CSS Preprocessor</label>
                            </div>
                            <%--<div class="row">--%>
                                <%--<select id="cssPreprocessor" class="form-control">--%>
                                    <%--<option selected>None</option>--%>
                                    <%--<option>LESS</option>--%>
                                    <%--<option>SCSS</option>--%>
                                    <%--<option>Sass</option>--%>
                                    <%--<option>Stylus</option>--%>
                                    <%--<option>PostCSS</option>--%>
                                <%--</select>--%>
                            <%--</div>--%>
                            <div class="row">
                                <label>Add External Stylesheets/Masterpieces</label>
                            </div>
                            <div class="row">
                                <p style="font-size: 9px; padding: 0px;">Any URL's added here will be added as links in order, and before the CSS in the editor.
                                    If you link to another Pen, it will include the CSS from that Pen.
                                    If the preprocessor matches, it will attempt to combine them before processing.</p>
                            </div>
                            <div class="row cdn-container" id="cdn-css">

                            </div>
                            <div class="row">
                                <div class="col align-items-end">
                                    <button type="button" class="btn btn-primary btn-sm" style="float:right; padding: 0.07rem .5rem;"
                                            onclick="cdnCssAdd('');">add</button>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane container" id="settingJS">

                            <div class="row">
                                <%--<label for="jsPreprocessor">JavaScript Preprocessor</label>--%>
                                <label>JavaScript Preprocessor</label>
                            </div>
                            <%--<div class="row">--%>
                                <%--<select id="jsPreprocessor" class="form-control">--%>
                                    <%--<option selected>None</option>--%>
                                    <%--<option>CoffeeScript</option>--%>
                                    <%--<option>LiveScript</option>--%>
                                    <%--<option>TypeScript</option>--%>
                                    <%--<option>Babel</option>--%>
                                <%--</select>--%>
                            <%--</div>--%>
                            <div class="row">
                                <label>Add External Scripts/Masterpieces</label>
                            </div>
                            <div class="row">
                                <p style="font-size: 9px; padding: 0px;">Any URL's added here will be added as scripts in order, and run before the JavaScript in the editor.
                                    You can use the URL of any other Pen and it will include the JavaScript from that Pen.</p>
                            </div>
                            <div class="row cdn-container" id="cdn-js">

                            </div>
                            <div class="row">
                                <div class="col align-items-end">
                                <button type="button" class="btn btn-primary btn-sm" style="float:right; padding: 0.07rem .5rem;"
                                        onclick="cdnJsAdd('')">add</button>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane container" id="settingSet">
                            <div class="row">
                                <label>Code Indentation</label>
                            </div>
                            <div class="row">
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
                                        SPACES
                                    </label>
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
                                        TABS
                                    </label>
                                    <label class="form-check-label" for="tab-size">
                                        <select class="custom-select" id="tab-size">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4" selected>4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                        </select>
                                        WIDTH OF INDENT
                                    </label>
                                </div>
                            </div>
                            <c:if test="${((login ne null)) and (SrcVO.srcWriter eq login.userId) or
                                    ((login ne null) and (SrcVO.srcId eq null)) or
                                    ((login eq null) and (SrcVO.srcId ne null) and !(empty cookie.get(SrcVO.srcId))) or
                                    ((login eq null) and (SrcVO.srcId eq null))}">
                                <div class="row">
                                    <label>Save Automatically</label>
                                </div>
                                <div class="row">
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input class="form-check-input" type="checkbox" id="autoSave"> AUTOSAVE
                                        </label>
                                    </div>
                                </div>
                            </c:if>

                            <div class="row">
                                <label>Auto-Updating Preview</label>
                            </div>
                            <div class="row">
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="checkbox" id="autoPreview" checked > ENABLED
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<%--<script>--%>
    <%--$(document).ready(function(){--%>
        <%--$("button").click(function(){--%>
             <%--alert($("#w3s").attr("href"));--%>
            <%--alert($("#gridRadios1").attr("name"))--%>
        <%--});--%>
    <%--});--%>
<%--</script>--%>