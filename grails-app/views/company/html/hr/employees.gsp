<div class="row">
    <div class="col-sm-4 col-md-4" ng-repeat="id in employeeIds">
        <div class="thumbnail">
            <div class="btn-group pull-right ">
                <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-cog"></i>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu ">
                    <li><a href="#" ng-click="removeEmployee(id)"><i class="fa fa-trash-o fa-fw"></i> Bu kişiyi işten çıkart</a></li>
                    <li><a href="{{getProfile(id).profileUrl}}" target="_self" ><i class="fa fa-user fa-fw"></i> Profile git</a></li>

                </ul>
            </div>
            <img ng-src="{{getProfile(id).profilePicture.url}}" alt="" style="height: 200px;"/>

            <div class="caption">
                <h4>{{getFullName(id)}}
                    <div class="pull-right">
                        <a href="{{getProfile(id).profileUrl}}" target="_self" class="btn btn-circle btn-xs"
                           title="Profile git"><i class="fa fa-male"></i></a>
                    </div>
                </h4>

                <p>{{getProfile(id).aboutText}}</p>


                <div class="clearfix"></div>
                <!-- // Social Icons END -->
            </div>
        </div>
        %{--{{getProfile(id) | json}}--}%
    </div>

</div>


<div class="page-header">

    <h4>Çalışan ekleme istekleri <small>Henüz onaylanmamış personel</small>
        <small class="pull-right"><a href="#" ng-click="showAddNewEmployeePanel = !showAddNewEmployeePanel"><i
                class="fa fa-plus-circle"></i>
            Yeni kişi ekle</a></small>
    </h4>
</div>

<div class="row m-b-large m-t-n " ng-show="showAddNewEmployeePanel">
    <div class="col-xs-3">
        <label class="control-label">Şirkete eklenecek kişi</label>
    </div>

    <div class="col-xs-6">
        <input type="search" class="form-control" placeholder="Email, Ad Soyad veya kullanici adi"/>
    </div>

    <div class="col-xs-3">
        <button type="submit" class="btn btn-primary fa fa-plus">Ekle</button>
        <button type="submit" ng-click="showAddNewEmployeePanel = false" class="btn btn-info fa fa-times">iptal</button>
    </div>
</div>

<div class="row">
    <div class="col-md-12">

        <table class="table table-striped">
            <thead>
            <tr>
                <th class="col-md-1">#</th>
                <th>Profil</th>
                <th>Istek yapan</th>
                <th class="col-md-1"></th>
                <th class="col-md-1"></th>
            </tr>
            </thead>
            <tbody>

            <tr ng-repeat="req in employmentRequests">
                <td><img ng-src="{{getProfile(req.profile).profilePicture.url}}" style="height: 47px;"/></td>
                <td><a href="{{getProfile(req.profile).profileUrl}}" target="_self">{{getFullName(req.profile)}}</a>

                </td>
                <td>{{req.requestedByCompany?'Şirket':'Profil'}}</td>
                <td>
                    <button ng-hide="req.requestedByCompany" type="button" class="btn btn-primary"
                            ng-click="verify(req)">Onayla</button>
                </td>
                <td>
                    <button type="button" class="btn btn-danger" ng-click="delete(req)">Sil</button>
                </td>
            </tr>

            </tbody>
        </table>

    </div>

</div>
