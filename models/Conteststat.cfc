<cfcomponent extends="Model">
	
	<cffunction name="init">
		<cfscript>
			belongsTo("contest");
			belongsTo("contestor");
			
			beforeValidation("lasteventUpdate");
		</cfscript>
	</cffunction>
	
	<cffunction name="lasteventUpdate">
		<cfscript>
			this.lastevent = now();
		</cfscript>
	</cffunction>
	
</cfcomponent>