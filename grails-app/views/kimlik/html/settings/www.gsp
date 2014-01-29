<div class="row">
    <div class="col-sm-6">
        <form class="form-horizontal" role="form">
            <div class="form-group">
                <label class="col-lg-3 control-label">Web siteniz</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" ng-model="domain.domains[0]"
                           placeholder="sirketim.com">
                    <span class="help-block">başında www olmadan örnek: adimsoyadim.com</span>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label">Web siteniz (altarnatif)</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" ng-model="domain.domains[1]"
                           placeholder="www.sirketim.com">
                    <span class="help-block">örnek: www.adimsoyadim.com</span>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label">Aktif</label>

                <div class="col-lg-9">
                    <div class="checkbox">

                        <label>
                            <input type="checkbox" name="checkboxA" ng-model="domain.enabled">
                            Yönlendirmeyi aktif hale getir.
                        </label>
                    </div>
                    <span class="help-block"><p>kimlik.io da ki kişisel profil sayfamı kendi domain'im ile kullanmak istiyorum</p>

                        <p>örnek: kişisel profil sayfanız www.kimlik.io/kullanıcı yerine {{domain.domains[0]||'www.adimsoyadim.com'}} olacak</p>
                    </span>
                </div>
            </div>


            <div class="form-group">
                <label class="col-lg-3 control-label">DNS Kayıtları</label>

                <div class="col-lg-9">
                    <p class="form-control-static">
                        Yukarıda girdiğiniz adresleri için DNS sunucunuza <i>CNAME</i> kaydı girmeniz gerekmektedir. <br/>
                        <br/> <b>Eklemeniz gereken kayıt:</b>

                    <div class="well">
                        CNAME {{domain.domains[0]||'www.adimsoyadim.com'}} = KIMLIK.IO <br/>
                        CNAME {{domain.domains[1]||'adimsoyadim.com'}} = KIMLIK.IO
                    </div>
                </p>

                </div>
            </div>


            <div class="form-group">
                <label class="col-lg-3 control-label">Google analytics:</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" ng-model="domain.googleAnalytics"
                           placeholder="google analytics takib numarası">
                    <span class="help-block">örnek: UA-XXXXXXXX-X</span>
                </div>
            </div>


            <div class="form-group">
                <div class="col-lg-9 col-lg-offset-3">
                    <button type="button" class="btn btn-primary pull-right" ng-click="save(domain)">Kaydet</button>
                    <span class="help-block"></span>
                </div>
            </div>
        </form>
    </div>

</div>

