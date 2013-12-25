<!-- .sidebar -->
<g:render template="/kimlik/html/positions/side_folders"></g:render>
<!-- /.sidebar -->

<!-- .main -->
<section class="main m-t-large">
    <div class="row">
        <div class="col-sm-6">
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="fullName" class="col-lg-3 control-label">aaaa</label>

                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="fullName"
                               ng-model="model.first_name">
                        <span class="help-block"></span>

                    </div>
                </div>

                <div class="form-group">
                    <label for="sortName" class="col-lg-3 control-label">bbbbb</label>

                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="sortName"  ng-model="model.last_name">
                        <span class="help-block"></span>

                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label">ccccc</label>

                    <div class="col-lg-9">
                        <input type="text" class="form-control"  ng-model="model.middle_name">
                        <span class="help-block"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label">ddddd</label>

                    <div class="col-lg-9">
                        <input type="text" class="form-control"  ng-model="model.birthDate">
                        <span class="help-block">SasaS</span>
                    </div>
                </div>

                <div class="form-group">
                    <label  class="col-lg-3 control-label">aaaaaaaa</label>

                    <div class="col-lg-9">
                        <select ng-model="model.gender"  class="form-control">
                            <option value="" disabled selected>Select your option</option>
                            <option value="male">ssss</option>
                            <option value="female">dddddd</option>
                        </select>
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-lg-3 control-label">SSSSS</label>

                    <div class="col-lg-9">
                        <textarea rows="5" class="form-control" ng-model="model.aboutText"></textarea>
                        <span class="help-block">ASasa</span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label">sadsadsad</label>

                    <div class="col-lg-9">
                        <p class="form-control-static">{{username}}</p>
                        <span class="help-block">sadasdsad</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">ddddd</label>

                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="w"  ng-model="model.webSite">
                        <span class="help-block">sadsadsa</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">ddddddddd</label>

                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="h" ng-model="model.publicEmail">
                        <span class="help-block">ddddr</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">ggggggg</label>

                    <div class="col-lg-9">
                        <input type="text" class="form-control" id="v" ng-model="model.publicTel">
                        <span class="help-block">ddd ssssss</span>
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


</section>


