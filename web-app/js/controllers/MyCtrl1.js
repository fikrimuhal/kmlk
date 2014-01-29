/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 7/12/13
 * Time: 8:32 PM
 * To change this template use File | Settings | File Templates.
 */


CTRL.controller('MyCtrl1', ['$scope', '$resource', function ($scope, $resource) {
    console.error('HElooo')
    var User = $resource('/fresh/apiTest/:userId', {userId: '@id'});
    $scope.var1 = 'merhaba ben var1 im';
    $scope.var2 = 'merhaba ben var2 yim!!!';
    $scope.varArray1 = ['11111', '2222222', '3333333', '44444444', 'merhaba!']

    var _users = User.query();
    $scope.getUsers = function () {
        return _users;
    };


}]);