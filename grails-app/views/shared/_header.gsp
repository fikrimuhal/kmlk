<!-- header -->
<header id="headerPrivate" class="navbar" ng-controller="NavBarCtrl" ng-cloak ng-show="showPrivateNavBar">
    <ul class="nav navbar-nav navbar-avatar pull-right">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <span class="hidden-xs-only">{{loggedinUser.first_name}} {{loggedinUser.last_name}}</span>
                <span class="thumb-small avatar inline"><img ng-src="{{loggedinUser.profilePicture.url}}"
                                                             alt="{{loggedinUser.first_name + ' ' + loggedinUser.last_name}}"
                                                             class="img-circle"/></span>
                <b class="caret hidden-xs-only"></b>
            </a>
            <ul class="dropdown-menu">

                <li><a href="/kimlik/profile/{{user_name}}" target="_self">Profilime git</a></li>
                <li><a href="/company/my/list">Şirket profilime git</a></li>
                <li class="divider"></li>
                <li class="disabled"><a href="%{--/kimlik/{{user_name}}/positions/inbox--}%">İlginizi Çekecek Şirketler</a>
                </li>
                <li class="disabled"><a href="%{--/kimlik/#{{user_name}}/positions/settings--}%">Şirketler Kiriterlerim</a>
                </li>
                <li class="divider"></li>
                <li><a href="/kimlik/{{user_name}}/contacts">Adres Defterim</a></li>
                <li><a href="/kimlik/{{user_name}}/notifications">Mesaj Kutum</a></li>
                <li><a href="/kimlik/{{user_name}}/settings/profilePicture">Profil Resmim</a></li>
                <li class="divider"></li>
                <li><a href="/kimlik/{{user_name}}/settings">Profilimi düzenle</a></li>
                <li><a href="#" target="_self" ng-click="logout()">Oturumu kapat</a></li>

                %{--<li><a href="/kimlik/{{user_name}}/notifications"><span--}%
                        %{--class="badge bg-danger pull-right">3</span>Bildirimler</a></li>--}%
            </ul>
        </li>
    </ul>



    %{--Left nav bar--}%



    <a class="navbar-brand" href="/" target="_self">kimlik</a>
    <button type="button" class="btn btn-link pull-left nav-toggle visible-xs"
            data-toggle="class:slide-nav slide-nav-left" data-target="body">
        <i class="fa fa-reorder icon-xlarge text-default"></i>
    </button>

    <ul class="nav navbar-nav hidden-xs">

        <g:render template="/shared/header/notifications"/>

        <li><div class="m-t-small"><a class="btn btn-sm btn-info" id="showFeedBackDialog" data-toggle="modal" href="#modal" ><i
                class="fa fa-lightbulb-o"></i> Geri bildirim</a></div></li>


        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                    class="fa fa-cog icon-xlarge visible-xs visible-xs-inline"></i>Şirket <b
                    class="caret hidden-sm-only"></b></a>
            <ul class="dropdown-menu">
                <li><a href="/company/my/list">Şirketlerim</a></li>
                <li><a href="/company/my/new">Yeni şirket ekle</a></li>

                %{--<li>--}%
                %{--<a href="#" data-toggle="class:navbar-fixed" data-target='body'>Navigasyon--}%
                %{--<span class="text-active">otomatik</span>--}%
                %{--<span class="text">sabit</span>--}%
                %{--</a>--}%
                %{--</li>--}%
                %{--<li class="divider hidden-xs"></li>--}%
                %{--<li class="dropdown-header">Renkler</li>--}%
                %{--<li>--}%
                %{--<a href="#" data-toggle="class:bg bg-black" data-target='.navbar'>Navigasyon--}%
                %{--<span class="text-active">beyaz</span>--}%
                %{--<span class="text">siyah</span>--}%
                %{--</a>--}%
                %{--</li>--}%
                %{--<li>--}%
                %{--<a href="#" data-toggle="class:bg-light" data-target='#nav'>Navigasyon 2--}%
                %{--<span class="text-active">sihay</span>--}%
                %{--<span class="text">beyaz</span>--}%
                %{--</a>--}%
                %{--</li>--}%
            </ul>
        </li>

        <li ng-cloak ng-show="showPrivateNavBarCompanies" ng-repeat="c in companies" class="dropdown"
            ng-class="{active: company_name === c.page_name}">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{c.short_name}} <b class="caret"></b></a>
            <ul class="dropdown-menu" role="menu">
                <li><a href="/company/profile/{{c.page_name}}" target="_top">Web Sayfası</a></li>
                %{--<li><a href="/company/{{c.page_name}}/dashboard">Şirket paneli</a></li>--}%
                <li><a href="/company/{{c.page_name}}/hr">Insan kaynakları</a></li>
                <li><a href="/company/{{c.page_name}}/skills">Şirket yetenekleri</a></li>
                <li><a href="/company/{{c.page_name}}/products">Ürünler ve Projeler</a></li>
                %{--<li><a href="/company/{{c.page_name}}/notifications">Bildiriler</a></li>--}%
                <li><a href="/company/{{c.page_name}}/settings">Ayarlar</a></li>
            </ul>
        </li>

    </ul>

    %{--<form class="navbar-form pull-left shift" action="" data-toggle="shift:appendTo" data-target=".nav-primary">--}%
    %{--<i class="fa fa-search text-muted"></i>--}%
    %{--<input type="text" class="input-sm form-control" placeholder="Search">--}%
    %{--</form>--}%
</header>
<!-- / header -->