<cfoutput>
	#styleSheetLinkTag(sources="styles/files,styles/progress-slider,styles/form", head=true)#
</cfoutput>

<div class="content-panel margin-bottom">

	<!-- Navigation panel -->
	<div class="panel-navigation silver-gradient">
		<div class="panel-control align-center">
			<span class="button-group">
				<label for="contests-radio" class="button green-active">
					<input type="radio" name="reportradio" id="contests-radio" value="contests" checked>
					Contests
				</label>
				<label for="contestor-radio" class="button blue-active">
					<input type="radio" name="reportradio" id="contestor-radio" value="contestors">
					Contestors
				</label>
			</span>
		</div>
		<div class="panel-load-target scrollable graphselector" id="contests" style="height:409px">
			<div class="navigable">
				<ul class="files-list mini">
					<cfoutput query="contests">
						<li class="with-right-arrow grey-arrow">
							<a href="#URLFor(action="contestGraph", key=contests.id)#" class="contestlink open-on-panel-content">
								<b>#contests.name#</b>
							</a>
							<cfif isDefined("session.user") AND isStruct(session.user)>
								<div class="controls show-on-parent-hover">
									<span class="button-group compact children-tooltip mid-margin-right">
										#linkTo(text="Edit", controller="contests", action="edit", key=contests.id, class="button icon-gear tracked", title="")#
									</span>
								</div>
							</cfif>
						</li>
					</cfoutput>
				</ul>
			</div>
		</div>
		<div class="panel-load-target scrollable graphselector" id="contestors" style="height:409px">
			<div class="navigable">
				<ul class="files-list mini">
					<cfoutput query="contestors">
						<li class="with-right-arrow grey-arrow">
							<a href="#URLFor(action="contestorGraph", key=contestors.id)#" class="contestorlink open-on-panel-content">
								<b>#contestors.name#</b>
							</a>
						</li>
					</cfoutput>
				</ul>
			</div>
		</div>
	</div>

	<!-- Content panel -->
	<div class="panel-content linen" style="height:450px">
		<div class="panel-control align-right">
			<cfif isDefined("session.user") AND isStruct(session.user)>
				<cfoutput>
					#linkTo(text="New Contestion!", controller="contests", action="newContestion", class="newcontest button icon-cloud-upload margin-left")#
				</cfoutput>
			</cfif>
		</div>

		<div class="panel-load-target scrollable with-padding" style="height:310px">

			<p class="message icon-info-round white-gradient">Select a contest/contestor on the left to show the event stats</p>
		</div>
	</div>

</div>