require(['application'], function (application) {
  application.directive('select2', [
    function () {
      return {
        restrict: 'E',
        replace: true,
        template: '<select></select>',
        link: function ($scope, $elem, $attr) {
          $($elem).select2();
        }
      }
    }
  ]);
});
