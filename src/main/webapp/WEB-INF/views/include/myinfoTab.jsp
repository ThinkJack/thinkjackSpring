<jsp:include page="header.jsp" flush="false"/>
<style>
    .tab-pane {
        padding-top: 20px;
    }
</style>
<div class="container" style="padding-top: 200px">
    <ul id="myTab" class="nav nav-tabs" role="tablist">
        <li role="presentation" class="Account_information">
            <a href="/user/myinfo" id="Account_information" role="tab">Account_information</a></li>
        <li role="presentation" class="Board">
            <a href="/user/myBoard" role="tab" id="Board">Board</a></li>
        <li role="presentation" class="Source_code">
            <a href="/user/mySourceCode" role="tab" id="Source_code">Source_code</a></li>

    </ul>
    <div id="myTabContent" class="tab-content">
