var app = angular.module("Tasks", []);

app.controller("TasksControl", function($scope, $http) {
  $http.get('/todos').
    success(function(data, status, headers, config) {
      console.log(data);
      $scope.tasks = data;
    }).
    error(function(data, status, headers, config) {
      // log error
    });
});
