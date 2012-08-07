<cfcomponent extends="Controller">
	
	<cffunction name="init" hint="override the default init so we don't have to have users logged in on these pages">
		<cfscript>
			provides("html,json,js,css");
			usesLayout(template="/blankLayout");
		</cfscript>
	</cffunction>
	
	<cffunction name="index">
		<cfscript>
			
		</cfscript>
	</cffunction>
	
	<cffunction name="login">
		<cfscript>
			
		</cfscript>
	</cffunction>
	
	<cffunction name="emailreset">
		<cfscript>
			
		</cfscript>
	</cffunction>
	
	<cffunction name="logout">
		<cfscript>
			//clean up session vars, redirect to home page
			StructDelete(SESSION, "user");
			redirectTo(route="home");
		</cfscript>
	</cffunction>
	
	<cffunction name="resetpassword">
		<cfscript>
			var oUser = model("user").findOne(where="resetstring = '#params.key#' AND resetexpires > NOW() AND username = '#params.username#'");
			if(isStruct(oUser) AND params.password EQ params.confirm AND oUser.update(password = oUser.encryptPassword(params.password))){
				session.user = oUser;
				flashInsert("Password Updated Successfully");
				redirectTo(route="dashboard");
			}
			redirectTo(route="home");
		</cfscript>
	</cffunction>
	
	<cffunction name="loginattempt">
		<cfscript>
			var loginsuccessful = false;
			if(StructKeysExist(params, "logindetails.login,logindetails.pass")){
				//login processes
				var oUser = model("user").findOne(where="username='#params.logindetails.login#' AND password = '#model("user").encryptPassword(params.logindetails.pass)#'");
				if(isStruct(oUser)){
					SESSION.user = oUser;
					loginsuccessful = true;
				}
			}
			return renderWith(loginsuccessful);
		</cfscript>
	</cffunction>
	
	<cffunction name="passwordretrieve">
		<cfscript>
			if(StructKeysExist(params, "details.mail") AND model("user").count(where="email = '#params.details.mail#'") EQ 1){
				//generate password and send mail
				var oUser = model("user").findOneByEmail(params.details.mail);
				if(!oUser.generateResetkey()) return renderWith(false);
				params.resetkey = oUser.resetstring;
				if(StructKeyExists(params, "newuser") AND params.newuser) sendEmail(template="newpasswordemail", from="forgottenpass@contestate.net", to=params.details.mail, subject="Welcome to Contestate.", params=params);
				else sendEmail(template="newpasswordemail", from="forgottenpass@contestate.net", to=params.details.mail, subject="Contestate Password Retrieval", params=params);
				return renderWith(true);
			}
			return renderWith(false);
		</cfscript>
	</cffunction>
	
	<cffunction name="register">
		<cfscript>
			if(StructKeysExist(params, "details.login,details.name,details.mail") AND model("user").count(where="username = '#params.details.login#' OR email = '#params.details.mail#'") EQ 0){
				//send mail
				if(model("user").create(username = params.details.login, email = params.details.mail, password = "123", fullname = params.details.name).hasErrors()) return renderWith(false);
				params.newuser = true;
				return passwordretrieve();
			}
			return renderWith(false);
		</cfscript>
	</cffunction>
	
</cfcomponent>