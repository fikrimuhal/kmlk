<div class="row">
    <div class="col-sm-6">
        <form class="form-horizontal" role="form">
            <div class="form-group">
                <label for="fullName" class="col-lg-3 control-label">Ülke</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" id="fullName"
                           placeholder="Fikrimuhal Teknoloji Araştırma Geliştirme LTD. ŞTİ.">
                    <span class="help-block">Şirketinizin yasal tam adı</span>

                </div>
            </div>

            <div class="form-group">
                <label for="sortName" class="col-lg-3 control-label">İl</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" id="sortName" placeholder="Fikrimuhal">
                    <span class="help-block">Yasal olarak kullanılabilecek en kısa adı. genelde 2 kelime sonuna LTD. ŞTİ eklemeyiniz. </span>

                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label">İlçe</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control"  placeholder="Fikrimuhal">
                    <span class="help-block">Http://kimlik.io/[SAYFA_ADI] şeklinde kullanicak ad. Şirket unvaninin Ilk parcasini kullaniniz. Boşluk Kullanmayiniz</span>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label">Address</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" placeholder="Fikrimuhal">
                    <span class="help-block">Http://kimlik.io/[SAYFA_ADI] şeklinde kullanicak ad. Şirket unvaninin Ilk parcasini kullaniniz. Boşluk Kullanmayiniz</span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 control-label">Foursquare</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" placeholder="Fikrimuhal">
                    <span class="help-block">Http://kimlik.io/[SAYFA_ADI] şeklinde kullanicak ad. Şirket unvaninin Ilk parcasini kullaniniz. Boşluk Kullanmayiniz</span>
                </div>
            </div>

            <div class="form-group">
                <label  class="col-lg-3 control-label">Ofis Türu</label>

                <div class="col-lg-9">
                    <select id="disabledSelect" class="form-control">
                        <option>Lütfen seçiniz...</option>
                        <option>LTD. ŞTİ.</option>
                        <option>A.Ş.</option>
                        <option>Şahıs Şirketi</option>
                        <option>Henüz resmi olarak kurulmadı</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label">Yetkili kişi</label>

                <div class="col-lg-9">
                    <p class="form-control-static">Ilgaz Şumnulu</p>
                    <span class="help-block">Daha sonra başka kişiler ekleye bilirsiniz, yada yonetici haklarini düzenleye bilirsiniz.</span>
                </div>
            </div>


            <div class="form-group">
                <div class="col-lg-9 col-lg-offset-3">
                    <button type="button" class="btn btn-primary pull-right">Kaydet</button>
                    <span class="help-block"></span>
                </div>
            </div>
        </form>
    </div>

    <div class="col-sm-6">
        <section class="panel">
            <header class="panel-heading">
                <form method="post" id="geocoding_form" class="m-b-none">
                    <div class="input-group">
                        <input type="text" id="address" name="address" class="input-sm form-control" placeholder="Search">
                        <span class="input-group-btn">
                            <button class="btn btn-sm btn-white" ng-click="testis()">Go!</button>
                        </span>
                    </div>
                </form>
            </header>
            <div class="panel-body">
                <div id="gmap_geocoding" style="height:350px">

                </div>
            </div>
        </section>
    </div>


</div>
