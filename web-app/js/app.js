//if ( window.self === window.top ) {
//    console.log('we are not in the frame ')
//} else {
//    console.log('we are in the frame ')
//}

var kimlik = angular.module('kimlik', ['ui.bootstrap', 'ngResource', 'ngRoute', 'route-segment', 'view-segment', 'blueimp.fileupload']);
kimlik.config(['$routeSegmentProvider', '$locationProvider',
    function ($routeSegmentProvider, $locationProvider) {

        console.debug('_settings :', _settings)

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
                controller: CompanyCtrl
            });

        $routeSegmentProvider.within('company').
            segment('settings', {
                templateUrl: '/html/company/settings/settings.html',
                controller: CompanySettingsCtrl}).
            within().
            segment('general', {templateUrl: '/html/company/settings/general.html'}).
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
            within('company').segment('new', {
                templateUrl: '/html/company/new.html',
                controller: CompanyNewCtrl});


        $routeSegmentProvider.
            when('/company/:company_name/dashboard', 'company.dashboard').
            within('company').segment('dashboard', {
                templateUrl: '/html/company/dashboard/dashboard.html'});

        console.log('App config block finished')
    }
]);

// run blocks
kimlik.run(function ($rootScope) {

    $rootScope.$on('routeSegmentChange', function () {
        console.log('* route change event')

    });
    console.log('App run block finished')

});

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

function CompanySettingsWwwCtrl($scope, $resource) {
    console.log('company id = ', $scope.company._id)

    var api = $resource(_settings.baseUrl + 'company/domainSettings');
    var domain = api.get({companyId: $scope.company._id}, {});
    $scope.domain = domain;
    console.log('domain : ', domain)

    $scope.save = function (domain) {
        var result = api.save({companyId: $scope.company._id}, domain);
    }
}

function CompanySettingsCtrl($scope) {
    console.log('Settings CTRL Ready')


}


function CompanyNewCtrl($scope, $routeSegment) {


}


function CompanyServicesCtrl($scope) {
    console.log('Services CTRL Ready')

}


