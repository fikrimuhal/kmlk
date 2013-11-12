<!-- hr -->
<div class="row">
    <div class="col-lg-12">

        <ul class="breadcrumb hidden-sm hidden-xs hidden-phone">
            <li><a href="#"><i class="icon-home"></i>Fikrimuhal</a></li>
            <li><a href="#"><i class="icon-list-ul"></i>İnsan Kaynakları</a></li>
            <li class="active">Çalışanlar</li>
        </ul>


        <section class="panel">
            <header class="panel-heading text-right">
                <ul class="nav nav-tabs pull-left">
                    <li class="active"><a
                            href="/company/{{company_name}}/products"><i
                                class="icon-home icon-large text-default"></i>Ürunler ve Projeler</a></li>
                    <li><a
                            href="/company/{{company_name}}/services"><i
                                class="icon-group icon-large text-default"></i>Hizmetler</a></li>

                </ul>
                <span class="hidden-sm hidden-xs hidden-phone">Ürun ve Hizmetler</span>
            </header>

            <div class="panel-body">
                <div class="tab-content">
                    <div class="tab-pane fade active in">

                        <div class="row">

                            <div class=" col-sm-4">

                                <section class="panel">

                                    <div class="list-group">
                                        <a ng-repeat="p in company.products" href="#"
                                           class="list-group-item bg-lighter">
                                            <i class="icon-chevron-right"></i>
                                            <i class="icon-inbox"></i> {{p.title}}
                                        </a>

                                    </div>
                                </section>


                                <div class="pull-right"><a href="#" ng-click="new()"><i
                                        class="glyphicon glyphicon-plus-sign"></i>
                                    Yeni ürün ekle</a></div>
                            </div>

                            <div class=" col-md-8">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">{{product.title || 'Yeni ürün'}}</div>

                                    <!--  Edit Position Start  -->
                                    <div class="panel-body">

                                        <form class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <label for="fullName" class="col-lg-3 control-label">Proje Adı</label>

                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control" id="fullName"
                                                           ng-model="product.title"
                                                           placeholder="örnek: Kimlik Io">
                                                    <span class="help-block">Web sayfanizda gösterilecek ad</span>

                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">Açıklama</label>

                                                <div class="col-lg-9">
                                                    <textarea class="form-control"  ng-model="product.about"
                                                              rows="5"></textarea>
                                                    <span class="help-block">Web sayfanızda gösterilecek</span>

                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">URL</label>

                                                <div class="col-lg-9">
                                                    <input type="text" class="form-control"
                                                           ng-model="product.url"
                                                           placeholder="örnek: www.kimlik.io">
                                                    <span class="help-block">Web sayfanızda projeye link olarak gösterilecek</span>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">Ayarlar</label>

                                                <div class="col-lg-9">
                                                    <div class="checkbox"><label><input
                                                            type="checkbox" ng-model="product.public">Web sayfamda göster</label></div>
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <div class="col-lg-offset-3 col-lg-9">
                                                    <button type="submit" class="btn btn-primary" ng-click="save(product)">Kaydet</button>
                                                </div>
                                            </div>

                                        </form>

                                    </div><!--  Edit Position End  -->

                                </div>
                            </div>

                        </div>

                    </div><!--end tab-pane-->

                </div>
            </div>
        </section>

    </div>
</div>
<!-- / hr -->


