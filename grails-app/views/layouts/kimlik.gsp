<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html><!--<![endif]-->
<head>
    <title>Kimlik.io</title>

    <!-- Meta -->
    <meta charset="UTF-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">


    <r:require modules="kimlik,jquery"/>

    <g:layoutHead/>
    <r:layoutResources/>

    <style type="text/css">
    #currentUser {
        position: fixed;
        top: 5px;
        float: right;
        right: 0px;
        z-index: 9999;
        padding: 5px;
        width: 200px;
        background-color: rgba(188, 188, 188, 0.69);;
    }

    [ng\:cloak], [ng-cloak], .ng-cloak {
        display: none !important;
    }
    </style>

</head>

<body data-spy="scroll" data-target="#menu" ng-app="kimlik" ng-controller="UserController">
<div>

    <div id="currentUser" ng-if="isLoggedIn()" class="ng-cloak">
        <span class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <div>
                    <span class="text-info" style="margin-left: 5px">{{getLoggedInUser().username}}</span>

                    <b class="caret pull-left"></b>
                </div>
            </a>
            <ul class="dropdown-menu">
                <li><a href="/kimlik/{{getLoggedInUser().username}}">Profilime git</a></li>
                <li class="divider"></li>
                <li><a href="/kimlik/{{getLoggedInUser().username}}/positionInbox">İlginizi Çekecek Şirketler</a> </li>
                <li><a href="/kimlik/{{getLoggedInUser().username}}/positionPreferences">Şirketler Kiriterlerim</a> </li>
                <li class="divider"></li>
                <li><a href="/kimlik/{{getLoggedInUser().username}}/contacts">Adres Defterim</a> </li>
                <li><a href="/kimlik/{{getLoggedInUser().username}}/notifications">Bildirimler</a> </li>
                <li><a href="/kimlik/{{getLoggedInUser().username}}/messageInbox">Mesaj Kutum</a> </li>
                <li><a href="/kimlik/{{getLoggedInUser().username}}/profilePicture">Profil Resmim</a> </li>
                <li class="divider"></li>
                <li><g:link controller="auth" action="logout">Oturumu kapat</g:link> </li>
            </ul>
        </span>
    </div>
</div>
<!-- Start Content -->
<div class="container left-menu">

    <div id="wrapper">

        <g:render template="/kimlik/leftMenu"></g:render>

        <div id="content">
            <!-- Menu Toggle on mobile -->
            <button type="button" class="btn btn-navbar main" data-spy="affix" data-offset-top="50">
                <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>

            </button>

            <div class="separator"></div>

            %{--<g:render template="/kimlik/alerts"></g:render>--}%
            <div class="heading-buttons">
                <h2 class="glyphicons user"><i></i>${profile.name}<span
                        class="visible-desktop">| ${profile.workHistory?.lastEntity?.position}</span>
                </h2>

                <div class="buttons pull-right">
                    <a href="#" class="btn-action border-only circle glyphicons print btn-primary"><i></i></a>
                    <a href="#" class="btn-action border-only circle glyphicons download btn-primary"><i></i></a>
                </div>

                <div class="clearfix"></div>
            </div>

            <g:layoutBody></g:layoutBody>

        </div> <!-- content END-->

    </div> <!-- wrapper END-->

</div> <!-- container END-->
<script type="text/javascript" src="http://maps.google.com/maps/api/js?v=3.5&amp;sensor=false"></script>

<script>
    var themerPrimaryColor = '#71c39a';
    var config = {
        username: '${profile.username}',
        isSelfProfile: <g:isSelfProfile profile="${profile}"/>
    }
    %{--alert('${session}')--}%
</script>

<r:layoutResources/>

</body>
</html>