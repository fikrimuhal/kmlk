
<!-- header -->
<header id="headerPrivate" class="navbar" ng-controller="NavBarCtrl" ng-cloak ng-show="showPrivateNavBar">
    <ul class="nav navbar-nav navbar-avatar pull-right">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <span class="hidden-xs-only">Ilgaz Şumnulu</span>
                <span class="thumb-small avatar inline"><img ng-src="{{loggedinUser.profilePicture.defaultPicture.url}}" alt="{{loggedinUser.first_name + ' ' + loggedinUser.last_name}}"
                                                             class="img-circle"/></span>
                <b class="caret hidden-xs-only"></b>
            </a>
            <ul class="dropdown-menu">


                <li><a href="/kimlik/profile/{{user_name}}" target="_self">Profilime git</a></li>
                <li><a href="/company/my/list">Şirket profilime git</a></li>
                <li class="divider"></li>
                <li><a href="/kimlik/{{user_name}}/positions/inbox">İlginizi Çekecek Şirketler</a>
                </li>
                <li><a href="/kimlik/{{user_name}}/positions/settings">Şirketler Kiriterlerim</a>
                </li>
                <li class="divider"></li>
                <li><a href="/kimlik/{{user_name}}/contacts" >Adres Defterim</a></li>
                <li><a href="/kimlik/{{user_name}}/notifications">Mesaj Kutum</a></li>
                <li><a href="/kimlik/{{user_name}}/settings/profilePicture">Profil Resmim</a></li>
                <li class="divider"></li>
                <li><a href="/kimlik/{{user_name}}/settings" >Profilimi düzenle</a></li>
                <li><g:link controller="auth" action="logout" target="_self">Oturumu kapat</g:link></li>

                <li><a href="/kimlik/{{user_name}}/notifications"><span class="badge bg-danger pull-right">3</span>Bildirimler</a></li>
            </ul>
        </li>
    </ul>
    <a class="navbar-brand" href="/" target="_self">kimlik</a>
    <button type="button" class="btn btn-link pull-left nav-toggle visible-xs"
            data-toggle="class:slide-nav slide-nav-left" data-target="body">
        <i class="fa fa-reorder icon-xlarge text-default"></i>
    </button>
    <ul class="nav navbar-nav hidden-xs">
        <li>
            <div class="m-t m-b-small" id="panel-notifications">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                        class="fa fa-comment-o icon-xlarge text-default"></i><b
                        class="badge badge-notes bg-danger count-n">2</b></a>
                <section class="dropdown-menu m-l-small m-t-mini">
                    <section class="panel panel-large arrow arrow-top">
                        <header class="panel-heading bg-white"><span class="h5"><strong><span
                                class="count-n">2</span> yeni bildiriminiz var</strong></span></header>

                        <div class="list-group">
                            <a href="#" class="media list-group-item">
                                <span class="pull-left thumb-small"><g:img uri="http://s3.amazonaws.com/kimlik/photos/525bee2aef869502d11cc461.jpg" alt="kimlik"
                                                                         class="img-circle"/></span>
                                <span class="media-body block m-b-none">
                                    Bootstrap 3.0 a geçtik süper!<br>
                                    <small class="text-muted">23 June 13</small>
                                </span>
                            </a>
                            <a href="#" class="media list-group-item">
                                <span class="media-body block m-b-none">
                                    Ilgaz Şumnulu, kendini fikrimuhal de çalışan olarak ekledi<br>
                                    <small class="text-muted">19 June 13</small>
                                </span>
                            </a>
                        </div>
                        <footer class="panel-footer text-small">
                            <a href="#" class="pull-right"><i class="fa fa-cog"></i></a>
                            <a href="#">Bütün bildirimleri gör</a>
                        </footer>
                    </section>
                </section>
            </div>
        </li>


        <li><div class="m-t-small"><a class="btn btn-sm btn-info" data-toggle="modal" href="#modal"><i
                class="fa fa-lightbulb"></i> Geri bildirim</a></div></li>


        <li class="dropdown shift" data-toggle="shift:appendTo" data-target=".nav-primary .nav">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                    class="fa fa-cog icon-xlarge visible-xs visible-xs-inline"></i>Şirket <b
                    class="caret hidden-sm-only"></b></a>
            <ul class="dropdown-menu">
                <li><a href="/company/my/list">Şirketlerim</a></li>
                <li><a href="/company/my/new">Yeni şirket ekle</a></li>

                <li>
                    <a href="#" data-toggle="class:navbar-fixed" data-target='body'>Navigasyon
                        <span class="text-active">otomatik</span>
                        <span class="text">sabit</span>
                    </a>
                </li>
                <li class="divider hidden-xs"></li>
                <li class="dropdown-header">Renkler</li>
                <li>
                    <a href="#" data-toggle="class:bg bg-black" data-target='.navbar'>Navigasyon
                        <span class="text-active">beyaz</span>
                        <span class="text">siyah</span>
                    </a>
                </li>
                <li>
                    <a href="#" data-toggle="class:bg-light" data-target='#nav'>Navigasyon 2
                        <span class="text-active">sihay</span>
                        <span class="text">beyaz</span>
                    </a>
                </li>
            </ul>
        </li>

        <li ng-cloak ng-show="showPrivateNavBarCompanies" ng-repeat="c in companies" class="dropdown" ng-class="{active: company_name === c.page_name}">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{c.short_name}} <b class="caret"></b></a>
            <ul class="dropdown-menu" role="menu">
                <li><a href="/company/profile/{{c.page_name}}" target="_top">Web Sayfası</a></li>
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
        <i class="fa fa-search text-muted"></i>
        <input type="text" class="input-sm form-control" placeholder="Search">
    </form>
</header>
<!-- / header -->