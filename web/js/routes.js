require(['application'], function (application) {
  application.config(['$routeProvider', function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'html/dashboard.html',
        controller: 'DashboardController'
      })
      .when('/api', {
        templateUrl: 'html/api.html',
        controller: 'ApiController'
      })
      .when('/actions', {
        templateUrl: 'html/actions/list.html',
        controller: 'ActionsController'
      })
      .when('/actions/new', {
        templateUrl: 'html/actions/form.html',
        controller: 'NewActionController'
      })
      .when('/customers', {
        templateUrl: 'html/customers/list.html',
        controller: 'CustomersController'
      })
      .when('/customers/:id', {
        templateUrl: 'html/customers/show.html',
        controller: 'CustomerController'
      })
      .when('/events', {
        templateUrl: 'html/events.html',
        controller: 'EventsController'
      })
      .when('/analysis', {
        templateUrl: 'html/analysis.html',
        controller: 'AnalysisController'
      })
      .otherwise({
        redirectTo: '/'
      });
  }]);
});
