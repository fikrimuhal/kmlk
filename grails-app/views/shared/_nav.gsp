<nav class="navbar navbar-default" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">KimlikIO</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">

        <ul class="nav navbar-nav">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Kurumsal <b class="caret"></b></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="/company/my/list">Şirketlerim</a></li>
                    <li><a href="/company/my/new">Yeni şirket ekle</a></li>
                </ul>
            </li>
            <li  ng-repeat="c in companies" class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{c.short_name}} <b class="caret"></b></a>
                <ul class="dropdown-menu" role="menu">
                    <li><a href="/company/{{c.page_name}}">Şirket profili</a></li>
                    <li><a href="/company/{{c.page_name}}/hr">Insan kaynakları</a></li>
                    <li><a href="/company/{{c.page_name}}/skills">Şirket yetenekleri</a></li>
                    <li><a href="/company/{{c.page_name}}/products">Ürünler ve Projeler</a></li>
                    <li><a href="/company/{{c.page_name}}/notifications">Bildiriler</a></li>
                    <li><a href="/company/{{c.page_name}}/settings">Ayarlar</a></li>
                </ul>
            </li>
        </ul>

        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Ilgaz Şumnulu <b class="caret"></b></a>
                <ul class="dropdown-menu" role="menu">

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
                </ul>
            </li>
        </ul>
    </div><!-- /.navbar-collapse -->
</nav>
