/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 7/12/13
 * Time: 8:45 PM
 * To change this template use File | Settings | File Templates.
 */
CTRL.controller('LoginCtrl', ['Facebook', '$scope', '$rootScope', '$http' , '$location', '$resource', '$state', 'ProfileService', function (Facebook, $scope, $rootScope, $http, $location, $resource, $state, ProfileService) {

//######################################################################################################################
//##################################################   EMAIL   #########################################################
//######################################################################################################################
    var user = {rememberMe: true, email: '', password: ''}
//    var user = {remember: true, email: 'ilgaz@fikrimuhal.com', password: 'password'};  //t-odo :yukaridakini kullan bu test icin


    function emailLogin() {
        ProfileService.authenticateViaEmail(user, 'idea');
    }

    /*
     ---------------------------------------------------------------------------------
     PUBLIC / SCOPE
     ---------------------------------------------------------------------------------
     */
    $scope.emailLogin = emailLogin;
    $scope.user = user;

//######################################################################################################################
//##################################################  FACEBOOK   #######################################################
//######################################################################################################################
    function facebookLogin() {
        Facebook.login();  //---> if succcess this will fire:fb_connected
        return false;
    }


    console.log('FacebookCtrl initialized');


//    ---------------------------------------------------------------------------------
//       to server private methods--->
//    ---------------------------------------------------------------------------------


//    ---------------------------------------------------------------------------------
//        Event handlers
//    ---------------------------------------------------------------------------------

    $rootScope.$on("fb_statusChange", function (event, args) {
        console.log('----------- FB event received!', args);
        $rootScope.fb_status = args.status;
        $rootScope.$apply();
    });
    $rootScope.$on("fb_get_login_status", function () {
        console.log("fb_get_login_status");
        Facebook.getLoginStatus();
    });
    $rootScope.$on("fb_login_failed", function () {
        console.log("fb_login_failed");
    });
    $rootScope.$on("fb_logout_succeded", function () {
        console.log("fb_logout_succeded");
    });
    $rootScope.$on("fb_logout_failed", function () {
        console.log("fb_logout_failed!");
    });

    $rootScope.$on("fb_connected", function (event, args) {
        /*
         ---------------------------------------------------------------------------------
         http://developers.facebook.com/docs/reference/javascript/FB.getLoginStatus/
         ---------------------------------------------------------------------------------
         */

        var params = {};


        if (args.userNotAuthorizedBefore === true) {
            //if the user has not authorized the app, we must write his credentials in our database
            //User could have unauthorized our app and reauthorized, so database could have her id
            console.log("user is connected to facebook but has not authorized our app before and we MAY NOT have her at DB");
        } else {
            console.log("user is connected to facebook and has authorized our app and we MAY have her at DB");
        }

        ProfileService.authenticateViaFacebook('idea');

    });


    if (!ProfileService.isLoggedIn) {
        console.log('NOT LOGGED IN');
        //ProfileService.updateUser();

    } else {
        console.log('LOGGED IN');
    }


//    ---------------------------------------------------------------------------------
//        Buttons [*]  [*]  [*]  [*]
//    ---------------------------------------------------------------------------------
    $scope.info = {};

    $scope.getLoginStatus = function () {
        Facebook.getLoginStatus();
    };

    $scope.facebookLogin = facebookLogin

    //TODO: User service den cekmesi lazim bu bilgileri....
    $scope.getInfo = function () {
        FB.api('/' + $rootScope.session.facebook_id, function (response) {
            console.log('Good to see you, ' + response.name + '.');
        });
        $rootScope.info = $rootScope.session;

    };


//    ---------------------------------------------------------------------------------
//        Logout/ UnRegister stuff
//    ---------------------------------------------------------------------------------
    $scope.logout = function () {
        console.error('FIXME! NYI!, ayrica bu burada olmamali...')
        Facebook.logout();
        $rootScope.session = {};
        document.location = '/fresh/logout'
    };

    $scope.unsubscribe = function () {
        Facebook.unsubscribe();
    }


}]);