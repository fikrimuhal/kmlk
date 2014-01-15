/**
 * Created by sumnulu on 21/11/13.
 */
var kimlik = angular.module('kimlik');


function AdminCtrl($scope, $routeSegment) {
    $scope.$routeSegment = $routeSegment;

    console.log('AdminCtrl Ready')
}

function AdminUsersCtrl($scope, $resource) {
    var api = $resource('/api/admin/:verb', {},
        {
            'allProfiles': {method: 'GET', params: {verb: 'allProfiles'}}
        });

    /**
     *
     * @param parameters
     */
    function fetchPage(parameters) {
        parameters = parameters || {};
        parameters = {
            currentPage: parameters.page || 1,
            itemsPerPage: parameters.itemsPerPage || 20
        };

        parameters.filterBy = $scope.filterBy;

        api.allProfiles(parameters, function (result) {
            console.log(result);
            $scope.users = result.data
            $scope.table.currentPage = result.currentPage
            $scope.table.itemsPerPage = result.itemsPerPage
            $scope.table.totalItems = result.totalItems

        });
    }

    $scope.users = [];

    $scope.selectPage = function (page) {
        fetchPage({page: page})
        console.log('page', page);
    };



    $scope.table = {
        totalItems: 0,
        maxSize: 5,
        currentPage: 1,
        itemsPerPage: 20
    };

    /* REGISTERED, UNREGISTERED, ALL*/
    $scope.filterBy = 'REGISTERED';
    $scope.changeFilter = function (newValue) {
        $scope.filterBy = newValue;
        fetchPage();
    };

    fetchPage();
    console.log('AdminUsersCtrl Ready')
}

function AdminCompaniesCtrl($scope, $resource) {
    var api = $resource('/api/admin/:verb', {},
        {
            'allCompanies': {method: 'GET', params: {verb: 'allCompanies'}}
        });

    /**
     *
     * @param parameters
     */
    function fetchPage(parameters) {
        parameters = parameters || {};
        parameters = {
            currentPage: parameters.page || 1,
            itemsPerPage: parameters.itemsPerPage || 20
        };

        parameters.filterBy = $scope.filterBy;

        api.allCompanies(parameters, function (result) {
            console.log(result);
            $scope.companies = result.data
            $scope.table.currentPage = result.currentPage
            $scope.table.itemsPerPage = result.itemsPerPage
            $scope.table.totalItems = result.totalItems

        });
    }

    $scope.companies = [];

    $scope.selectPage = function (page) {
        fetchPage({page: page})
        console.log('page', page);
    };



    $scope.table = {
        totalItems: 0,
        maxSize: 5,
        currentPage: 1,
        itemsPerPage: 20
    };

    fetchPage();
    console.log('AdminCompaniesCtrl Ready')
}
