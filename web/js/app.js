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
            url: '/home',
	    views: {
                '': { templateUrl: 'home.html',
		      controller: 'searchFormCtrl'
		    },
		'experiences': { component: 'experiences' }
	   },
	   resolve: {
	      experiences: function(ExperienceService) {
		return ExperienceService.getAllExperiences();
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
      return $http.get('data/experiences.json', { cache: true }).then(function(resp) {
        return resp.data;
      });
    },

    getPerson: function(id) {
      function experienceMatchesParam(experience) {
        return experience.id === id;
      }

      return service.getAllExperiences().then(function (experiences) {
        return experiences.find(experienceMatchesParam)
      });
    }
  }

  return service;
});


wallaweeApp.component('experiences', {
  bindings: { experiences: '<' },

  templateUrl: 'experiences.html'
});


// List Experiences Controller
// ========================================================

wallaweeApp.controller('listExperiences', function($scope, $http) {
  //$scope.experiences = [{ name: 'Alice' }, { name: 'Bob' }];
   $scope.experience = null;
    $http({method: 'GET', url: 'data/experiences.json'}).
        success(function(data, status, headers, config) {
            $scope.experiences=data;
        }).error(function(data, status, headers, config) {
    });
});


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
        $scope.searchResponse = 'Search Results for: '+$scope.searchForm.keywords+".";
    };
});


