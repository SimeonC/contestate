<cfcomponent extends="Controller" hint="the front end functions">
	
	<cffunction name="init" hint="override the default init so we don't have to have users logged in on these pages">
		<cfscript>
			provides("html,json,js,css");
			usesLayout(template="/blankLayout", only="contestGraph,contestorGraph");
		</cfscript>
	</cffunction>
	
	<!--- view functions --->
	
	<cffunction name="index">
		<cfscript>
			var oUser = "";
			if(isDefined("params.user")){
				try{
					oUser = model("user").findOneByUsernameAndProfiletypeid("#params.user#,1");
					if(!isStruct(oUser)) oUser = model("user").findOneByUsername("#model("user").decryptUsername(params.user)#"); //try find a private profile
				}catch(any){}
				if(!isStruct(oUser)){
					flashInsert(error="Sorry We Cannot Find That Contestate Page");
					return redirectTo(route="home");
				}
			}else if(StructKeyExists(session, "user") AND isStruct(session.user)){
				oUser = session.user;
			}else{
				flashInsert(error="Sorry We Cannot Find That Contestate Page");
				return redirectTo(route="home");
			}
			contests = oUser.contests();
			contestors = oUser.contestors();
			jsincludes = "developr.content-panel,developr.scroll,developr.progress-slider,developr.input";
			title = "Dashboard";
		</cfscript>
	</cffunction>
	
	<cffunction name="contestGraph">
		<cfscript>
			stats = model("contest").findByKey(key=params.key, include="conteststats(contestor)", returnAs="query");
		</cfscript>
	</cffunction>
	
	<cffunction name="contestorGraph">
		<cfscript>
			stats = model("contestor").findByKey(key=params.key, include="conteststats(contest)", returnAs="query");
		</cfscript>
	</cffunction>
	
</cfcomponent>