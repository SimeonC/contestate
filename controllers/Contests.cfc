<cfcomponent extends="Controller">
	
	<cffunction name="init">
		<cfscript>
			super.init();
			usesLayout(template="/blankLayout", ajax="/blankLayout", only="list,details");
		</cfscript>
	</cffunction>
	
	<!--- view functions --->
	
	<cffunction name="index">
		<cfif StructKeyExists(params, "format") AND (params.format EQ "css" OR params.format EQ "js")>
			<cfreturn renderWith({})>
		</cfif>
		<cfscript>
			jsincludes = "angular/angular-1.0.1.min, angular/angular-resource-1.0.1.min, angular/angular.modules";
			title = "Contests Management";
		</cfscript>
	</cffunction>
	
	<cffunction name="edit">
		<cfscript>
			redirectTo(action="index", anchor="/edit/#params.key#");
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
					var contest = model("contest").create(params.object);
					return renderWith({"errors": contest.allErrors(), "id": contest.id});
					break;
				case "PUT"://update
					return renderWith({"success": model("contest").findByKey(params.key).update(params.object)});
				case "GET"://edit
					if(isDefined("params.key")){
						return renderWith(model("contest").findByKey(params.key).properties());
					}
					break;
				case "DELETE":
					return renderWith({"success": model("contest").findByKey(params.key).delete()});
			}
			return renderWith(QueryToJSON(model("contest").findAll()));
		</cfscript>
	</cffunction>
	
	<cffunction name="newContestion" hint="used for when a new contest event needs to be recorded">
		<cfif StructKeyExists(params, "format") AND (params.format EQ "css" OR params.format EQ "js")>
			<cfreturn renderWith({})>
		</cfif>
		<cfscript>
			jsincludes = "developr.input, angular/angular-1.0.1.min, angular/angular-resource-1.0.1.min, angular/angular.modules";
			contests = model("contest").findAll(where="userid = 1");
			contestors = model("contestor").findAll(where="userid = 1");
			title = "New Contestion";
		</cfscript>
	</cffunction>
	
	<!--- action/json functions --->
	
	<cffunction name="newContestionAngular">
		<cfscript>
			if(request.cgi.request_method EQ "POST"){
				var req = toString(getHttpRequestData().content);	
				if (isJSON(req)){
					params.object = deserializeJSON(req);
					var contestors = "";
					for(p = 1; p LTE ArrayLen(params.object.placings); p++){
						for(l = 1; l LTE ArrayLen(params.object.placings[p].placers); l++){
							contestors &= params.object.placings[p].placers[l].id;
							if(l EQ ArrayLen(params.object.placings[p].placers)) contestors &= ",";
							else contestors &= ";";
						}
					}
					return renderWith(model("contest").findByKey(params.object.contestid).runEvent(contestors));
				}else{
					return renderWith(false);
				}
			}
			var query = '';
			var user = model("user").findByKey(1);//replace with SESSION.currentUser
			switch(params.type){
				case "contests":
					query = user.contests();
					break;
				case "placings":
					var contest = user.findOneContest(where = "id = #params.contestid#");
					var placings = [];
					if(contest.participants EQ 0) contest.points4win = ReReplaceNoCase(contest.points4win, ",0", "");
					for(i = 1; i LTE ListLen(contest.points4win); i++) ArrayAppend(placings, {"points": ListGetAt(contest.points4win, i), "placers": []});
					return renderWith({"placings": placings, "participants": QueryToJSON(user.contestors())});
				default:
					query = user.contests();
			}
			return renderWith(QueryToJSON(query));
		</cfscript>
	</cffunction>
	
	<cffunction name="logContestion" hint="puts the data in the DB">
		<cfparam name="params.key" type="numeric"><!--- the selected contest key --->
		<cfparam name="params.placings" type="string"><!--- an ordered participants list, append all non placing participants to the end of the list before sending here --->
		<cfreturn renderWith({"success": model("contest").findByKey(params.key).runEvent(params.placings)})>
	</cffunction>
	
</cfcomponent>