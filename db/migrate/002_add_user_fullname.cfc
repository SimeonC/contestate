<cfcomponent extends="plugins.dbmigrate.Migration" hint="Add user fullname field">
	<cffunction name="up">
		<cfscript>
			t = changeTable('users');
			t.string(columnNames='fullname', limit=32);
			t.change();
			
			execute('UPDATE users SET fullname = username');
			
			changeColumn(table='users', columnName='fullname', columnType='string', null=false, limit=32);
		</cfscript>
	</cffunction>
	<cffunction name="down">
		<cfscript>
			removeColumn(table='users', columnName='fullname');
		</cfscript>
	</cffunction>
</cfcomponent>
