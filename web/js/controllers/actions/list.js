require(['application'], function (application) {
  application.controller('ActionsController', [
    '$rootScope', '$scope', '$http',
    function ($rootScope, $scope, $http) {
      function loadActions() {
        $http.get('/api/actions').success(function (response) {
          $scope.actions = response.actions;
        });
      }

      $rootScope.bodyClass = 'actions';
      $scope.hideSidebar();

      $scope.newAction = {};
      $scope.saveAction = function () {
        $scope.savingAction = true;
        $http.post('/api/actions', { model: $scope.newAction })
          .success(function (response) {
            loadActions();
            $scope.savingAction = false;
          })
          .error(function () {
            $scope.savingAction = false;
          });
      };

      $scope.deleteAction = function (action) {
        if (!confirm('Are you sure?')) { return; }
        $http['delete']('/api/actions/' + action.id)
          .success(function () {
            loadActions();
          });
      };

      loadActions();
    }
  ]);
});
