<div class="table-header" style="line-height: 28px;">
	<b>Contests List</b>
	<a ng-click="new()" class="button float-right">
		<span class="button-icon green-gradient glossy"><span class="icon-plus-round"></span></span>
		Create New
	</a>
</div>
<table class="table">
	<thead>
		<tr>
			<th scope="col">Name</th>
			<th scope="col">Plays</th>
			<th scope="col"></th>
		</tr>
	</thead>
	<tbody>
		<tr ng-repeat="contest in contests">
			<td scope="row">{{contest.name}}</td>
			<td>{{contest.gamescount}}</td>
			<td><a href="#/edit/{{contest.id}}" class="button float-right">Edit</a></td>
		</tr>
	</tbody>
</table>