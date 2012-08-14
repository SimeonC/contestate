<!---
	Here you can add routes to your application and edit the default one.
	The default route is the one that will be called on your application's "home" page.
--->
<cfscript>
	//these must be usable no matter where - they ignore the user part
	addRoute(name="login", pattern="/login", controller="homepage", action="login");
	addRoute(name="logout", pattern="/logout", controller="homepage", action="logout");
	addRoute(name="emailreset", pattern="/emailreset/[key]", controller="homepage", action="emailreset");
	//working pages calls
	addRoute(pattern="/dashboard/[action]/[key]", controller="dashboard");
	addRoute(name="dashboard", pattern="/dashboard", controller="dashboard", action="index");
	addRoute(pattern="/contests/[action]/[key]", controller="contests");
	addRoute(pattern="/contests/[action]", controller="contests");
	addRoute(name="contests", pattern="/contests", controller="contests", action="index");
	addRoute(pattern="/contestors/[action]/[key]", controller="contestors");
	addRoute(pattern="/contestors/[action]", controller="contestors");
	addRoute(name="contestors", pattern="/contestors", controller="contestors", action="index");
	//used for login page ajax calls
	addRoute(name="homepagekey", pattern="/homepage/[action]/[key]", controller="homepage");
	addRoute(name="homepage", pattern="/homepage/[action]", controller="homepage");
	//these ones are for user interactions
	addRoute(name="profile", pattern="/[user]/profile", controller="users", action="edit");
	addRoute(pattern="/users/[action]/[key]", controller="users");
	addRoute(pattern="/users/[action]", controller="users");
	addRoute(name="user", pattern="/users", controller="users", action="edit");
	//catch all routes
	addRoute(pattern="/[user]/[controller]/[action]/[key].[format]");
	addRoute(pattern="/[user]/[controller]/[action]/[key]");
	addRoute(pattern="/[user]/[controller]/[action].[format]");
	addRoute(pattern="/[user]/[controller]/[action]");
	addRoute(pattern="/[user]/[controller].[format]", action="index");
	addRoute(pattern="/[user]/[controller]", action="index");
	addRoute(name="contestateHome", pattern="/[user]", controller="dashboard", action="index");
	//by default show the home page
	addRoute(name="home", pattern="", controller="homepage", action="index");
</cfscript>