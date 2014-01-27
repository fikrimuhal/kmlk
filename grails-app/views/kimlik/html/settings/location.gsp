<style>
#map-canvas {
    height: 350px;
    margin: 0px;
    padding: 0px
}
</style>

<div class="row">
    <div class="col-sm-6">
        <form class="form-horizontal" role="form">
            <div class="form-group">
                <label for="fullName" class="col-lg-3 control-label">Ülke</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" id="fullName"
                           ng-model="address.country" ng-change="codeAddress()"/>
                    <span class="help-block"></span>

                </div>
            </div>

            <div class="form-group">
                <label for="sortName" class="col-lg-3 control-label">İl</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" id="sortName" ng-change="codeAddress()"
                           ng-model="address.city">
                    <span class="help-block"></span>

                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label">İlçe</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" ng-change="codeAddress()" ng-model="address.district">
                    <span class="help-block"></span>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label">Mahalle</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" ng-change="codeAddress()" ng-model="address.quarter">
                    <span class="help-block">Eğer mahalle ismini bilmiyorsanız yada yok ise boş bırakınız</span>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label">Cadde</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" ng-change="codeAddress()" ng-model="address.avenue">
                    <span class="help-block">Eğer cadde ismini bilmiyorsanız yada yok ise boş bırakınız</span>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label">Sokak</label>

                <div class="col-lg-9">
                    <input type="text" class="form-control" ng-change="codeAddress()" ng-model="address.street">
                    <span class="help-block">Eğer sokak ismini bilmiyorsanız yada yok ise boş bırakınız</span>
                </div>
            </div>

            <div class="form-group">
                <label class="col-lg-3 control-label">Address</label>

                <div class="col-lg-9">
                    <textarea class="form-control" ng-model="address.display_address" rows="5"></textarea>
                    <span class="help-block">Bu alani revize etmeyi unutmayınız, profiliniz de bu adres gosterilecektir.</span>
                </div>
            </div>


            <div class="form-group">
                <label class="col-lg-3 control-label">Gizlilik</label>

                <div class="col-lg-9">

                    <span class="help-block">Profilinize bakan kişilerin ev adresinizi hangi seviyeye kadar görebileceğini seçiniz</span>

                    %{--<div class="radio">--}%
                        %{--<label>--}%
                            %{--<input type="radio" ng-model="address.privacyLevel" value="0">--}%
                            %{--Gizli &mdash; Adres bilgisi gösterilmez--}%
                        %{--</label>--}%
                    %{--</div>--}%

                    <div class="radio">
                        <label>
                            <input type="radio" ng-model="address.privacyLevel" value="100">
                            Ülke &mdash; Sadece ülke bilgisi gözükürür
                        </label>
                    </div>

                    <div class="radio">
                        <label>
                            <input type="radio"  ng-model="address.privacyLevel" value="200">
                            Şehir &mdash; Sadece ülke ve şehir bilgisi gözükürür
                        </label>
                    </div>

                    <div class="radio">
                        <label>
                            <input type="radio"  ng-model="address.privacyLevel" value="300">
                            İlçe &mdash; Sadece ülke, şehir ve ilçe bilgisi gözükürür (Tavsiye edilen)
                        </label>
                    </div>

                    <div class="radio">
                        <label>
                            <input type="radio" ng-model="address.privacyLevel" value="1000">
                            Hepsi &mdash; Açık adresiniz gözükür
                        </label>
                    </div>

                </div>

            </div>


            <div class="form-group">
                <div class="col-lg-9 col-lg-offset-3">
                    <button ng-click="save(address)" type="button" class="btn btn-primary pull-right">Kaydet</button>
                    <span class="help-block"></span>
                </div>
            </div>

        </form>
    </div>

    <div class="col-sm-6">
        <section class="panel">

            <div class="panel-body" style="padding: 0px;">
                <div id="map-canvas"></div>
            </div>
            <header class="panel-heading">
                <p class="form-control-static">{{address.formatted_address}}</p>
            </header>

        </section>

        <div class="alert alert-info alert-block" ng-show="address.city">
            <button type="button" class="close" data-dismiss="alert"><i class="fa fa-remove"></i></button>

            <h4><i class="fa fa-map-marker icon-2x"></i>
                {{markerIsJumping?'Zıplayan':'Zıplamayan'}} işaret hakkında!</h4>

            <p>
                Lütfen evinizin yerini işaretleyiniz. Olabildiğince doğru yere koymaya çalışın: <br/>
                (Yaptığınız iş başvurularında, iş yerinin evinize olan uzaklığını hesaplamak için kullanılacaktır.)
            </p>
        </div>

    </div>

</div>
%{--<pre>--}%

    %{--{{user | json}}--}%
%{--</pre>--}%
