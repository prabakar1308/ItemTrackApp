Tracking.controller('DeveloperEffortCtrl', function ($scope, $uibModalInstance, item) {

    $scope.dev = {};

    if (item !== undefined && item !== null) {
        $scope.dev.jiraId = item.JiraID;
        $scope.dev.analysis = item.Analysis;
        $scope.dev.coding = item.Coding;
        $scope.dev.testing = item.UnitTesting;
        $scope.dev.estimatedBy = item.EstimatedBy;
        $scope.dev.devEffort = ($scope.dev.analysis + $scope.dev.coding + $scope.dev.testing);
        $scope.dev.leadEffort = item.LeadEffort;
        //$scope.devEstimated = item.DevEstimatedEffort;
        $scope.dev.devEstimated = ($scope.dev.devEffort + $scope.dev.leadEffort);
        $scope.dev.qaEffort = item.QAEstimatedEffort;
        $scope.dev.totalEffort = ($scope.dev.devEstimated + $scope.dev.qaEffort);

    }

    $scope.$watchGroup(['dev.analysis', 'dev.coding', 'dev.testing', 'dev.devEffort', 'dev.leadEffort', 'dev.qaEffort'], function () {
        $scope.dev.devEffort = ($scope.dev.analysis + $scope.dev.coding + $scope.dev.testing);
        $scope.dev.devEstimated = ($scope.dev.devEffort + $scope.dev.leadEffort);
        $scope.dev.totalEffort = ($scope.dev.devEstimated + $scope.dev.qaEffort);
    });

    $scope.save = function () {
        $uibModalInstance.close($scope.dev);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});


Tracking.controller('UpdateItemCtrl', function ($scope, $uibModalInstance, data) {

    $scope.item = {};
    if (data !== undefined && data !== null) {
        $scope.item.jiraID = data.JiraID;
        $scope.item.application = data.Application;
        $scope.item.module = data.Module;
        $scope.item.priority = data.Priority;
        $scope.item.bundle = data.PlannedBundle;


        $scope.item.title = data.Title;
        $scope.item.developer = data.Developer;
        $scope.item.tester = data.Tester;
        $scope.item.status = data.Status;
    }

    $scope.buttonName = $uibModalInstance.buttonName;
    $scope.BundleItems = ['Bundle 1', 'Bundle 2', 'Bundle 3'];
    $scope.PriorityItems = ['P1', 'P2', 'P3'];
    $scope.Status = ['Analysis', 'To Be Estimated', 'Estimated','Development','Unit Testing','Verification','Integration Testing','Regression Testing','UAT','Production Test'];

    $scope.save = function () {
        $uibModalInstance.close($scope.item);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});

