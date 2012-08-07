<cfoutput>
	#styleSheetLinkTag(sources="styles/form", head=true)#
</cfoutput>

<div ng-app="newcontestwizard" ng-controller="NewContest">
	<wizard title="New Contest">
		<step title="Select Contest">
			<button ng-click="newContest()" class="button"><span class="button-icon green-gradient glossy"><span class="icon-plus-round"></span></span>New Contest</button>
			<ul class="big-menu margin-bottom blue-gradient">
				<li ng-repeat="contest in contests" class="with-right-arrow">
					<a ng-click="selectContest(contest)">{{contest.name}}</a>
				</li>
			</ul>
		</step>
		<step title="New Contest Details" optionalstep='newcontest' disablenext="contestForm.$invalid" navigationprev=true navigationnext=true beforeleave="createContest">
			<form name="contestForm">
				<div class="field-block button-height">
					<small class="input-info">Enter the name of the contest</small>
					<label for="name" class="label"><b>Name</b></label>
					<input type="text" name="name" id="name" ng-model="newcontest.name" class="input full-width" required="required">
				</div>
				
				<div class="field-block button-height">
					<small class="input-info">Enter the points awarded for each placing, starting with first</small>
					<label for="points4win" class="label"><b>Points</b></label>
					<input type="text" name="points4win" id="points4win" ng-model="newcontest.points4win" class="input full-width" required="required">
				</div>
				
				<div class="field-block button-height">
					<small class="input-info">Allow multiple people to get each point</small>
					<label for="multiwin" class="label"><b>Multiwin</b></label>
					<span class="checkbox replacement" ng-click="toggleCheckbox('multiwin')" ng-class="{checked: newcontest.multiwin}" tabindex="0">
						<span class="check-knob"></span>
						<input type="checkbox" name="multiwin" ng-model="newcontest.multiwin" ng-true-value="1" ng-false-value="0" tabindex="-1">
					</span>
				</div>
				
				<div class="field-block button-height">
					<small class="input-info">Record contestants that did not place</small>
					<label for="participants" class="label"><b>Participants</b></label>
					<span class="checkbox replacement" ng-click="toggleCheckbox('participants')" ng-class="{checked: newcontest.participants}" tabindex="0">
						<span class="check-knob"></span>
						<input type="checkbox" name="participants" ng-model="newcontest.participants" ng-true-value="1" ng-false-value="0" tabindex="-1">
					</span>
				</div>
			</form>
		</step>
		<step title="Select Participants and Placings" navigationprev=true navigationfinish=true beforeenter="checkSelectContest" onbeforeshow="setupElements">
			<div class="columns">
				<div id="allcontestors" class="six-columns twelve-columns-mobile">
					<div ng-show="addingparticipant"><input placeholder="Enter the new contestors name" ng-model="newcontestant.name" type="text" class="input full-width"></div><button ng-click="newParticipant()" class="button"><span class="button-icon green-gradient glossy"><span class="icon-plus-round"></span></span><span ng-show="addingparticipant">Save</span><span ng-hide="addingparticipant">New Contestor</span></button>
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