Tracking.controller('TrackingController', function ($scope, TrackingService, $location, $uibModal) {

    $scope.releaseFilter = true;
    $scope.trackFilter = true;
    getReleases();  

    $scope.Update = function () {
        $location.path('/updateItem');
    }

    $scope.ReleaseFilterChanged = function () {
        $scope.releaseFilter != $scope.releaseFilter;
    }

    $scope.TrackFilterChanged = function () {
        $scope.trackFilter != $scope.trackFilter;
    }

    function getReleases() {
        TrackingService.getReleases().success(function (items) {
            console.log(items);
            $scope.Releases = items;
            $scope.selectedRelease = items[0];
            getTracks();
            })
            .error(function (error) {
                alert(error);

            });
    }

    function getTracks() {
        TrackingService.getTracks().success(function (items) {
            console.log(items);
            $scope.Tracks = items;
            $scope.selectedTrack = items[0];
            $scope.GetItems();
        })
            .error(function (error) {
                alert(error);

            });
    }

    $scope.GetItems = function () {

        TrackingService.getItems($scope.selectedRelease.ReleaseID, $scope.selectedTrack.TrackID, $scope.releaseFilter, $scope.trackFilter)
            .success(function (items) {
                $scope.rowCollection = items;
                console.log(items);
                $scope.data = [].concat(items);
                console.log($scope.data);

            })
                .error(function (error) {
                    alert(error);

                });
    }

    $scope.ClearFilters = function () {
        $scope.releaseFilter = false;
        $scope.trackFilter = false;
    }

    $scope.selectRow = function (row) {
        console.log(row);
    }

    $scope.developerEffort = function (row) {
        var modalInstance = $uibModal.open({
            templateUrl: 'DeveloperEffort.html',
            controller: 'DeveloperEffortCtrl',
            size: 'lg',
            resolve: {
                item: function () {
                    return row;
                }
            }
        });

        modalInstance.result.then(function (result) {
            console.log(result);
        });
    }    

    $scope.updateItem = function (row, buttonName) {
        var modalInstance = $uibModal.open({
            templateUrl: 'UpdateItem.html',
            controller: 'UpdateItemCtrl',
            size: 'lg',
            resolve: {
                data: function () {
                    return row;
                }
            }
        });

        modalInstance.buttonName = buttonName;

        modalInstance.result.then(function (result) {
            console.log(result);
        });
    }

    $scope.ImportExcel = function () {
        $location.path('/updateItem');
    }
});