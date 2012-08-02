angular.module('wizard', []).
	directive('wizard', function() {
		return {
			restrict: 'E',
			transclude: true,
			controller: function($scope, $element) {
				var steps = $scope.steps = [];
				var currentIndex = 0;
				
				$scope.select = function(index) {
					//make sure not outside the number of steps
					index = Math.min(Math.max(0, index), $scope.steps.length);
					
					//check transition functions, passing in whether we are going forward (next)
					if(!$scope.steps[currentIndex].beforeleave(index > currentIndex) || !$scope.steps[index].beforeenter(index > currentIndex)) return false;
					if($scope.steps[currentIndex].onbeforehide) $scope.steps[currentIndex].onbeforehide();
					//all after set inactive
					for(var i = currentIndex; i > index; i--){
						$scope.steps[i].class = "";
						$scope.steps[i].selected = false;
					}
					//all before set completed
					for(var i = currentIndex; i < index; i++){
						$scope.steps[i].class = "completed";
						$scope.steps[i].selected = false;
					}
					if($scope.steps[currentIndex].onhide) $scope.steps[currentIndex].onhide();
					$scope.steps[index].selected = true;
					$scope.steps[index].class = "active";
					if($scope.steps[index].onbeforeshow) $scope.steps[index].onbeforeshow();
					currentIndex = index;
					if($scope.steps[index].onshow) $scope.steps[index].onshow();
				}
				
				this.addStep = function(step) {
					$scope.steps.push(step);
					if ($scope.steps.length == 1) $scope.select(0);
				}
				
				$scope.next = this.next = function(){
					$scope.select(currentIndex + 1);
				}
				
				$scope.prev = this.prev = function(){
					$scope.select(currentIndex - 1);
				}
				
				$scope.finish = this.finish = function(){
					$scope.$emit('wizardFinish', {});
				}
			},
			template:
				'<form method="post" action="" class="block margin-bottom wizard-enabled same-height" ng-app="newcontestwizard">' +
					'<h3 class="block-title">New Contest!</h3>' +
					'<ul class="wizard-steps">' +
						'<li ng-repeat="step in steps" ng-class="step.class" ng-click="select($index)"><span class="wizard-step">{{$index + 1}}</span> {{step.title}}</li>' +
					'</ul>' + 
					'<div ng-transclude></div>' +
				'</form>',
			replace: true
		};
	}).
directive('step', function() {
	return {
		require: '^wizard',
		restrict: 'E',
		transclude: true,
		scope: {
			title: '@'
		},
		link: function(scope, element, attrs, wizCtrl) {
			//set defaults
			scope.selected = false;
			scope.navigationprev = scope.$parent.$eval(attrs.navigationprev) || false;
			scope.navigationnext = scope.$parent.$eval(attrs.navigationnext) || false;
			scope.navigationfinish = scope.$parent.$eval(attrs.navigationfinish) || false;
			scope.onshow = scope.$parent.$eval(attrs.onshow) || function(){return true;};
			scope.onhide = scope.$parent.$eval(attrs.onhide) || function(){return true;};
			scope.onbeforeshow = scope.$parent.$eval(attrs.onbeforeshow) || function(){return true;};
			scope.onbeforehide = scope.$parent.$eval(attrs.onbeforehide) || function(){return true;};
			scope.beforeleave = scope.$parent.$eval(attrs.beforeleave) || function(){return true;};
			scope.beforeenter = scope.$parent.$eval(attrs.beforeenter) || function(){return true;};
			//add to the wizard
			wizCtrl.addStep(scope);
			
			scope.next = wizCtrl.next;
			scope.prev = wizCtrl.prev;
			scope.finish = wizCtrl.finish;
		},
		template:
			'<fieldset class="wizard-fieldset fields-list" ng-class="{active: selected}">' +
				'<div class="field-block button-height" ng-transclude>' +
				'</div>' +
				'<div class="field-block button-height wizard-controls clearfix">' +
					'<button type="button" class="button glossy mid-margin-right wizard-previous float-left" ng-show="navigationprev" ng-click="prev()"><span class="button-icon anthracite-gradient"><span class="icon-backward"></span></span>Back</button>' +
					'<button type="button" class="button glossy mid-margin-right wizard-next float-right" ng-show="navigationnext" ng-click="next()">Next<span class="button-icon right-side"><span class="icon-forward"></span></span></button>' +
					'<button type="submit" class="button glossy mid-margin-right float-right" ng-show="navigationfinish" ng-click="finish()">Finish<span class="button-icon right-side green-gradient glossy"><span class="icon-tick"></span></span></button>' +
				'</div>' +
			'</fieldset>',
		replace: true
	};
});

angular.module('validators', []).
	directive('matches', function() {
		return {
			require: 'ng-model',
			scope: {
				matches: '='
			},
			link: function(scope, elm, attrs, ctrl){
				ctrl.$parsers.unshift(function(viewValue) {
					if(scope.matches === viewValue){
						ctrl.$setValidity('matches', true);
						return viewValue;
					}else{
						ctrl.$setValidity('matches', false);
						return undefined;
					}
				});
			}
		};
	});
