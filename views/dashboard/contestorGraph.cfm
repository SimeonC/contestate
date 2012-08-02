<p class="message white-gradient"><cfoutput>#stats.name# <span class="count right">#stats.gamescount#</span></cfoutput></p>
<div class="wrapped relative with-mid-padding" style="padding-bottom: 0;">
	<cfoutput query="stats">
		<div class="left-column-200px<cfif stats.currentRow NEQ stats.recordcount> margin-bottom</cfif>">
		
			<div class="left-column">
				#stats.contestname#
			</div>
		
			<div class="right-column">
				<span class="progress" style="width: 100%">
					
					<!-- Inner marks -->
					<span class="inner-mark" style="left: 25%"></span>
					<span class="inner-mark" style="left: 50%"></span>
					<span class="inner-mark" style="left: 75%"></span>
					<cfset percentage = Int(stats.points / stats.maxPoints * 100)>
					<!-- Background-text, revealed when progress bar is too small -->
					<span class="progress-text">#stats.points#</span>
					
					<!-- Progress bar with foreground text -->
					<cfif percentage GT 0>
						<span class="progress-bar" style="width: #percentage#%">
							<span class="progress-text">#stats.points#</span>
						</span>
					</cfif>
				</span>
			</div>
		
		</div>
	</cfoutput>
</div>