var app = angular.module("Todos", []);
console.log("ANG.JS is running")
app.controller("TodosControl", function($scope, $http) {
  $http.get('/todos.json').success(function(data, status, headers, config) {
      console.log(data, "DATTAA");
      $scope.todos = data;
    }).error(function(data, status, headers, config) {
      // log error
    });
});
