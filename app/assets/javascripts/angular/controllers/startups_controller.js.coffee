@entreprenology.controller 'StartupsController', ($scope, Startup, $location) ->
  $scope.startups = Startup.query ->
    $scope.hoveredStartup = $scope.startups[0]
  $scope.hovering = no

  $scope.showDetails = (startup) ->
    $scope.hoveredStartup = startup
    $scope.hovering = yes
