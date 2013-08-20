/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 7/12/13
 * Time: 8:32 PM
 *
 * Bu Controller'i passwordReset ve changePasswordWithToken kullaniyor
 */


CTRL.controller('ForgotPasswordCtrl', ['$scope', 'ProfileService', '$state', '$location', function ($scope, ProfileService, $state, $location) {
    var user = {email: '', password: ''};

    /**
     * http://localhost.acikdemokrasi.org:8080/fresh/index#!/forgotPassword
     */
    if ($state.current.name == "forgotPassword") {
    }

    /**
     * http://localhost.acikdemokrasi.org:8080/fresh/index/#!/changePasswordWithToken
     */
    if ($state.current.name == "changePasswordWithToken") {
        user.displayName = Base64.decode($location.$$search.name); // Users name encoded as Base64
    }

    function forgotPassword(user) {
        $scope.submitBtnDisabled = true;
        function onSuccess(result) {
            console.log(result);
            alert('Parolanızı email adresinize yolladik!');
            $state.transitionTo('login', {}, true);

        }

        function onError(result) {
            alert('Email addresi bulunamadi');
            $scope.submitBtnDisabled = false;

            console.log(result.data);
        }

        ProfileService.resetPassword(user.email, onSuccess, onError);

    }

    function changePassword(user) {
        if (6 > user.password.length) {
            alert('Password en az 6 karakter olmali!');
            return
        }

        $scope.submitBtnDisabled = true;
        user.token = $location.$$search.token;
        function onSuccess(result) {
            console.log(result);
            alert('Parolan degisti!');
            $state.transitionTo('idea', {}, true);

        }

        function onError(result) {
            alert('ANEKTARLAR DIYORUM! Parolani degistiremiyorum uzgunum! bir problem var! Tekrar email adresinizi giriniz...');
            $scope.submitBtnDisabled = false;
            $state.transitionTo('forgotPassword', {}, true);

            console.error(result.data);
        }

        //user parameter must contain {password, token}
        ProfileService.changePassword(user, onSuccess, onError);

    }


    /*
     ---------------------------------------------------------------------------------
     PUBLIC / SCOPE
     ---------------------------------------------------------------------------------
     */
    $scope.user = user;
    $scope.submitBtnDisabled = false;
    $scope.forgotPassword = forgotPassword;
    $scope.changePassword = changePassword;

}]);

