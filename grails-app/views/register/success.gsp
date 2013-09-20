<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="frontKimlik"/>
    <script src="http://code.angularjs.org/1.0.8/angular-resource.min.js"></script>
    <style type="text/css">

    .animate-if.ng-enter, .animate-if.ng-leave {
        -webkit-transition: all cubic-bezier(0.250, 0.460, 0.450, 0.940) 0.5s;
        -moz-transition: all cubic-bezier(0.250, 0.460, 0.450, 0.940) 0.5s;
        -o-transition: all cubic-bezier(0.250, 0.460, 0.450, 0.940) 0.5s;
        transition: all cubic-bezier(0.250, 0.460, 0.450, 0.940) 0.5s;
    }

    .animate-if.ng-enter,
    .animate-if.ng-leave.ng-leave-active {
        opacity: 0;
    }

    .animate-if.ng-enter.ng-enter-active,
    .animate-if.ng-leave {
        opacity: 1;
    }
    </style>
    <r:require modules="kimlik_register"/>
</head>

<body>

<div id="login">
    <h1>KIMLIK.IO/<small style="font-style: italic">AdınSoyadın</small></h1>
    <br>

    <div class="wrapper signup" ng-controller="RegisterController">
        <h1 class="glyphicons user_add">Kayıt ol <i></i> <small><br>Kulanici adininizi seçiniz. Kullanici adinizi sectikten sonra bir daha degistiremezsiniz.
        </small></h1>
        <!-- Box -->
        <div class="widget widget-heading-simple">
            <div class="widget-body">
                <!-- Form -->
                <form method="post" action="">

                    <!-- Row -->
                    <div class="row-fluid ">

                        <!-- Column -->
                        <div class="span8">
                            <h5>http://kimlik.io/ <small><input ng-model="username" ng-change="checkUsername(username)"
                                                                name="checkUsername(username)" type="text" class=""
                                                                placeholder="Kullanici adiniz"/></small></h5>
                            %{--<h5>Email adresiniz <small><input name="email" type="text" class="" placeholder="email adresiniz"/></small></h5>--}%

                            <button ng-disabled="submitButtonIsDisabled()" ng-click="createProfile()"
                                    class="btn btn-icon-stacked btn-block btn-primary glyphicons user_add span6 pull-right"><i></i><span>Profilimi oluştur</span><span
                                    class="strong">Kayıt ol</span></button>
                        </div>

                        <!-- // Column END -->    <!-- Column -->
                        <div class="span4" ng-switch on="submitButtonIsDisabled()">
                            <span ng-switch-when="true" class=" text-error">{{userNameMessage}}</span>
                            <span ng-switch-when="false" class="text-success">{{userNameMessage}}</span>
                        </div>
                        <!-- // Column END -->

                    </div>
                    <!-- // Row END -->

                </form>
                <!-- // Form END -->

            </div>
            <!-- // Box END -->

        </div>

        %{--Normal kayit ol basla--}%
        %{--<br><br>--}%
        %{--<h1 class="glyphicons icon-chevron-down"> - Yada<i></i> <small>email adresin ile...</small></h1>--}%

        %{--<!-- Box -->--}%
        %{--<div class="widget widget-heading-simple">--}%
        %{--<div class="widget-body">--}%

        %{--<!-- Form -->--}%
        %{--<form method="post" action="">--}%

        %{--<!-- Row -->--}%
        %{--<div class="row-fluid row-merge">--}%

        %{--<!-- Column -->--}%
        %{--<div class="span6">--}%
        %{--<div class="innerR">--}%
        %{--<label class="strong">Ad</label>--}%
        %{--<input type="text" class="input-block-level" placeholder="Adiniz"/>--}%
        %{--<label class="strong">Soyad</label>--}%
        %{--<input type="password" class="input-block-level" placeholder="Soyadiniz"/>--}%
        %{--<label class="strong">Parola</label>--}%
        %{--<input type="password" class="input-block-level" placeholder="Parolaniz"/>--}%
        %{--</div>--}%
        %{--</div>--}%
        %{--<!-- // Column END -->--}%

        %{--<!-- Column -->--}%
        %{--<div class="span6">--}%
        %{--<div class="innerL">--}%
        %{--<label class="strong">Email</label>--}%
        %{--<input type="text" class="input-block-level" placeholder="Email adresiniz"/>--}%
        %{--<label class="strong">Tekrar Email</label>--}%
        %{--<input type="text" class="input-block-level" placeholder="Yukarıda yazan email adresinizin tekrarı"/>--}%
        %{--<a href=""--}%
        %{--class="btn btn-icon-stacked btn-block btn-primary glyphicons user_add"><i></i><span>Email adresiniz ile</span><span--}%
        %{--class="strong">Kayıt ol</span></a>--}%


        %{--<p>Bir sorun mu var? <a href="/help">Yardim edelim</a></p>--}%
        %{--</div>--}%
        %{--</div>--}%
        %{--<!-- // Column END -->--}%

        %{--</div>--}%
        %{--<!-- // Row END -->--}%

        %{--</form>--}%
        %{--<!-- // Form END -->--}%

        %{--</div>--}%
        %{--<!-- // Box END -->--}%

        %{--</div>--}%

        <br><br>

    </div>

</div>

</body>
</html>
