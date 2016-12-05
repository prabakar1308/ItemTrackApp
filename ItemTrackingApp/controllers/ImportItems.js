Tracking.controller('ImportItemsController', function ($scope, $location) {

    $scope.gridOptions = {};

    $scope.Reset = function() {
        $scope.gridOptions.data = [];
        $scope.gridOptions.columnDefs = [];
    }

    $scope.GoToHome = function () {
        $location.path('#/');
    }
});