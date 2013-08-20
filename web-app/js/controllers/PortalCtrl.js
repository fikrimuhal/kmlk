/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 7/12/13
 * Time: 8:36 PM
 * To change this template use File | Settings | File Templates.
 */

CTRL.controller('PortalCtrl', ['$scope', function ($scope) {
    $scope.portalId = 1; //todo implement

    $scope.voteId = 8; //todo implement //todo move this

    //Voters
    $scope.voters = getMockVoters();   //todo move


    $scope.items = getMockEventItems();

}]);