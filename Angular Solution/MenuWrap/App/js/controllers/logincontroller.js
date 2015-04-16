$PortalApp.controller('loginController', function ($scope, $http, $location, $routeParams, $rootScope, AuthService, ValidateService, APIService) {
    $scope.UserLogin = function () {
        $scope.submitted = true;
        $scope.hasError = false;
        if ($scope.form.$valid) {
            $scope.processing = true;
            $scope.user.password = decodeURIComponent(escape(base64.encode($scope.user.password)));
            var res = APIService.login($scope.user);
            res.then(function (data) {
                if (data) {
                    if (!data.IsErrorResponse && data.Response) {
                        if (AuthService.authenticateUser(data.Response)) {
                            $location.path("/dashboard");
                        } else {
                            alert("Browser not supported");
                            $location.path("/");
                        }
                    } else {
                        $scope.hasError = true;
                        $scope.Errors = data.Errors;
                        $scope.processing = false;
                        $scope.user.password = "";
                    }
                } else {
                    alert("Unable to contact server.Please try after sometime");
                    $scope.hasError = false;
                    $scope.processing = false;
                    $scope.user.password = "";
                }
            });
        }
    };

    $scope.isRequired = function (feild) {
        return ValidateService.isRequired($scope, feild);
    };

    $scope.isEmail = function (feild) {
        return ValidateService.isEmail($scope, feild);
    };

    $scope.isNumeric = function (feild) {
        return ValidateService.isNumeric($scope, feild);
    };

    $scope.InitiateLoginForm = function () {
        $scope.validEmailRegex = $PortalApp.Enums.PortalConfig.EmailRegex;
    };
});

