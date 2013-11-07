<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="first"/>
    <r:require modules="landing"/>


    <script type="text/javascript">
        _settings.staticMode = true // i.e. locationProvider should not use html5Mode
    </script>
</head>


<body data-spy="scroll" data-target="#header" class="landing">
<!-- header -->
<header id="header" class="navbar navbar-fixed-top" data-spy="affix" data-offset-top="1">
    <div class="container">
        <a class="navbar-brand" href="#">kimlik</a>

        <p class="navbar-text pull-left text-muted hidden-xs"><small><em>Kimlik.IO / Kurumsal.IO</em></small></p>
        <ul class="nav navbar-nav pull-right hidden-xs">
            <li class="hide">
                <a href="#header" target="_self">Ev</a>
            </li>
            <li>
                <a href="#about" target="_self">Hakkında</a>
            </li>
            <li>
                <a href="#features" target="_self">Nedir</a>
            </li>
            <li>
                <a href="#screenshot" target="_self">Örnekler</a>
            </li>
        </ul>
    </div>
</header>
<g:render template="/shared/header"></g:render>

<section id="content">
    <div class="main-visual">
        <div class="bg-inverse">
            <div class="container text-center">
                <h1 class="animated fadeInUp">Startup ve Kisisel kariyer yonetim yazilimi<br> Some thing is seriously wrong with this landing page!
                </h1>

                <p>
                    <a href="/register/signIn" target="_self"
                       class="btn btn-lg btn-danger animated fadeInLeft m-l m-r m-b">Giriş yap</a>
                    <a href="/register/signIn" target="_self"
                       class="btn btn-lg btn-primary animated fadeInRight m-l m-r m-b">Kayıt ol</a>
                </p>
            </div>
        </div>
    </div>

    <div id="about">
        <div class="container">
            <p>&nbsp;</p>

            <div class="text-center m-large">
                <h2 class="font-thin">Hemde bedava!</h2>

                <p>Ilk 24 saat ucretsizdir, daha sonra dakika uzerinden 3$ dan hesaplanacaktir.</p>
            </div>

            <div class="text-center">
                <g:img uri="/first/images/responsive.png"/>
            </div>

            <div class="row m-large">
                <div class="col-lg-6 col-sm-6 media">
                    <span class="btn btn-circle btn-lg btn-default pull-left"><i class="icon-mobile-phone"></i></span>

                    <div class="media-body">
                        <h3 class="m-t-none">Cok zevkli</h3>

                        <p>first contains many mobile app widgets and components, it's fully responsive, it can run on all the size of the screen.</p>
                    </div>
                </div>

                <div class="col-lg-6 col-sm-6 media m-t-none">
                    <span class="btn btn-circle btn-lg btn-default pull-left"><i class="icon-signal"></i></span>

                    <div class="media-body">
                        <h3 class="m-t-none">Mukemmel</h3>

                        <p>first also can be used as admin dashboard, it has tables, charts and other useful components for admin management.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="bg-primary" id="features">
        <div class="container">
            <p>&nbsp;</p>

            <div class="text-center m-large">
                <h2 class="font-thin">Nedir?</h2>

                <p>Ouuukk!!</p>
            </div>

            <div class="row m-large">
                <div class="col-lg-4 col-sm-4">
                    <p class="text-center"><span class="btn btn-circle btn-lg btn-white"><i class="icon-bold"></i>
                    </span></p>

                    <div>
                        <h3 class="text-center">Kontrol Paneli</h3>

                        <p>This project is based on Bootstrap 3. the sleek, intuitive, and powerful mobile-first front-end framework for faster and easier web development.</p>
                    </div>
                </div>

                <div class="col-lg-4 col-sm-4">
                    <p class="text-center"><span class="btn btn-circle btn-lg btn-warning"><i class="icon-bolt"></i>
                    </span></p>

                    <div>
                        <h3 class="text-center">Online Hizmetler</h3>

                        <p>We only choose the lightweight plugins, but with rich functions. we use tiny components, css and js size is first consideration.</p>
                    </div>
                </div>

                <div class="col-lg-4 col-sm-4">
                    <p class="text-center"><span class="btn btn-circle btn-lg btn-danger"><i class="icon-html5"></i>
                    </span></p>

                    <div>
                        <h3 class="text-center">Kurumsal Destek</h3>

                        <p>first use HTML5 and CSS3 to build the components. the pages use header, nav, section to build the layout. this project have a good color scheme, can easy to change.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div>
        <div class="container">
            <div class="row m-large">
                <div class="col-lg-4 col-sm-4">
                    <p class="text-center"><span class="btn btn-circle btn-lg btn-primary"><i class="icon-tablet"></i>
                    </span></p>

                    <div>
                        <h3 class="text-center">100% Mobil</h3>

                        <p>This project is fully responsive, but it's mobile first. it provide the off screen nav, and almost all the widgets are copatible to all the screen sizes.</p>
                    </div>
                </div>

                <div class="col-lg-4 col-sm-4">
                    <p class="text-center"><span class="btn btn-circle btn-lg btn-default"><i
                            class="icon-briefcase"></i></span></p>

                    <div>
                        <h3 class="text-center">Şirketinizi Web Sitesi</h3>

                        <p>We build many components for your project need. also they are extensible and easy to customize.</p>
                    </div>
                </div>

                <div class="col-lg-4 col-sm-4">
                    <p class="text-center"><span class="btn btn-circle btn-lg btn-success"><i class="icon-refresh"></i>
                    </span></p>

                    <div>
                        <h3 class="text-center">Kişisel Web Siteniz</h3>

                        <p>We will keep update this project, we will keep adding new widgets and components.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="bg-light" id="screenshot">
        <div class="container gallery">
            <div class="text-center m-large">
                <h2 class="font-thin">Örnekler</h2>

                <p>todo: link yerine screen shot daha guzel olur</p>

                <p>Kimlik.IO! yu kullanan bir kaç şirket; Aşağida ki linkler şirketlerin profil sayfasina gider. <small>(geri gelmeyi unutmayın)</small>
                </p>
            </div>

            <div class="row m-large gallery">
                <div class="col-lg-3 col-6">
                    <a href="http://kimliklocal.fikrimuhal.com" class="thumbnail" target="_blank"><g:img
                            uri="/images/photos/fikrimuhal_logo_medium.png"/></a>
                </div>

                <div class="col-lg-3 col-6">
                    <a href="${resource(dir: 'first/images', file: 'render-2.jpg')}" class="thumbnail"
                       target="_blank"><g:img uri="/first/images/render-2-thumb.jpg"/></a>
                </div>

                <div class="col-lg-3 col-6">
                    <a href="${resource(dir: 'first/images', file: 'render-3.jpg')}" class="thumbnail"
                       target="_blank"><g:img uri="/first/images/render-3-thumb.jpg"/></a>
                </div>

                <div class="col-lg-3 col-6">
                    <a href="${resource(dir: 'first/images', file: 'render-4.jpg')}" class="thumbnail"
                       target="_blank"><g:img uri="/first/images/render-4-thumb.jpg"/></a>
                </div>
            </div>
        </div>
    </div>

    <div class="bg-inverse clearfix">
        <div class="container text-center m-large">
            <h2 class="font-thin">Teşekkürler size!</h2>

            <p>&nbsp;</p>
            <a href="#content"><i class="icon-arrow-up"></i><br>Tepeye dön</a>
        </div>
    </div>
</section>
<!-- / header -->

</body>

</html>

