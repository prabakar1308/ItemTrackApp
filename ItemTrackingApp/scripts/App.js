var Tracking = angular.module('Tracking', ['ngRoute', 'smart-table', 'ui.bootstrap', 'ui.grid']);

Tracking.factory('TrackingService', ['$http',function ($http) {

    var urlBase = 'http://localhost:56886/api/';
    var TrackingService = {};

    TrackingService.getTeamDetails = function () {
        return $http.get(urlBase + 'RetrieveData/getTeamDetails');
    };

    TrackingService.getReleases = function () {
        return $http.get(urlBase + 'RetrieveData/getReleases');
    };

    TrackingService.getTracks = function () {
        return $http.get(urlBase + 'RetrieveData/getTracks');
    };

    TrackingService.getItemsByRelease = function (trackId) {
        return $http.get(urlBase + 'RetrieveData/getJiraItemsByByRelease/' + trackId);
    };

    TrackingService.getItemsByTrack = function (trackId) {
        return $http.get(urlBase + 'RetrieveData/getJiraItemsByTrack/' + trackId);
    };

    TrackingService.getItems = function (releaseId,trackId,releaseFilter,trackFilter) {
        return $http.get(urlBase + 'RetrieveData/getJiraItems/' + releaseId + '/' + trackId+ '/' +releaseFilter+ '/'+trackFilter);
    };

    TrackingService.getAllItems = function (trackId) {
        return $http.get(urlBase + 'RetrieveData/getAllJiraItems/' + trackId);
    };

    TrackingService.getQAStatus = function (jiraId) {
        return $http.get(urlBase + 'RetrieveData/getQADetails/' + jiraId);
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
        templateUrl: 'views/ImportItems.html',
        controller: 'ImportItemsController'
    })
    .otherwise('/');
});