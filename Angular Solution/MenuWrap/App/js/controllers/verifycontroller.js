$PortalApp.controller('verifycontroller', function ($scope, $http, $routeParams, $rootScope, $location, APIService) {

    $scope.Initiate = function () {
        var id = $location.search().id;
        if (id) {
            $scope.user.id = id;
        } else {
            alert('error');
            $location.path("/");
        }
    };

    $scope.UserVerify = function () {
        $scope.submitted = true;
        $scope.hasError = false;
        if ($scope.form.$valid) {
            $scope.processing = true;
            var res = APIService.confirmAccount($scope.user);
            res.then(function (data) {
                if (data) {
                    if (data.Response) {
                        $location.path("/verified");
                        $scope.processing = false;
                    } else {
                        $scope.hasError = true;
                        $scope.Errors = data.Errors;
                        $scope.processing = false;
                    }
                } else {
                    alert('Unable to contact server.Please try after sometime');
                    $scope.processing = false;
                }
            });
        }
        
    };

});