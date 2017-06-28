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
	.state({
	    name: 'home',
            url: '/home?keywords',
	    views: {
                '': { templateUrl: 'home.html',
					  controller: 'searchCtrl'
					},
		'experiences': { component: 'experiences' }
	   },
	   resolve: {
					experiences: function(ExperienceService) {
						return ExperienceService.getAllExperiences();
					}
	    },
		reloadOnSearch: false
	})


	// Show Expereince PAGE  =================================
	.state({name: 'experience',
		url: '/experience/{experienceId}',
		component: 'experience',
		resolve: {
		  experience: function(ExperienceService, $stateParams) {
		    return ExperienceService.getPerson($stateParams.experienceId);
		  }
		}
	})

        // ABOUT PAGE  =================================
        .state({
	    name: 'about',
            url: '/about',
            templateUrl: 'about.html'
        })

	//Help PAGE  =================================
	.state(  {
	    name: 'help',
            url: '/help',
            templateUrl: 'help.html'
        })

	// Sign UP PAGE  =================================
	.state({
	    name: 'signup',
            url: '/signup',
            templateUrl: 'signup.html'
        });



})

// Experiences Service
// ========================================================
wallaweeApp.service('ExperienceService', function($http) {
	var service = {
		getAllExperiences: function() {
			console.log("getAllExperiences called.");
			return $http.get('/experiences', { cache: true }).then(function(resp) {
				return resp.data;
			});
		},

		getPerson: function(id) {
			console.log("getPerson Called"+id);
			return $http.get('/experience/'+id, { cache: true }).then(function(resp) {
				return resp.data;
			});
		}
	}
	return service;
});


// List Experiences Controller DEPRACATED
// ========================================================
wallaweeApp.controller('listExperience', function($http, $scope, $stateParams) {
   $scope.experience = null;

    $http({method: 'GET', url: '/experience/'+$stateParams.experienceId}).
        success(function(data, status, headers, config) {
			console.log(JSON.stringify(data));
            $scope.experience=data;
        }).error(function(data, status, headers, config) {
    });
});

// Expereiences Component
// ========================================================
wallaweeApp.component('experiences', {
  bindings: { experiences: '<' },

  templateUrl: 'experiences.html'
});


// An Expereience Component
// ========================================================
wallaweeApp.component('experience', {
  bindings: { experience: '<' },
  templateUrl: 'experience.html'

});


// our controller for the form
// =============================================================================
wallaweeApp.controller('searchCtrl', function($scope, $state, $stateParams) {

	console.log("Called controller!");

	// function to process the form
    $scope.submit = function() {

        console.log("Called submit!"+$scope.keywords);
        $scope.showKeywords = function() {
			return "Results: " + $scope.keywords;
		};
		$state.go('.', {keywords: $scope.keywords});
    };


    // function to process the form
    $scope.processSearchForm = function() {
        $scope.searchResponse = 'Search Results for: '+$scope.searchForm.keywords+".";
    };
});



