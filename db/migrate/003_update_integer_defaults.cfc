<cfcomponent extends="plugins.dbmigrate.Migration" hint="Add the integer defaults">
	<cffunction name="up">
		<cfscript>
			changeColumn(table="contestors", columnName="gamescount", columnType="integer", default=0);
			changeColumn(table="contests", columnName="gamescount", columnType="integer", default=0);
			updateRecord(table="contestors", gamescount=0);
			updateRecord(table="contests", gamescount=0);
		</cfscript>
	</cffunction>
	<cffunction name="down">
		<cfscript>
			changeColumn(table="contestors", columnName="gamescount", columnType="integer");
			changeColumn(table="contests", columnName="gamescount", columnType="integer");
		</cfscript>
	</cffunction>
</cfcomponent>
