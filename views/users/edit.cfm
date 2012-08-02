<cfoutput>
	#styleSheetLinkTag(sources="styles/form,styles/switches", head=true)#
</cfoutput>
<div ng-app="profile">
	<fieldset class="fieldset fields-list" ng-controller="passChange">
		
		<legend class="legend">Password Change</legend>
		
		<div class="field-block button-height">
			<small class="input-info">Enter your current password</small>
			<label for="password" class="label"><b>Current Password</b></label>
			<input type="password" name="password" ng-model="current" class="input" required="required">
		</div>
		
		<div class="field-block button-height">
			<small class="input-info">Enter your new password twice to change it</small>
			<label for="password" class="label"><b>New Password</b></label>
			<ul class="inputs" style="width: 169px;">
				<li><input type="password" class="input-unstyled" ng-model="password" required="required"></li>
				<li><input type="password" class="input-unstyled" ng-model="confirm" required="required"></li>
			</ul>
		</div>
		
		<div class="field-block button-height">
			<button type="submit" class="button glossy mid-margin-right" ng-click="save()" ng-disabled="current == '' || password != confirm || password == ''">
				<span class="button-icon"><span class="icon-tick"></span></span>
				Save
			</button>
			
			<button type="submit" class="button glossy" ng-click="reset()">
				<span class="button-icon red-gradient"><span class="icon-cross-round"></span></span>
				Cancel
			</button>
		</div>
	</fieldset>
	<fieldset class="fieldset fields-list" ng-controller="profileEdit">
		
		<legend class="legend">Profile Details</legend>
		
		<div class="field-block button-height">
			<small class="input-info">This is the email address we will use if you forget your password or for important updates</small>
			<label for="email" class="label"><b>Email</b></label>
			<input type="text" name="email" id="email" ng-model="email" class="input" required="required">
		</div>
		
		<div class="field-block button-height">
			<small class="input-info">This is the optional title that shows at the top of the page.</small>
			<label for="pagename" class="label"><b>Page Name</b></label>
			<input type="text" name="pagename" id="pagename" ng-model="pagename" class="input">
		</div>
		
		<div class="field-block button-height">
			<small class="input-info">Your profile is now accessable @ <cfoutput>#LinkTo(controller=SESSION.user.username, onlyPath=false, "ng-show"="profiletype")##LinkTo(controller=SESSION.user.encryptUsername(), onlyPath=false, "ng-show"="!profiletype")#</cfoutput></small>
			<label for="profiletype" class="label"><b>Public Profile</b></label>
			<input id="profiletype" type="checkbox" class="switch wider green-active" data-checkable-options='{"textOn":"PUBLIC","textOff":"PRIVATE"}'>
		</div>
		
		<div class="field-block button-height">
			<button type="submit" class="button glossy mid-margin-right" ng-click="save()">
				<span class="button-icon"><span class="icon-tick"></span></span>
				Save
			</button>
			
			<button type="submit" class="button glossy" ng-click="reset()">
				<span class="button-icon red-gradient"><span class="icon-cross-round"></span></span>
				Cancel
			</button>
		</div>
	
	</fieldset>
</div>