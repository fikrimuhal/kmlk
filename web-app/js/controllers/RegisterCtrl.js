/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 7/12/13
 * Time: 8:35 PM
 * To change this template use File | Settings | File Templates.
 */

CTRL.controller('RegisterCtrl', ['$scope', '$resource', 'ProfileService', '$state', function ($scope, $resource, ProfileService, $state) {
    $scope.submitBtnDisabled = false

//    $scope.user = {
//        firstName: 'firstName',
//        lastName: 'lastName',
//        password: 'password',
//        email: 'ilgaz@fikrimuhal.com',
//        email_repeat: 'ilgaz@fikrimuhal.com'
//    };
    $scope.user = {
        firstName: '',
        lastName: '',
        password: '',
        email: '',
        email_repeat: ''
    }
    //email=&password=myPassword&firstName=first&middleName=middle&lastName=last
    $scope.registerBtn = function (user) {
        if (user.email !== user.email_repeat) {
            alert('Email adresinizi kontrol ediniz!');
            return;
        }

        if (6 > user.password.length) {
            alert('Password en az 6 karakter olmali!');
            return
        }

        $scope.submitBtnDisabled = true

        //Resource.action([parameters], postData, [success], [error])
        var postData = user
        var registeredUser = ProfileService.register({}, postData, function (result) {
            alert('Size email yolladık! Email inizdeki linke tıklayınız!');
            $state.transitionTo('login', {}, true);

        }, function (result) {
            $scope.submitBtnDisabled = false
            alert('FAIL!');
            //todo hatayi goster render et.

        });
    }

    $scope.checkEmail = function (/**String*/email) {
        $scope.result = ProfileService.checkEmailAvailability(email)
    }

}]);