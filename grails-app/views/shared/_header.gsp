
<!-- header -->
<header id="headerPrivate" class="navbar" ng-controller="NavBarCtrl" ng-cloak ng-show="showPrivateNavBar">
    <ul class="nav navbar-nav navbar-avatar pull-right">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <span class="hidden-xs-only">Ilgaz Şumnulu</span>
                <span class="thumb-small avatar inline"><img src="/first/images/avatar.jpg" alt="Ilgaz Şumnulu"
                                                             class="img-circle"></span>
                <b class="caret hidden-xs-only"></b>
            </a>
            <ul class="dropdown-menu">


                <li><a href="/kimlik/{{getLoggedInUser().username}}" target="_self">Profilime git</a></li>
                <li><a href="/company/my/list">Şirket profilime git</a></li>
                <li class="divider"></li>
                <li><a href="/kimlik/{{getLoggedInUser().username}}/positionInbox" target="_self">İlginizi Çekecek Şirketler</a>
                </li>
                <li><a href="/kimlik/{{getLoggedInUser().username}}/positionPreferences" target="_self">Şirketler Kiriterlerim</a>
                </li>
                <li class="divider"></li>
                <li><a href="/kimlik/{{getLoggedInUser().username}}/contacts" target="_self">Adres Defterim</a></li>
                <li><a href="/kimlik/{{getLoggedInUser().username}}/notifications" target="_self">Bildirimler</a></li>
                <li><a href="/kimlik/{{getLoggedInUser().username}}/messageInbox" target="_self">Mesaj Kutum</a></li>
                <li><a href="/kimlik/{{getLoggedInUser().username}}/profilePicture" target="_self">Profil Resmim</a></li>
                <li class="divider"></li>
                <li><g:link controller="auth" action="logout" target="_self">Oturumu kapat</g:link></li>

                <li><a href="#"><span class="badge bg-danger pull-right">3</span>Notifications</a></li>
            </ul>
        </li>
    </ul>
    <a class="navbar-brand" href="/" target="_self">kimlik</a>
    <button type="button" class="btn btn-link pull-left nav-toggle visible-xs"
            data-toggle="class:slide-nav slide-nav-left" data-target="body">
        <i class="icon-reorder icon-xlarge text-default"></i>
    </button>
    <ul class="nav navbar-nav hidden-xs">
        <li>
            <div class="m-t m-b-small" id="panel-notifications">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                        class="icon-comment-alt icon-xlarge text-default"></i><b
                        class="badge badge-notes bg-danger count-n">2</b></a>
                <section class="dropdown-menu m-l-small m-t-mini">
                    <section class="panel panel-large arrow arrow-top">
                        <header class="panel-heading bg-white"><span class="h5"><strong>You have <span
                                class="count-n">2</span> notifications</strong></span></header>

                        <div class="list-group">
                            <a href="#" class="media list-group-item">
                                <span class="pull-left thumb-small"><img src="/first/images/avatar.jpg" alt="John said"
                                                                         class="img-circle"></span>
                                <span class="media-body block m-b-none">
                                    Moved to Bootstrap 3.0<br>
                                    <small class="text-muted">23 June 13</small>
                                </span>
                            </a>
                            <a href="#" class="media list-group-item">
                                <span class="media-body block m-b-none">
                                    first v.1 (Bootstrap 2.3 based) released<br>
                                    <small class="text-muted">19 June 13</small>
                                </span>
                            </a>
                        </div>
                        <footer class="panel-footer text-small">
                            <a href="#" class="pull-right"><i class="icon-cog"></i></a>
                            <a href="#">See all the notifications</a>
                        </footer>
                    </section>
                </section>
            </div>
        </li>


        <li><div class="m-t-small"><a class="btn btn-sm btn-info" data-toggle="modal" href="#modal"><i
                class="icon-plus"></i> POST</a></div></li>


        <li class="dropdown shift" data-toggle="shift:appendTo" data-target=".nav-primary .nav">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                    class="icon-cog icon-xlarge visible-xs visible-xs-inline"></i>Şirket <b
                    class="caret hidden-sm-only"></b></a>
            <ul class="dropdown-menu">
                <li><a href="/company/my/list">Şirketlerim</a></li>
                <li><a href="/company/my/new">Yeni şirket ekle</a></li>

                <li>
                    <a href="#" data-toggle="class:navbar-fixed" data-target='body'>Navbar
                        <span class="text-active">auto</span>
                        <span class="text">fixed</span>
                    </a>
                </li>
                <li class="hidden-xs">
                    <a href="#" data-toggle="class:nav-vertical" data-target="#nav">Nav
                        <span class="text-active">vertical</span>
                        <span class="text">horizontal</span>
                    </a>
                </li>
                <li class="divider hidden-xs"></li>
                <li class="dropdown-header">Colors</li>
                <li>
                    <a href="#" data-toggle="class:bg bg-black" data-target='.navbar'>Navbar
                        <span class="text-active">white</span>
                        <span class="text">inverse</span>
                    </a>
                </li>
                <li>
                    <a href="#" data-toggle="class:bg-light" data-target='#nav'>Nav
                        <span class="text-active">inverse</span>
                        <span class="text">light</span>
                    </a>
                </li>
            </ul>
        </li>

        <li  ng-repeat="c in companies" class="dropdown" ng-class="{active: company_name === c.page_name}">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{c.short_name}} <b class="caret"></b></a>
            <ul class="dropdown-menu" role="menu">
                <li><a href="/company/profile/{{c.page_name}}" target="_self">Web Sayfası</a></li>
                <li><a href="/company/{{c.page_name}}/dashboard">Şirket paneli</a></li>
                <li><a href="/company/{{c.page_name}}/hr">Insan kaynakları</a></li>
                <li><a href="/company/{{c.page_name}}/skills">Şirket yetenekleri</a></li>
                <li><a href="/company/{{c.page_name}}/products">Ürünler ve Projeler</a></li>
                <li><a href="/company/{{c.page_name}}/notifications">Bildiriler</a></li>
                <li><a href="/company/{{c.page_name}}/settings">Ayarlar</a></li>
            </ul>
        </li>

    </ul>

    <form class="navbar-form pull-left shift" action="" data-toggle="shift:appendTo" data-target=".nav-primary">
        <i class="icon-search text-muted"></i>
        <input type="text" class="input-sm form-control" placeholder="Search">
    </form>
</header>
<!-- / header -->