@entreprenology = angular.module 'entreprenology', ["ngResource"]

@entreprenology.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode(true)
  $routeProvider
    .when('/signup',            template: JST['signup'])
    .when('/startups',          template: JST["startups/index"], controller: "StartupsController")
    .when('/startups/new',      template: JST["startups/new"],   controller: "StartupsController")
    .when('/startups/:id/edit', template: JST["startups/edit"],  controller: "StartupsController")
    .when('/interns',           template: JST["interns/index"],  controller: "InternsController")
    .when('/interns/:id/edit',  template: JST["interns/edit"],   controller: "InternsController")
    .otherwise(template: 'This page was not found')

# @entreprenology.run ['$window','$templateCache', ($window, $templateCache) ->
#   for name, templateFunction of $window.JST
#     $templateCache.put(name, templateFunction()
#     )
# ]
# /keep this and review later!

# Startup
@entreprenology.factory 'Startup', ($resource) ->
  $resource "/api/startups.json", {index: {method: "GET"}}

@entreprenology.factory 'Startup', ($resource) ->
  $resource "/api/startups/startup_id/edit.json", {update: {method: "PUT"}}

@entreprenology.factory 'Startup', ($resource) ->
  $resource "/api/startups/new.json", {new: {method: "GET"}}


# Intern
@entreprenology.factory 'Intern', ($resource) ->
  $resource "/api/interns.json", {index: {method: "GET"}}
  
@entreprenology.factory 'Intern', ($resource) ->
  $resource "/api/interns/intern_id/edit.json", {update: {method: "PUT"}}

@entreprenology.factory 'Intern', ($resource) ->
  $resource "/api/interns/new.json", {new: {method: "GET"}}
