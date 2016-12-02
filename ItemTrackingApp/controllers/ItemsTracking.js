Tracking.controller('TrackingController', function ($scope, TrackingService,$location) {

    getItems();

    $scope.Update = function () {
        $location.path('/updateItem');
    }

    function getItems() {
        TrackingService.getItems()
            .success(function (items) {
                $scope.rowCollection = items;

            })
            .error(function (error) {
                $scope.status = 'Unable to load customer data: ' + error.message;

            });
    }
});