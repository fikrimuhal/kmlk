/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 7/12/13
 * Time: 11:49 PM
 * Todo: add page timings
 * Todo: add events other than stateChangeEvent
 * https://developers.google.com/analytics/devguides/collection/analyticsjs/pages
 */

//#####################################################################################################################
//##                                       Google Analytics Module                                                   ##
//#####################################################################################################################


angular.module('fm.analytics', ['ui.state']).run(['$rootScope', '$location', function ($rootScope, $location) {
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date();
        a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

    //init
    ga('create', 'UA-41123168-3', 'acikdemokrasi.org');

    /**
     * https://github.com/angular-ui/ui-router/wiki#state-change-events
     * @param event
     * @param toState
     * @param toParams
     * @param fromState
     * @param fromParams
     */
    var track = function (event, toState, toParams, fromState, fromParams) {
        var path = $location.path();
        var absUrl = $location.absUrl();

        ga('send', 'pageview', {
            'page': path,
            'title': absUrl   //todo change to this title, and add absUrl to different place
        });
//        console.log('------>event', event);
//        console.log('---->toState', toState);
//        console.log('--->toParams', toParams);
//        console.log('-->fromState', fromState);
//        console.log('->fromParams', fromParams);
//        console.log('----------->', $location);
    };

    //track every stage change
    $rootScope.$on('$stateChangeSuccess', track);

}])
