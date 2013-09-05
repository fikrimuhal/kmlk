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
    <li><a href="/company/people/ilgaz">Ilgaz Şumnulu</a></li>
</ul>

<h3>Ilgaz Şumnulu</h3>

<div class="row-fluid">

    <div class="span4">
        <g:render template="/s/profile/picture"></g:render>
        <g:render template="/s/profile/links"></g:render>

    </div>

    <div class="span7">

        <g:render template="/s/profile/contact"></g:render>
        <g:render template="/s/profile/skills"></g:render>
        <p class="separator text-center"><i class="icon-ellipsis-horizontal icon-3x"></i></p>

        <g:render template="/s/profile/certifates"></g:render>



        <div class=" widget widget-heading-simple widget-body-white">
            <div class="widget-head">
                <h4 class="heading">TODO:</h4>
            </div>

            <div class="widget-body">
                <div class="row-fluid">
                    <div class="span9">
                        <ul>
                            <li>Kisinin timelini</li>
                            <li>Kisinin sirketdeki pozisyonu</li>
                            <li>Maasi</li>
                            <li>Degerlendirme / puan</li>
                            <li>telefon numarasi, email adresi</li>
                            <li>Sosyal networkler, facebook, google, twitter, github, stackOverflow, deviantArt, etc.</li>
                            <li>google maps.(eger yetkisiz biri bakiyor ise noise ekle)</li>
                            <li>CV</li>
                            <li>Referanslar</li>
                            <li>Timeline (egitim, diger sirketler etc...)</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- // Row END -->

</body>
</html>