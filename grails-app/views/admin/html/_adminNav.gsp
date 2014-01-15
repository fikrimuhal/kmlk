<!-- nav -->
<nav id="nav" class="nav-primary hidden-xs nav-vertical">
    <ul class="nav" data-spy="affix" data-offset-top="50">
        <li ng-class="{active: $routeSegment.contains('dashboard')}"><a href="/admin/dashboard"><i class="fa fa-dashboard icon-xlarge"></i><span>Dashboard</span></a></li>
        <li ng-class="{active: $routeSegment.contains('companies')}"><a href="/admin/companies"><i class="fa fa-building-o icon-xlarge"></i><span>Şirketler</span></a></li>
        <li ng-class="{active: $routeSegment.contains('users')}"><a href="/admin/users"><i class="fa fa-user icon-xlarge"></i><span>Kullanıcılar</span></a></li>
        <li ng-class="{active: $routeSegment.contains('settings')}"><a href="/admin/settings"><i class="fa fa-edit icon-xlarge"></i><span>Ayarlar</span></a></li>
    </ul>
</nav>
<!-- / nav -->
