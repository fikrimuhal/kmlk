var kimlik = angular.module('kimlik', ['ui.bootstrap', 'ngResource']);

function UserController($scope, $http, filterFilter, $resource, userService) {


     $scope.isLoggedIn = function() {
        return userService.isLoggedIn()
    }

     $scope.isLoggedIn = function() {
        return userService.isLoggedIn()
    }

     $scope.isSelfProfile = function() {
        return config.isSelfProfile
    }


     $scope.getLoggedInUser = function() {
        return userService.getLoggedInUser()
    }


}




