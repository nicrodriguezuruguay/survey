require(['application'], function (application) {
  application.controller('DashboardController', [
    '$rootScope', '$scope', '$http', '$timeout',
    function ($rootScope, $scope, $http, $timeout) {
      $rootScope.bodyClass = 'dashboard';
      $scope.hideSidebar();
    }
  ]);
});
