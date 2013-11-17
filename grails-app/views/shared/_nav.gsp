<!-- nav -->
<nav id="nav" class="nav-primary hidden-xs nav-vertical">
    <ul class="nav" data-spy="affix" data-offset-top="50">
        <li ng-class="{active: $routeSegment.contains('dashboard')}"><a href="%{--/company/{{company_name}}/dashboard--}%"><i class="icon-dashboard icon-xlarge"></i><span>Dashboard</span></a></li>
        <li ng-class="{active: $routeSegment.contains('hr')}"><a href="/company/{{company_name}}/hr"><i class="icon-th icon-xlarge"></i><span>Insan kaynakları</span></a></li>
        <li ng-class="{active: $routeSegment.contains('skills')}"><a href="/company/{{company_name}}/skills"><i class="icon-list icon-xlarge"></i><span>Şirket yetenekleri</span></a></li>
        <li ng-class="{active: $routeSegment.contains('products')||$routeSegment.contains('services')}"><a href="/company/{{company_name}}/products"><i class="icon-link icon-xlarge"></i><span>Ürünler ve Projeler</span></a></li>
        <li ng-class="{active: $routeSegment.contains('notifications')}"><a href="/company/{{company_name}}/notifications"><i class="icon-signal icon-xlarge"></i><span>Bildiriler</span></a></li>
        <li ng-class="{active: $routeSegment.contains('settings')}"><a href="/company/{{company_name}}/settings"><i class="icon-edit icon-xlarge"></i><span>Ayarlar</span></a></li>
    </ul>
</nav>
<!-- / nav -->
