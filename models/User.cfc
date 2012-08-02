<cfcomponent extends="Model">
	
	<cffunction name="init">
		<cfscript>
			hasMany("contests");
			hasMany("contestors");
			
			beforeUpdate("$setReset");
		</cfscript>
	</cffunction>
	
	<cffunction name="encryptPassword" returnType="string" hint="encrypts the value for storage or comparison to the DB, should never unencrypt the password">
		<cfargument name="value" required="true" type="string">
		<cfscript>
			return encrypt(value, application.userkey);
		</cfscript>
	</cffunction>
	
	<cffunction name="encryptUsername" hint="used for generating the encrypted Unique URL for private profiles">
		<cfscript>
			return ToBase64(encrypt(this.username, application.privatecontestsKey));
		</cfscript>
	</cffunction>
	
	<cffunction name="decryptUsername" hint="used for viewing private contestate profiles">
		<cfargument name="name" type="string" required="true">
		<cfscript>
			return Decrypt(ToString(ToBinary(arguments.name)), application.privatecontestsKey);
		</cfscript>
	</cffunction>
	
	<cffunction name="$setReset" hint="Sets the email reset string and expiration date, means that the old email cannot be used again">
		<cfscript>
			this.resetexpires = now();
			this.resetstring = '';
		</cfscript>
	</cffunction>
	
	<cffunction name="stats" hint="gets all the stats for the user" returnType="query">
		<cfargument name="orderBy" type="string" default="contest.name ASC" hint="order by clause">
		<cfscript>
			return this.contests(include="conteststats(contestor)", orderBy=arguments.orderBy);
		</cfscript>
	</cffunction>
	
	<cffunction name="generateResetkey" hint="used for sending a password reset email">
		<cfscript>
			var resetKey = "";
			var rChars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
			for(i = 1; i LTE 30; i++){
				rnum = ceiling(rand() * len(rChars));
				if(rnum EQ 0) rnum = 1;
				resetKey = resetKey & mid(rChars, rnum, 1);
			}
			this.resetstring = resetkey;
			this.resetexpires = DateAdd("h", 24, NOW());
			return this.save(callbacks=false);
		</cfscript>
	</cffunction>
	
</cfcomponent>