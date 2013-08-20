'use strict';

//TURN OFF THIS AT PRODUCTION (NOT IMPLEMENTED YET)
//var MERGE_API_WITH_LOCAL_CACHE = true;

/* Services */

var SRVC = angular.module('app.services', []).
    value('version', '0.1');

SRVC.factory('ForumService', function () {
    //initialize, this will run only one time
    return {
//        getLastForums: function () {
//            $rootScope.updateSession();
//        }
    };
});


function applyCacheToResource(resource, cache) {
    // Check to see what type of value we're dealing with.
    // If it's an array, we want to splice-in the cache;
    // if it's an object, we want to extend the keys.
    if (angular.isArray(resource)) {
        //alert('ok');
        resource.splice.apply(
            resource.data,
            [ 0, 0 ].concat(cache)
        );

    } else {
        //alert(resource.data);
        angular.extend(resource, cache);
    }
    // Return the updated resource (for easy of use).
    return( resource );

}

//
//function mergeCachedResponse(apiResponse, cachedResponse) {
//    //todo: bunu resources a bir sekilde entegre etmek lazim
//    //todo: cache i update etmeli son datayla
//    //todo: cache da son N kayit olmali
//    //todo: idsi ayni olanlardan 2 sertane olmamali
//    if (MERGE_API_WITH_LOCAL_CACHE && angular.isArray(apiResponse.data)) {
//
//        apiResponse.data.splice.apply(
//            apiResponse.data,
//            [ 0, 0 ].concat(cachedResponse.data)
//        );
//    }
//
//}







