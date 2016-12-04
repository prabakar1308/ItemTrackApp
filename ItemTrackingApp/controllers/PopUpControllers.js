Tracking.controller('DeveloperEffortCtrl', function ($scope, $uibModalInstance, item) {

    console.log(item);
    $scope.dev = {};
    $scope.dev.jiraId = item.JiraID;
    $scope.dev.analysis = item.Analysis;
    $scope.dev.coding = item.Coding;
    $scope.dev.testing = item.UnitTesting;
    //$scope.devEffort = item.DeveloperEffort;
    $scope.dev.devEffort = ($scope.dev.analysis + $scope.dev.coding + $scope.dev.testing);
    $scope.dev.leadEffort = item.LeadEffort;
    //$scope.devEstimated = item.DevEstimatedEffort;
    $scope.dev.devEstimated = ($scope.dev.devEffort + $scope.dev.leadEffort);

    $scope.$watchGroup(['dev.analysis', 'dev.coding', 'dev.testing', 'dev.devEffort', 'dev.leadEffort'], function () {
        $scope.dev.devEffort = ($scope.dev.analysis + $scope.dev.coding + $scope.dev.testing);
        $scope.dev.devEstimated = ($scope.dev.devEffort + $scope.dev.leadEffort);
    });

    console.log($scope.dev);

    $scope.save = function () {
        $uibModalInstance.close($scope.dev);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});

Tracking.controller('QAEffortCtrl', function ($scope, $uibModalInstance, item) {

    console.log(item);
    $scope.dev = {};
    $scope.dev.jiraId = item.JiraID;
    $scope.dev.analysis = item.Analysis;
    $scope.dev.coding = item.Coding;
    $scope.dev.testing = item.UnitTesting;
    //$scope.devEffort = item.DeveloperEffort;
    $scope.dev.devEffort = ($scope.dev.analysis + $scope.dev.coding + $scope.dev.testing);
    $scope.dev.leadEffort = item.LeadEffort;
    //$scope.devEstimated = item.DevEstimatedEffort;
    $scope.dev.devEstimated = ($scope.dev.devEffort + $scope.dev.leadEffort);

    $scope.$watchGroup(['dev.analysis', 'dev.coding', 'dev.testing', 'dev.devEffort', 'dev.leadEffort'], function () {
        $scope.dev.devEffort = ($scope.dev.analysis + $scope.dev.coding + $scope.dev.testing);
        $scope.dev.devEstimated = ($scope.dev.devEffort + $scope.dev.leadEffort);
    });

    console.log($scope.dev);

    $scope.save = function () {
        $uibModalInstance.close($scope.dev);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});