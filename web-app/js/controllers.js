function TypeaheadCtrl($scope, $http, filterFilter, $resource, skillService, profileService, userService) {
    var friendIds = userService.getLoggedInUser().friends;

    var friends = _.toArray(profileService.prefetchProfilesByIds(friendIds));
    console.log('user::: ', friends);

    /**
     *
     * @param input
     * @param exclude , do not include these ids in the result
     * @returns {*}
     */
    $scope.getFriends = function (input, exclude) { //todo : bunun yerine friends den search yapalim
        return _.reduce(exclude, function (ac, it) {
            return _.reject(ac, {_id: it})
        }, filterFilter(friends, input));
    };


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
        var api = $resource('/api/kimlik/ajaxRateSelf');
        api.get({skillName: skillName, value: value})

    };

    /**
     *
     * @param friendId
     * @param skillName
     * @param selected , model
     * @param value {delete | worst | same | better}
     */
    $scope.rateFriend = function (skill, friend, value, model) {


        console.debug(skill, friend, value);

        var friendId = friend._id;
        var skillName = skill.name;
        var bucket = skill.profiles[value];
        for (var idx in skill.profiles) {
            var _bucket = skill.profiles[idx];
            var profileIDX = jQuery.inArray(friendId, _bucket);
            if (profileIDX !== -1) {
                _bucket.splice(profileIDX, 1)
            }
        }

        if (jQuery.inArray(friendId, bucket) === -1) {
            bucket.push(friendId);
            var api = $resource('/api/kimlik/ajaxRateFriend');
            api.get({skillName: skillName, value: value, friendId: friendId});
        }
        console.debug('thiss: ', this.skill.selected);
        this.skill.selected = {name: ''};
//        model.name = ''

    };
    $scope.rateFriendRemove = function (skill, friendId) {
        console.debug(skill.name, friendId);


        var skillName = skill.name;

        for (var idx in skill.profiles) {
            var _bucket = skill.profiles[idx];
            var profileIDX = jQuery.inArray(friendId, _bucket)
            if (profileIDX !== -1) {
                _bucket.splice(profileIDX, 1)
            }
        }
        var api = $resource('/api/kimlik/ajaxRateFriend')
        api.get({skillName: skillName, value: 'delete', friendId: friendId});

    };

//    $scope.skills = [];

    $scope.profile = function (id) {
        return profileService.getProfileById(id);
    };


    $scope.removeSkill = function (skill) {

        skillService.removeSkill(skill.name)
    }


}


function NewSkillCtrl($scope, skillService) {

    $scope.selected = undefined;

    $scope.getSkillNames = function (value) {
        return skillService.allSkills(value)
    };

    $scope.addSkill = function ($item) {

        console.log('item to add:', $item);
        console.log('item to selected:', $scope.selected);

        skillService.addSkill($scope.selected)
        $scope.selected = '';
    };

    /**
     * @deprecated
     * @param skillName
     */
    $scope.scrollToSkill = function (skillName) {
        console.log('_skill_' + skillName);

//        scrollTo('_skill_' + skillName);
        scrollTo('xxx');


    }


}


///register...


function RegisterController($scope, $resource) {

    $scope.username;
    var USERNAME_NOT_AVAILABLE = "Boyle bir kullanici adi var, başka bir tane deneyiniz..";
    var USERNAME_AVAILABLE = "Kullanıcı adı UYGUN, devam edebilirsiniz...";
    $scope.userNameMessage = '';
    var userNameValid = false,
        submitInProgress = false,
        checkInProgress = false,
        checkAgain = false;

    // REST JSON API
    var apiCheckUsername = $resource('/register/ajaxCheckUsername');
    var apiCreate = $resource('/register/ajaxCreate');


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
    };

    $scope.submitButtonIsDisabled = function () {
        return checkInProgress || !userNameValid || submitInProgress || !$scope.username
    };

    $scope.createProfile = function () {
        submitInProgress = true;
        $scope.submitInProgress = submitInProgress;

        function onSuccess(result) {
            var username = result.username;
            document.location = '/kimlik/profile/' + username;
        }

        function onError(result) {
            submitInProgress = false;
            $scope.submitInProgress = submitInProgress;
            alert('Bir hata olustu tekrar deneyin');
        }

        apiCreate.save({username: $scope.username}, {}, onSuccess, onError);
    }


}


/**
 * @deprecated
 * @refactor router cagirsin bu kontroller i
 *
 * @param $rootScope
 * @param $scope
 * @param userService
 * @param $resource
 * @param $modal
 * @param $log
 */
function positionInboxController($rootScope, $scope, userService, $resource, $modal, $log) {
    $scope.model = 'selassm';
    var api = $resource('/position/inbox');
    var visibleDetailsMap = {};
    $scope.inbox = api.query({}, {}, function () {
        console.log($scope.inbox)
    });

    $scope.toggleDetails = function (it) {
        var id = it._id;
        console.log('details', id);
        console.log('details1', visibleDetailsMap[id]);
        visibleDetailsMap[id] = !visibleDetailsMap[id]
    };

    $scope.isDetailsVisible = function (it) {
        var id = it._id;
        return visibleDetailsMap[id]
    };

    $scope.testX = function () {
        console.log('testing testing X')
        return 'yeppp'
    };


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



































