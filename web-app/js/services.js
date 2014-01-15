kimlik.factory('skillService', function ($resource, $rootScope) {
    $rootScope.skills = [];    //users skills
    $rootScope.allSkills = undefined  //all skills
    var config = {username: 'sumnulu'}

    function fetchSkills() {
        var apiSkills = $resource('/api/kimlik/ajaxSkills');
        $rootScope.skills = apiSkills.query({}, {}, function (r) {
        });
    }

    /**
     * Current user a skill ekleyecek
     * @param skillName {String}
     */
    function addSkill(skillName) {
        var apiSkills = $resource('/api/skill/addSkill');
        apiSkills.save({skillName: skillName}, {}, function (r) {
            fetchSkills();  //update user skills
            $rootScope.allSkills = undefined; //update typeahead list
        });
    }

    /**
     * Current user a skill ekleyecek
     * @param skillName {String}
     */
    function removeSkill(skillName) {
        var apiSkills = $resource('/api/skill/removeSkill');
        apiSkills.save({skillName: skillName}, {}, function (r) {
            fetchSkills();  //update user skills
        });
    }

    function todo() {
        alert('todo')
    }

    function allSkills(filter) {
        var apiSkills = $resource('/api/skill/getAll');
        if ($rootScope.allSkills === undefined) {
            $rootScope.allSkills = apiSkills.query({}, {}, function (r) {
            });
        }
        return  $rootScope.allSkills
    }

    fetchSkills();

    return{
        allSkills: allSkills,
        fetchSkills: fetchSkills,
        addSkill: addSkill,
        removeSkill: removeSkill


    };
});


kimlik.factory('employmentService', function ($resource, $rootScope) {
    $rootScope.employment = undefined  // work History

    function addNew(work) {
        var api = $resource('/employment/addNew');

        var params = work
        params.username = config.username
        if (work.startDate) params.startDate = new Date(work.startDate).valueOf()
        if (work.endDate) params.endDate = new Date(work.endDate).valueOf()
        console.log(work)
        api.save(params, {}, function (r) {
            fetchEmploymentHistory()
        });

    }

    function save(work) {
        var api = $resource('/employment/save');

        var params = work
        params.username = config.username
        if (work.startDate) params.startDate = new Date(work.startDate).valueOf()
        if (work.endDate) params.endDate = new Date(work.endDate).valueOf()

        console.log(work)
        api.save(params, {}, function (r) {
            fetchEmploymentHistory()
        });

    }

    function todo() {
        alert('todo')
    }

    function fetchEmploymentHistory() {
        var username = config.username
        var api = $resource('/employment/list');
        $rootScope.employment = api.query({username: username}, {});
        console.log($rootScope.employment)
    }

    fetchEmploymentHistory()
    return{
        addNew: addNew,
        save: save
    };
});


kimlik.factory('userService', function ($resource, $rootScope) {
    //$rootScope.loggedinUser;
    var _cacheKey = 'loggedInProfile';
    var user;

    function getCachedProfile() {
        var p;
        try {
            p = angular.fromJson(localStorage.getItem(_cacheKey));
            console.log('getCachedProfile')
        } catch (e) {
            console.warn('localStorage cached profile is corrupted (purge everything!!!)');
            localStorage.removeItem(_cacheKey)
        }
        return p
    }

    function setCachedProfile(profile) {
        localStorage.setItem(_cacheKey, angular.toJson(profile))
        console.log('setCachedProfile')

    }


    function isLoggedIn() {
        return !!user;
    }

    function getLoggedInUser() {
//        console.log('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
        // alert(getCachedProfile().username)
        return user
    }


    function auth() {
        user = getCachedProfile();

        console.log('auth begin');
        var api = $resource('/auth/ajaxAuth')

        api.get({}, {}, function (d) {
            console.log('server authenticated the user');
            setCachedProfile(d);
            user = d;
            $rootScope.loggedinUser = d; //deprecate

            $rootScope.$broadcast('userAuthenticated');  //kullanici authenticated ise broadcast
        });
    }

    auth(); //try authentication  on service init

    return {
        isLoggedIn: isLoggedIn,
        auth: auth,
        getLoggedInUser: getLoggedInUser
    }
});

kimlik.factory('profileService', function ($resource) {
    var todoCount = 0;
    var _profileCache = {};
    var api = $resource('/api/kimlik/:verb', {},
        {
            'getProfileById': {method: 'GET', params: {verb: 'getProfileById'}},

            'getProfilesByIds': {method: 'POST', params: {verb: 'getProfilesByIds'}, isArray: true}
        });


    function todo() {
        console.log(todoCount++)
    }

    function prefetchProfilesByIds(ids) {
        _(ids).each(function (id) {
            if (!_profileCache[id]) {
//                console.log('cachede id yok: ', id);
                _profileCache[id] = {}
            } else {
//                console.log('cachede id var: ', _profileCache[id]);
            }
        });

        api.getProfilesByIds({}, {ids: ids}, function (result) {
            _(result).each(function (it) {
                var names = [it.first_name, it.middle_name, it.last_name]
                it.name = _.reduce(names, function (ac, n) {
                    return ac + (n?n+' ':'')
                }, '');
                angular.extend(_profileCache[it._id], it)
            });
        });

        return _profileCache

    }

    function getProfileById(id) {
        return _profileCache[id] || prefetchProfilesByIds([id])[id]
    }

    return{
        getProfileById: getProfileById,
        prefetchProfilesByIds: prefetchProfilesByIds,
        todo: todo
    };
});