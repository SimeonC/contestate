<form name="contestForm">
	<h3 class="block-title">Contest Edit</h3>
	<div class="with-padding">
		<div class="field-block button-height">
			<small class="input-info">Enter the name of the contest</small>
			<label for="name" class="label"><b>Name</b></label>
			<input type="text" name="name" id="name" ng-model="contest.name" class="input full-width">
		</div>
		
		<div class="field-block button-height">
			<small class="input-info">Enter the points awarded for each placing, starting with first</small>
			<label for="points4win" class="label"><b>Points</b></label>
			<input type="text" name="points4win" id="points4win" ng-model="contest.points4win" class="input full-width">
		</div>
		
		<div class="field-block button-height">
			<small class="input-info">Allow multiple people to get each point</small>
			<label for="multiwin" class="label"><b>Multiwin</b></label>
			<span class="checkbox replacement" ng-click="toggleCheckbox('multiwin')" ng-class="{checked: contest.multiwin}" tabindex="0">
				<span class="check-knob"></span>
				<input type="checkbox" name="multiwin" ng-model="contest.multiwin" ng-true-value="1" ng-false-value="0" tabindex="-1">
			</span>
		</div>
		
		<div class="field-block button-height">
			<small class="input-info">Record contestants that did not place</small>
			<label for="participants" class="label"><b>Participants</b></label>
			<span class="checkbox replacement" ng-click="toggleCheckbox('participants')" ng-class="{checked: contest.participants}" tabindex="0">
				<span class="check-knob"></span>
				<input type="checkbox" name="participants" ng-model="contest.participants" ng-true-value="1" ng-false-value="0" tabindex="-1">
			</span>
		</div>
		
		<div class="field-block button-height">
			<button type="submit" class="button glossy mid-margin-right" ng-click="save()"  ng-disabled="isClean() || contestForm.$invalid">
				<span class="button-icon"><span class="icon-tick"></span></span>
				Save
			</button>
			<a href="#/" class="button glossy">
				<span class="button-icon red-gradient"><span class="icon-cross-round"></span></span>
				Cancel
			</a>
		</div>
	</div>
</form>