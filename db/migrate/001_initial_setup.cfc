<cfcomponent extends="plugins.dbmigrate.Migration" hint="initial_setup">
	<cffunction name="up">
		<cfscript>
			t = createTable('users');
			t.string(columnNames='username,password', null=false, limit=16);//max username and password length is 16
			t.string(columnNames='email', null=false, limit=60);
			t.integer(columnNames='profiletypeid', default='0');//if we need to create a table for this later we won't need to change the name - 0 is private, 1 is public, if 0 encrypt name
			t.string(columnNames='pagename', limit=30);
			t.string('resetstring');
			t.datetime('resetexpires');
			t.create();
			
			t = createTable('contestors');
			t.string('name');
			t.integer('gamescount');
			t.references('user');
			t.create();
			
			t = createTable('contests');
			t.string('name,points4win');
			t.integer('gamescount');
			t.boolean('multiwin,participants');//multiwin is if ties are allowed, participants is whether we need to track just the winner(s) or all the people who played.
			t.references('user');
			t.create();
			
			t = createTable('conteststats');
			t.references('contestor,contest');
			t.integer('plays,points');
			t.datetime('lastevent');
			t.create();
		</cfscript>
	</cffunction>
	<cffunction name="down">
		<cfscript>
			removeTable(table='users');
			removeTable(table='contestors');
			removeTable(table='contests');
			removeTable(table='conteststats');
		</cfscript>
	</cffunction>
</cfcomponent>
