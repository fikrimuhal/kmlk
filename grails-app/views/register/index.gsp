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
                <h1 class="animated fadeInUp">Kurumsal ve Kisisel Saas Araçlar<br> <small>Pre-alpha release</small>
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

                <p>Beta teste kayıt olanlar bütun servisleri 1 yıl bedava kullanabilecek . ..evet şuanda test aşamasındayız :)</p>

            </div>

            <div class="text-center">
                <g:img dir="images/frontpage" file="kimlikapple2_1140_580.png"/>
            </div>

            <div class="row m-large">
                <div class="col-lg-6 col-sm-6 media">
                    <span class="btn btn-circle btn-lg btn-default pull-left"><i class="fa fa-users"></i></span>

                    <div class="media-body">
                        <h3 class="m-t-none">Kurumlar için</h3>

                        <p>Şirket web siteniz, insan kaynakları, yetenek yonetimi, email adresiniz </p>
                    </div>
                </div>

                <div class="col-lg-6 col-sm-6 media m-t-none">
                    <span class="btn btn-circle btn-lg btn-default pull-left"><i class="fa fa-user"></i></span>

                    <div class="media-body">
                        <h3 class="m-t-none">Bireyler için</h3>

                        <p>Web siteniz, online CV, yetenek ve kariyer yönetimi</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="bg-primary" id="features">
        <div class="container">
            <p>&nbsp;</p>

            <div class="text-center m-large">
                <h2 class="font-thin">5 Dakika İçinde Web Siteniz Hazır</h2>

                <p>Kurumsal ve Bireysel</p>
            </div>

            <div class="row m-large">
                <div class="col-lg-4 col-sm-4">
                    <p class="text-center"><span class="btn btn-circle btn-lg btn-white"><i class="fa fa-rss"></i>
                    </span></p>

                    <div>
                        <h3 class="text-center">Kendi Alan Adınız</h3>

                        <p>Arama motorları ve sosyal medya için optimize edilmiş ve kendi alan adınızı kullandığınız kurumsal yada kişel web siteniz 5 dakika için de yayında olsun.</p>
                    </div>
                </div>

                <div class="col-lg-4 col-sm-4">
                    <p class="text-center"><span class="btn btn-circle btn-lg btn-danger"><i class="fa fa-tablet"></i>
                    </span></p>

                    <div>
                        <h3 class="text-center">Mobil Cihaz Uyumlu</h3>

                        <p>IPhone, IPad ve diğer akkıllı telefonlar ile kusursuz uyum. Ziyaretcileriniz ekran çözürlüğüne göre kendini adapde eden responsive tasarım! </p>
                    </div>
                </div>

                <div class="col-lg-4 col-sm-4">
                    <p class="text-center"><span class="btn btn-circle btn-lg btn-twitter"><i class="fa fa-cloud"></i>
                    </span></p>

                    <div>
                        <h3 class="text-center">Bulut Tabanlı</h3>

                        <p>Web siteniz dünyanın 14 farklı lokasyonundan yayınlama imkanı. Ziyaretcileriniz dünyanin neresinde olursa olsun size en hızlı yoldan ulaşabilecek. Yada aynı anda yüzlerce ziyaretciniz olsa bile.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="bg-white">
        <div class="container">
            <p>&nbsp;</p>

            <div class="text-center m-large">
                <h2 class="font-thin">Entegre HR Çözümü</h2>

                <p>Kurumsal</p>
            </div>
            <div class="row m-large">
                <div class="col-lg-4 col-sm-4">
                    <p class="text-center"><span class="btn btn-circle btn-lg btn-info"><i class="fa fa-link"></i>
                    </span></p>

                    <div>
                        <h3 class="text-center">Web Sitenize Entegre çözüm</h3>

                        <p>Web Sitenizden aday başvuru kabulu. Şirketiniz de çalışmak isteyenler zahmetsizce başvuru yapabilecek.</p>
                    </div>
                </div>

                <div class="col-lg-4 col-sm-4">
                    <p class="text-center"><span class="btn btn-circle btn-lg btn-primary"><i class="fa fa-inbox"></i></span></p>

                    <div>
                        <h3 class="text-center">Aday Takip Sistemi</h3>

                        <p>Adayları işe alma sürecinde zahmetsizce takip edin. Kolayca aday havuzu oluşturun ve pozisyona göre en uygun adayi seçin. </p>
                    </div>
                </div>

                <div class="col-lg-4 col-sm-4">
                    <p class="text-center"><span class="btn btn-circle btn-lg btn-warning"><i class="fa fa-flip-vertical fa-filter"></i>
                    </span></p>

                    <div>
                        <h3 class="text-center">Detaylı Raporlama</h3>

                        <p>Analatik olarak hesaplanan aday yetenekleri, şirketinize harita üzerinde uzaklığı, iletişim bilgileri, iş ve eğitim geçmişi, güncel tutulan bilgiler, ve diğer raporlama araçları</p>
                    </div>
                </div>
            </div>
            <div class="row m-large">
                <div class="col-lg-4 col-sm-4">
                    <p class="text-center"><span class="btn btn-circle btn-lg btn-danger"><i class="fa fa-bullseye"></i>
                    </span></p>

                    <div>
                        <h3 class="text-center">Akıllı İş İlanı</h3>

                        <p>Hızlıca iş ilanı verin. Aradığınız yeterlilikleri girin, maaş aralığı ekleyin ve açtığınız ilanı pozisyona en uygun adaylar görsün.</p>
                    </div>
                </div>

                <div class="col-lg-4 col-sm-4">
                    <p class="text-center"><span class="btn btn-circle btn-lg btn-inverse"><i
                            class="fa fa-bullhorn"></i></span></p>

                    <div>
                        <h3 class="text-center">Şirketinizi Tanıtın</h3>
                        <p>İlanda adaylar, şirketinizin fotoğraflarını, çalışanlarınızı, yaptığınız işleri, hangi alanlarda uzman olduğunuzu, beklentilerinizi görsün.</p>

                    </div>
                </div>

                <div class="col-lg-4 col-sm-4">
                    <p class="text-center"><span class="btn btn-circle btn-lg btn-info"><i class="fa fa-tasks"></i>
                    </span></p>

                    <div>
                        <h3 class="text-center">Yetenek Karşılaştırması</h3>

                        <p>Şirketinizde çalışanların yetenek ve yeterliliklerini yeni adaylar ile yetenek bazında karşılaştırın ve işe alım sürecinde analatik ve doğru karar verin</p>
                    </div>
                </div>
            </div>
        </div>
    </div>


