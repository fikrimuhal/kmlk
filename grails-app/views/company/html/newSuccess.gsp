<%--
  Created by IntelliJ IDEA.
  User: sumnulu
  Date: 10/14/13
  Time: 5:53 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

<div class="page-header text-center">

    <h2>Tebrikler <small><br/>Yeni Şirket Sayfanız Oluşturuldu</small></h2>

    <p>

        <a class="btn btn-lg btn-primary" href="/company/{{company_name}}/settings">
            <i class="fa fa-cogs fa-2x pull-left"></i> Sirket sayfanızı<br>Düzenleyin</a>
        yada
        <a class="btn btn-lg btn-info" target="_self" href="/company/profile/{{company_name}}">
            <i class="fa fa-flag fa-2x pull-left"></i> Sirket sayfanızı<br>bakın</a>
    </p>

</div>

</body>
</html>