var $routerApp = angular.module('Menuwrap', ['ui.router']);

$routerApp.config(function ($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise('/home');
    $stateProvider
        .state('home', {
            url: '/home',
            templateUrl: 'views/partials/_slider.html'
        })
        .state('service', {
            url: '/service',
            templateUrl: 'views/partials/_services.html'
        })
        .state('about', {
            url: '/about',
            templateUrl: 'views/partials/_about.html'
        })
        .state('restraunt', {
            url: '/restraunts',
            templateUrl: 'views/Restraunts/_toprestraunts.html'
        }).state('happy-clients', {
            url: '/happy-clients',
            templateUrl: 'views/partials/_happyclients.html'
        }).state('contact', {
            url: '/contact',
            templateUrl: 'views/partials/_contactus.html'
        });
});

//$routerApp.config(function ($routeProvider, $httpProvider) {
//    $routeProvider.when("/", {
//        templateUrl: "Views/Account/login.html",
//        controller: "loginController",
//    }).when("/login", {
//        templateUrl: "Views/Account/login.html",
//        controller: "loginController",
//    }).when("/signup", {
//        templateUrl: "Views/Account/signup.html",
//        controller: "signupcontroller",
//    }).when("/dashboard", {
//        templateUrl: "Views/Dashboard/dashboard.html",
//        controller: "dashboardcontroller",
//        requiresLogin: true
//    }).when("/pushNotifocation", {
//        templateUrl: "Views/Patient/pushnotification.html",
//        controller: "dashboardcontroller",
//        requiresLogin: true
//    }).when("/verify/:id?", {
//        templateUrl: "Views/Account/verify.html",
//        controller: "verifycontroller",
//    }).when("/registered", {
//        templateUrl: "Views/Account/registrationSuccessful.html",
//        controller: "",
//    }).when("/verified", {
//        templateUrl: "Views/Account/verificationSuccessful.html",
//        controller: "",
//    }).otherwise({ redirectTo: '/' });
//}).run(['$rootScope', '$location', 'AuthService', function ($rootScope, $location, AuthService) {
//    $rootScope.$on('$routeChangeStart', function (event, next) {
//        if (next.requiresLogin && !AuthService.isAuthenticated()) {
//            console.log('Unauthorised User');
//            event.preventDefault();
//            $location.path('/login');
//        } else {
//            return $location.path;
//        }
//    });
//}]);