<div class="bg-lighter" >
    <div class="container">
        <p>&nbsp;</p>

        <div class="text-center m-large">
            <h2 class="font-thin">Kişisel Web Siteniz ve CV'niz</h2>

            <p>Bireysel</p>
        </div>

        <div class="row m-large">
            <div class="col-lg-4 col-sm-4">
                <p class="text-center"><span class="btn btn-circle btn-lg btn-primary"><i class="fa fa-file"></i>
                </span></p>

                <div>
                    <h3 class="text-center">Online CV</h3>

                    <p>Sizi arayanlara: Bilgi ve yeteneklerinizi, iş ve eğitim geçmişinizi, güncel iletişim bilgilerinizi, sizin hakkınızda bilinmesi gerekli bilgileri gösterin.</p>
                </div>
            </div>

            <div class="col-lg-4 col-sm-4">
                <p class="text-center"><span class="btn btn-circle btn-lg btn-danger"><i class="fa fa-heart"></i>
                </span></p>

                <div>
                    <h3 class="text-center">İdeal İşi Bulun</h3>

                    <p>Çalışmak istediğiniz şirketlerin kriterlerini girin. Örneğin: evinize uzaklığı, çalışan sayısı, faliyet alanları, minimum maaş, kazanacağınız yeni yetenek ve tecrübe miktarı, şirket fotoğrafları, vb.</p>
                </div>
            </div>

            <div class="col-lg-4 col-sm-4">
                <p class="text-center"><span class="btn btn-circle btn-lg btn-white"><i class="fa fa-coffee"></i>
                </span></p>

                <div>
                    <h3 class="text-center">Bulut Tabanlı</h3>

                    <p>Web siteniz dünyanın 14 farklı lokasyonundan yayınlama imkanı. Ziyaretcileriniz dünyanin neresinde olursa olsun size en hızlı yoldan ulaşabilecek. Yada aynı anda yüzlerce ziyaretciniz olsa bile.</p>
                </div>
            </div>
        </div>

        %{--<div class="row m-large">--}%


            %{--<div class="col-lg-4 col-sm-4">--}%
                %{--<p class="text-center"><span class="btn btn-circle btn-lg btn-danger"><i class="fa fa-tablet"></i>--}%
                %{--</span></p>--}%

                %{--<div>--}%
                    %{--<h3 class="text-center">Mobil Cihaz Uyumlu</h3>--}%

                    %{--<p>IPhone, IPad ve diğer akkıllı telefonlar ile kusursuz uyum. Ziyaretcileriniz ekran çözürlüğüne göre kendini adapde eden responsive tasarım! </p>--}%
                %{--</div>--}%
            %{--</div>--}%

            %{--<div class="col-lg-4 col-sm-4">--}%
                %{--<p class="text-center"><span class="btn btn-circle btn-lg btn-twitter"><i class="fa fa-cloud"></i>--}%
                %{--</span></p>--}%

                %{--<div>--}%
                    %{--<h3 class="text-center">Bulut Tabanlı</h3>--}%

                    %{--<p>Web siteniz dünyanın 14 farklı lokasyonundan yayınlama imkanı. Ziyaretcileriniz dünyanin neresinde olursa olsun size en hızlı yoldan ulaşabilecek. Yada aynı anda yüzlerce ziyaretciniz olsa bile.</p>--}%
                %{--</div>--}%
            %{--</div>--}%
            %{--<div class="col-lg-4 col-sm-4">--}%
                %{--<p class="text-center"><span class="btn btn-circle btn-lg btn-white"><i class="fa fa-rss"></i>--}%
                %{--</span></p>--}%

                %{--<div>--}%
                    %{--<h3 class="text-center">Kendi Alan Adınız</h3>--}%

                    %{--<p>Arama motorları ve sosyal medya için optimize edilmiş ve kendi alan adınızı kullandığınız  kişel web siteniz 5 dakika için de yayında olsun.</p>--}%
                %{--</div>--}%
            %{--</div>--}%
        %{--</div>--}%
    </div>
