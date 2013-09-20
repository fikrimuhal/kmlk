var kimlik = angular.module('kimlik', ['ui.bootstrap', 'ngResource']);

function UserController($scope, $http, filterFilter, $resource, userService) {


     $scope.isLoggedIn = function() {
        return userService.isLoggedIn()
    }


     $scope.getLoggedInUser = function() {
        return userService.getLoggedInUser()
    }


}




