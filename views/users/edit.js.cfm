<cfoutput>
angular.module('profile', ['ngResource','validators'])
	.factory('Profile', function($resource){
		return $resource('#URLFor(controller="users", action="angular")#', {},
			{
				password: {method: 'PUT'},
				update: {method: 'POST'}
			}
		);
	});

function profileEdit($scope, $resource, Profile){
	var callChange = true;
	var defaults = {
		profiletype: #(SESSION.user.profiletypeid == 1)#,
		pagename: '#SESSION.user.pagename#',
		email: '#SESSION.user.email#'
	};
</cfoutput>
	$scope.reset = function(){
		angular.extend($scope, defaults);
		callChange = false;
		$("#profiletype").prop("checked", $scope.profiletype).change();
	};
	
	$scope.save = function(){
		$("[ng-controller='ProfileEdit']").clearMessages('', true);
		$("[ng-controller='ProfileEdit']").message('Sending Data', {arrow: 'bottom', classes: ['blue-gradient'], stripes: true, closable: false, append: false});
		Profile.update({'profiletype': $scope.profiletype, 'pagename': $scope.pagename, 'email': $scope.email}, function(data){
			$("[ng-controller='ProfileEdit']").clearMessages('', true);
			if(data.success){
				angular.extend(defaults, {'profiletype': $scope.profiletype, 'pagename': $scope.pagename, 'email': $scope.email});
				$("[ng-controller='passChange']").message('Your password has been changed!', {arrow: 'bottom', classes: ['green-gradient'], append: false});
			}else $("[ng-controller='passChange']").message(message, {arrow: 'bottom', classes: ['red-gradient'], append: false});
		});
	};
	
	$("#profiletype").change(function(){
		if(callChange) $scope.$apply("profiletype = " + $(this).is(":checked"));
		callChange = true;
	});
	$scope.reset();
}

function passChange($scope, $resource, Profile){
	$scope.reset = function(){
		$scope.current = '';
		$scope.password = '';
		$scope.confirm = '';
	};
	
	$scope.save = function(){
		$("[ng-controller='passChange']").clearMessages('', true);
		$("[ng-controller='passChange']").message('Sending Data', {arrow: 'bottom', classes: ['blue-gradient'], stripes: true, closable: false, append: false});
		Profile.password({'current': $scope.current, 'password': $scope.password, 'confirm': $scope.confirm}, function(data){
			$("[ng-controller='passChange']").clearMessages('', true);
			var message = '';
			if(data.success){
				$("[ng-controller='passChange']").message('Your password has been changed!', {arrow: 'bottom', classes: ['green-gradient'], append: false});
				$scope.reset();
				return;
			}else if(!data.old){
				message = 'Incorrect Password';
			}else if(!data.matchlength){
				message = 'Password Must Be at least 6 characters';
			}else if(!data.matches){
				message = 'Passwords Do not match';
			}else{
				message = 'An Error occurred saving the data';
			}
			$("[ng-controller='passChange']").message(message, {arrow: 'bottom', classes: ['red-gradient'], append: false});
			$scope.reset();
		});
	};
	$scope.reset();
}