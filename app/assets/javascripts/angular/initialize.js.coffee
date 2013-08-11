@entreprenology = angular.module 'entreprenology', ["ngResource"]

@entreprenology.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode(true)
  $routeProvider
    .when('/signup',            templateUrl: "signup")
    .when('/startups',          templateUrl: "startups/index", controller: "StartupsController")
    .when('/startups/:id/edit', templateUrl: "startups/edit",  controller: "StartupsController")
    .when('/interns',           templateUrl: "interns/index",  controller: "InternsController")
    .when('/interns/:id/edit',  templateUrl: "interns/edit",   controller: "InternsController")
    .otherwise(template: 'This page was not found')

@entreprenology.run ['$window','$templateCache', ($window, $templateCache) ->
  for name, templateFunction of $window.JST
    $templateCache.put(name, templateFunction())
]


# Startup
@entreprenology.factory 'Startup', ($resource) ->
  $resource "/api/startups.json", {index: {method: "GET"}}

@entreprenology.factory 'Startup', ($resource) ->
  $resource "/api/startups/startup_id/edit.json", {update: {method: "PUT"}}

# Intern
@entreprenology.factory 'Intern', ($resource) ->
  $resource "/api/interns.json", {index: {method: "GET"}}

@entreprenology.factory 'Intern', ($resource) ->
  $resource "/api/interns/intern_id/edit.json", {update: {method: "PUT"}}