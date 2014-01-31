//if ( window.self === window.top ) {
//    console.log('we are not in the frame ')
//} else {
//    console.log('we are in the frame ')
//}

var kimlik = angular.module('kimlik', ['ui.bootstrap', 'ngResource', 'ngRoute', 'route-segment', 'view-segment', 'blueimp.fileupload', 'fm.analytics']);
kimlik.config(['$routeSegmentProvider', '$locationProvider',
    function ($routeSegmentProvider, $locationProvider) {
        console.debug('_settings :', _settings);

        $locationProvider.html5Mode(!_settings.staticMode);
        $routeSegmentProvider.options.autoLoadTemplates = true;
        $routeSegmentProvider.options.strictMode = true;

        $routeSegmentProvider.
            when('/company/:company_name/settings', 'company.settings.general').
            when('/company/:company_name/settings/general', 'company.settings.general').
            when('/company/:company_name/settings/location', 'company.settings.location').
            when('/company/:company_name/settings/images', 'company.settings.images').
            when('/company/:company_name/settings/social', 'company.settings.social').
            when('/company/:company_name/settings/notifications', 'company.settings.notifications').
            when('/company/:company_name/settings/security', 'company.settings.security').
            when('/company/:company_name/settings/www', 'company.settings.www').


            segment('company', {
                templateUrl: '_template/company.inline',
//                dependencies: ['company_name'],
                controller: CompanyCtrl
            });

        $routeSegmentProvider.within('company').
            segment('settings', {
                templateUrl: '/html/company/settings/settings.html',
                dependencies: ['company_name'],
                controller: CompanySettingsCtrl}).
            within().
            segment('general', {templateUrl: '/html/company/settings/general.html',
                dependencies: ['company_name'],
                controller: 'CompanySettingsGeneralCtrl'}).
            segment('location', {templateUrl: '/html/company/settings/location.html',
                controller: 'CompanySettingsLocationCtrl'}).
            segment('images', {templateUrl: '/html/company/settings/images.html'}).
            segment('social', {templateUrl: '/html/company/settings/social.html'}).
            segment('notifications', {templateUrl: '/html/company/settings/notifications.html'}).
            segment('security', {templateUrl: '/html/company/settings/security.html'}).
            segment('www', {templateUrl: '/html/company/settings/www.html',
                controller: CompanySettingsWwwCtrl});

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
            when('/company/:company_name/products/:pid', 'company.products').
            within('company').segment('products', {
                templateUrl: '/html/company/products/products.html',
                dependencies: ['pid'],
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
            when('/company/my/new/success/:company_name', 'company.newSuccess').
            within('company').
            segment('new', {
                templateUrl: '/html/company/new.html',
                controller: CompanyNewCtrl}).
            segment('newSuccess', {
                templateUrl: '/html/company/newSuccess.html'});


        $routeSegmentProvider.
            when('/company/:company_name/dashboard', 'company.dashboard').
            within('company').segment('dashboard', {
                templateUrl: '/html/company/dashboard/dashboard.html'});


        $routeSegmentProvider.
            when('/company/:company_name/timeline', 'company.timeline').
            within('company').segment('timeline', {
                templateUrl: '/html/company/timeline/timeline.html',
                controller: 'CompanyTimelineCtrl'});


        /*                   #########  Personal profiles start   ###########                                */
        $routeSegmentProvider.
            when('/kimlik/:user_name/settings', 'kimlik.settings.general').
            when('/kimlik/:user_name/settings/general', 'kimlik.settings.general').
            when('/kimlik/:user_name/settings/profilePicture', 'kimlik.settings.profilePicture').
            when('/kimlik/:user_name/settings/location', 'kimlik.settings.location').
            when('/kimlik/:user_name/settings/history', 'kimlik.settings.history').
            when('/kimlik/:user_name/settings/skills', 'kimlik.settings.skills').
            when('/kimlik/:user_name/settings/social', 'kimlik.settings.social').
            when('/kimlik/:user_name/settings/www', 'kimlik.settings.www').
            when('/kimlik/:user_name/settings/notifications', 'kimlik.settings.notifications').


            segment('kimlik', {
                templateUrl: '_template/kimlik.inline',
                controller: KimlikCtrl
            });

        $routeSegmentProvider.within('kimlik').
            segment('settings', {
                dependencies: ['user_name'],
                templateUrl: '/html/kimlik/settings/settings.html'}).
            within().
            segment('general', {templateUrl: '/html/kimlik/settings/general.html',
                dependencies: ['user_name'],
                controller: 'KimlikSettingsGeneralCtrl'}).
            segment('profilePicture', {templateUrl: '/html/kimlik/settings/profilePicture.html'}).
            segment('location', {templateUrl: '/html/kimlik/settings/location.html',
                controller: 'KimlikSettingsLocationCtrl'}).
            segment('history', {templateUrl: '/html/kimlik/settings/history.html',
                controller: 'KimlikTimelineCtrl'}).
            segment('skills', {templateUrl: '/html/kimlik/settings/skills.html',
                controller: KimlikSkillsCtrl}).
            segment('social', {templateUrl: '/html/kimlik/settings/social.html',
                controller: 'KimlikSettingsSocialCtrl'}).
            segment('www', {templateUrl: '/html/kimlik/settings/www.html',
                controller: ProfileSettingsWwwCtrl}).
            segment('notifications', {templateUrl: '/html/kimlik/settings/notifications.html'});


        $routeSegmentProvider.
            when('/kimlik/:user_name/contacts', 'kimlik.contacts').
            within('kimlik').segment('contacts', {
                controller: 'KimlikContactsCtrl',
                templateUrl: '/html/kimlik/contacts/contacts.html'});


        $routeSegmentProvider.
            when('/kimlik/:user_name/notifications', 'kimlik.notifications').
            within('kimlik').segment('notifications', {
                templateUrl: '/html/kimlik/notifications/notifications.html'});


        $routeSegmentProvider.
            when('/kimlik/:user_name/positions', 'kimlik.positions.inbox').
            when('/kimlik/:user_name/positions/inbox', 'kimlik.positions.inbox').
            when('/kimlik/:user_name/positions/settings', 'kimlik.positions.settings');

        $routeSegmentProvider.within('kimlik').segment('positions', {
            templateUrl: '/html/kimlik/positions/positions.html'}).
            within().
            segment('inbox', {templateUrl: '/html/kimlik/positions/inbox.html'}).
            segment('settings', {templateUrl: '/html/kimlik/positions/settings.html'});


        /*                   #########  Management start   ###########                                */

        $routeSegmentProvider.
            when('/admin', 'admin.dashboard').
            when('/admin/dashboard', 'admin.dashboard').
            when('/admin/settings', 'admin.settings.general').
            when('/admin/settings/general', 'admin.settings.general').
            when('/admin/companies', 'admin.companies').
            when('/admin/users', 'admin.users').

            segment('admin', {
                templateUrl: '_template/admin.inline',
                controller: AdminCtrl
            });

        $routeSegmentProvider.within('admin').
            segment('dashboard', {templateUrl: '/html/admin/dashboard.html'}).
            segment('companies', {templateUrl: '/html/admin/companies/companies.html',
                controller: AdminCompaniesCtrl}).
            segment('users', {templateUrl: '/html/admin/users/users.html',
                controller: AdminUsersCtrl});

        $routeSegmentProvider.within('admin').
            segment('settings', {
                templateUrl: '/html/admin/settings/settings.html'}).
            within().
            segment('general', {templateUrl: '/html/admin/settings/general.html'});


        console.log('App config block finished')
    }
]);

// run blocks
kimlik.run(function ($rootScope, $routeSegment) {

    $rootScope.$on('routeSegmentChange', function () {
        //broadcast de company_name i aliyoruz boylece resolved oldugundan eminiz parametrenin.

        $rootScope.company_name = $routeSegment.$routeParams.company_name; //todo bunun adi pageName olsa daha iyi

        console.log('* route change event')

    });
    console.log('App run block finished');

    //todo refactor
    $rootScope.getProfilePictureUrl = function (loggedinUser) {
        if (loggedinUser &&
            loggedinUser.profilePicture &&
            loggedinUser.profilePicture.defaultPicture &&
            loggedinUser.profilePicture.defaultPicture.url) {
            return loggedinUser.profilePicture.defaultPicture.url
        } else if (loggedinUser &&
            loggedinUser.accounts &&
            loggedinUser.accounts.facebook &&
            loggedinUser.accounts.facebook.remoteId) {
            return "http://graph.facebook.com/" + loggedinUser.accounts.facebook.remoteId + "/picture?height=400"
        } else {

        }
    };

    $rootScope.$watch(function () {
        console.debug('%c digest ', 'color: #bada55')
    });
});


function NavBarCtrl($scope, companyService, userService, $location) {
    $scope.companies = $scope.companies || companyService.getUserCompanyList(); //bir onceki scope da yuklenmis olabilir
    $scope.companies.$promise.then(function () {
        $scope.showPrivateNavBarCompanies = true; //flicker i onlemek icin showPrivateNavBar burada true olmali eger true olacak ise
        //todo companies i cache e at
        console.log('companies', $scope.companies)
    });
    function initialize() {

        if (userService.isLoggedIn()) {
            $scope.showPrivateNavBar = true;
            $scope.user_name = userService.getLoggedInUser().username;
        }
    }


    initialize();
    $scope.$on('userAuthenticated', initialize);

    $scope.logout = function () {
        userService.logout();
    };
    console.log('NAV_BAR Ready');

}

function NotificationCtrl($scope, $resource, userService, companyService) {
    $scope.items = [];
    var api = $resource('/api/notification/:verb', {}, {
        'query': {method: 'POST', params: {verb: 'getInbox'}/*, isArray: true*/},
        'markAsRead': {method: 'POST', params: {verb: 'markAsRead'}/*, isArray: true*/},
        'deleteNotifications': {method: 'POST', params: {verb: 'deleteNotifications'}/*, isArray: true*/}
    });

    $scope.getNumberOfNewNotifications = function () {
        return  _.reject($scope.items, 'isRead').length
    };

    var companies = $scope.companies || companyService.getUserCompanyList();
    companies.$promise.then(function (companies) {
        $scope.items = _(companies)
            .map('notificationInbox')
            .compact()
            .map('notifications')
            .flatten()
            .union($scope.items)
            .compact()
            .value()
    });

    //notificationInbox diye bir field gelmeye bilir, kontrol edelim
    if (userService.isLoggedIn() && userService.getLoggedInUser().notificationInbox) {
        var profile_notifications = userService.getLoggedInUser().notificationInbox.notifications;
        $scope.items = _.union(profile_notifications, $scope.items);
    }


    $scope.markAllAsRead = function () {
        var ids = _($scope.items).reject('isRead').collect('_id').value();
        api.markAsRead({}, {ids: ids});
        _($scope.items).forEach(function (it) {
            it.isRead = true
        });

    };

    $scope.notificationBodyTemplate = function (notification) {
        notification.data = notification.data || {};
        console.error('data: ', notification.data);
        switch (notification.data.type) {
            case '1002':
                return '/html/kimlik/notifications/items/type_employee_add_request.html';
            default:
                return '/html/kimlik/notifications/items/type_general.html';
        }
    };

    $scope.deleteNotifications = function () {
        var ids = _.collect($scope.items, '_id');
        api.deleteNotifications({}, {ids: ids});
        $scope.items = []
    };
    console.log('NotificationCtrl Ready');

}
/**
 * @template /html/kimlik/notifications/items/type_employee_add_request.html
 * @param $scope
 * @param userService
 * @param $resource
 */
function notificationEmployeeAddRequest($scope, userService, $resource) {
    var loggedInUser = userService.getLoggedInUser();
    var api = $resource('/api/company/:verb', {},
        {'newRequest': {method: 'PUT', params: {verb: 'employeeRequest'}}});

    $scope.iWorkHere = function (companyId) {
        var toId = loggedInUser._id;
        var fromId = companyId;

        console.log('user ', toId);
        console.log('company ', fromId);

        api.newRequest({}, {toId: toId, fromId: fromId, requestedByCompany: false}, function (d) {
            alert('Şirket yetkilisine bildirildi, teşekkürler!');
        });
    };

}


kimlik.factory('companyService', function ($resource, $rootScope, userService,$q) {
    var currentUserCompanyList;

    function todo() {
        alert('todo')
    }

    //todo urlleri merkezi biryerde yaz hepsini burdan constant a eris sadece
    var api = $resource('/api/company/userCompanyList');

    function getUserCompanyList() {
        var result;
        /**
         * If no remember me token exists do not try to authenticate
         */
        if (userService.hasAuthenticationCookie()) {
            result = api.query({}, {}, function (data) {
                currentUserCompanyList = data;
                $rootScope.$broadcast("company_list_statusChange");
            });

        }else{
            /**
             * mocks http api call result
             * @type {*}
             */
            var NOOP = $q.defer();
            NOOP.reject();
            result = {$promise: NOOP.promise }
        }
        return result
    }


    function getUserCompanyListCached() {
        return currentUserCompanyList || getUserCompanyList();
    }

    return{
        getUserCompanyList: getUserCompanyListCached,
        reloadCompanies: getUserCompanyList
    };
});

kimlik.
/**
 * Office pictures
 * Profile picture
 */
    controller('FileDestroyController', ['$scope', function ($scope) {
        var file = $scope.file,
            state;
        if (file.url) {
            file.$state = function () {
                return state;
            };
            file.$destroy = function () {
                state = 'pending';
                return $scope.deletePicture(file).$promise.then(
                    function () {
                        state = 'resolved';
                        $scope.clear(file);
                    },
                    function () {
                        state = 'rejected';
                    }
                );
            };
        } else if (!file.$cancel && !file._index) {
            file.$cancel = function () {
                $scope.clear(file);
            };
        }
    }]);


//end