<cfoutput>
	#styleSheetLinkTag(sources="styles/form", head=true)#
</cfoutput>

<div ng-app="newcontestwizard" ng-controller="NewContest">
	<wizard title="New Contest">
		<step title="Select Contest">
			<ul class="big-menu margin-bottom blue-gradient">
				<li ng-repeat="contest in contests" class="with-right-arrow">
					<a ng-click="selectContest(contest)">{{contest.name}}</a>
				</li>
			</ul>
		</step>
		<step title="Select Participants and Placings" navigationprev=true navigationfinish=true beforeenter="checkSelectContest" onbeforeshow="setupElements">
			<div class="columns">
				<div id="allcontestors" class="six-columns twelve-columns-mobile">
					<p ng-repeat="person in participants" ng-click="addToPlacing($index)" class="message align-center blue-gradient mid-margin-bottom" ng-hide="person.selected">
						<span class="block-arrow right"><span></span></span>
						{{person.name}}
					</p>
				</div>
				<div id="finalplacings" class="six-columns twelve-columns-mobile">
					<div ng-repeat="placing in placings" ng-click="selectPlacing($index)" class="message margin-bottom wrapped with-mid-padding align-center" ng-class="{'green-gradient': $index == selectedPlacing}">
						<span class="count blue-gradient right">{{placing.points}}</span>
						<p ng-repeat="person in placing.placers" class="message align-center blue-gradient mid-margin-bottom" ng-click="removePerson($parent.$index, $index)">
							<span class="block-arrow left"><span></span></span>
							{{person.name}}
						</p>
					</div>
				</div>
			</div>
		</step>
	</wizard>
</div>