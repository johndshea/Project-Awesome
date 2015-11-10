var app = angular.module("Todos", []);

app.controller("TodosControl", function($scope, $http) {
  $http.get('/todos.json').success(function(data, status, headers, config) {
      console.log(data);
      $scope.todos = data;
    }).
    error(function(data, status, headers, config) {
      // log error
    });
});