</div>

    <div class="bg-light" id="screenshot">
        <div class="container gallery ">
            <div class="text-center m-large">
                <h2 class="font-thin">Örnekler</h2>

                %{--<p>todo: link yerine screen shot daha guzel olur, ve modal da gösterilmeli</p>--}%
                %{--<p>todo: bu sayfa da cok tekrar eden eleman var</p>--}%

                %{--<p>Kimlik.IO! yu kullanan bir kaç şirket; Aşağida ki linkler şirketlerin profil sayfasina gider. <small>(geri gelmeyi unutmayın)</small>--}%
                %{--</p>--}%
            </div>

            <div class="row m-large gallery  ">
                <div class="col-lg-3 col-md-3">
                    <a href="http://fikrimuhal.com" class="thumbnail" target="_blank"><g:img  style="height:197px; "
                            uri="/images/photos/fikrimuhal_logo_medium.png"/></a>
                </div>


                <div class="col-lg-3 col-md-3">
                    <a href="${resource(dir: 'images/frontpage', file: 'screenshot_2_241_197.png')}" class="thumbnail"
                       target="_blank"><g:img uri="/images/frontpage/screenshot_2.png"/></a>
                </div>

                <div class="col-lg-3 col-md-3">
                    <a href="${resource(dir: 'images/frontpage', file: 'screenshot_5_241_197.png')}" class="thumbnail"
                       target="_blank"><g:img uri="/images/frontpage/screenshot_5.png/"/></a>
                </div>

                <div class="col-lg-3 col-md-3">
                    <a href="${resource(dir: 'images/frontpage', file: 'screenshot_4_241_197.png')}" class="thumbnail"
                       target="_blank"><g:img uri="/images/frontpage/screenshot_4.png"/></a>
                </div>

            </div>

        </div>
    </div>

    <div class="bg-inverse clearfix">
        <div class="container text-center m-large">
            <h2 class="font-thin">Tekrar merhaba ve teşekkürler,</h2>

            <div class="row">

                <div class="col-lg-offset-3 col-lg-6 font-thin">

                    <i class="fa fa-quote-left fa-2x pull-left"></i>
                    <i class="fa fa-quote-right fa-2x pull-right"></i>

                    Kimlik.Io şu anda test asamasindadır.
                    Üye olduktan sonra facebook grubumuza katılıp,
                    bizim ile olmasını istediğiniz özellikler yada karşılaştığınız hatalar hakkında sohbet edebilirsiniz,
                    yada herhangi başka bir konu hakkında.

                    <br/>
                </div>
            </div>

            <p>&nbsp;</p>
            <a href="https://www.facebook.com/groups/kimlik.io/" target="_blank" class="text-primary"><i class="fa fa-users"></i><br>Facebook grubu</a>

        </div>

        <g:render template="/shared/footer"></g:render>

    </div>
</section>
<!-- / header -->
<g:render template="/shared/modals"></g:render>

</body>

</html>

