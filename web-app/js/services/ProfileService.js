/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 7/13/13
 * Time: 4:05 AM
 * To change this template use File | Settings | File Templates.
 */

SRVC.factory('ProfileService', ['$rootScope', '$http', '$resource', '$state', 'authService', '$cookies', '$q', 'Facebook', '$storage', function ($rootScope, $http, $resource, $state, authService, $cookies, $q, Facebook, $storage) {
    var ANON_PICTURE = C.anon_pic,
        facebookSDKReady = false;
    userAPI = $resource('/api/1/user/:id/:verb', {id: '@id'},
        {   //https://bitbucket.org/fikrimuhal/fmw/wiki/acikdemokrasi.api.caching
            'get': {method: 'GET', params: {}},
            'profile': {method: 'GET', params: {verb: 'profile'}}, // shallow profile i.e. without restricted fields
            'register': {method: 'PUT', params: {verb: 'register'}},
            'login_email': {method: 'POST', params: {verb: 'login', authType: 'plain'}},
            'login_rememberMe': {method: 'POST', params: {verb: 'login', authType: 'rememberMe'}},
            'login_facebook': {method: 'POST', params: {verb: 'login', authType: 'facebook'}},
            'resetPassword': {method: 'POST', params: {verb: 'resetPassword'}},
            'changePassword': {method: 'POST', params: {verb: 'changePassword'}},
            'changePasswordWithToken': {method: 'POST', params: {verb: 'changePasswordWithToken'}},
            'logout': {method: 'POST', params: {verb: 'logout'}},
            'update': {method: 'POST', params: {}},
            'verifyEmail': {method: 'POST', params: {verb: 'verifyEmail'}},
            'changeEmail': {method: 'POST', params: {verb: 'changeEmail'}},
            'isEmailAvailable': {method: 'POST', params: {verb: 'checkEmailAddress'}},   //todo  isEmailAvailable olsa ismi daha iyi olur
            'ideaVotes': {method: 'GET', params: {verb: 'ideaVotes'}}
        });

    /**
     * @deprecated
     * @param forceLogin if true redirect to login page
     */
    function authenticate(forceLogin) {
        forceLogin = forceLogin || false;

        var cachedUser = cachedCurrentUser();

        function useCachedUserIfAvailable() {
            if (cachedUser) {
                updateUser(cachedUser, true)
            }
        }

        function showLoginScreen() {
            if (cachedUser) {
                // Kullanici authenticated degil ama daha onceden kayit olmus
                alert('Bu islemi yapmaniz icin giris yapmaniz gerekiyor')
                $state.transitionTo('login', {}, true);
            } else {
                // kullanici authenticated degil ve ilk defa goruyoruz
                alert('Bu islemi yapmaniz icin kayıt olmanız gerekiyor')
                $state.transitionTo('register', {}, true);

            }
        }


        if (!isLoggedIn()) {
            // browser i  ilk defa acmis olabilir ||
            // command-R yapmis olabilir

            //Localstorage da user var ise view e gonder, (i.e. daha authenticate olmadik)
            useCachedUserIfAvailable();

            var next = forceLogin ? showLoginScreen : null;


            if (isRememberMeEnabled()) {
                authenticateViaRememberMe(null, next)
            } else {
                if (forceLogin) {
                    next();
                }
            }


        } else {
            console.error('Kullanici zaten login olmus');
        }


    }


    /**
     *
     * @param parameters
     * @param {STRING} [transitionTo]
     */
    function authenticateViaEmail(parameters, transitionTo) {

        userAPI.login_email({}, parameters, function (result) {
            var user = result.data;

            //update session with new data
            updateUser(user);

            //http-auth-interceptor
            authService.loginConfirmed();

            //GO TO next view if Set
            if (transitionTo) {
                $state.transitionTo(transitionTo, {}, true);
            }
        }, function (result) {
            alert('Login basarisiz oldu!');
            console.log(result.data);
            //todo: hatayi goster
        });
    }

    /**
     *
     * @param {String} [transitionTo]
     */
    function authenticateViaRememberMe(transitionTo, onFail) {
        if (isRememberMeEnabled()) {

            userAPI.login_rememberMe({}, {}, function (result) {
                var user = result.data;
                console.info('Authentication success with authenticateViaRememberMe');

                //update session with new data
                updateUser(user);

                //http-auth-interceptor
                authService.loginConfirmed();

                //GO TO next view if Set
                if (transitionTo) {
                    $state.transitionTo(transitionTo, {}, true);
                }

            }, function (result) {
                if (onFail)onFail();
                console.error('Unexpected authentication failure with authenticateViaRememberMe', result.data);
            });
        }
    }

    /**
     * reqires already connected to facebook JS SDK and in status should be connected
     * @param {String} [transitionTo]
     */
    function authenticateViaFacebook(transitionTo) {

        if (facebookSDKReady) {
            console.log("authenticateViaFacebook");
            //this api call implies registration. i.e if no user exists, Servlet Filter will create one on (ANY) next request
            userAPI.login_facebook({}, {}, function (result) {
                var user = result.data;
                console.info('Authentication success with authenticateViaFacebook');

                //update session with new data
                updateUser(user);

                //http-auth-interceptor
                authService.loginConfirmed();

                //GO TO next view if Set
                if (transitionTo) {
                    $state.transitionTo(transitionTo, {}, true);
                }

            });


        }

//        $state.transitionTo('idea', {}, true);
    }

    /**
     * if user is not provided , will try to fetch from server
     * @param {Object} [user] {facebook:{id:null}, id:975, firstName:firstName, middleName:null, lastName:lastName,…}
     * @param {Boolean} doNotUpdateCache
     */
    function updateUser(user, doNotUpdateCache) {

        if (user) {
            //todo: session daki fieldleri teker teker kontrol edip eger gerekli degisiklik varsa ozaman yaz.
            $rootScope.authenticated = true
            $rootScope.session = user;

            if (!doNotUpdateCache) cachedCurrentUser(user)
        } else {
            userAPI.get({}, {}, function (result) {
                //todo: session daki fieldleri teker teker kontrol edip eger gerekli degisiklik varsa ozaman yaz.
                $rootScope.authenticated = true
                $rootScope.session = result.data;
                if (!doNotUpdateCache) cachedCurrentUser(result.data)
            });
        }
    }


    function resetPassword(email, onSuccess, onError) {
        userAPI.resetPassword({}, {email: email}, onSuccess, onError);

    }

    /**
     *
     * @param {Object} params
     * @param {Function} onSuccess
     * @param {Function} onError
     */
    function changePassword(params, onSuccess, onError) {

        if (params.token) {
            userAPI.changePasswordWithToken({}, params, onSuccess, onError);
        } else {
            userAPI.changePassword({}, params, onSuccess, onError);
        }

    }

    /**
     *
     * @param {Object} [params] {}
     * @param {Function} [onSuccess]
     * @param {Function} [onError]
     */
    function votedIdeas(params, onSuccess, onError) {
        userAPI.ideaVotes({}, {}, onSuccess, onError);
    }

    /**
     *
     * @param {Object} params {"email":"test@example.com","currentPassword":"password"}
     * @param {Function} onSuccess
     * @param {Function} onError
     */
    function changeEmail(params, onSuccess, onError) {
        userAPI.changeEmail({}, params, onSuccess, onError);
    }

    /**
     *  Server: {"status":"OK","data":{"available":false,"email":"ilgaz@fikrimuhal.com"}} Api will return something like that
     * @param {String} email
     * @returns {*}
     */
    function checkEmailAvailability(email) {
        console.error('not implemented yet');
        var result = userAPI.isEmailAvailable({}, {email: email});

        return result
    }

    function user() {
        return $rootScope.session;
    }

    function isLoggedIn() {
        return ($rootScope.authenticated && $rootScope.session && $rootScope.session.id) === true;
    }

    /**
     * Kullanici eger daha onceden login olmus ise, Browser cache in de kaydedilmis user i dondur
     */
    function cachedCurrentUser(user) {
        var me = $storage('me');

        if (user) {
            me.setItem('USER', user);
        }

        var x = me.getItem('USER');

        return x
    }

    function isRememberMeEnabled() {
//        alert($cookies.rememberMe )
        // cookie var ise true, yok ise false
        return ($cookies.rememberMe && $cookies.rememberMe.length > 3);
    }

    /**
     * Fetch profile from server
     * @param {Long} id
     * @param {Function} [onSuccess]
     * @param {Function} [onError]
     */
    function getProfile(id, onSuccess, onError) {

        var params = {ids: id};
//        var params = {ids: '1,2,3,4,5,6,7,8,9,10'};
        var result = userAPI.profile(params, {}, onSuccess, onError);

//        console.error('XXXXX::::::', result);
        return result;

    }

    /*
     ---------------------------------------------------------------------------------
     PROFILE STORE
     ---------------------------------------------------------------------------------
     */

    /**
     *profile cache
     * todo bundan onceki cache local storage da olmasi lazim
     */
    var profileStore = {

    }

    function localStorageCache() {

    }

    /**
     *
     * @param id
     * @returns {Promise} that can be never broken!
     */
    function showProfile(id) {

        if (profileStore[id]) {
//            console.debug('cacheOK ' + id)
            return  profileStore[id];
        } else {
//            console.info('profile fetch requested: SERVER FETCH!!!', id)
            var deferred = $q.defer();
//            console.debug('FETCH' + id)

            var response = getProfile(id, function updateStore(r) {
                var remoteProfile = r.data[0];
//                console.debug('GOT response' + id)

                //Todo alt da ki todo icin jira da issue ac.
                //Todo: Server or service should return profile picture always. Or profile picture should be a directive not <img> tag. i.e. <profile:picture>
                //FIX: missing profile picture
                remoteProfile.pictureUrl = remoteProfile.pictureUrl || ANON_PICTURE;

                //store for next request
                profileStore[id] = remoteProfile;

                //resolve defered response
                deferred.resolve(profileStore[id]);
            });
            //
            profileStore[id] = {_loading: true};

            return deferred;
        }
    }


    /*
     ---------------------------------------------------------------------------------
     Listeners watchers et.al.
     ---------------------------------------------------------------------------------
     */

    /**
     * @Deprecated
     */
    $rootScope.$on("fb_connected", function (event, args) {
        authenticateViaFacebook()
    });

    /**
     * Eger kullanici bize authorization vermis ise, server da authenticate et
     * todo: MOVE this LISTENER in to the facebookProvider SERVICE
     */
    $rootScope.$on("fb_ready", function (event, args) {
        facebookSDKReady = true;
        Facebook.getLoginStatus();
        FB.getLoginStatus(function (x) {
            if (x.status == 'connected') {
                authenticateViaFacebook();
            } else {
                // Manyak gibi kullaniciya FB login ekrani gostermeye gerek yok.
            }
        })
    });

    /*
     ---------------------------------------------------------------------------------
     PUBLIC / SCOPE
     ---------------------------------------------------------------------------------
     */
    $rootScope.showProfile = showProfile


    return {
        // @deprecated
        authenticate: authenticate,

        authenticateViaEmail: authenticateViaEmail,
        authenticateViaRememberMe: authenticateViaRememberMe,
        authenticateViaFacebook: authenticateViaFacebook,
        updateUser: updateUser,
        changePassword: changePassword,
        resetPassword: resetPassword,
        changeEmail: changeEmail,
        checkEmailAvailability: checkEmailAvailability,
        votedIdeas: votedIdeas,
        register: userAPI.register,
        user: user,
        isLoggedIn: isLoggedIn(),
        getProfile: getProfile,
        showProfile: showProfile


    };


}]);

