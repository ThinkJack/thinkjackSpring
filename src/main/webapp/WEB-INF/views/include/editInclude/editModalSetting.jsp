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
                    <c:if test="${(SrcVO.srcId eq null) or
                        ((SrcVO.srcId ne null) and !(empty cookie.get(SrcVO.srcId)))}">
                        <li class="nav-item">
                            <a class="nav-link btn-light" data-toggle="tab" href="#settingInfo">Information</a>
                        </li>
                    </c:if>
                    <li class="nav-item">
                        <a class="nav-link btn-light" data-toggle="tab" href="#settingHTML">HTML</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn-light" data-toggle="tab" href="#settingCSS">CSS</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn-light" data-toggle="tab"href="#settingJS">JavaScript</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn-light" data-toggle="tab" href="#settingBehavior">Behavior</a>
                    </li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <c:if test="${(SrcVO.srcId eq null) or
                        ((SrcVO.srcId ne null) and !(empty cookie.get(SrcVO.srcId)))}">
                        <div class="tab-pane active container" id="settingInfo">
                            <div class="form-check">
                                <label>Code Title</label>
                                <div>
                                    <label class="form-check-label setting_info">
                                        <input class="form-control" type="text" id="src-title-modal">
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
                                        <input class="form-check-input" type="radio" id="visibility1" name="visibility" value="1" checked>
                                        public
                                    </label>
                                    <label class="form-check-label">
                                        <input class="form-check-input" type="radio" id="visibility0" name="visibility" value="0">
                                        private
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane container" id="settingHTML">
                    </c:if>
                    <c:if test="${login.userId ne SrcVO.srcWriter}">
                        <div class="tab-pane container active" id="settingHTML">
                    </c:if>
                        <label for="htmlPreprocessor">HTML Preprocessor</label>
                        <select id="htmlPreprocessor" class="form-control">
                            <option selected value="0">None</option>
                            <option value="1">Haml</option>
                            <option value="2">MarkDown</option>
                            <option value="3">Slim</option>
                            <option value="4">Pug</option>
                        </select>
                    </div>
                    <div class="tab-pane container" id="settingCSS">
                        <label for="cssPreprocessor">CSS Preprocessor</label>
                        <select id="cssPreprocessor" class="form-control">
                            <option selected>None</option>
                            <option>LESS</option>
                            <option>SCSS</option>
                            <option>Sass</option>
                            <option>Stylus</option>
                            <option>PostCSS</option>
                        </select>
                    </div>
                    <div class="tab-pane container" id="settingJS">
                        <label for="jsPreprocessor">JavaScript Preprocessor</label>
                        <select id="jsPreprocessor" class="form-control">
                            <option selected>None</option>
                            <option>CoffeeScript</option>
                            <option>LiveScript</option>
                            <option>TypeScript</option>
                            <option>Babel</option>
                        </select>
                    </div>
                    <div class="tab-pane container" id="settingBehavior">
                        <%--<label for="jsPreprocessor">Code Indentation</label>--%>
                        <label>Code Indentation</label>
                        <div>
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

                        <label>Save Automatically</label>
                        <div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="checkbox" id="autoSave" checked> AUTOSAVE
                                </label>
                            </div>
                        </div>

                        <label>Auto-Updating Preview</label>
                        <div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="checkbox" id="autoPreview" checked > ENABLED
                                </label>
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