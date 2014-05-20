require(['application'], function (application) {
  application.controller('AnalysisController', [
    '$rootScope', '$scope', '$http',
    function ($rootScope, $scope, $http) {
      function loadActions() {
        $http.get('/api/actions').success(function (response) {
          $scope.actions = response.actions;
        })
      }

      $rootScope.bodyClass = 'analysis';
      $scope.hideSidebar();

      $scope.flowActions = [{}];

      $scope.analysis = {};
      $scope.runAnalysis = function () {
        $http.post('/api/analyses', $scope.analysis)
          .success(function (response) {
            $scope.result = response.result;
          });
      };

      loadActions();
    }
  ]);
});

