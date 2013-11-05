<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <meta name="layout" content="first"/>

    <link rel="stylesheet" href="/first/css/landing.css">

    <script type="text/javascript">
        _settings.staticMode = true // i.e. locationProvider should not use html5Mode
    </script>
</head>

<body data-spy="scroll" data-target="#header" class="landing" id="body">

<g:render template="profile/headerPublic"></g:render>
<g:render template="/shared/header"></g:render>

<section id="content">

    <g:render template="profile/banner"></g:render>
    <g:render template="profile/employees"></g:render>
    <g:render template="profile/office"></g:render>

    <div class="row bg-white" id="2column">
        <div class="col-lg-8">
            <g:render template="profile/timeline"></g:render>
        </div>

        <div class="col-lg-4 bg-white">
            <g:render template="profile/stats"></g:render>
        </div>
    </div>
    <g:render template="profile/skills"></g:render>
    <g:render template="profile/products"></g:render>
    <g:render template="profile/map"></g:render>


    <g:render template="profile/footer"></g:render>

</section>



</body>
</html>