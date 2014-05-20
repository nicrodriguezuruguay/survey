require(['application', 'moment'], function (application, moment) {
  application.controller('ApplicationController', [
    '$scope',
    function ($scope) {
      $scope.sidebarCollapsed = true;
      $scope.toggleSidebar = function (collased) {
        $scope.sidebarCollapsed = !$scope.sidebarCollapsed;
      };
      $scope.hideSidebar = function () {
        $scope.sidebarCollapsed = true;
      };

      $scope.formatDate = function (date) {
        return moment(date).format('hh:mm A - MMMM Do, YYYY');
      };
    }
  ]);
});
