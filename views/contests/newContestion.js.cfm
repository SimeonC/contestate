angular.module('newcontestwizard', ['wizard', 'ngResource']);

function NewContest($scope, $resource){
	$scope.contests = $resource("<cfoutput>#URLFor(controller="contests", action="newContestionAngular")#.json</cfoutput>").query({type: 'contests'}, function(contests){
		<cfif isDefined("params.contestid") AND params.contestid NEQ "">for(i = 0; i < contests.length; i++){
			if(contests[i].id == <cfoutput>#params.contestid#</cfoutput>){
				$scope.selectContest(contests[i]);
				return contests;
			}
		}</cfif>
		return contests;
	});
	
	$scope.newcontest = {};
	$scope.newcontestant = {'name': ""};
	
	$scope.selectedContest = null;
	$scope.selectedPlacing = 0;
	$scope.participants = [];
	$scope.placings = [];
	
	$scope.newContest = function(){
		$scope.activateOptionalStep('newcontest', 2);
		$scope.next();
	};
	
	$scope.toggleCheckbox = function(name){
		$scope.newcontest[name] = ($scope.newcontest[name] === 1)?0:1;
	};
	
	var creatingcontest = false;
	$scope.createContest = function(next){
		if(!next){
			$scope.deactivateOptionalStep('newcontest');
		}else if(!creatingcontest){
			creatingcontest = true;
			var ContestResource = $resource('<cfoutput>#URLFor(controller="contests", action="indexAngular")#</cfoutput>/:id');
			ContestResource.save($scope.newcontest, function(data){
				ContestResource.get({id: data.id}, function(contest){
					$scope.contests.push(contest);
					$scope.deactivateOptionalStep('newcontest');
					$scope.selectContest(contest);
					creatingcontest = false;
				});
			});
		}
	};
	
	$scope.selectContest = function(contest){
		$scope.selectedContest = contest;
		$scope.next();
	}
	
	$scope.checkSelectContest = function(next){
		return !next || $scope.selectedContest != null;
	}
	
	$scope.setupElements = function(){
		$scope.selectedPlacing = 0;
		$resource("<cfoutput>#URLFor(controller="contests", action="newContestionAngular")#.json</cfoutput>")
			.get({type: 'placings', contestid: $scope.selectedContest.id}, function(placingsData){
				$scope.participants = placingsData.participants;
				$scope.placings = placingsData.placings;
			});
	}
	
	$scope.addingparticipant = false;
	
	$scope.newParticipant = function(){
		if($scope.addingparticipant && $scope.newcontestant.name.length > 0){
			 $resource('<cfoutput>#URLFor(controller="contestors", action="indexAngular")#</cfoutput>').save({}, {'name': $scope.newcontestant.name}, function(data){
				if(data.success){
					$scope.participants.push(data.contestor);
					$scope.addingparticipant = false;
					$scope.newcontestant.name = "";
				}
			 });
		}else $scope.addingparticipant = true;
	};
	
	$scope.addToPlacing = function(personindex){
		if(!$scope.selectedContest.multiwin //if not multi win
			&& $scope.placings[$scope.selectedPlacing].placers.length > 0 //and the target already has a placement
			&& ($scope.placings.length - 1 == $scope.selectedPlacing && $scope.selectedContest.participants == 0)) return;//and we are NOT recording participants (all participants are scored at the last level - removed in controller if no participants)
		//Therefore if we are in multiwin or there are no placements or there are participants being recorded, add the person
		$scope.placings[$scope.selectedPlacing].placers.splice($scope.placings[$scope.selectedPlacing].placers.length, 0, $scope.participants[personindex]);
		$scope.participants[personindex].selected = true;
		$scope.participants[personindex].originalindex = personindex;
		if(!$scope.selectedContest.multiwin) $scope.selectedPlacing = Math.min($scope.placings.length - 1, $scope.selectedPlacing + 1);
	}
	
	$scope.selectPlacing = function(placingindex){
		if(!$scope.selectedContest.multiwin && $scope.placings[placingindex].placers.length > 0) return;//check for not multiwin and already have a placement, if participants basically this gets locked to the last empty or the participants score
		$scope.selectedPlacing = placingindex;
	}
	
	$scope.removePerson = function(placingindex, personindex){
		$scope.placings[placingindex].placers[personindex].selected = false;
		$scope.placings[placingindex].placers.splice(personindex, 1);
	}
	
	$scope.$on('wizardFinish', function(){
		$resource("<cfoutput>#URLFor(controller="contests", action="newContestionAngular")#.json</cfoutput>").save({placings: $scope.placings, contestid: $scope.selectedContest.id}, function(data){
			if(data) window.location = "<cfoutput>#URLFor(route="dashboard")#</cfoutput>";
		});
	});
}