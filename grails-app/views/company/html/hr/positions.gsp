<div class="row">
<div class="col-sm-4 col-md-4">

    <div class="list-group">
        <a ng-repeat="p in positions"
           href="/company/{{company_name}}/hr/positions/{{p._id}}"
           class="list-group-item"
           ng-class="{active: $routeSegment.$routeParams.pid ==p._id }">
            {{p.title}}
        </a>

    </div>
    <a href="/company/{{company_name}}/hr/positions/new"
       ng-class="{'active': page.isNew }"
       class="btn btn-default pull-right">Yeni pozisyon ekle</a>

</div>

<div class="col-sm-4 col-md-8">

<div class="panel panel-primary">
<div class="panel-heading">{{position.title  || page.title || 'Pozisyonlar'}} <button type="button"
                                                                     ng-hide="page.isNew || !(page.show || page.edit)"
                                                                     ng-click="toggleEdit()"
                                                                     class="pull-right btn btn-default btn-xs">
    <span class="glyphicon" ng-class="{' glyphicon-pencil': !page.edit, 'glyphicon-list-alt': page.edit }"></span>
    {{(page.edit)?'göster':'düzenle'}}
</button></div>

<!--  Edit Position Start  -->
<div ng-show="page.edit" class="panel-body">

    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label for="fullName" class="col-lg-3 control-label">Pozisyon Başlığı</label>

            <div class="col-lg-9">
                <input type="text" class="form-control" id="fullName"  ng-model="position.title"
                       placeholder="Fikrimuhal Teknoloji Araştırma Geliştirme LTD. ŞTİ.">
                <span class="help-block">Şirketinizin yasal tam adı</span>

            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-3 control-label">Açıklama</label>

            <div class="col-lg-9">
                <textarea class="form-control" rows="5">{{$routeSegment.$routeParams | json}}</textarea>
                <span class="help-block">Yasal olarak kullanılabilecek en kısa adı. genelde 2 kelime sonuna LTD. ŞTİ eklemeyiniz.</span>

            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-3 control-label">Maaş</label>

            <div class="col-lg-9">
                <input type="text" class="form-control" id="inputPassword12" placeholder="___,_ TL/Ay">
                <span class="help-block">Http://kimlik.io/[SAYFA_ADI] şeklinde kullanicak ad. Şirket unvaninin Ilk parcasini kullaniniz. Boşluk Kullanmayiniz</span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-3 control-label">Çalışma Zamanı</label>

            <div class="col-lg-9">
                <div class="checkbox"><label><input type="checkbox">Tam zamanlı</label></div>

                <div class="checkbox"><label><input type="checkbox">Yarı zamanlı</label></div>

                <div class="checkbox"><label><input type="checkbox">Staj</label></div>

                <div class="checkbox"><label><input type="checkbox">Uzaktan</label></div>

            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-3 control-label">Gerekli Yetenekler</label>

            <div class="col-lg-9">
                <table class="table">
                    <thead>
                    <tr>
                        <th>Yetenek & Beceriler</th>
                        <th class="col-xs-1"></th>
                        <th class="col-xs-2">Önem</th>
                    </tr>
                    </thead>
                    <tbody>

                    <tr>
                        <td>Javascript</td>
                        <td><a href="#">sil</a></td>

                        <td>
                            <input class="form-control" type="number" min="1" value="10"/>
                        </td>
                    </tr>

                    <tr>
                        <td>Yönetim</td>
                        <td><a href="#">sil</a></td>

                        <td>
                            <input class="form-control" type="number" min="1" value="10"/>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="yetenek">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">ekle</button>
                                </span>
                            </div><!-- /input-group -->

                        </td>
                        <td></td>
                        <td></td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </div>

        <div class="form-group">
            <div class="col-lg-offset-3 col-lg-9">
                <button type="submit" class="btn btn-primary">Kaydet</button>
            </div>
        </div>

    </form>

</div><!--  Edit Position End  -->

<!--  View Position Start  -->
<div ng-show="page.show" class="panel-body">
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label for="fullName" class="col-lg-3 control-label">Pozisyon Başlığı</label>

            <div class="col-lg-9">
                <p class="form-control-static">{{position.title}}</p>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-3 control-label">Açıklama</label>

            <div class="col-lg-9">
                <p class="form-control-static">{{$routeSegment.$routeParams | json}}</p>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-3 control-label">Maaş</label>

            <div class="col-lg-9">
                <p class="form-control-static">2500 ~ 3000 TL</p>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-3 control-label">Çalışma Zamanı</label>

            <div class="col-lg-9">
                <div class="checkbox"><label><input type="checkbox" checked="true" disabled="true">Tam zamanlı</label>
                </div>

                <div class="checkbox"><label><input type="checkbox"  disabled="true">Yarı zamanlı</label>
                </div>

                <div class="checkbox"><label><input type="checkbox"  disabled="true">Staj</label></div>

                <div class="checkbox"><label><input type="checkbox" checked="true" disabled="true">Uzaktan</label></div>

            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-3 control-label">Gerekli Yetenekler</label>

            <div class="col-lg-9">
                <table class="table">
                    <thead>
                    <tr>
                        <th>Yetenek & Beceriler</th>
                        <th class="col-xs-3">Adaylar</th>
                    </tr>
                    </thead>
                    <tbody>

                    <tr>
                        <td>Javascript</td>
                        <td>
                           <span>8 kişi, </span> <a href="#">göster</a>
                        </td>
                    </tr>

                    <tr>
                        <td>Yönetim</td>
                        <td>
                            <span>2 kişi, </span> <a href="#">göster</a>
                        </td>
                    </tr>


                    </tbody>
                </table>
            </div>
        </div>

        <div class="form-group">
            <div class="col-lg-offset-3 col-lg-9">
                <a href="/company/{{company_name}}/hr/applicants?positions={{position._id}}" class="btn btn-default">Adaylar</a>
                <a class="btn btn-default">İstatistikler</a>
            </div>
        </div>

    </form>
</div> <!--  View Position End  -->

</div><!--PANEL END-->

</div>
</div>
