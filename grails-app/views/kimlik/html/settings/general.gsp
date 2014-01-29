<div class="row">
    <div class="col-sm-6">
        <form class="form-horizontal" role="form">
            <div class="form-group">
                <label for="fullName" class="col-lg-3 control-label">Ad</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" id="fullName"
                            ng-model="model.first_name">
                    <span class="help-block"></span>

                </div>
            </div>

            <div class="form-group">
                <label for="sortName" class="col-lg-3 control-label">Soyad</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" id="sortName"  ng-model="model.last_name">
                    <span class="help-block"></span>

                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label">Ortanca Ad</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control"  ng-model="model.middle_name">
                    <span class="help-block"></span>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label">Doğum Tarihiniz</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control"  ng-model="model.birthDate">
                    <span class="help-block">Acik olarak gozukecek</span>
                </div>
            </div>

            <div class="form-group">
                <label  class="col-lg-3 control-label">Cinsiyet</label>

                <div class="col-lg-9">
                    <select ng-model="model.gender"  class="form-control">
                        <option value="" disabled selected>Select your option</option>
                        <option value="male">Erkek</option>
                        <option value="female">Kadin</option>
                    </select>
                </div>
            </div>


            <div class="form-group">
                <label class="col-lg-3 control-label">Hakkımda</label>

                <div class="col-lg-9">
                    <textarea rows="5" class="form-control" ng-model="model.aboutText"></textarea>
                    <span class="help-block">Kısaca kendinizden bahsedin</span>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label">Sayfa/Kullanici Adı</label>

                <div class="col-lg-9">
                    <p class="form-control-static">{{username}}</p>
                    <span class="help-block">kimlik.io/profile/{{username}}</span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 control-label">Web</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" id="w"  ng-model="model.webSite">
                    <span class="help-block">http://www.xxxx.com</span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 control-label">Açık Email</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" id="h" ng-model="model.publicEmail">
                    <span class="help-block">Ziyaretcilere görünür</span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 control-label">Tel</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" id="v" ng-model="model.publicTel">
                    <span class="help-block">Ziyaretcilere görünür</span>
                </div>
            </div>


            <div class="form-group">
                <div class="col-lg-9 col-lg-offset-3">
                    <button type="button" class="btn btn-primary pull-right" ng-click="save(model)">Kaydet</button>
                    <span class="help-block"></span>
                </div>
            </div>

        </form>
    </div>




</div>

