'use strict';

// Declare app level module which depends on filters, and services
var app = angular.module('app', ['app.filters', 'app.services', 'app.directives', 'app.controllers', 'FacebookProvider', 'ui.state', 'ngCookies', 'fm.analytics', 'http-auth-interceptor', 'localStorageModule']).
    config(['$routeProvider', '$locationProvider', '$stateProvider', '$urlRouterProvider', function ($routeProvider, $locationProvider, $stateProvider, $urlRouterProvider) {
        //Routes
//        $routeProvider.when('/view1', {templateUrl: '/fresh/partial1', controller: 'MyCtrl1'});
//        $routeProvider.when('/view2', {templateUrl: '/fresh/partial2', controller: 'MyCtrl2'});
//        $routeProvider.when('/login', {templateUrl: '/fresh/login', controller: 'LoginCtrl'});

//        $routeProvider.when('/register', {templateUrl: '/fresh/register', controller: 'RegisterCtrl'});
//        $routeProvider.when('/forum', {templateUrl: '/fresh/forum', controller: 'ForumCtrl'});
//        $routeProvider.when('/portal', {templateUrl: '/fresh/portal', controller: 'PortalCtrl'});
//        $routeProvider.when('/portalMeclis', {templateUrl: '/fresh/portal', controller: 'PortalMeclisCtrl'});
//        $routeProvider.otherwise({redirectTo: '/'});
        $urlRouterProvider.otherwise('/idea')
        $stateProvider
            .state('layout_2c', {
                views: {
                    "main": {
                        templateUrl: '_/layout2c'
                    }
                }
            })
            .state('view1', {
                url: "/view1",
                views: {
                    "main": {
                        templateUrl: "/fresh/partial1",
                        controller: 'MyCtrl1'
                    }
                }
            })
            .state('landing', {
                url: "/landing",
                views: {
                    "main": {
                        templateUrl: "/fresh/landing",
                        controller: 'MyCtrl2'
                    }
                }
            })
            .state('login', {
                url: "/login",
                views: {
                    "main": {
                        templateUrl: "/fresh/login",
                        controller: 'LoginCtrl'
                    }
                }
            })
            .state('forgotPassword', {
                url: "/forgotPassword",
                views: {
                    "main": {
                        templateUrl: "/fresh/forgotPassword",
                        controller: 'ForgotPasswordCtrl'
                    }
                }
            })
            .state('changePasswordWithToken', {
                url: "/changePasswordWithToken",
                views: {
                    "main": {
                        templateUrl: "/fresh/changePasswordWithToken",
                        controller: 'ForgotPasswordCtrl'
                    }
                }
            })
            .state('register', {
                url: "/register",
                views: {
                    "main": {
                        templateUrl: "/fresh/register",
                        controller: 'RegisterCtrl'
                    }
                }
            })
            .state('idea', {
                url: "/idea",
                parent: 'layout_2c',
                views: {
                    "main": {
                        templateUrl: "/fresh/idea",
                        controller: 'IdeaCtrl'
                    },
                    "rightbar": {
                        templateUrl: "_/idea_right"
                    }
                }
            })
            .state('idea.id', {    // idea uri ile paylasilir ise bu route a dusuyor
                url: "/:ideaId"
            })
            .state('forumList', {
                url: "/forumList",
                parent: 'layout_2c',
                views: {
                    "main": {
                        templateUrl: "/fresh/forumList",
                        controller: 'ForumListCtrl'
                    },
                    "rightbar": {
                        templateUrl: "_/forumList_right"
                    }
                }
            })
            .state('portal', {
                url: "/portal/:portalId",
                parent: 'layout_2c',
                views: {
                    "main": {
                        templateUrl: "/fresh/portal",
                        controller: 'PortalCtrl'
                    }
                }
            })
            .state('portal.voteBoard', {
                url: "/voteBoard",
                templateUrl: "/fresh/portalVoteBoard",
                controller: 'PortalCtrl'
            })
            .state('portal.voteBoard.vote', {
//                parent: 'portal',
                url: "/vote/:voteId",
                views: {
                    "@portal": {
                        templateUrl: "/fresh/portalVote",
                        controller: 'VotablePageCtrl'
                    }
                }
            })

            .state('portal.info', {
                url: "/info",
                templateUrl: "/fresh/portalInfo",
                controller: 'PortalCtrl'
            })

            .state('portal.news', {
                url: "/news",
                templateUrl: "/fresh/portalNews",
                controller: 'PortalCtrl'
            })
            .state('portal.discussion', {
                url: "/discussion",
                templateUrl: "/fresh/portalDiscussion",
                controller: 'PortalCtrl'
            })

            .state('portal.multimedia', {
                url: "/multimedia",
                templateUrl: "/fresh/portalMultimedia",
                controller: 'PortalCtrl'
            })
            .state('portal.moderation', {
                url: "/moderation",
                templateUrl: "/fresh/portalModeration",
                controller: 'PortalCtrl'
            })
            .state('profile', {
                url: "/profile/:id",
                parent: 'layout_2c',
                views: {
                    "main": {
                        templateUrl: "/fresh/profile",
                        controller: 'ProfileCtrl'
                    },
                    "rightbar": {
                        //templateUrl: "_/idea_right"
                    }
                }
            })


        //Use hashBang, do not use html5 urls
        $locationProvider.html5Mode(false).hashPrefix('!');
        console.log('Fresh config finished, all modules are loaded')
    }]);

