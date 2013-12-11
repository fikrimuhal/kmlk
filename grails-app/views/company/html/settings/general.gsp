<div class="row">
    <div class="col-sm-6">
        <form class="form-horizontal" role="form">
            <div class="form-group">
                <label class="col-lg-3 control-label">Şirketin tam ünvanı</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" ng-model="model.fullLegal"/>
                    <span class="help-block">Şirketinizin yasal tam adı</span>

                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label">Kisa ad</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" ng-model="model.significantPart">
                    <span class="help-block">Yasal olarak kullanılabilecek en kısa adı. genelde 2 kelime sonuna LTD. ŞTİ eklemeyiniz. </span>

                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label">Sayfa adi</label>

                <div class="col-lg-9">
                    <p class="form-control-static">{{model.pageName}}</p>

                    <span class="help-block">Http://kimlik.io/[SAYFA_ADI] şeklinde kullanicak ad. Şirket unvaninin Ilk parcasini kullaniniz. Boşluk Kullanmayiniz</span>
                </div>
            </div>

            <div class="form-group">
                <label  class="col-lg-3 control-label">Şirket Türu</label>

                <div class="col-lg-9">
                    <select ng-model="model.legalType" class="form-control">
                        <option disabled selected>Lütfen seçiniz...</option>
                        <option value="Ltd. Şti.">LTD. ŞTİ.</option>
                        <option value="A.Ş.">A.Ş.</option>
                        <option value="">Şahıs Şirketi</option>
                        <option value="">Henüz resmi olarak kurulmadı</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label">Yetkili kişi</label>

                <div class="col-lg-9">
                    <p class="form-control-static">{{owner.first_name}} {{owner.last_name}}</p>
                    %{--<span class="help-block">Daha sonra başka kişiler ekleye bilirsiniz, yada yonetici haklarini düzenleye bilirsiniz.</span>--}%
                </div>
            </div>


            <div class="form-group">
                <div class="col-lg-9 col-lg-offset-3">
                    <button type="button" class="btn btn-primary pull-right" ng-click="save()">Kaydet</button>
                    <span class="help-block"></span>
                </div>
            </div>

        </form>
    </div>


</div>
