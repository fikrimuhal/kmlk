<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="first"/>
    <r:require modules="first_deprecated"/>

    <script type="text/javascript">
        _settings.staticMode = true // i.e. locationProvider should not use html5Mode
    </script>
</head>
<body>
<!-- header -->
<header id="header" class="navbar bg bg-black">
    <a href="" class="btn btn-link pull-right m-t-mini"><i class="fa fa-question icon-xlarge text-default"></i></a>
    <a class="navbar-brand" href="#">kimlik</a>
</header>
<!-- / header -->
<section id="content" ng-controller="RegisterController" ng-cloak>
    <div class="main padder">
        <div class="row">
            <div class="col-lg-4 col-lg-offset-4 m-t-large">
                <section class="panel">
                    <header class="panel-heading text-center">
                        Kayit ol
                    </header>
                    <form action="/" class="panel-body">
                        <div class="block">
                            <label class="control-label">Kullanıcı Adı</label>
                            <input type="text" ng-model="username" ng-change="checkUsername(username)"
                                   name="checkUsername(username)"
                                   placeholder="" class="form-control">
                            <span class="help-block">Kullanıcı adınız <em>AdSoyad</em> tarzında yazmanızı öneririz</span>
                            <span ng-show='username' class="help-block">http://kimlik.io/{{username}}</span>
                        </div>

                        %{--<button ng-disabled="submitButtonIsDisabled()" ng-click="createProfile()" ng-class="{'disabled':submitButtonIsDisabled(), 'btn-primary':!submitButtonIsDisabled()}" class="btn btn-block ">Profilimi oluştur</button>--}%
                        <div class="line line-dashed"></div>
                        <div class="row">
                            <div class="col-sm-12 text-center" ng-switch on="submitButtonIsDisabled()">

                                <h4 ng-hide='username' class=" text-info">Kişisel hesabınız için lütfen kullanıcı adı seçiniz...</h4>
                                <h4 ng-show='submitInProgress' class="text-info">Profiliniz oluşturuluyor lütfen bekleyiniz...</h4>

                                <h4 ng-switch-when="true"  ng-show='username && !submitInProgress' class=" text-danger">{{userNameMessage}}</h4>
                                <h4 ng-switch-when="false" ng-show='username' class="text-success">{{userNameMessage}}</h4>
                            </div>
                        </div>
                        <div class="line line-dashed"></div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> Kullanım sözleşmesini kabulet. Okumak için <a href="#">tiklayin</a>
                            </label>
                        </div>
                        <a href="#" ng-disabled="submitButtonIsDisabled()" ng-click="createProfile()" ng-class="{'disabled':submitButtonIsDisabled(), 'btn-primary':!submitButtonIsDisabled()}" class="btn btn-block ">Profilimi oluştur</a>
                    </form>
                </section>
            </div>
        </div>
    </div>
</section>
<g:render template="/shared/footer"/>

</body>
</html>

