var app = angular.module("Tasks", []);

app.controller("TasksControl", function($scope, $http) {
  $http.get('data/tasks.json').
    success(function(data, status, headers, config) {
      $scope.tasks = data;
      console.log(data)
    }).
    error(function(data, status, headers, config) {
      // log error
    });
});
