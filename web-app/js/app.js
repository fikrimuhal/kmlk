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
            when('/company/:company_name/hr/positions/:pid', 'company.hr.positions').
            when('/company/:company_name/hr/applicants', 'company.hr.applicants').
            when('/company/:company_name/hr/applicants/:pid', 'company.hr.applicants').
            when('/company/:company_name/hr/notifications', 'company.hr.notifications').

            within('company').segment('hr', {templateUrl: '/html/company/hr/hr.html'}).
            within().
            segment('employees', {templateUrl: '/html/company/hr/employees.html',
                controller: CompanyEmployeeCtrl}).
            segment('positions', {
                templateUrl: '/html/company/hr/positions.html',
                dependencies: ['pid'],
                controller: CompanyPositionCtrl}).
            segment('applicants', {
                templateUrl: '/html/company/hr/applicants.html',
                dependencies: ['pid'],
                controller: CompanyApplicantsCtrl}).
            segment('notifications', {templateUrl: '/html/company/hr/notifications.html'});

        $routeSegmentProvider.
            when('/company/:company_name/skills', 'company.skills').
            within('company').segment('skills', {
                templateUrl: '/html/company/skills/skills.html',
                controller: CompanySkillsCtrl});

        $routeSegmentProvider.
            when('/company/:company_name/products', 'company.products').
            within('company').segment('products', {
                templateUrl: '/html/company/products/products.html',
                controller: CompanyProjectsCtrl});

        $routeSegmentProvider.
            when('/company/:company_name/services', 'company.services').
            within('company').segment('services', {
                templateUrl: '/html/company/services/services.html',
                controller: CompanyServicesCtrl});

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


        $routeSegmentProvider.
            when('/company/:company_name/dashboard', 'company.dashboard').
            within('company').segment('dashboard', {
                templateUrl: '/html/company/dashboard/dashboard.html'});


    }
]);

function UserController($scope, $http, filterFilter, $resource, userService) {

    $scope.isLoggedIn = function () {
        return userService.isLoggedIn()
    };

    $scope.isLoggedIn = function () {
        return userService.isLoggedIn()
    };

    $scope.isSelfProfile = function () {
        return config.isSelfProfile
    };


    $scope.getLoggedInUser = function () {
        return userService.getLoggedInUser()
    };


}


function CompanyDashboardCtrl($scope, $routeSegment) {

}

function CompanySkillsCtrl($scope, $routeSegment) {

}

function CompanySettingsCtrl($scope, $routeSegment) {
    console.log('Settings CTRL Ready')

}


function CompanyNewCtrl($scope, $routeSegment) {


}


function CompanyServicesCtrl($scope) {
    console.log('Services CTRL Ready')

}


function CompanyProjectsCtrl($scope) {
    console.log('Projects CTRL Ready')

}

function CompanyListCtrl($scope) {
    console.log('CompanyListCtrl Ready')

}

function CompanyEmployeeCtrl($scope) {
    $scope.employmentRequests = [
        {  profile: 11111,
            company: 2222222233,
            requestedByCompany: false},
        {  profile: 11111,
            company: 2222222233,
            requestedByCompany: true},
        {  profile: 11111,
            company: 2222222233,
            requestedByCompany: true},
        {  profile: 11111,
            company: 2222222233,
            requestedByCompany: false},
        {  profile: 11111,
            company: 2222222233,
            requestedByCompany: false}
    ]

}

function CompanyPositionCtrl($scope, $routeSegment) {
    var pid = $routeSegment.$routeParams.pid

    $scope.page = {};
    $scope.position = {};
    if (pid === "new") {
        $scope.page.edit = true;
        $scope.page.show = false;
        $scope.page.isNew = true;
        $scope.page.title = "Yeni pozisyon";
        console.log('Yeni pozisyon');
    } else {
        $scope.page.edit = false;
        $scope.page.show = false;
        $scope.position.id = pid;
        console.log('Pozisyonu goster')
    }


    var _positionCache = {

        '52684f4def861e456dac75b4': {  _id: '52684f4def861e456dac75b4',
            company: 2222222233,
            title: 'Fullstack Java developer'},
        '52684f4def861e456dac75b2': {  _id: '52684f4def861e456dac75b2',
            company: 2222222233,
            title: 'JavaScript developer'},
        '52684f4def861e456dac75b1': {  _id: '52684f4def861e456dac75b1',
            company: 2222222233,
            title: 'Genel başvuru'}
    };

    function getPositionById(pid) {
        console.log('pid: ', pid);
        console.log('position cache: ', _positionCache);
        if (pid && pid == 'new') {
            return {}
        } else if (pid) {
            return _positionCache[pid]
        } else {
            return {}
        }
//        return (!pid || pid == 'new') ? {} : {  _id: pid,
//            company: 2222222233,
//            title: 'Genel başvuru'}
    }

    $scope.toggleEdit = function () {
        $scope.page.edit = !$scope.page.edit;
        $scope.page.show = !$scope.page.edit;
    };
    $scope.positions = _.values(_positionCache);

    $scope.position = getPositionById(pid);
    $scope.page.show = ($scope.position && $scope.position._id);
}

function CompanyApplicantsCtrl($scope, $routeSegment) {
    var pid = $routeSegment.$routeParams.pid;
    if (pid === "new") {
        $scope.isNew = true
    } else {
        $scope.position_id = pid
    }

    $scope.applicants = [
        {  _id: '52684f4def861e456dac75b1',
            company: 2222222233,
            fullName: 'Ilgaz Şumnulu'},
        {  _id: '52684f4def861e456dac75b2',
            company: 2222222233,
            fullName: 'Ahmet mehmet'},
        {  _id: '52684f4def861e456dac75b3',
            company: 2222222233,
            fullName: 'Abuzer kadayif'},
        {  _id: '52684f4def861e456dac75b4',
            company: 2222222233,
            fullName: 'Mark otaa'},
        {  _id: '52684f4def861e456dac75b5',
            company: 2222222233,
            fullName: 'Abdullah Guneydas'},
        {  _id: '52684f4def861e456dac75b6',
            company: 2222222233,
            fullName: 'Yeter dursun Kadayif'},
        {  _id: '52684f4def861e456dac75b7',
            company: 2222222233,
            fullName: 'Coskun kilic'},
        {  _id: '52684f4def861e456dac75b8',
            company: 2222222233,
            fullName: 'Bende varum'},
        {  _id: '52684f4def861e456dac75b9',
            company: 2222222233,
            fullName: 'Mac hintosh'}

    ];

    $scope.getApplicant = function () {
        if (pid == '52684f4def861e456dac75b1') {
            return {
                pictureUrl: '/images/photos/ilgaz2.jpg'
            }
        } else if (pid == '52684f4def861e456dac75b2') {
            return {
                pictureUrl: '/images/photos/ilgaz3.jpg'
            }
        } else {
            return {
                pictureUrl: '/images/photos/ilgaz4.jpg'
            }
        }
    }

}

/**
 * Parent Controller of Company related pages
 * @param $scope
 * @param companyService
 * @constructor
 * @param $routeSegment
 */
function CompanyCtrl($scope, companyService, $routeSegment) {
    $scope.companies = companyService.getUserCompanyList();
    $scope.$routeSegment = $routeSegment;

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





