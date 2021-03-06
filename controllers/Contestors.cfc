<cfcomponent extends="Controller">
	
	<cffunction name="index">
		<cfif StructKeyExists(params, "format") AND (params.format EQ "css" OR params.format EQ "js")>
			<cfreturn renderWith({})>
		</cfif>
		<cfscript>
			jsincludes = "angular/angular-1.0.1.min, angular/angular-resource-1.0.1.min, angular/angular.modules";
			title = "Contestors Management";
		</cfscript>
	</cffunction>
	
	<cffunction name="indexAngular">
		<cfscript>
			if(request.cgi.request_method EQ "POST" OR request.cgi.request_method EQ "PUT"){
				var req = toString(getHttpRequestData().content);	
				if (isJSON(req)){
					params.object = deserializeJSON(req);
				}
			}
			switch(request.cgi.request_method){
				case "POST"://create new
					var contestor = SESSION.user.createContestor(params.object);
					return renderWith({"errors": contestor.allErrors(), "success": !contestor.hasErrors(), "contestor": contestor.properties()});
					break;
				case "PUT"://update
					return renderWith({"success": SESSION.user.findOneContestor(where='id = #params.key#').update(params.object)});
				case "GET"://edit
					if(isDefined("params.key")){
						return renderWith(SESSION.user.findOneContestor(where='id = #params.key#').properties());
					}
					break;
				case "DELETE":
					return renderWith({"success": SESSION.user.deleteContestor(params.key)});
			}
			return renderWith(QueryToJSON(SESSION.user.contestors()));
		</cfscript>
	</cffunction>
	
</cfcomponent>