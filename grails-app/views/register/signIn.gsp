<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Mobile first web app theme | first</title>
    <meta name="description" content="mobile first, app, web app, responsive, admin dashboard, flat, flat ui">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/first/css/bootstrap.css">
    <link rel="stylesheet" href="/first/css/font-awesome.min.css">
    <link rel="stylesheet" href="/first/css/font.css" cache="false">
    <link rel="stylesheet" href="/first/css/style.css">
    <!--[if lt IE 9]>
    <script src="/first/js/ie/respond.min.js" cache="false"></script>
    <script src="/first/js/ie/html5.js" cache="false"></script>
  <![endif]-->
</head>

<body>
<!-- header -->
<header id="header" class="navbar bg bg-black">
    <a href="docs.html" class="btn btn-link pull-right m-t-mini"><i class="icon-question icon-xlarge text-default"></i>
    </a>
    <a class="navbar-brand" href="/">kimlik</a>
</header>
<!-- / header -->
<section id="content">
    <div class="main padder">
        <div class="row">
            <div class="col-lg-4 col-lg-offset-4 m-t-large">
                <section class="panel">
                    <header class="panel-heading text-center">
                        Sign in
                    </header>

                    <form action="" class="panel-body">
                        <div class="line line-dashed"></div>

                        <oauth:connect provider="facebook" id="facebook-connect-link"
                                       class="btn btn-facebook btn-block m-b-small"><i
                                class="icon-facebook pull-left"></i>Facebook ile giriş yap</oauth:connect>

                        <oauth:connect provider="twitter" id="twitter-connect-link"
                                       class="btn btn-twitter btn-block"><i
                                class="icon-twitter pull-left"></i>Twitter ile giriş yap</oauth:connect>

                        <oauth:connect provider="google" id="google-connect-link"
                                       class="btn btn-gplus btn-block"><i
                                class="icon-google-plus pull-left"></i>Google ile giriş yap</oauth:connect>

                        <oauth:connect provider="linkedin" id="linkedin-connect-link"
                                       class="btn btn-linkedin btn-block"><i
                                class="icon-linkedin pull-left"></i>Linkedin ile giriş yap</oauth:connect>


                        <div class="line line-dashed"></div>

                        <p class="text-muted text-center"><small>Do not have an account?</small></p>
                        <a href="/register/signUp" target="_self" class="btn btn-white btn-block">Create an account</a>
                    </form>
                </section>
            </div>
        </div>
    </div>
</section>
<g:render template="/shared/footer"/>

<script src="/first/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/first/js/bootstrap.js"></script>
<!-- app -->
<script src="/first/js/app.js"></script>
<script src="/first/js/app.plugin.js"></script>
<script src="/first/js/app.data.js"></script>
</body>
</html>