@entreprenology.controller 'StartupController', ($scope, Startup, $routeParams, $location) ->
  $scope.id = $routeParams.id
  $scope.startup = Startup.get id: $routeParams.id

  $scope.updatePStartup = ->
    $scope.startup.$update onStartupSave, onError

  onStartupSave = ->
    $location.path('/startups')

  onError = ->
    alert("Could not update startup.")