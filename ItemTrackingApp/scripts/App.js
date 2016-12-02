var Tracking = angular.module('Tracking', ['ngRoute','smart-table']);

Tracking.factory('TrackingService', ['$http',function ($http) {

    var urlBase = 'http://localhost:56886/api/';
    var TrackingService = {};
    TrackingService.getItems = function () {
        return $http.get(urlBase + 'ItemTracking');
    };

    return TrackingService;
}]);

Tracking.config(function ($routeProvider) {
    $routeProvider
    .when("/", {
        templateUrl: 'views/ItemsTracking.html',
        controller: 'TrackingController'
    })
    .when("/updateItem", {
        templateUrl: 'views/UpdateItems.html',
        controller: 'UpdateItemsController'
    })
    .otherwise({
        template: "<h1>None</h1><p>Nothing has been selected,</p>"
    });
});