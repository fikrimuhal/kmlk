<%--
  Created by IntelliJ IDEA.
  User: sumnulu
  Date: 10/14/13
  Time: 5:53 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>



<div class="page-header text-center">

    <h2>Yeni Şirket</h2>
</div>


<div class="row">
    <div class="col-lg-offset-2 col-sm-7">
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

            <div class="form-group" ng-class="formStatusClass.pageName">
                <label class="col-lg-3 control-label">Sayfa adi</label>

                <div class="col-lg-9"  ng-switch on="isPageNameAvailable(model.pageName)">
                    <input type="text" class="form-control"  ng-model="model.pageName" ng-change="validatePageName(model.pageName)">


                    <span ng-switch-when="true"  class="help-block text-success">Bu sayfa adını kullanabilirsiniz</span>
                    <span ng-switch-when="false" class="help-block text-error">Bu sayfa adı kullanımda. Lütfen başka bir ad seçiniz</span>
                    <span class="help-block">Http://kimlik.io/[SAYFA_ADI] şeklinde kullanicak ad. Şirket unvaninin Ilk parcasini kullaniniz. Boşluk Kullanmayiniz</span>
                </div>
            </div>

            <div class="form-group">
                <label  class="col-lg-3 control-label">Şirket Türu</label>

                <div class="col-lg-9">
                    <select ng-model="model.legalType" class="form-control">
                        <option value="" disabled selected>Lütfen seçiniz...</option>
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
                    <span class="help-block">Daha sonra başka kişiler ekleye bilirsiniz, yada yonetici haklarini düzenleye bilirsiniz.</span>
                </div>
            </div>

            <div class="form-group">
                <div class="col-lg-offset-3 col-lg-9">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox"> Sözleşmeyi okudum ve anladım
                        </label>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-lg-offset-3 col-lg-9">
                    <button type="submit" class="btn btn-primary" ng-click="save()">Şirket Sayfamı Oluştur</button>
                </div>
            </div>
        </form>
    </div>


</div>
        <pre>
            {{ model | json }}
        </pre>
</body>
</html>