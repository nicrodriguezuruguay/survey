require(['application'], function (application) {
  application.controller('CustomerController', [
    '$rootScope', '$scope', '$http', '$routeParams',
    function ($rootScope, $scope, $http, $routeParams) {
      $rootScope.bodyClass = 'customer';
      $scope.hideSidebar();

      $http.get('/api/customers/' + $routeParams.id)
        .success(function (response) {
          $scope.customer = response.customer;
        });
    }
  ]);
});
