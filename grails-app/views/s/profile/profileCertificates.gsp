<%--
  Created by IntelliJ IDEA.
  User: sumnulu
  Date: 8/20/13
  Time: 7:29 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>

<ul class="breadcrumb">
    <li>Bulunduğunuz sayfa</li>
    <li><a href="/company" class="glyphicons home"><i></i> Fikrimuhal</a></li>
    <li class="divider"><i class="icon-caret-right"></i></li>
    <li><a href="/company/people">Çalışanlar</a></li>
    <li class="divider"><i class="icon-caret-right"></i></li>
    <li><a href="/profile/ilgaz">Ilgaz Şumnulu</a></li>
    <li class="divider"><i class="icon-caret-right"></i></li>
    <li><a href="/profile/ilgaz/certificates">Sertifikalar</a></li>
</ul>

<h3>Ilgaz Şumnulu</h3>

<div class="row-fluid">

    <div class="span4">
        <g:render template="/s/profile/picture"></g:render>
        <g:render template="/s/profile/links"></g:render>

    </div>

    <div class="span7">

        <g:render template="/s/profile/certifates"></g:render>

    </div>

</div>
<!-- // Row END -->

</body>
</html>