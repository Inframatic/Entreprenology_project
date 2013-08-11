@entreprenology = angular.module 'entreprenology', ["ngResource"]

@entreprenology.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode(true)
  $routeProvider
    .when('/signup',            templateUrl: "signup")
    .when('/startups',          templateUrl: "startups/index", controller: "StartupsController")
    .when('/startups/new',      templateUrl: "startups/new",   controller: "StartupsController")
    .otherwise(template: "This page was'nt found")

@entreprenology.run ['$window','$templateCache', ($window, $templateCache) ->
  for name, templateFunction of $window.JST
    $templateCache.put(name, templateFunction())
]


@entreprenology.factory 'Startup', ($resource) ->
  $resource "/api/startups.json", {index: {method: "GET"}}

@entreprenology.factory 'Startup', ($resource) ->
  $resource "/api/startups/new.json", {new: {method: "GET"}}