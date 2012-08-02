<cfcomponent extends="Controller">
	
	<!--- view functions --->
	
	<cffunction name="edit">
		<cfif StructKeyExists(params, "format") AND (params.format EQ "css" OR params.format EQ "js")>
			<cfreturn renderWith({})>
		</cfif>
		<cfscript>
			jsincludes = "angular/angular-1.0.1.min, angular/angular-resource-1.0.1.min, angular/angular.modules, developr.input, developr.message, developr.notify";
			title="Profile";
		</cfscript>
	</cffunction>
	
	<!--- action functions --->
	
	<cffunction name="angular">
		<cfscript>
			if(request.cgi.request_method EQ "POST" OR request.cgi.request_method EQ "PUT"){
				var req = toString(getHttpRequestData().content);	
				if (isJSON(req)){
					params.object = deserializeJSON(req);
				}
			}
			switch(request.cgi.request_method){
				case "POST"://create new
					SESSION.user.update(profiletypeid = (params.object.profiletype)?1:0, pagename = params.object.pagename, email = params.object.pagename);
					return renderWith({"errors": SESSION.user.allErrors(), "success": SESSION.user.hasErrors()});
				case "PUT"://update
					if(SESSION.user.encryptPassword(params.object.current) NEQ SESSION.user.password) return renderWith({"success": false, "old": false});
					if(LEN(params.object.password) < 6) return renderWith({"success": false, "old": true, "matchlength": false});
					if(params.object.password != params.object.confirm || LEN(params.object.password) < 6) return renderWith({"success": false, "matches": false, "old": true, "matchlength": true});
					return renderWith({"success": SESSION.user.update(password = SESSION.user.encryptPassword(params.object.password))});
			}
		</cfscript>
	</cffunction>
</cfcomponent>