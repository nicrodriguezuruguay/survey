require(['application'], function (application) {
  application.controller('NewActionController', [
    '$rootScope', '$scope', '$http', '$location',
    function ($rootScope, $scope, $http, $location) {
      $rootScope.bodyClass = 'actions';
      $scope.hideSidebar();

      $scope.action = {
        custom_fields: [{ name: '', slug: '', on_event: '' }]
      };

      /* Custom fields */
      $scope.addCustomField = function () {
        $scope.action.custom_fields.push({
          name: '', slug: '', on_event: ''
        });
      };
      $scope.removeCustomField = function (customField) {
        customField.name = customField.slug = null;
        customField.deleted = true;
      };

      /* Submit form */
      $scope.saveAction = function () {
        $http.post('/api/actions', { model: $scope.action })
          .success(function () {
            $location.path('/actions');
          });
      };
    }
  ]);
});
