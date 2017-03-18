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
            controller: 'formController'
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
wallaweeApp.controller('formController', function($scope) {

    // we will store all of our form data in this object
    $scope.formData = {};

    // function to process the form
    $scope.processForm = function() {
        alert('awesome! Thanks'+$scope.formData.name);
    };

});


