kimlik.factory('userService', function ($resource, $rootScope) {
    $rootScope.loggedinUser = {}

    function isLoggedIn() {
        return !!$rootScope.loggedinUser.username
    }

    function getLoggedInUser() {
        return $rootScope.loggedinUser
    }


    function auth() {
        var api = $resource('/auth/ajaxAuth')

        $rootScope.loggedinUser = api.get({}, {}, function () {
            console.log($rootScope.loggedinUser)
            $rootScope.$broadcast('userAuthenticated')
        });
    }

    auth(); //try authentication

    return {
        isLoggedIn: isLoggedIn,
        auth: auth,
        getLoggedInUser: getLoggedInUser
    }
});

kimlik.factory('skillService', function ($resource, $rootScope) {
    $rootScope.skills = [];    //users skills
    $rootScope.allSkills = undefined  //all skills

    function fetchSkills() {
        var apiSkills = $resource('/kimlik/' + config.username + '/ajaxSkills');
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


kimlik.factory('profileService', function ($resource) {
    var todoCount = 0;
    var _profileCache = {}
    var api = $resource('/kimlik/api/:verb', {},
        {
            //@deprecated
            'getProfileById': {method: 'GET', params: {verb: 'getProfileById'}},

            'getProfilesByIds': {method: 'POST', params: {verb: 'getProfilesByIds'}, isArray: true}
        });


    function todo() {
        console.log(todoCount++)
    }

    function prefetchProfilesByIds(ids) {
        _(ids).each(function (id) {
            if (!_profileCache[id]) {
                console.log('cachede id yok: ', id);
                _profileCache[id] = {}
            } else {
                console.log('cachede id var: ', _profileCache[id]);
            }
        });

        api.getProfilesByIds({}, {ids: ids}, function (result) {
            _(result).each(function (it) {
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