var Tracking = angular.module('Tracking', ['smart-table']);

Tracking.factory('TrackingService', ['$http',function ($http) {

    var urlBase = 'http://localhost:56886/api/';
    var TrackingService = {};
    TrackingService.getItems = function () {
        return $http.get(urlBase + 'ItemTracking');
    };

    return TrackingService;
}]);