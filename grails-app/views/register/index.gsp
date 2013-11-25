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
                <h1 class="animated fadeInUp">Kurumsal ve Kisisel Saas hizmetleri <br> Some thing is seriously wrong with this landing page!
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

                <p>Ilk 24 saat ucretsizdir, daha sonra dakika uzerinden 2 elma ile hesaplanacaktir.</p>

            </div>
            <div class="text-center">
                <g:img  dir="images" file="kimlikapple1.png"/>
            </div>

            <div class="row m-large">
                <div class="col-lg-6 col-sm-6 media">
                    <span class="btn btn-circle btn-lg btn-default pull-left"><i class="icon-mobile-phone"></i></span>

                    <div class="media-body">
                        <h3 class="m-t-none">Cok zevkli</h3>

                        <p>Siz isinizi yapin bizde o daginizi bozalim....</p>
                    </div>
                </div>

                <div class="col-lg-6 col-sm-6 media m-t-none">
                    <span class="btn btn-circle btn-lg btn-default pull-left"><i class="icon-signal"></i></span>

                    <div class="media-body">
                        <h3 class="m-t-none">Mukemmel</h3>

                        <p>Ougggkk!Ougggkk!Ougggkk!Ougggkk!Ougggkk! Ougggkk!Ougggkk!</p>
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

                        <p>Bootstrap 3. sagolsun hemde mobile first</p>
                    </div>
                </div>

                <div class="col-lg-4 col-sm-4">
                    <p class="text-center"><span class="btn btn-circle btn-lg btn-warning"><i class="icon-bolt"></i>
                    </span></p>

                    <div>
                        <h3 class="text-center">Online Hizmetler</h3>

                        <p>Super Ouuugkk! Tam bir product market fit, oleyyy oleyyyy blah blah yazi yazi calis calis all work no play makes </p>
                    </div>
                </div>

                <div class="col-lg-4 col-sm-4">
                    <p class="text-center"><span class="btn btn-circle btn-lg btn-danger"><i class="icon-html5"></i>
                    </span></p>

                    <div>
                        <h3 class="text-center">Kurumsal Destek</h3>

                        <p>hemde 3 ay dan kisa surede bitti superr kudos kudos oleyyyy</p>
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

                        <p>Hemde programcilar icin api destegi voooo </p>
                    </div>
                </div>

                <div class="col-lg-4 col-sm-4">
                    <p class="text-center"><span class="btn btn-circle btn-lg btn-default"><i
                            class="icon-briefcase"></i></span></p>

                    <div>
                        <h3 class="text-center">Şirketinizi Web Sitesi</h3>

                        <p>Ouuugk!</p>
                    </div>
                </div>

                <div class="col-lg-4 col-sm-4">
                    <p class="text-center"><span class="btn btn-circle btn-lg btn-success"><i class="icon-refresh"></i>
                    </span></p>

                    <div>
                        <h3 class="text-center">Kişisel Web Siteniz</h3>

                        <p>şirket;Kimlik.IO! yu kullanan bir kaç  Aşağida ki Kimlik.IO! yu kullanan bir kaç linkler şirketlerin profil sayfasina gider..</p>
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
                    <a href="${resource(dir: 'images', file: '1.png')}" class="thumbnail"
                       target="_blank"><g:img uri="/images/1.png"/></a>
                </div>
                <div class="col-lg-3 col-6">
                    <a href="${resource(dir: 'images', file: '2.png')}" class="thumbnail"
                       target="_blank"><g:img uri="/images/2.png"/></a>
                </div>
                <div class="col-lg-3 col-6">
                    <a href="${resource(dir: 'images', file: '5.png')}" class="thumbnail"
                       target="_blank"><g:img uri="/images/5.png"/></a>
                </div>
                <div class="col-lg-3 col-6">
                    <a href="${resource(dir: 'images', file: '4.png')}" class="thumbnail"
                       target="_blank"><g:img uri="/images/4.png"/></a>
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

