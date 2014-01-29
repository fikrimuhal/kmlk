<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="kimlik"/>
</head>

<body>
<div ng-controller='personalInfoController'>
    <h4 class="glyphicons notes"><i></i>Kişisel bilgilerim</h4>

    %{--<div class="heading-buttons">--}%
    %{--<h3 class="glyphicons share_alt"><i></i>  İŞ GEÇMİŞİ<span><g:link action="employment"--}%
    %{--params="[username: params.username]">hepsini goster</g:link>--}%
    %{--</span></h3>--}%

    %{--<div class="buttons pull-right">--}%
    %{--<g:link action="employment" params="[username: params.username]">düzenle</g:link>--}%
    %{--</div>--}%
    %{--</div>--}%
    %{--<form novalidate>--}%

    %{--<div class="body span9">--}%
    %{--<h4><input type="text" placeholder="Gorev / Pozisyon" ng-model="newWork.position"/> @ <input type="text"--}%
    %{--placeholder="Sirket"--}%
    %{--ng-model="newWork.entity"/>--}%
    %{--</h4>--}%

    %{--<textarea placeholder="Aciklama" ng-model="newWork.note"></textarea>    <br>--}%
    %{--<label>Baslangic</label><input type="date" class="input-full" ng-model="newWork.startDate"/>    <br>--}%
    %{--<label>Bitis</label><input type="date" class="input-full" ng-model="newWork.endDate"/>    <br>--}%
    %{--</div>--}%

    %{--</form>--}%
    <div class="row-fluid">
        <div class="span12">
            <form class="form-horizontal" novalidate>

                <h5>Kişisel</h5>

                <div class="control-group">
                    <label class="control-label">Ad</label>

                    <div class="controls">
                        <input type="text" ng-model="model.first_name">
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Göbek adı</label>

                    <div class="controls">
                        <input type="text" ng-model="model.middle_name">
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Soyad</label>

                    <div class="controls">
                        <input type="text" ng-model="model.last_name">
                    </div>
                </div>

               %{-- <div class="control-group">
                    <label class="control-label">Doğum Tarihi</label>

                    <div class="controls">
                        <input type="date" ng-model="model.birthDate">
                        <label class="checkbox inline">
                            <input type="checkbox" id="inlineCheckbox1" value="option1"> gizli
                        </label>
                    </div>
                </div>--}%
                %{--
                                <h5>Telefon</h5>

                                <div class="control-group">
                                    <label class="control-label">Yeni Telefon</label>

                                    <div class="controls">
                                        <input type="text" placeholder="(_ _ _) _ _ _ _ _ _ _">

                                        <ul>
                                            <li>5336406120<a href="">kaldır</a></li>
                                            <li>312 266 69 55 <a href="">kaldır</a></li>
                                        </ul>
                                    </div>
                                </div>--}%

                <h5>www</h5>

                <div class="control-group">
                    <label class="control-label">www</label>

                    <div class="controls">
                        <input type="text" placeholder="http://" ng-model="model.webSite">
                    </div>
                </div>

%{--
                <h5>Adress</h5>

                <div class="control-group">
                    <label class="control-label">Şehir</label>

                    <div class="controls">
                        <input type="text" ng-model="model.contactInfo.address.city">
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Ülke</label>

                    <div class="controls">
                        <input type="text" ng-model="model.contactInfo.address.country">
                    </div>
                </div>


                <div class="control-group">
                    <label class="control-label">Adres</label>

                    <div class="controls">
                        <input type="text" ng-model="model.contactInfo.address.other">
                    </div>
                </div>
--}%

                <h5>Hakkımda</h5>

                <div class="control-group">
                    <label class="control-label">Kendinizi Tanıtın</label>

                    <div class="controls">
                        <textarea ng-model="model.aboutText" class="span12"></textarea>
                    </div>
                </div>


                <div class="control-group">
                    <div class="controls">
                        <label class="checkbox">
                        </label>
                        <button type="submit" class="btn" ng-click="save()">Kaydet</button>
                    </div>
                </div>

            </form>
%{--
            <form class="form-horizontal" novalidate>

                <h5>Email</h5>

                <div class="control-group">
                    <label class="control-label">Gizli Email</label>

                    <div class="controls">
                        <input type="text" ng-model="model.contactInfo.primaryEmail">
                        <button type="submit" class="btn">email adresimi kaydet</button>

                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Açik Email</label>

                    <div class="controls">
                        <input type="text" ng-model="model.contactInfo.publicEmail">
                        <button type="submit" class="btn">email adresimi kaydet</button>
                        <span>Profiliniz de herkez tarafından görülür</span>
                    </div>
                </div>

            </form>--}%

        </div>
    </div>

    <pre>
        {{model | json}}
    </pre>
</body>
</html>
