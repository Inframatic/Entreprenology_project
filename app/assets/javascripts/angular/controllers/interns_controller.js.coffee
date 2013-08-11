@entreprenology.controller 'InternsController', ($scope, Intern, $location) ->
  $scope.interns = Intern.query ->
    $scope.hoveredIntern = $scope.interns[0]
  $scope.hovering = no

  $scope.showDetails = (intern) ->
    $scope.hoveredIntern = intern
    $scope.hovering = yes