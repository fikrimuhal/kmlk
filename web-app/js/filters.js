'use strict';

/* Filters */

var FLTR = angular.module('app.filters', [])

FLTR.filter('interpolate', ['version', function (version) {
    return function (text) {
        return String(text).replace(/\%VERSION\%/mg, version);
    }
}]);

FLTR.filter('ideaSearch', [ function () {
    var MINIMUM_CHAR = 2;
    var MINIMUM_MATCH = 1;
    return function (items,input) {
        var items = items
        var item
        var result = []
//        var maxIdx = items.length - 1
//
//        var result = new Array(maxIdx + 1);

        for (var idx in items) {
            item = items[idx];
            var input = input || ''
            if (multipleSearch(item.text, input, MINIMUM_MATCH, MINIMUM_CHAR)) {
                result.push(item);
            }

        }
        return result
    }
}]);
