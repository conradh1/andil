/*
 * This is a JS app for page routing and templating.
 *
 * */

//angular.module('wallaweeApp', ['ui.bootstrap']);
var wallaweeApp = angular.module('wallaweeApp', ['ui.router', 'ui.bootstrap']);

wallaweeApp.config(function($stateProvider, $urlRouterProvider) {

    $urlRouterProvider.otherwise('/home');

    $stateProvider

        // HOME STATES AND NESTED VIEWS ========================================
	.state('home', {
            url: '/home',
            views: {
                '': { templateUrl: 'home.html' },
		'experiences' : { templateUrl: 'experiences.html' }
                   },
            controller: 'searchFormCtrl'
        })

        // ABOUT PAGE  =================================
        .state('about', {
            url: '/about',
            templateUrl: 'about.html'
        })

	//Help PAGE  =================================
	.state('help', {
            url: '/help',
            templateUrl: 'help.html'
        })

	// Sign UP PAGE  =================================
	.state('signup', {
            url: '/signup',
            templateUrl: 'signup.html'
        });

})

// our controller for the form
// =============================================================================
wallaweeApp.controller('searchFormCtrl', function($scope) {
    $scope.searchForm = {};
    $scope.searchResponse = '';
    $scope.showKeywords = function() {
        return "Results: " + $scope.searchForm.keywords;
    };

    // function to process the form
    $scope.processSearchForm = function() {
        $scope.searchResponse = 'Results for: '+$scope.searchForm.keywords+".";
    };
});



