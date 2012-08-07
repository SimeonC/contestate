<cfoutput>
angular.module('Contestors', ['ngResource'])
	.factory('ContestorResource', function($resource){
		var ContestorResource = $resource('#URLFor(controller="contestors", action="indexAngular")#/:id', {},
			{
				new: {method: 'POST'},
				save: {method: 'PUT'}
			}
		);
		
		ContestorResource.prototype.create = function(cb){
			return ContestorResource.new({}, this.data, cb);
		}
		
		ContestorResource.prototype.update = function(cb) {
			return ContestorResource.save({id: this.data.id}, this.data, cb);
		};
		
		ContestorResource.prototype.destroy = function(cb) {
			return ContestorResource.remove({id: this.data.id}, cb);
		};
		
		return ContestorResource;
	});
</cfoutput>

function Contestors($scope, ContestorResource){
	ContestorResource.query(function(array){
		for(i = 0; i < array.length; i++){
			array[i] = new ContestorResource({'data': array[i], 'master': angular.copy(array[i]), 'isClean': function(){return angular.equals(this.data, this.master)}, 'index': i});
		}
		$scope.contestors = array;
	});
	
	$scope.addNew = function(){
		$scope.contestors.push(new ContestorResource({"editing": true, "index": $scope.contestors.length}));
	};
	
	$scope.save = function(contestor){
		if (!!contestor.data.id){
			contestor.update(function(data){if(data.success) contestor.master = angular.copy(contestor.data);});
		}else{
			contestor.create(function(data){
				if(data.success){
					angular.extend($scope.contestors[contestor.index].data, data.contestor);
					$scope.contestors[contestor.index].master = angular.copy($scope.contestors[contestor.index].data);
					$scope.contestors[contestor.index].isClean = function(){return angular.equals(this.data, this.master)};
				}
			});
		}
	};
	
	$scope.delete = function(contestor){
		if(!confirm("Deleting this contestor will delete ALL related contest stats and is unreversable, continue?")) return;
		if(!!contestor.data.id)
			contestor.destroy(function(data){
				if(data.success) $scope.contestors.splice(contestor.index, 1);
			});
	};
}