function CompanyProjectsCtrl($scope, $routeSegment, $resource) {
    var api = $resource(_settings.baseUrl + 'company/products');

    var pid = $routeSegment.$routeParams.pid
    var products = _($scope.company.products);

    $scope.product = products.find({_id: pid});

    console.log('product', $scope.product)
    $scope.new = function () {
        console.log('new product');
        $scope.product = {};
    };

    $scope.save = function (product) {
        console.log('save product', product);
        api.save({companyId: $scope.company._id}, product);
        //todo company yi reload et

    };

    $scope.delete = function (product) {
        console.log('delete product', product);
        api.delete({companyId: $scope.company._id, productId: product._id});
        //todo company yi reload et
        //todo bu urlye geri don  '/company/fikrimuhal/products'
    };

    $scope.getId = function (p) {
        if (!p) return ''
        else return p._id;
    };

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

        '52684f4def861e456dac75b4': {  id: '52684f4def861e456dac75b4',
            company: 2222222233,
            title: 'Fullstack Java developer'},
        '52684f4def861e456dac75b2': {  id: '52684f4def861e456dac75b2',
            company: 2222222233,
            title: 'JavaScript developer'},
        '52684f4def861e456dac75b1': {  id: '52684f4def861e456dac75b1',
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
    $scope.page.show = ($scope.position && $scope.position.id);
}

function CompanyApplicantsCtrl($scope, $routeSegment) {
    var pid = $routeSegment.$routeParams.pid;
    if (pid === "new") {
        $scope.isNew = true
    } else {
        $scope.position_id = pid
    }

    $scope.applicants = [
        {  id: '52684f4def861e456dac75b1',
            company: 2222222233,
            fullName: 'Ilgaz Şumnulu'},
        {  id: '52684f4def861e456dac75b2',
            company: 2222222233,
            fullName: 'Ahmet mehmet'},
        {  id: '52684f4def861e456dac75b3',
            company: 2222222233,
            fullName: 'Abuzer kadayif'},
        {  id: '52684f4def861e456dac75b4',
            company: 2222222233,
            fullName: 'Mark otaa'},
        {  id: '52684f4def861e456dac75b5',
            company: 2222222233,
            fullName: 'Abdullah Guneydas'},
        {  id: '52684f4def861e456dac75b6',
            company: 2222222233,
            fullName: 'Yeter dursun Kadayif'},
        {  id: '52684f4def861e456dac75b7',
            company: 2222222233,
            fullName: 'Coskun kilic'},
        {  id: '52684f4def861e456dac75b8',
            company: 2222222233,
            fullName: 'Bende varum'},
        {  id: '52684f4def861e456dac75b9',
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
        $scope.company_name = $routeSegment.$routeParams.company_name //todo bunun adi pageName olsa daha iyi
        $scope.company = _.find($scope.companies, {page_name: $scope.company_name })

    });

    console.log('CompanyCtrl Ready')
}


function NavBarCtrl($scope, companyService) {
    $scope.companies = $scope.companies || companyService.getUserCompanyList(); //bir onceki scope da yuklenmis olabilir
    $scope.companies.$promise.then(function () {
        $scope.showPrivateNavBar = true && $scope.companies //todo bunun yerine kullanici login olmus mu diye kontrol et
        console.log('companies', $scope.companies)
    });
    //todo: login bilgileri rest ile gelecek
    //todo:
    console.log('NAV_BAR Ready');
}

kimlik.factory('companyService', function ($resource, $rootScope) {

    function todo() {
        alert('todo')
    }

    function getUserCompanyList() {
//         alert(_settings.baseUrl)
        //todo urlleri merkezi biryerde yaz hepsini burdan consttant a eris sadece
        var api = $resource(_settings.baseUrl + 'company/userCompanyList');
        return api.query({}, {});
    }

    return{
        getUserCompanyList: getUserCompanyList
    };
});


var url = '/picture/ajaxUpload';
kimlik
    .controller('OfficePicturesController', [
        '$scope', '$resource',
        function ($scope, $resource) {
            var api = $resource(_settings.baseUrl + 'picture/ajaxDelete');


            $scope.options = {
                url: url,
                formData: {companyId: $scope.company._id}
            };
            console.log($scope.company)

            $scope.officePictures = $scope.company.officePictures
            $scope.deletePicture = function (file) {
                console.log(file._id)
                var result = api.delete({pictureId: file._id, companyId: $scope.company._id})

                //todo: api result i mi beklesek...
                $scope.officePictures = _.reject($scope.officePictures, {_id: file._id})
                console.log($scope.company.officePictures)
                return result
            }

        }
    ])

    .controller('FileDestroyController', [
        '$scope', '$http',
        function ($scope, $http) {
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
        }
    ])


    .controller('CompanySettingsLocationCtrl', ['$scope', '$resource', function ($scope, $resource) {
        google.maps.visualRefresh = true;
        $scope.address = $scope.company.location;

        var api = $resource(_settings.baseUrl + 'company/updateLocation');

        var map;
        var geocoder;
        var marker;
        var myLatlng = new google.maps.LatLng($scope.address.latLng.lat, $scope.address.latLng.lng)
        var markerLocation = new google.maps.LatLng($scope.address.latLng.lat, $scope.address.latLng.lng)
        var zoomLevel = _.min([$scope.address.latLng.zoomLevel , 12])
        $scope.markerIsJumping = !($scope.address && $scope.address.latLng && $scope.address.latLng.lat && $scope.address.latLng.lng);  //kozmetik

        var markerDragListener = function () {
            console.log('dragend: ', marker.getPosition());
            marker.setAnimation(null);

            $scope.$apply(function () {
                $scope.markerIsJumping = false;
            });

            /*Vodoo START!
             digest cycle in disinda bilerek bu atamayi yaptim (address objesinde degisiklik oldugu halde event fire etmesin diye)
             bu satir apply dan sonra olmali
             */
            $scope.address.latLng = {
                lat: marker.getPosition().lat(),
                lng: marker.getPosition().lng(),
                zoomLevel: map.getZoom()
            }
            /*Vodoo END!*/
        };

        var markerDragStartListener = function () {
            console.log('.')
            marker.setAnimation(google.maps.Animation.BOUNCE);
            $scope.$apply(function () {
                $scope.markerIsJumping = true
            });


        };

        function initialize() {
            console.log('google maps init')


            var mapOptions = {
                zoom: zoomLevel,
                center: myLatlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
//                disableDefaultUI: true,
                panControl: false,
                zoomControl: true,
                mapTypeControl: true,
                scaleControl: false,
                streetViewControl: false,
                overviewMapControl: true,
                overviewMapControlOptions: {opened: true}
            };
            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);


            //marker
            marker = new google.maps.Marker({
                position: markerLocation,
                map: map,
                draggable: true,
                animation: google.maps.Animation.DROP,
                title: "Hello World!"
            });
            google.maps.event.addListener(marker, 'dragend', markerDragListener);
            google.maps.event.addListener(marker, 'dragstart', markerDragStartListener);

            //geocode
            geocoder = new google.maps.Geocoder();
        }


        initialize();
        marker.setAnimation($scope.markerIsJumping ? google.maps.Animation.BOUNCE : null);
        var waitingGeocoder = false;
        $scope.codeAddress = function () {
            if (!waitingGeocoder) {
                waitingGeocoder = true;
                var address = getPartialAddress($scope.address);
                console.log(address)

                geocoder.geocode({ 'address': address}, function (results, status) {
                    try {
                        if (status == google.maps.GeocoderStatus.OK) {
                            map.panTo(results[0].geometry.location);
                            map.fitBounds(results[0].geometry.bounds);
                            console.log(results);
                            marker.setPosition(results[0].geometry.location);
                            markerDragStartListener();
                            $scope.address.formatted_address = results[0].formatted_address
                            $scope.address.display_address = results[0].formatted_address
                        } else {
//                        alert("Geocode was not successful for the following reason: " + status);
                        }
                    } catch (e) {
                        throw e;
                    } finally {
                        waitingGeocoder = false;

                    }
                });

            }
        };

//        var skippCodeAddress = true;
//        $scope.$watchCollection('address', function () {
//            console.log('address data changed');
//            if (!skippCodeAddress) {
//                $scope.codeAddress();
//            }
//            skippCodeAddress = false;
//        });

        function getPartialAddress(a) {
            return a.street + ', ' + a.avenue + ', ' + a.quarter + ', ' + a.district + ', ' + a.city + ', ' + a.country;
        }


        $scope.save = function (address) {
            var result = api.save({companyId: $scope.company._id}, address)

        }
        console.log('Settings location Ready')

    }
    ]);


//end