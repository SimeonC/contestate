<cfoutput>
	#styleSheetLinkTag(sources="styles/form,styles/table", head=true)#
</cfoutput>
<div class="block" ng-app="Contestors" ng-controller="Contestors">
	<table class="simple-table">
		<thead>
			<tr>
				<th scope="col">Name</th>
				<th scope="col" class="align-right">
					<a ng-click="addNew()" class="button float-right">
						<span class="button-icon green-gradient glossy"><span class="icon-plus-round"></span></span>
						Create New
					</a>
				</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="4">Edit the contestors names as above</td>
			</tr>
		</tfoot>
	
		<tbody>
			<tr ng-repeat="contestor in contestors">
				<td><input ng-model="contestor.data.name" type="text" class="input-unstyled full-width"></td>
				<td class="align-right low-padding">
					<a ng-show="!contestor.isClean()" href="#" ng-click="save(contestor)" class="button compact"><span class="button-icon green-gradient"><span class="icon-tick"></span></span>Save</a>
					<a href="#" ng-click="delete(contestor)" class="button compact"><span class="button-icon red-gradient"><span class="icon-cross-round"></span></span>Delete</a>
				</td>
			</tr>
		</tbody>
	
	</table>
</div>