// Main module
app.run(function ($window, $rootScope, ProfileService, $route, $state, $stateParams) {
    console.log("Fresh run begin");
    //Used in navigation, used by: _navbar.gsp
    $rootScope.$state = $state;
    $rootScope.$stateParams = $stateParams;


    //facebook
    _facebookApiInit($window, $rootScope);

    //authenticate
    ProfileService.authenticate();


    //debug
    $rootScope._logApply = function () {
        var e = $("#debug_apply_flash");
        var value = parseInt(e.html()) + 1;
        e.html(value)
    };

    // register listener to watch route changes
    $rootScope.$on("$stateChangeSuccess", function () {
        //reset count each route change
        var e = $("#debug_apply_flash");
        e.html(0);

    });


    console.log("Fresh run end! :)");


    $rootScope.$on('event:auth-loginRequired', function () {
        console.warn('event:auth-loginRequired');

        // if this event emitted: user is not authenticated
        $rootScope.authenticated = false

        ProfileService.authenticate(true);
    });
    $rootScope.$on('event:auth-loginConfirmed', function () {
        console.info('event:auth-loginConfirmed');
    });

});


//#####################################################################################################################
//##                                       PRIVATE FUNCTIONS                                                         ##
//#####################################################################################################################


function _facebookApiInit(window, $rootScope) {
    console.log("_facebookApiInit started");
    window.fbAsyncInit = function () {
        FB.init({
            appId: "258055817670416",
            channelUrl: "/facebookSdk/channel?locale=en_US",  // Custom channel URL
            cookie: true, // enable cookies to allow the server to access the session
            oauth: true, // enables OAuth 2.0
            status: false, // check login status
            xfbml: true, // parse XFBML
            frictionlessRequests: false // to enable frictionless requests
        });

        console.log("Facebook api is ready, you can call FB.* now");

        //console.debug("FB event edge.create registered")
        FB.Event.subscribe('edge.create', function (targetUrl) {
            ga('send', 'facebook', 'like', targetUrl);
        });

        //console.debug("FB event auth.statusChange registered")
        FB.Event.subscribe('auth.statusChange', function (response) {
            $rootScope.$broadcast("fb_statusChange", {'status': response.status});
        });


        $rootScope.$broadcast("fb_ready");
        console.log("Facebook api successfully initialized");
    };

    (function () {
        var e = document.createElement("script");
        e.src = document.location.protocol + "//connect.facebook.net/en_US/all.js";
        e.async = true;
        document.getElementById("fb-root").appendChild(e);
    }());
//
}