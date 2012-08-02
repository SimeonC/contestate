<!---
	This is the parent controller file that all your controllers should extend.
	You can add functions to this file to make them globally available in all your controllers.
	Do not delete this file.
	
	Useful Header for view files with attached .js.cfm or .css.cfm:
	
	<cfif StructKeyExists(params, "format") AND (params.format EQ "css" OR params.format EQ "js")>
		<cfreturn renderWith({})>
	</cfif>
--->
<cfcomponent extends="Wheels">
	
	<cfset jsincludes = "">
	
	<cffunction name="init">
		<cfscript>
			filters(through="loginRequired");//overriden in the homepage and dashboard controller so those pages can be accessed without login
			provides("html,json,js,css");
		</cfscript>
	</cffunction>
	
	<cffunction name="global" hint="global js and css action, just renders">
		<cfscript>
			renderWith({});
		</cfscript>
	</cffunction>
	
	<!--- This function will prevent non-logged in users from accesing specific actions. --->
	<cffunction name="loginRequired">
		<cfif NOT StructKeyExists(session, "user")>
			<!--- for IIS issue of redirecting to the wrong place, as tries to load faviconico as well as what we requested --->
			<cfif params.controller NEQ "faviconico"><cfset SESSION.redirectparams = params></cfif>
			<cfset flashInsert(info="You need to log in first!")>
			<cfset redirectTo(route="login")>
		</cfif>
	</cffunction>
	
	<cffunction name="facebookopengraph" access="private" returnType="struct">
		<cfscript>
			if(StructKeyExists(session, "user") AND isStruct(session.user) AND session.user.profiletypeid) return {userpath: session.user.username};
			if(StructKeyExists(params, "user") AND model("user").count(where="username = '#params.user#'")) return {userpath: params.user};//encrypted links don't get shared through opengraph - and won't be found so no need for the profile type check
			return {userpath: ""};
		</cfscript>
	</cffunction>
	
	<cffunction name="QueryMerge" hint="merges multiple queries into 1">
		<cfloop collection="#arguments#" item="i">
			<cfset query = arguments[i]>
			<cfif isDefined("result")>
				<cfquery dbtype="query" name="result">
					SELECT * FROM result
					UNION ALL
					SELECT * FROM query
				</cfquery>
			<cfelse>
				<cfquery dbtype="query" name="result">
					SELECT * FROM query
				</cfquery>
			</cfif>
		</cfloop>
		<cfreturn result>
	</cffunction>
	
	<cffunction name="QueryToJSON" hint="converts the passed query to an array of struct objects" returnType="array">
		<cfargument name="query" type="query" required="true">
		<cfscript>
			var result = [];
			var columnNames = ListToArray(query.columnList);
			var metadata = GetMetadata(query);
			loop query="query"{
				var row = {};
				for(i = 1; i LTE ArrayLen(columnNames); i++){
					if(metadata[i].typeName EQ "TIMESTAMP") row[columnNames[i].toLowerCase()] = query[columnNames[i]].getTime() / 1000;
					else row[columnNames[i].toLowerCase()] = query[columnNames[i]];
					
				}
				ArrayAppend(result, row);
			}
		</cfscript>
		<cfreturn result>
	</cffunction>
	
	<cffunction name="StructKeysExist" access="private" output="false" returnType="boolean" hint="checks for the existence of multiple keys in one struct including nested keys">
		<cfargument name="struct" type="struct" required="yes" hint="the structure to search within">
		<cfargument name="keys" type="string" required="yes" hint="a comma delimited list of keys to check the existence of">
		<cfscript>
			var aKeys = ListToArray(Trim(arguments.keys));
			for(i = 1; i LTE ArrayLen(aKeys); i++){
				if(FindNoCase(".", aKeys[i])){
					var aCurrent = ListToArray(aKeys[i], ".");
					var sPath = Trim(aCurrent[1]);
					if(!StructKeyExists(arguments.struct, sPath) || !isStruct(arguments.struct[sPath])) return false;
					var sRef = arguments.struct;
					for(c = 2; c LTE ArrayLen(aCurrent); c++){
						sRef = sRef[sPath];
						sPath = Trim(aCurrent[c]);
						if(!StructKeyExists(sRef, sPath) || (c NEQ ArrayLen(aCurrent) AND !isStruct(sRef[sPath]))) return false;
					}
				}else
					if(!StructKeyExists(arguments.struct, Trim(aKeys[i]))) return false;
			}
			return true;
		</cfscript>
	</cffunction>
	
</cfcomponent>