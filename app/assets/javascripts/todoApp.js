var app = angular.module('ToDoApp', ['ngDialog']);

app.controller('MainCtrl', function ($scope, ngDialog) {
    $scope.clickToOpen = function () {
        ngDialog.open({ template: 'main/index.html' });
    };
});
