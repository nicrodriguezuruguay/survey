require(['application'], function (application) {
  application.controller('CustomersController', [
    '$rootScope', '$scope', '$http',
    function ($rootScope, $scope, $http) {
      function loadCustomers() {
        $http.get('/api/customers').success(function (response) {
          $scope.customers = response.customers;
        });
      }

      $rootScope.bodyClass = 'customers';
      $scope.hideSidebar();

      $scope.newCustomer = {};
      $scope.saveCustomer = function () {
        $scope.savingCustomer = true;
        $http.post('/api/customers', { model: $scope.newCustomer })
          .success(function () {
            loadCustomers();
            $scope.savingCustomer = false;
          })
          .error(function () {
            $scope.savingCustomer = false;
          });
      };

      $scope.deleteCustomer = function (customer) {
        if (!confirm('Are you sure?')) { return; }
        $http['delete']('/api/customers/' + customer.id)
          .success(function () {
            loadCustomers();
          });
      };

      loadCustomers();
    }
  ])
});
