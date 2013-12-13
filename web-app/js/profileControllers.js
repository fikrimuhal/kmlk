/**
 * Created by sumnulu on 21/11/13.
 */

var kimlik = angular.module('kimlik');


function UserController($scope, userService) {

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


function KimlikContactsCtrl($scope, userService, profileService) {
    console.log('KimlikContactsCtrl ready');
    $scope.profiles = [];
    var user = userService.getLoggedInUser();
    user.$promise.then(function (d) {
//    console.debug('user friends',user.friends)
//        console.log('cacheee ', profileService.prefetchProfilesByIds(user.friends));
        _.chain(user.friends).uniq().forEach(function (id) {
            $scope.profiles.push(profileService.getProfileById(id))
        });


    });
}

kimlik.controller('KimlikTimelineCtrl', [ '$scope', '$resource', 'userService', function ($scope, $resource, userService) {
    console.log('CompanyTimelineCtrl start');
    var api = $resource('/api/employment/:verb', {},
        {
            'save': {method: 'POST', params: {verb: 'save'}},
            'delete': {method: 'DELETE', params: {verb: 'save'}},
            'query': {method: 'GET', params: {verb: 'list'}}
        });
    var type = {
        work: {key: 'work', friendly: 'İş', color: 'bg-warning', icon: 'fa-bookmark-o'},
        education: {key: 'education', friendly: 'Eğitim', color: '', icon: 'fa-calendar'}
//        other: {key: 'other', friendly: 'Diğer', color: '', icon: 'fa-square-o'}
    };


    $scope.availableTypes = type;

    $scope.selected = {};
    $scope.entities = userService.getLoggedInUser().timeline
    console.log(' $scope ', $scope.entities);

    $scope.new = function () {
        $scope.selected = {}
    };

    $scope.doSelectType = function (t) {
        $scope.selected.typeKey = t.key;
    };

    $scope.getType = function (t) {

        return type[t.typeKey];
    };

    $scope.isEntitySelected = function (e) {
        if ($scope.selected && $scope.selected._id == e._id) {
            return 'bg-lighter';
        } else {
            return null
        }
    };

    $scope.edit = function (t) {
        $scope.selected = angular.copy(t);
    };

    $scope.save = function (entity) {
        console.log(entity);
        var result;
        if (!entity.typeKey) {
            alert('Lütfen günce türünü seçiniz');
            return
        }
        if (!entity._id) {
            //new entity
            $scope.entities.push(entity);

        } else {
            //update

            var idx = _($scope.entities).findIndex({_id: entity._id});

            angular.extend($scope.entities[idx], entity);

        }

        result = api.save({type: entity.typeKey}, entity);
        $scope.selected = {};

    };

    $scope.doDelete = function (entity) {
        console.log(entity);
        if (entity._id) {
            console.debug({_id: entity._id})
            var result = api.delete({entityId: entity._id, typeKey: entity.typeKey});

            $scope.entities = _($scope.entities).reject({_id: entity._id, typeKey: entity.typeKey}).value();

        }
        $scope.selected = {};


    }


}])


function KimlikSkillsCtrl($scope, skillService) {
    console.log('KimlikSkillsCtrl ready');
    var selected
    var isPanelVisible = function (s) {
        return selected && selected.name == s.name
    }
    $scope.isPanelVisible = isPanelVisible;

    $scope.togglePanel = function (s) {
        selected = (isPanelVisible(s)) ? null : s
    }


}


function LeftMenuController($rootScope, $scope, userService) {
    console.log('LeftMenuController ready');

    $scope.isVisible = {
        showAddEmployeeModal: userService.isLoggedIn(),
        claimMyProfile: false
    };

    $scope.showAddEmployeeModal = function () {
        console.log('showAddEmployeeModal')
        $('#AddEmployeeModal').modal('show')
    };


}


function addEmployeeModalController(companyService, $scope, $resource, userService) {
    var loggedInUser = userService.getLoggedInUser();
    var selectedCompany;
    var elm = $('#AddEmployeeModal')
    elm.on('show.bs.modal', function () {
        //re-initialize
        selectedCompany = null;
    });
    var api = $resource('/api/company/:verb', {},
        {
            'newRequest': {method: 'PUT', params: {verb: 'employeeRequest'}}
        });

    console.log('LeftMenuController ready')

    $scope.companies = companyService.getUserCompanyList();

    $scope.selectCompany = function (company) {
        var toId = _currentProfile._id;
        /*global inline*/

        selectedCompany = company;
        console.log('selectedCompany ', company._id)
        console.log('user ', _currentProfile)

        //todo bug toId suanda bakilan profil olmali
        api.newRequest({}, {toId: toId, fromId: company._id, requestedByCompany: true}, function (d) {
            elm.modal('hide');
        });

    };

    $scope.isActive = function (company) {
        if (selectedCompany && (selectedCompany._id == company._id)) {
            return 'active'
        } else {
            return ''
        }

    }

}


/**
 * Parent Controller of Personal profile related pages
 * @param $scope
 * @constructor
 * @param $routeSegment
 */
function KimlikCtrl($scope, $routeSegment) {
//    $scope.companies = companyService.getUserCompanyList();
    $scope.$routeSegment = $routeSegment;
    $scope.user_name = $routeSegment.$routeParams.user_name;
    $scope.$on('routeSegmentChange', function () {
        //broadcast de company_name i aliyoruz boylece resolved oldugundan eminiz parametrenin.
        //URL mapping de resolved ile yapila bilinir?
        //Sayfa render olmadan once resolved olsa daha iyi olur.
        $scope.user_name = $routeSegment.$routeParams.user_name; //todo bunun adi pageName olsa daha iyi
//   $scope.company = _.find($scope.companies, {page_name: $scope.company_name })
    });


}

kimlik.controller('KimlikSettingsLocationCtrl', ['$scope', '$resource', 'userService', function ($scope, $resource, userService) {
    //yeni google maps style, buton'lar flat
    google.maps.visualRefresh = true;
    $scope.user = userService.getLoggedInUser();

    $scope.address = $scope.user.contactInfo.address;

    //default privacy
    if ($scope.address.privacyLevel === undefined)$scope.address.privacyLevel = 300;

    console.log($scope.address);


    var api = $resource(_settings.baseUrl + 'api/kimlik/updateLocation');

    var map;
    var geocoder;
    var marker;
    var myLatlng = new google.maps.LatLng($scope.address.latLng.lat, $scope.address.latLng.lng);
    var markerLocation = new google.maps.LatLng($scope.address.latLng.lat, $scope.address.latLng.lng);
    var zoomLevel = _.min([$scope.address.latLng.zoomLevel , 12]);
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
        var result = api.save({}, address)

    }
    console.log('Settings location Ready')

}]);


function KimlikSettingsGeneralCtrl($scope, userService, $resource) {
    console.log('Settings general Ready')

    $scope.model = {}
    if (userService.isLoggedIn()) {
        populateForm();
    } else {
        $scope.$on('userAuthenticated', populateForm)
    }

    function populateForm() {
        var newValue = userService.getLoggedInUser()
        $scope.model.first_name = newValue.first_name
        $scope.model.last_name = newValue.last_name
        $scope.model.middle_name = newValue.middle_name
        $scope.model.birthDate = newValue.birthDate
        $scope.model.aboutText = newValue.aboutText
        $scope.model.gender = newValue.gender
        $scope.model.webSite = newValue.contactInfo.webSite
        $scope.model.publicTel = newValue.contactInfo.publicTel
        $scope.model.publicEmail = newValue.contactInfo.publicEmail

        $scope.username = newValue.username


    }

    $scope.save = function (model) {
        console.debug('model', model);
        var api = $resource('/api/kimlik/ajaxSaveBasicInfo');
        api.save(model, {}, function () {
            console.warn('TODO: reload/update profile');
        });
    }


}
