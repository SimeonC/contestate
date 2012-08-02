<cfcomponent extends="Model">
	
	<cffunction name="init">
		<cfscript>
			belongsTo("user");
			hasMany(name="conteststats", dependent="delete");
		</cfscript>
	</cffunction>
	
	<cffunction name="stats" hint="gets a contestors contest stats" returnType="query">
		<cfargument name="orderBy" type="string" default="points/plays DESC" hint="order by clause defaults to best win/points percentage based on what points is set to">
		<cfscript>
			return this.conteststats(include="contest", orderBy=arguments.orderBy);
		</cfscript>
	</cffunction>
	
	<cffunction name="scorecontestpoints" hint="records points scored in a contest" returnType="boolean">
		<cfargument name="contestid" type="numeric" required="true" hint="contest id that the contestor took part in">
		<cfargument name="points" type="numeric" required="true" hint="the number of points that this contestor scored">
		<cfscript>
			this.gamescount++;
			var oConteststat = this.findOneConteststat(where="contestid = #arguments.contestid#");
			if(!isStruct(oConteststat)) return this.save() AND !this.createConteststat(contestid = arguments.contestid, plays = 1, points = arguments.points).hasErrors();
			oConteststat.points += arguments.points;
			oConteststat.plays++;
			return this.save() AND oCosteststat.save();
		</cfscript>
	</cffunction>
	
</cfcomponent>