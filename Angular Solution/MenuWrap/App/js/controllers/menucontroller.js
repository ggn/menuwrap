$PortalApp.controller('menucontroller', function ($scope, AuthService) {
    $scope.menuSelected = function (activeMenu) {
        $scope.$emit('menucontroller.menuselected', activeMenu);
        $scope.activeMenu = activeMenu;
    }

    $scope.initiateMenu = function () {
        $('.dashboard-menu').css('height', parseInt($('body').css('height')) - parseInt($('#application-headear').css('height')));
        $scope.activeMenu = 'dashboard';
        $scope.menuList = $scope.getMenuForUser(); // Expects json from DB
    }

    $scope.getMenuForUser = function () {
        return [{ 'item': 'dashboard', 'title': 'Dashboard' },
                { 'item': 'addApplication', 'title': 'Add Application' }];
    };
});

