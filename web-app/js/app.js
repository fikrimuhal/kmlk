var kimlik = angular.module('kimlik', ['ui.bootstrap', 'ngResource', 'ngRoute', 'route-segment', 'view-segment']);


kimlik.config(['$routeSegmentProvider', '$locationProvider',
    function ($routeSegmentProvider, $locationProvider) {
        $locationProvider.html5Mode(true);
        $routeSegmentProvider.options.autoLoadTemplates = true;

        $routeSegmentProvider.
            when('/company/:company_name/settings', 'company.settings.general').
            when('/company/:company_name/settings/general', 'company.settings.general').
            when('/company/:company_name/settings/location', 'company.settings.location').
            when('/company/:company_name/settings/images', 'company.settings.images').
            when('/company/:company_name/settings/social', 'company.settings.social').
            when('/company/:company_name/settings/notifications', 'company.settings.notifications').
            when('/company/:company_name/settings/security', 'company.settings.security').

            segment('company', {
                templateUrl: '_template/company.inline',
                controller: CompanyCtrl
            });

        $routeSegmentProvider.within('company').
            segment('settings', {
                templateUrl: '/html/company/settings/settings.html',
                controller: CompanySettingsCtrl}).
            within().
            segment('general', {templateUrl: '/html/company/settings/general.html'}).
            segment('location', {templateUrl: '/html/company/settings/location.html'}).
            segment('images', {templateUrl: '/html/company/settings/images.html'}).
            segment('social', {templateUrl: '/html/company/settings/social.html'}).
            segment('notifications', {templateUrl: '/html/company/settings/notifications.html'}).
            segment('security', {templateUrl: '/html/company/settings/security.html'});

        $routeSegmentProvider.
            when('/company/:company_name/hr', 'company.hr.employees').
            when('/company/:company_name/hr/employees', 'company.hr.employees').
            when('/company/:company_name/hr/positions', 'company.hr.positions').
            when('/company/:company_name/hr/applicants', 'company.hr.applicants').
            when('/company/:company_name/hr/notifications', 'company.hr.notifications').

            within('company').segment('hr', {templateUrl: '/html/company/hr/hr.html',
                controller: CompanySettingsCtrl}).
            within().
            segment('employees', {templateUrl: '/html/company/hr/employees.html',
                controller: CompanyEmployeeCtrl}).
            segment('positions', {templateUrl: '/html/company/hr/positions.html'}).
            segment('applicants', {templateUrl: '/html/company/hr/applicants.html'}).
            segment('notifications', {templateUrl: '/html/company/hr/notifications.html'});

        $routeSegmentProvider.
            when('/company/:company_name/skills', 'company.skills').
            within('company').segment('skills', {
                templateUrl: '/html/company/skills/skills.html',
                controller: CompanySettingsCtrl});

        $routeSegmentProvider.
            when('/company/:company_name/products', 'company.products').
            within('company').segment('products', {
                templateUrl: '/html/company/products/products.html',
                controller: CompanySettingsCtrl});

        $routeSegmentProvider.
            when('/company/:company_name/services', 'company.services').
            within('company').segment('services', {
                templateUrl: '/html/company/services/services.html',
                controller: CompanySettingsCtrl});

        $routeSegmentProvider.
            when('/company/:company_name/notifications', 'company.notifications').
            within('company').segment('notifications', {
                templateUrl: '/html/company/notifications/notifications.html',
                controller: CompanySettingsCtrl});

        $routeSegmentProvider.
            when('/company/my/list', 'company.list').
            within('company').segment('list', {
                templateUrl: '/html/company/list.html',
                controller: CompanyListCtrl});


        $routeSegmentProvider.
            when('/company/my/new', 'company.new').
            within('company').segment('new', {
                templateUrl: '/html/company/new.html',
                controller: CompanyNewCtrl});


    }
]);

function UserController($scope, $http, filterFilter, $resource, userService) {

    $scope.isLoggedIn = function () {
        return userService.isLoggedIn()
    }

    $scope.isLoggedIn = function () {
        return userService.isLoggedIn()
    }

    $scope.isSelfProfile = function () {
        return config.isSelfProfile
    }


    $scope.getLoggedInUser = function () {
        return userService.getLoggedInUser()
    }


}


function CompanySettingsCtrl($scope, $routeSegment) {

}


function CompanyNewCtrl($scope, $routeSegment) {


}


function CompanyListCtrl($scope, $routeSegment) {
    console.log('CompanyListCtrl Ready')

}
function CompanyEmployeeCtrl($scope, $routeSegment) {
    $scope.employmentRequests = [
        {  profile:11111,
            company:2222222233,
            requestedByCompany:false},
        {  profile:11111,
            company:2222222233,
            requestedByCompany:true},
        {  profile:11111,
            company:2222222233,
            requestedByCompany:true},
        {  profile:11111,
            company:2222222233,
            requestedByCompany:false},
        {  profile:11111,
            company:2222222233,
            requestedByCompany:false}
    ]

}

/**
 * Parent Controller of Company related pages
 * @param $scope
 * @param companyService
 * @constructor
 */
function CompanyCtrl($scope, companyService, $routeSegment) {
    $scope.companies = companyService.getUserCompanyList();
    $scope.$routeSegment = $routeSegment

    $scope.$on('routeSegmentChange', function () {
        //broadcast de company_name i aliyoruz boylece resolved oldugundan eminiz parametrenin.
        //URL mapping de resolved ile yapila bilinir?
        //Sayfa render olmadan once resolved olsa daha iyi olur.
        $scope.company_name = $routeSegment.$routeParams.company_name
    });

    console.log('CompanyCtrl Ready')
}


kimlik.factory('companyService', function ($resource, $rootScope) {

    function todo() {
        alert('todo')
    }

    function getUserCompanyList() {

        var api = $resource('/company/userCompanyList');
        return employment = api.query({}, {});
    }

    return{
        getUserCompanyList: getUserCompanyList
    };
});





