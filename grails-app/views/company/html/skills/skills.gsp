<!-- skills -->
<div class="row">
    <div class="col-lg-12">

        <ul class="breadcrumb hidden-sm hidden-xs hidden-phone">
            <li><a href="#"><i class="fa fa-home"></i>Fikrimuhal</a></li>
            <li class="active">Şirket yetenekleri</li>
        </ul>

        <section class="panel">
            <header class="panel-heading text-right">
                <ul class="nav nav-tabs pull-left">
                    <li ng-class="{active: $routeSegment.contains('skills')}"><a
                            href="/company/{{company_name}}/skills"><i
                                class="fa fa-home icon-large text-default"></i>Şirket yetenekleri</a></li>
                </ul>
                <span class="hidden-sm hidden-xs hidden-phone">Yetenek Yönetimi</span>
            </header>

            <div class="panel-body">
                <div class="tab-content">
                    <div class="tab-pane fade active in">
                        <div class="row">

                            <div class=" col-md-3">
                                <h3>Yetenekler  <a href="#" ng-click="forceRecalculate()" class="btn btn-white pull-right">Güncelle</a></h3>
                                <br/>
                                <p>
                                    Yetenekler otomatik olarak 1 saat de bir tekrar hesaplanir. Tekrar hesaplamayi tetiklemek icin guncelle butonunu kullanabilirsiniz (gibi bir aciklama...)
                                </p>

                            </div>

                            <div class=" col-md-9">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th class="col-xs-1">Yetenek</th>
                                        <th class="col-xs-3">Puan</th>
                                        <th class="col-xs-3">Katkıda bulunanlar</th>
                                        <th class="col-xs-1">Görünür</th>
                                        <th class="col-xs-2">Önem</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <tr ng-repeat="skill in skills | orderBy:'order'">
                                        <td>{{skill.name}}</td>
                                        <td>
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-info"
                                                     style="{{progressBarStyle(skill.percent)}}">
                                                    <span class="sr-only">{{skill.percent}}%</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td style="">
                                            <ul>

                                                <li ng-repeat="c in skill.contributors"
                                                    class="label label-primary pull-left m-b-mini m-r-mini ">{{getFullName(c)}}</li>
                                            </ul>

                                        </td>
                                        <td>
                                            <button class="btn btn-white" ng-class="{'active':skill.visible}"
                                                    ng-click="toggleVisibility(skill)">
                                                <i ng-if="skill.visible"
                                                   class="fa fa-lightbulb-o text-active text-warning"></i>
                                                <i ng-if="!skill.visible"
                                                   class="fa fa-eye-slash text-active text-danger"></i>
                                            </button>
                                        </td>
                                        <td>
                                            <input class="form-control" type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)"/>
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div><!--end tab-pane-->

                </div>
            </div>
        </section>

    </div>
</div>
<!-- / skills -->
