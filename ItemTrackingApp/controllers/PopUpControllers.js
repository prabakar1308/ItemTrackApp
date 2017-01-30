Tracking.controller('DeveloperEffortCtrl', function ($scope, $uibModalInstance, item,team) {

    $scope.dev = {};
    console.log(team);
    console.log(item);
    $scope.teamDetails = [];
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

    if (team !== undefined && team !== null) {
        angular.forEach(team, function (data) {
            if (data.Track == 'MS Track' || data.Track == 'Java Track')
                $scope.teamDetails.push(data);
        });
    }

    $scope.save = function () {
        $uibModalInstance.close($scope.dev);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});

Tracking.controller('QAEffortCtrl', function ($scope, $uibModalInstance, item,team) {

    $scope.qa = {};

    console.log('teamtest');
    console.log(item);

    if (item[0] !== undefined && item[0] !== null) {
        //var startedDate = new Date(item[0].TestStartedDate.replace(/^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/]\d{4}$/));
        var startedDate = new Date(item[0].TestStartedDate);
        var releaseDate = new Date(item[0].TestReadyDate);
        $scope.qa.jiraId = item[0].JiraId;
        $scope.qa.status = item[0].QAStatus;
        console.log($scope.qa.status);
        $scope.qa.validation = item[0].Validation;
        $scope.qa.rounds = item[0].Rounds;
        $scope.qa.testCaseFailed = item[0].TestCaseFailed;
        $scope.qa.testCasePassed = item[0].TestCasePassed;
        $scope.qa.testCompletedDate = item[0].TestCompletedDate;
        $scope.qa.releasedDate = releaseDate;
        $scope.qa.testStartedDate = startedDate;
        $scope.qa.testedBy = item[0].TestedBy;
        $scope.qa.defects = item[0].Defects;
        $scope.qa.actualHours = item[0].ActualHours;
        $scope.qa.comments = item[0].Comments;

    }

    if (team !== undefined && team !== null) {
        $scope.teamDetails = team;
       // $scope.qa.testedBy = 'M1022169dew';
    }

    $scope.save = function () {
        $uibModalInstance.close($scope.qa);
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

