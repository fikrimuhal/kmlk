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
    <a href="" class="btn btn-link pull-right m-t-mini"><i class="fa fa-question icon-xlarge text-default"></i>
    </a>
    <a class="navbar-brand" href="/">kimlik</a>
</header>
<!-- / header -->
<section id="content" ng-controller="SignInController">
    <div class="main padder">
        <div class="row">
            <div class="col-lg-4 col-lg-offset-4 m-t-large">
                <section class="panel">
                    <header class="panel-heading text-center">
                        Sign in
                    </header>

                    <form action="" class="panel-body">
                        <p class="text-center text-info" ng-if="inProgress"><b>Lütfen bekleyiniz...</b></p>

                        <div class="line line-dashed"></div>
                        <oauth:connect provider="facebook" id="facebook-connect-link" ng-class="{disabled: inProgress}" ng-click="login()"
                                       class="btn btn-facebook btn-block m-b-small"><i
                                class="fa fa-facebook pull-left"></i>Facebook ile giriş yap</oauth:connect>

                        %{--<oauth:connect provider="twitter" id="twitter-connect-link"--}%
                                       %{--class="btn btn-twitter btn-block"><i--}%
                                %{--class="fa fa-twitter pull-left"></i>Twitter ile giriş yap</oauth:connect>--}%

                        %{--<oauth:connect provider="google" id="google-connect-link"--}%
                                       %{--class="btn btn-gplus btn-block"><i--}%
                                %{--class="fa fa-google-plus pull-left"></i>Google ile giriş yap</oauth:connect>--}%

                        <oauth:connect provider="linkedin" id="linkedin-connect-link"  ng-class="{disabled: inProgress}" ng-click="login()"
                                       class="btn btn-linkedin btn-block"><i
                                class="fa fa-linkedin pull-left"></i>Linkedin ile giriş yap</oauth:connect>


                        %{--<div class="line line-dashed"></div>--}%

                        %{--<p class="text-muted text-center"><small>Hesabin henüz yok mu?</small></p>--}%
                        %{--<a href="/register/signUp" target="_self" class="btn btn-white btn-block">Ücretsiz hemen hesap oluştur</a>--}%
                    </form>
                </section>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript">

    function SignInController($scope, $resource) {
        $scope.inProgress = false;
        $scope.login = function () {
            var preventClick = $scope.inProgress;
            $scope.inProgress = true;
            return preventClick
        };

    }
</script>
<g:render template="/shared/footer"/>

</body>
</html>