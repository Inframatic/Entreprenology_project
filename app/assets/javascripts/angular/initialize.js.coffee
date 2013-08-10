@entreprenology = angular.module 'entreprenology', ["ngResource"]

@entreprenology.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode(true)
  $routeProvider
    .when('/',                  templateUrl: "startups/index",   controller: "StartupsController")
    .when('/startups',          templateUrl: "startups/index",   controller: "StartupsController")
    # .when('/startups/new',      templateUrl: "startups/new",   controller: "StartupsController")
    # .when('/startups/:id',      templateUrl: "startups/show",  controller: "StartupsController")
    # .when('/startups/:id/edit', templateUrl: "startups/edit",  controller: "StartupsController")
    .otherwise(template: 'adsf')
    #.otherwise(redirect: '/')

@entreprenology.run ['$window','$templateCache', ($window, $templateCache) ->
  for name, templateFunction of $window.JST
    $templateCache.put(name, templateFunction())
]

@entreprenology.factory 'Startup', ($resource) ->
  $resource "/api/startups.json", {index: {method: "GET"}}
