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
    <li><a href="/">Servisler</a></li>
    <li class="divider"><i class="fa fa-caret-right"></i></li>
    <li><a href="/avukat">Avukatlar</a></li>
</ul>

<div class="heading-buttons">
    <h1>Avukat<span>listesi</span></h1>

    <div class="buttons pull-right">
        <a href="" class="btn btn-primary btn-icon glyphicons circle_edit"><i></i>Değistir</a>
    </div>

    <div class="clearfix"></div>
</div>

<div class="separator bottom"></div>


<div class="innerLR  innerB widget widget-heading-simple widget-body-white">
    <div class="row-fluid">
        <div class="span9">
            <g:render template="/s/avukat/list"/>
        </div>

        <div class="span3">

            <div class="separator bottom"></div>

            <g:render template="/s/avukat/filter"/>
            <g:render template="/s/avukat/sideNote"/>
        </div>
    </div>
</div>

<div class="innerLR  innerB widget widget-heading-simple widget-body-white">

    <div class="widget-head">
        <h4 class="heading">TODO:</h4>
    </div>

    <div class="widget-body">
        <div class="row-fluid">
            <div class="span9">
                <ul>

                    <li></li>
                </ul>
            </div>
        </div>
    </div>
</div>

</body>
</html>