<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="kimlik"/>
</head>

<body>

<div class="separator line"></div>
<g:render template="/kimlik/personalInfo" model="[profile:profile]"></g:render>
<g:render template="/kimlik/followMe" model="[profile:profile]"></g:render>
<g:render template="/kimlik/employment" model="[profile:profile]"></g:render>
<g:render template="/kimlik/skills"  model="[profile:profile]"></g:render>
<g:render template="/kimlik/education" model="[profile:profile]"></g:render>
%{--<g:render template="/kimlik/testimonials"></g:render>--}%
%{--<g:render template="/kimlik/portfolio"></g:render>--}%
<g:render template="/kimlik/contact"  model="[profile:profile]"></g:render>
%{--<g:render template="/kimlik/other"></g:render>--}%




</body>
</html>
