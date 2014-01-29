/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 7/12/13
 * Time: 8:35 PM
 * To change this template use File | Settings | File Templates.
 */

CTRL.controller('ProfileCtrl', ['$scope', '$resource', 'ProfileService', '$state', function ($scope, $resource, ProfileService, $state) {


    var ANON_PICTURE = C.anon_pic,
        profile = {
            /**
             * given url should be in the form '.../profile/$id'. if id is not provided than use logged in user's id
             */
            id: $state.params.id || $scope.session.id
        },
        result = {passwordClass: '', emailClass: '' };


    !(function Initialize() {
        if (isSelfProfile()) {
            $scope.profile = $scope.session;


        } else {
            $scope.profile = ProfileService.showProfile($state.params.id);
            console.error('GGG::::',$scope.profile )
        }

    })();

    /**
     *
     * @returns {boolean} true if requested profile is for logged in user
     */
    function isSelfProfile() {
        var currentUser = $scope.session;
        return currentUser && profile.id == currentUser.id;
    }


    function changePassword(user) {
        user = user || {};
        var valid = user.password === user.password2;
        if (!valid) {
            $scope.result.passwordClass = 'warning';
            $scope.result.passwordDoesNotMatch = true;

            return
        } else {
            $scope.result.passwordDoesNotMatch = false;

        }
        $scope.passwordSubmitBtnDisabled = true;

        function success() {
            user.password = '';
            user.password2 = '';

            $scope.result.passwordClass = 'success';
        }

        function error() {
            $scope.result.passwordClass = 'error';

            $scope.passwordSubmitBtnDisabled = false;

        }

        ProfileService.changePassword(user, success, error);
    };

    function changeEmail(params) {
        params = params || {};
        $scope.result.emailNotAvailable = false;
        $scope.result.emailDoesNotMatch = false;

        var valid = params.email === params.email2;
        if (!valid) {
            $scope.result.emailClass = 'warning';
            $scope.result.emailDoesNotMatch = true;

            return
        } else {
            $scope.result.emailDoesNotMatch = false;

        }
        if (!params.currentPassword || (params.currentPassword && params.currentPassword.length < 1)) {
            alert('Parolanizi girmeniz gerekiyor.');
            return
        }


        $scope.emailSubmitBtnDisabled = true;

        function success() {
            params.email = null;
            params.email2 = null;
            params.currentPassword = null;

            $scope.result.emailClass = 'success';
        }

        function error() {
            $scope.result.emailClass = 'error';
            $scope.result.emailNotAvailable = true;

            $scope.emailSubmitBtnDisabled = false;

        }

        ProfileService.changeEmail(params, success, error);
    };


    /*
     ---------------------------------------------------------------------------------
     PUBLIC / SCOPE
     ---------------------------------------------------------------------------------
     */
    $scope.isSelfProfile = isSelfProfile;
    $scope.result = result;

//    $scope.profile = profile;
    $scope.changePassword = changePassword;
    $scope.changeEmail = changeEmail;
//    {
//        pictureUrl: 'https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash3/c42.42.531.531/s320x320/528342_10151825266584619_154370031_n.jpg',
//        name: 'Ilgaz Şumnulu'
//    }
    //$scope.user.pictureUrl = C.anon_pic;




}]);

