<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <meta name="layout" content="first"/>

    %{--https://developers.google.com/webmasters/ajax-crawling/docs/specification?csw=1--}%
    <meta name="fragment" content="!">

    %{--<r:require modules="landing,grid,gallery,prettyPhoto"/>--}%
    <r:require modules="landing,grid"/>


    <script type="text/javascript">
        _settings.staticMode = true; // i.e. locationProvider should not use html5Mode
        _settings.isCrawler = ${isCrawler};

        var _currentCompany = {
            _id: '${company._id}'
        };
    </script>

</head>

<body data-spy="scroll" data-target="#header" class="landing" id="body">

<g:render template="profile/headerPublic" model="[company: company]"></g:render>
<g:if test="${!isCrawler}"><g:render template="/shared/header"></g:render></g:if>

<section id="content">
    <g:render template="profile/banner" model="[company: company]"></g:render>
    <g:render template="profile/employees" model="[company: company, employees:employees]"></g:render>
    <g:render template="profile/office" model="[company: company]"></g:render>

    <div class="row bg-white" id="2column">
        <div class="col-md-8">
            <g:render template="profile/timeline" model="[company: company]"></g:render>
        </div>

        <div class="col-md-4 bg-white">
            <g:render template="profile/stats" model="[company: company]"></g:render>
        </div>
    </div>
    <g:render template="profile/skills" model="[company: company, skills:skills]"></g:render>
    <g:render template="profile/products" model="[company: company]"></g:render>
    <g:render template="profile/map" model="[company: company]"></g:render>


    <g:render template="profile/footer"></g:render>

</section>


<g:render template="/shared/modals"/>
</body>
</html>