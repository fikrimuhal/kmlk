<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <meta name="layout" content="first"/>

    %{--https://developers.google.com/webmasters/ajax-crawling/docs/specification?csw=1--}%
    <meta name="fragment" content="!">

    %{--<r:require modules="landing,grid,gallery,prettyPhoto"/>--}%
    <r:require modules="landing,grid"/>


    <script type="text/javascript">
        _settings.staticMode = true // i.e. locationProvider should not use html5Mode
    </script>
</head>

<body data-spy="scroll" data-target="#header" class="landing" id="body">

<g:render template="profile/headerPublic" model="[company:company]"></g:render>
<g:render template="/shared/header"></g:render>

<section id="content">

    <g:render template="profile/banner" model="[company:company]"></g:render>
    <g:render template="profile/employees" model="[company:company]"></g:render>
    <g:render template="profile/office" model="[company:company]"></g:render>

    <div class="row bg-white" id="2column">
        <div class="col-md-8">
            <g:render template="profile/timeline" model="[company:company]"></g:render>
        </div>

        <div class="col-md-4 bg-white">
            <g:render template="profile/stats" model="[company:company]"></g:render>
        </div>
    </div>
    <g:render template="profile/skills" model="[company:company]"></g:render>
    <g:render template="profile/products" model="[company:company]"></g:render>
    <g:render template="profile/map" model="[company:company]"></g:render>


    <g:render template="profile/footer"></g:render>

</section>



</body>
</html>