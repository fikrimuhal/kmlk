function TypeaheadCtrl($scope, $http, filterFilter, $resource, skillService) {
    var friends = {}


    $scope.getFriends = function (input) { //todo : bunun yerine friends den search yapalim
        var promise = $http.get("/kimlik/" + config.username + "/ajaxFriends", {cache: true}).then(function (response) {
            return filterFilter(response.data, input)
        });
        promise.$$v = promise;
        return promise;
    }

    /**
     *
     * @param skillName
     * @param value 1,2,3,4 {Adını duydum | Öğrenmekteyim | Orta seviye | Uzman}
     */
    $scope.rateSelf = function (skillName, value) {
        var skills = $scope.skills
        console.warn(skillName, value);
        for (var idx in skills) {
            if (skills[idx].name == skillName) {
                skills[idx].self_score = value;
            }
        }
        var api = $resource('/kimlik/' + config.username + '/ajaxRateSelf');
        api.get({skillName: skillName, value: value})

    }

    /**
     *
     * @param friendId
     * @param skillName
     * @param selected , model
     * @param value {delete | worst | same | better}
     */
    $scope.rateFriend = function (skill, friend, value, model) {


        console.debug(skill, friend, value);

        var friendId = friend.id;
        var skillName = skill.name;
        var bucket = skill.profiles[value];
        for (var idx in skill.profiles) {
            var _bucket = skill.profiles[idx];
            var profileIDX = jQuery.inArray(friendId, _bucket)
            if (profileIDX !== -1) {
                _bucket.splice(profileIDX, 1)
            }
        }

        if (jQuery.inArray(friendId, bucket) === -1) {
            bucket.push(friendId)
            var api = $resource('/kimlik/' + config.username + '/ajaxRateFriend')
            api.get({skillName: skillName, value: value, friendId: friendId});
        }

        model.name = ''

    }
    $scope.rateFriendRemove = function (skill, friendId) {
        console.debug(skill.name, friendId);


        var skillName = skillName;

        for (var idx in skill.profiles) {
            var _bucket = skill.profiles[idx];
            var profileIDX = jQuery.inArray(friendId, _bucket)
            if (profileIDX !== -1) {
                _bucket.splice(profileIDX, 1)
            }
        }
        var api = $resource('/kimlik/' + config.username + '/ajaxRateFriend')
        api.get({skillName: skillName, value: 'delete', friendId: friendId});

    }

//    $scope.skills = [];

    function fetchSkills() {
        skillService.fetchSkills();
    }

    function fetchFriends() {
        var apiFriends = $resource('/kimlik/' + config.username + '/ajaxFriends')
        apiFriends.query({}, {}, function (r) {
            for (var idx in r) {
//                    angular.extend(friends[r[idx].id] , r[idx] );
//                    console.log(friends[r[idx].id])
                friends[r[idx].id] = r[idx];

            }
        })
    }

    fetchFriends();

    $scope.profile = function (id) {
        if (friends[id] == undefined) {
            friends[id] = {name: 'loading...'}
        }
//            console.log(id)
        return friends[id]
    }


    $scope.removeSkill = function (skill) {

        skillService.removeSkill(skill.name)
    }


}

function NewSkillCtrl($scope, skillService) {

    $scope.selected = undefined

    $scope.getSkillNames = function (value) {
        return skillService.allSkills(value)
    }

    $scope.addSkill = function ($item) {

        console.log('item to add:', $item);
        console.log('item to selected:', $scope.selected);

        skillService.addSkill($scope.selected)
        $scope.selected = ''
        // return ['aaaa', 'bbbbb', 'ccccc', 'ababab', 'acacacac', 'cbcbcbcb']
    }


    $scope.scrollToSkill = function (skillName) {
        console.log('_skill_' + skillName);

//        scrollTo('_skill_' + skillName);
        scrollTo('xxx');


    }


}


///register...


