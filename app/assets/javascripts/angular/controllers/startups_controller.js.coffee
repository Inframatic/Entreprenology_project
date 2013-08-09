@entreprenology.controller 'StartupsController', ($scope, Startup, $location) ->

$scope.startups = Startup.query()
$scope.hoveredStartup
$scope.hovering = false

$scope.showDetails = (startup) ->
  $scope.hoveredStartup = startup
  $scope.hovering = true