require(['application'], function (application) {
  application.controller('EventsController', [
    '$rootScope', '$scope', '$http',
    function ($rootScope, $scope, $http) {
      $rootScope.bodyClass = 'events';
      $scope.hideSidebar();

      $scope.saveEvent = function () {
        var url = '/api/events?token=' + $scope.newEvent.apiToken
          , params = {
              event: {
                action: $scope.newEvent.action,
                customer: $scope.newEvent.customer,
                params: JSON.parse($scope.newEvent.params)
              }
            };

        $http.post(url, params)
          .success(function () {
            alert('Event sent');
            $scope.newEvent = {};
          })
          .error(function () {
            alert('There was an error try again')
          });
      };
    }
  ]);
});
