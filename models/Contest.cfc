<cfcomponent extends="Model">
	
	<cffunction name="init">
		<cfscript>
			belongsTo("user");
			hasMany(name="conteststats", dependent="delete");//broken?
			
			property(sql="SELECT MAX(points) FROM conteststats WHERE conteststats.contestid = contests.id",
				name="maxPoints");
		</cfscript>
	</cffunction>
	
	<cffunction name="stats" hint="gets all the stats for all contestors" returnType="query">
		<cfargument name="orderBy" type="string" default="points/plays DESC" hint="order by clause defaults to best win/points percentage based on what points is set to">
		<cfscript>
			return this.conteststats(include="contestor", orderBy=arguments.orderBy);
		</cfscript>
	</cffunction>
	
	<cffunction name="runEvent" hint="adds the contest stats to the db based on the passed in string (this is a wrapper for the full function for transaction purposes)" returnType="boolean" output="false">
		<cfargument name="contestors" type="string" required="true"
			hint="A comma seperated list of contestor id's that participated ordered by winners first, in the case of multi win scenarios the contestors at the same position are seperated by semi-colons.
				This is matched against the points4win list to determine the number of points awarded for each position.
				Examples:
					'2,3,1,5,9' = 2 in first, 3 in second, 1 in fourth, 5 in fifth and 9 in sixth
					'4;5;6,2;3,14,8,1' = 4,5,6 all share first, 2 and 3 share second, 14 is third, 8 is fourth and 1 is fifth">
		<cfscript>
			return invokeWithTransaction(method="$runEvent", contestors=arguments.contestors);
		</cfscript>
	</cffunction>
	
	<cffunction name="$runEvent" access="private" hint="adds the contest stats to the db based on the passed in string, called in an transaction" returnType="boolean" output="false">
		<cfargument name="contestors" type="string" required="true" hint="See @runEvent">
		<cfscript>
		SESSION.user = model("user").findByKey(1);
			//setup the lists as arrays
			var aPoints = ListToArray(this.points4win);
			var aPositions = ListToArray(arguments.contestors);
			var iPointsIndex = 1;
			var bSuccess = true;
			
			for(var i = 1; i LTE ArrayLen(aPositions); i++){
				var contestors = ListToArray(aPositions[i], ";");//get all the contestors
				for(var c = 1; c LTE ArrayLen(contestors); c++){
					bSuccess = bSuccess AND SESSION.user.findOneContestor(where="id = #contestors[c]#").scorecontestpoints(this.id, aPoints[iPointsIndex]);
				}
				iPointsIndex++;
			}
			this.gamescount++;
			bSuccess = bSuccess AND this.save();
			return bSuccess;
		</cfscript>
	</cffunction>
	
</cfcomponent>