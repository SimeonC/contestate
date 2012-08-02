<cfoutput>
angular.module('Contests', ['ngResource'])
	.config(function($routeProvider) {
		$routeProvider.
			when('/', {controller:ListCtrl, templateUrl:'#URLFor(controller="contests", action="list")#'}).
			when('/edit/:contestID', {controller:EditCtrl, templateUrl:'#URLFor(controller="contests", action="details")#'}).
			when('/new', {controller:CreateCtrl, templateUrl:'#URLFor(controller="contests", action="details")#'}).
			otherwise({redirectTo:'/'});
	})
	.factory('Contest', function($resource){
		var Contest = $resource('#URLFor(controller="contests", action="indexAngular")#/:id', {},
			{
				update: {method: 'PUT'}
			}
		);
		
		Contest.prototype.update = function(cb) {
			return Contest.save({id: this.id}, cb);
		};
		
		Contest.prototype.destroy = function(cb) {
			return Contest.remove({id: this.id}, cb);
		};
		
		return Contest;
	});
</cfoutput>

function ListCtrl($scope, $location, Contest) {
	$scope.contests = Contest.query();
	
	$scope.new = function(){
		$location.path('/new');
	}
}

function CreateCtrl($scope, $location, Contest) {
	$scope.save = function() {
		Contest.save($scope.contest, function(contest) {
			$location.path('/edit/' + contest.id);
		});
	};
	
	$scope.toggleCheckbox = function(name){
		$scope.contest[name] = ($scope.contest[name] === 1)?0:1;
	};
	
	$scope.cancel = function() {
		$location.path('/');
	};
}


function EditCtrl($scope, $location, $routeParams, Contest) {
	var self = this;
	
	Contest.get({id: $routeParams.contestID}, function(contest) {
		self.original = contest;
		$scope.contest = new Contest(contest);
	});
	
	$scope.toggleCheckbox = function(name){
		$scope.contest[name] = ($scope.contest[name] === 1)?0:1;
	};
	
	$scope.isClean = function() {
		return angular.equals(self.original, $scope.contest);
	};
	
	$scope.cancel = function() {
		$location.path('/');
	};
	
	$scope.save = function() {
		$scope.contest.update(function() {
			$location.path('/');
		});
	};
}