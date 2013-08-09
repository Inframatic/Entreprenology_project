@entreprenology = angular.module 'entreprenology', ["ngResource"]

@entreprenology.factory "Startups", ($resource, apiPrefix) ->
	$resource(apiPrefix + "/startups", {index: {method: "GET"})

@entreprenology.config ($routeProvider, $locationProvider) ->
	$locationProvider.html5Mode(true)
	$routeProvider
	.when('/startups',          templateUrl: "startups/index", controller: "StartupsController")
	.otherwise(template: "Page not found.")

@entreprenology.run ['$window','$templateCache', ($window, $templateCache) ->
	for name, templateFunction of $window.JST
		$templateCache.put(name, templateFunction)
]
