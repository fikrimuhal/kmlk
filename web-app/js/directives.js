'use strict';

/* Directives */


var mod = angular.module('app.directives', []).
    directive('appVersion', ['version', function (version) {
        return function (scope, elm, attrs) {
            elm.text(version);
        };
    }]);


mod.directive('fadey', function () {
    return {
        restrict: 'A',
        link: function (scope, elm, attrs) {
            var duration = parseInt(attrs.fadey);
            if (isNaN(duration)) {
                duration = 500;
            }
            elm = jQuery(elm);
            elm.hide();
            elm.fadeIn(duration)

            scope.destroy = function (complete) {
                elm.fadeOut(duration, function () {
                    if (complete) {
                        complete.apply(scope);
                    }
                });
            };
        }
    };
});