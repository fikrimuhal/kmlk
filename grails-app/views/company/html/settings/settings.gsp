<ol class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="#">Library</a></li>
    <li class="active">Data</li>
</ol>

<div class="row">
    <div class="col-md-12">
        <ul class="nav nav-tabs">
            <li ng-class="{active: $routeSegment.contains('general')}"><a href="/company/{{company_name}}/settings/general">Genel</a></li>
            <li ng-class="{active: $routeSegment.contains('location')}"><a href="/company/{{company_name}}/settings/location">Lokasyon</a></li>
            <li ng-class="{active: $routeSegment.contains('images')}"><a href="/company/{{company_name}}/settings/images">Görseller</a></li>
            <li ng-class="{active: $routeSegment.contains('security')}"><a href="/company/{{company_name}}/settings/security">Güvenlik ve İzinler</a></li>
            <li ng-class="{active: $routeSegment.contains('notifications')}"><a href="/company/{{company_name}}/settings/notifications">Bildirimler</a></li>
            <li ng-class="{active: $routeSegment.contains('social')}"><a href="/company/{{company_name}}/settings/social">Sosyal</a></li>
        </ul>
        <br/>
    </div>
</div>

<div app-view-segment="2"></div>