function RegisterController($scope, $resource) {

    $scope.username
    var USERNAME_NOT_AVAILABLE = "Boyle bir kullanici adi var, başka bir tane deneyiniz..";
    var USERNAME_AVAILABLE = "Kullanıcı adı UYGUN, devam edebilirsiniz...";
    $scope.userNameMessage = '';
    var userNameValid = false,
        submitInProgress = false,
        checkInProgress = false,
        checkAgain = false;

    // REST JSON API
    var apiCheckUsername = $resource('/register/ajaxCheckUsername')
    var apiCreate = $resource('/register/ajaxCreate')


    $scope.checkUsername = function (username) {
        if (!checkInProgress) {
            checkInProgress = true;
            apiCheckUsername.get({username: username}, function success(result) {
                console.log('result.available', result.available);
                console.log('result.username', result.username);
                userNameValid = result.available;
                if (userNameValid) {
                    $scope.userNameMessage = USERNAME_AVAILABLE;
                } else {
                    $scope.userNameMessage = USERNAME_NOT_AVAILABLE;
                }
                checkInProgress = false;
                if (checkAgain) {
                    checkAgain = false;
                    $scope.checkUsername($scope.username)
                }
            });
        } else {
            checkAgain = true;  //because the model changed and we did not checked the new value just yet.
        }
    }

    $scope.submitButtonIsDisabled = function () {
        return checkInProgress || !userNameValid || submitInProgress
    }

    $scope.createProfile = function () {
        submitInProgress = true;

        function onSuccess(result) {
            var username = result.username
            document.location = '/kimlik/' + username;
        }

        function onError(result) {
            submitInProgress = false;
            alert('Bir hata olustu tekrar deneyin');
        }

        apiCreate.save({username: $scope.username}, {}, onSuccess, onError);
    }


}


function employmentController($scope, employmentService) {

    $scope.getEmploymentHistory = function () {
        return $scope.employment
    }

    $scope.addWork = function (work) {
        employmentService.addNew(work)
    }

    $scope.save = function (work) {
        work.showEdit = false
        employmentService.save(work)
        //employmentService.addNew(work)
    }


}
function personalInfoController($rootScope, $scope, userService, $resource) {
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
        $scope.model.aboutText = newValue.aboutText
        $scope.model.webSite = newValue.contactInfo.webSite
    }

    $scope.save = function () {
        var api = $resource('/kimlik/' + config.username + '/ajaxSaveBasicInfo')
        api.save($scope.model, {}, function () {
            document.location = '/kimlik/' + userService.getLoggedInUser().username
        })
    }


}


function positionInboxController($rootScope, $scope, userService, $resource, $modal, $log) {
    $scope.model = 'selassm'
    var api = $resource('/position/inbox')
    var visibleDetailsMap = {}
    $scope.inbox = api.query({}, {}, function () {
        console.log($scope.inbox)
    });

    $scope.toggleDetails = function (id) {
        visibleDetailsMap[id] = !visibleDetailsMap[id]
    };

    $scope.isDetailsVisible = function (id) {
        return visibleDetailsMap[id]
    }

    $scope.testX = function () {
        console.log('testing testing X')
        return 'yeppp'
    }


    $scope.items = ['item1', 'item2', 'item3d'];

    $scope.notInterested = function () {

        var modalInstance = $modal.open({
            templateUrl: 'positionNotInterestedModal.html',
            controller: PositionNotInterestedCtrl,
            resolve: {
                items: function () {
                    return $scope.items;
                }
            }
        });

        modalInstance.result.then(function (selectedItem) {
            $scope.selected = selectedItem;
        }, function () {
            $log.info('Modal dismissed at: ' + new Date());
        });
    };

    $scope.stacked = [
        {"value": 20, "type": "danger"},
        {"value": 70, "type": "danger"}

    ]


}


var PositionNotInterestedCtrl = function ($scope, $modalInstance, items) {

    $scope.items = items;
    $scope.selected = {
        item: $scope.items[0]
    };

    $scope.ok = function () {
        $modalInstance.close($scope.selected.item);
    };

    $scope.cancel = function () {
        $modalInstance.dismiss('cancel');
    };
};



































