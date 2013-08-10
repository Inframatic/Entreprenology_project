@entreprenology = angular.module 'entreprenology', ["ngResource"]

@entreprenology.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode(true)
  $routeProvider
    .when('/startups',          templateUrl: "startups/index",   controller: "StartupsController")
    .when('/startups/:id/edit',      templateUrl: "startups/edit",  controller: "StartupsController")
    .when('/interns',      templateUrl: "interns/index",   controller: "InternsController")
    .when('/interns/:id/edit', templateUrl: "interns/edit",  controller: "InternsController")
    .otherwise(redirect: '/')

@entreprenology.run ['$window','$templateCache', ($window, $templateCache) ->
  for name, templateFunction of $window.JST
    $templateCache.put(name, templateFunction())
]


# Startup
@entreprenology.factory 'Startup', ($resource) ->
  $resource "/api/startups.json", {index: {method: "GET"}}

@entreprenology.factory 'Startup', ($resource) ->
  $resource "/api/startups.json", {update: {method: "PUT"}}

# Intern
@entreprenology.factory 'Intern', ($resource) ->
  $resource "/api/interns.json", {index: {method: "GET"}}

@entreprenology.factory 'Intern', ($resource) ->
  $resource "/api/interns.json", {update: {method: "PUT"}}