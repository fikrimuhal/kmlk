/**
 * Created by sumnulu on 21/11/13.
 */
var kimlik = angular.module('kimlik');


function CompanyDashboardCtrl($scope, $routeSegment) {

}

function companyLoggedInUserMenuController($scope, userService, $resource) {
    var loggedInUser = userService.getLoggedInUser();
    $scope.isMenuVisible = userService.isLoggedIn();
    var api = $resource('/api/company/:verb', {},
        {'newRequest': {method: 'PUT', params: {verb: 'employeeRequest'}}});


    $scope.reportProblem = function () {
        console.error('not implemented yet!');
    };
    $scope.iWorkHere = function () {
        var toId = loggedInUser._id;
        var fromId = _currentCompany._id

        console.log('user ', toId)
        console.log('company ', fromId)

        //todo bug toId suanda bakilan profil olmali
        api.newRequest({}, {toId: toId, fromId: fromId, requestedByCompany: false}, function (d) {
            alert('Şirket yetkilisine bildirildi, teşekkürler!');
        });
    };

}

function CompanySkillsCtrl($scope, $resource, profileService) {
    var api = $resource(_settings.baseUrl + 'company/skillUpdate');

    $scope.skills = $scope.company.skills

    profileService.prefetchProfilesByIds(_.chain($scope.skills).map('contributors').flatten().uniq().value());

    console.log($scope.skills)

    $scope.forceRecalculate = function () {
        api.save({companyId: $scope.company._id}, {op: 'RECALCULATE'});
    };

    $scope.updateOrder = function (skill) {
        //todo server a request biraz deferred gitmeli, ng-change ile tetikleniyor bu
        api.save({companyId: $scope.company._id}, {op: 'ORDER', order: skill.order, skillId: skill.skill});
    };

    $scope.toggleVisibility = function (skill) {
        skill.visible = !skill.visible;
        api.save({companyId: $scope.company._id}, {op: 'VISIBILITY', visible: skill.visible, skillId: skill.skill});
    };


    $scope.progressBarStyle = function (percent) {
        return 'width:' + percent + '%;';
    }

    $scope.getFullName = function (id) {
//        console.log($scope.$$phase)
        var u = profileService.getProfileById(id)
        return u.first_name + ' ' + u.last_name;

    };

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


function CompanyEmployeeCtrl($scope, profileService, $resource) {
    var employeeIds = $scope.company.employees;
    $scope.employeeIds = employeeIds;
    profileService.prefetchProfilesByIds(_.chain(employeeIds).flatten().uniq().value());


    $scope.getFullName = function (id) {
        var u = profileService.getProfileById(id);
        return u.first_name + ' ' + u.last_name;

    };

    $scope.getProfile = function (id) {
        return profileService.getProfileById(id);
    };

    var api = $resource('/api/company/:verb', {},
        {
            /*alias of newRequest*/
            'verify': {method: 'PUT', params: {verb: 'employeeRequest'}},
            'newRequest': {method: 'PUT', params: {verb: 'employeeRequest'}},
            'delete': {method: 'DELETE', params: {verb: 'employeeRequest'}},
            'query': {method: 'GET', params: {verb: 'employeeRequest'}, isArray: true}
        });


    $scope.employmentRequests = api.query({companyId: $scope.company._id}, function (d) {
        profileService.prefetchProfilesByIds(_.chain(d).map('profile').flatten().uniq().value());
    });

    $scope.verify = function (request) {
        console.log('verify', request);
        var toId = request.profile;
        var reqId = request._id;

        api.verify({}, {toId: toId, fromId: $scope.company._id, requestedByCompany: true}, function (d) {

            console.log('verify success', d);
            $scope.employmentRequests = _($scope.employmentRequests).reject({_id: reqId}).value();

        });
    };

    $scope.delete = function (request) {
        console.log('delete');
        var reqId = request._id;
        //todo companyId: $scope.company._id, buna gerek yok, api doc u kontrol et
        api.delete({companyId: $scope.company._id, requestId: reqId}, function (d) {
            console.log('delete success', d);
            $scope.employmentRequests = _($scope.employmentRequests).reject({_id: reqId}).value();

        });

    }

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
function CompanyCtrl($scope, companyService, $routeSegment, $rootScope) {
    $scope.companies = companyService.getUserCompanyList();
    $scope.$routeSegment = $routeSegment;

    $scope.$on('routeSegmentChange', function () {
        //URL mapping de resolved ile yapila bilinir?
        //Sayfa render olmadan once resolved olsa daha iyi olur.
        $rootScope.company = _.find($scope.companies, {page_name: $scope.company_name })

    });

    console.log('CompanyCtrl Ready')
}


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
            console.log($scope.company);

            $scope.officePictures = $scope.company.officePictures;
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


    .controller('CompanyTimelineCtrl', [ '$scope', '$resource', function ($scope, $resource) {
        console.log('CompanyTimelineCtrl start');
        var api = $resource('/api/company/:verb', {},
            {
                'save': {method: 'POST', params: {verb: 'timeline'}},
                'delete': {method: 'DELETE', params: {verb: 'timeline'}}
            });
        var type = {
            project: {key: 'project', friendly: 'Proje', color: 'bg-warning', icon: 'fa-bookmark-o'},
            news: {key: 'news', friendly: 'Haber', color: '', icon: 'fa-calendar'},
            office: {key: 'office', friendly: 'Ofis değişikliği', color: 'bg-warning', icon: 'fa-building-o'},
            finance: {key: 'finance', friendly: 'Sermaye', color: 'bg-info', icon: 'fa-dollar'},
            inception: {key: 'inception', friendly: 'Kuruluş', color: '', icon: 'fa-home'},
            other: {key: 'other', friendly: 'Diğer', color: '', icon: 'fa-square-o'}
        };
        $scope.availableTypes = type;

        $scope.selected = {};
        $scope.entities = $scope.company.timeline;

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
            if (!entity._id) {
                //new entity
//                entity._id = testId++;
                $scope.entities.push(entity);

            } else {
                //update

                var idx = _($scope.entities).findIndex({_id: entity._id});

                angular.extend($scope.entities[idx], entity);


            }
            var result = api.save({companyId: $scope.company._id}, entity);
            $scope.selected = {};

        };

        $scope.doDelete = function (entity) {
            console.log(entity);
            if (entity._id) {
                console.debug({_id: entity._id})
                var result = api.delete({companyId: $scope.company._id, entityId: entity._id});

                $scope.entities = _($scope.entities).reject({_id: entity._id}).value();

            }
            $scope.selected = {};


        }


    }])
    .controller('FileDestroyController', [
        '$scope',
        function ($scope) {
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

