/*
 * This is a JS app for page routing and templating.
 *
 * */

var wallaweeApp = angular.module('wallaweeApp', ['ui.router']);

wallaweeApp.config(function($stateProvider, $urlRouterProvider) {

    $urlRouterProvider.otherwise('/home');

    $stateProvider

        // HOME STATES AND NESTED VIEWS ========================================
	.state('home', {
            url: '/home',
            views: {
                '': { templateUrl: 'home.html' },
		'experiences' : { templateUrl: 'experiences.html' }
                }
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

});



