var app = angular.module("Todos", []),
		latitude,
		longitude,
		//private key but not associated with a card
		key = '9e1e16d4146962d495579322b5e63015';
		// app = angular.module("WeatherApp" , []);

////////////      TODO CONTROLLER     ////////////////////
app.controller("TodosController", function($scope, $http) {
  $http.get('/todos.json').success(function(data, status, headers, config) {
      console.log(data, "DATTAA");
      $scope.todos = data;
    }).error(function(data, status, headers, config) {
      // log error
    });
});

///////////////    WEATHER CONTROLLER    ////////////////
app.controller('WeatherController', ['$http', '$timeout',
function ($http, $timeout) {
	var controller = this;

	$.getJSON('http://www.telize.com/geoip?callback=?', function(json) {
		console.log("RUNNING lat and lon")
		latitude = json.latitude
		longitude = json.longitude
	}).success(function () {
		$http.get('http://api.openweathermap.org/data/2.5/weather?lat=' + latitude + '&lon=' + longitude + '&APPID=' + key).success(function (data) {
			console.log(data)
			var k = data.main.temp
			var f = Math.floor(1.8*(k - 273) + 32)

			//description will be a string => "partly cloudy"
			controller.description = data.weather[0].description
			// will be an integer => 55
			controller.temp = f
			//will be the users location(ish) as a string => "Long Island City"
			controller.location = data.name
			console.log(controller.temp)
			//weather icon
			controller.icon = data.weather[0].icon
		});	
	});
}]);


