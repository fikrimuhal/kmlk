<ol class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="#">Library</a></li>
    <li class="active">Data</li>
</ol>


<div class="row">
    <div class="col-md-12">
        <ul class="nav nav-tabs">
            <li ng-class="{active: $routeSegment.contains('employees')}"><a href="/company/{{company_name}}/hr/employees">Çalışanlar</a></li>
            <li ng-class="{active: $routeSegment.contains('positions')}"><a href="/company/{{company_name}}/hr/positions">Pozisyonlar</a></li>
            <li ng-class="{active: $routeSegment.contains('applicants')}"><a href="/company/{{company_name}}/hr/applicants">Adaylar</a></li>
            <li ng-class="{active: $routeSegment.contains('notifications')}"><a href="/company/{{company_name}}/hr/notifications">Bildiriler</a></li>
        </ul>
        <br/>
    </div>
</div>
<div app-view-segment="2"></div>
