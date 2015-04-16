$PortalApp.controller('signupcontroller', function ($scope, $http, $location, $routeParams, $rootScope, ValidateService, APIService) {
    $scope.CreateAccount = function () {
        $scope.submitted = true;
        $scope.hasError = false;
        if ($scope.form.$valid) {
            $scope.processing = true;
            var encrypted = decodeURIComponent(escape(base64.encode($scope.User.Password)));
            $scope.User.Password = encrypted;
            $scope.User.ConfirmPassword = encrypted;
            var res = APIService.registerUser($scope.User);
            res.then(function (data) {
                if (data && !(typeof data.IsErrorResponse == "undefined")) {
                    $scope.processing = false;
                    if (!data.IsErrorResponse && data.Response.Data.subject) {
                        $location.path("/registered");
                    } else {
                        $scope.Errors = data.Errors;
                        $scope.hasError = true;
                        $scope.processing = false;
                        $scope.User.Password = "";
                        $scope.User.ConfirmPassword = "";
                    }
                } else {
                    alert('Unable to contact server.Please try after sometime');
                    $scope.processing = false;
                    $scope.User.Password = "";
                    $scope.User.ConfirmPassword = "";
                }
            });
        } else {
            $scope.processing = false;
            $scope.User.Password = "";
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

    $scope.InitiateSignUpForm = function () {
        $scope.validEmailRegex = $PortalApp.Enums.PortalConfig.EmailRegex;
        $scope.FirstNameMaxLength = $PortalApp.Enums.MaxlengthConfig.FirstName;
        $scope.LastNameMaxLength = $PortalApp.Enums.MaxlengthConfig.LastName;
        $scope.CompanyNameMaxLength = $PortalApp.Enums.MaxlengthConfig.CompanyName;
    };
});