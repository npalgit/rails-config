'use strict';

angular.module('oasConfig').factory('AssetFactory', ['$log', '$resource',
function($log, $resource) {
    return $resource('/assets/:id', {}, {});
}]);
