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
    <li><a href="/dashboard" class="glyphicons dashboard"><i></i> Şirket</a></li>
    <li class="divider"><i class="icon-caret-right"></i></li>
    <li><a href="/">Projeler</a></li>
    <li class="divider"><i class="icon-caret-right"></i></li>
    <li><a href="/">Proje listesi</a></li>
</ul>

<div class="heading-buttons">
    <h1>Projeler <span>Proje listesi</span></h1>

    <div class="buttons pull-right">
        <a href="" class="btn btn-primary btn-icon glyphicons circle_plus"><i></i>Yeni proje ekle</a>
    </div>

    <div class="clearfix"></div>
</div>

<div class="separator bottom"></div>

<div class="innerLR">

    <div class="">
        <table class="table table-striped table-vertical-center table-projects table-bordered">
            <thead>
            <tr>
                <th colspan="2">Project</th>
                <th width="100" class="center"></th>
                <th width="100" class="center"></th>
                <th width="140" class="center"></th>
                <th width="120" class="center"></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td width="80" class="center"><span class="thumb"><img
                        src="http://2.s3.envato.com/files/50444644/80-avatar.jpg" alt=""/></span></td>
                <td class="important">Acikdemokrasi.org</td>
                <td class="center stats"><span>Baslangic (Gün)</span><span class="count">65</span></td>
                <td class="center stats"><span>Harcanan</span><span class="count">1,365 TL</span></td>
                <td class="center stats"><span>Kazanç</span><span class="count">0</span></td>
                <td class="center"><button type="button" class="btn btn-default">Manage</button></td>
            </tr>
            <tr>
                <td width="80" class="center"><span class="thumb"><img
                        src="http://0.s3.envato.com/files/52347478/admin-avatar-12.jpg" alt=""/></span></td>
                <td class="important">Makale Pazarı</td>
                <td class="center stats"><span>Baslangic (Gün)</span><span class="count">97</span></td>
                <td class="center stats"><span>Harcanan</span><span class="count">400 TL</span></td>
                <td class="center stats"><span>Kazanç</span><span class="count">0</span></td>
                <td class="center"><button type="button" class="btn btn-default">Manage</button></td>
            </tr>
            <tr>
                <td width="80" class="center"><span class="thumb"><img
                        src="http://2.s3.envato.com/files/50868169/avatar80.jpg" alt=""></span></td>
                <td class="important">Startup Services</td>
                <td class="center stats"><span>Baslangic (Gün)</span><span class="count">8</span></td>
                <td class="center stats"><span>Harcanan</span><span class="count">0 TL</span></td>
                <td class="center stats"><span>Kazanç</span><span class="count">0</span></td>
                <td class="center"><button type="button" class="btn btn-default">Manage</button></td>
            </tr>
            </tbody>
        </table>

    </div>
</div>

<div class="innerLR widget widget-heading-simple widget-body-white">
    <div class="widget-head">
        <h4 class="heading">TODO:</h4>
    </div>
    <div class="widget-body">
        <div class="row-fluid">
            <div class="span9">
                <ul>
                    <li>aaa</li>
                    <li>aaa</li>
                    <li>aaa</li>
                    <li>aaa</li>
                </ul>
            </div>
        </div>
    </div>
</div>




</body>
</html>