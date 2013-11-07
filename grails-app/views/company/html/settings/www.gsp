<div class="row">
    <div class="col-sm-6">
        <form class="form-horizontal" role="form">
            <div class="form-group">
                <label class="col-lg-3 control-label">Web siteniz</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" ng-model="form.www1"
                           placeholder="sirketim.com">
                    <span class="help-block">başında www olmadan örnek: sirketim.com</span>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label">Web siteniz (altarnatif)</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" ng-model="form.www2"
                           placeholder="www.sirketim.com">
                    <span class="help-block">örnek: www.sirketim.com</span>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label">Aktif</label>

                <div class="col-lg-9">
                    <div class="checkbox">

                        <label>
                            <input type="checkbox" name="checkboxA">
                            Yönlendirmeyi aktif hale getir.
                        </label>
                    </div>
                    <span class="help-block"><p>kimlik.io da ki şirket profil sayfami kendi domain im ile kullanmak istiyorum</p>

                        <p>örnek: şirket sayfanız www.kimlik.io/şirket yerine www.şirketiniz.com olacak</p>
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
                        CNAME {{form.www1||'www.sirketim.com'}} = KIMLIK.IO <br/>
                        CNAME {{form.www2||'sirketim.com'}} = KIMLIK.IO
                    </div>
                </p>

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

</div>

