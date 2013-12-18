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


angular.module('fm.analytics', []).run(['$rootScope', '$location', function ($rootScope, $location) {
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
    ga('create', 'UA-41123168-4', 'kimlik.io');
    console.log('google analytics initialized');

    var previousAbsUrl;

    /**
     * todo: pageView yollanmadan once status u bulsak iyi olur
     * suanda ilk pageView annoymous olarak gidiyor.
     */
    function setLoginStatusAsRegistered() {
        ga('set', 'dimension1', 'registered');
        console.error('hellooooo2oo23o32o3o2o32o23o2')
    }

    /**
     *
     * @param event
     * @param next
     * @param current
     */
    var track = function (event, next, current) {
        var path = $location.path();
        var absUrl = $location.absUrl();
        if (previousAbsUrl !== absUrl) { //todo ayni sayfa cagrilinca yeni event gonderilmiyecek, bu istenmiye bilinir.
            previousAbsUrl = absUrl;

            ga('send', 'pageview', {
                'page': window.location.pathname,
                'title': window.location.pathname
            });

            console.debug('track url sent', window.location.pathname)
//        console.log('------>event', event);
//        console.log('---->next', next);
//        console.log('--->current', current);
//        console.log('----------->', $location);
        }
    };


    //track every stage change
    $rootScope.$on("$routeChangeStart", track);
    $rootScope.$on("userAuthenticated", setLoginStatusAsRegistered);
    //ui route ile
//    $rootScope.$on('$stateChangeSuccess', track);

    track();
}]);
