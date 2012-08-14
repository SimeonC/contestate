<cfscript>
	if(isDefined("SESSION.user")){
		if(SESSION.user.pagename NEQ '')
			pagename = Capitalize(SESSION.user.pagename);
		else
			pagename = Capitalize(SESSION.user.username);
		if(SESSION.user.profiletypeid EQ 1)//public profile
			pageURL = URLFor(controller=SESSION.user.username, onlyPath=false);
		else
			pageURL = URLFor(controller=SESSION.user.encryptUsername(), onlyPath=false);
	}else if(isDefined("params.user")){
		pageURL = URLFor(controller=params.user, onlyPath=false);
		attempt = model("user").findOneByUsername(params.user);
		if(isStruct(attempt) AND attempt.pagename NEQ "")
			pagename = Capitalize(attempt.pagename);
		else if(isStruct(attempt))
			pagename = Capitalize(attempt.username);
		else{
			attempt = model("user").findOneByUsername(model("user").decryptUsername(params.user));
			if(isStruct(attempt) AND attempt.pagename NEQ "")
				pagename = Capitalize(attempt.pagename);
			else if(isStruct(attempt))
				pagename = Capitalize(attempt.username);
			else
				pagename = Capitalize(params.user);
		}
	}
	request.pageURL = pageURL;
</cfscript>
<!DOCTYPE html>

<!--[if IEMobile 7]><html class="no-js iem7 oldie"><![endif]-->
<!--[if (IE 7)&!(IEMobile)]><html class="no-js ie7 oldie" lang="en"><![endif]-->
<!--[if (IE 8)&!(IEMobile)]><html class="no-js ie8 oldie" lang="en"><![endif]-->
<!--[if (gt IE 8)|(gt IEMobile 7)]><!--><html class="no-js" lang="en"><!--<![endif]-->

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title><cfoutput>Contestate By #pagename#</cfoutput></title>
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- http://davidbcalhoun.com/2010/viewport-metatag -->
	<meta name="HandheldFriendly" content="True">
	<meta name="MobileOptimized" content="320">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	
	<cfoutput>
		#includePartial("/icons")#
		#includePartial("/facebookopengraph")#
	
		<!-- For all browsers -->
		#StyleSheetLinkTag('reset,style,colors')#
		#StyleSheetLinkTag(source='print', media="print")#
		<!-- For progressively larger displays -->
		#StyleSheetLinkTag(source='480', media="only all and (min-width: 480px)")#
		#StyleSheetLinkTag(source='768', media="only all and (min-width: 768px)")#
		#StyleSheetLinkTag(source='992', media="only all and (min-width: 992px)")#
		#StyleSheetLinkTag(source='1200', media="only all and (min-width: 1200px)")#
		<!-- For Retina displays -->
		#StyleSheetLinkTag(source='2x', media="only all and (-webkit-min-device-pixel-ratio: 1.5), only screen and (-o-min-device-pixel-ratio: 3/2), only screen and (min-device-pixel-ratio: 1.5)")#
	
		<!-- Webfonts -->
		#StyleSheetLinkTag(source='http://fonts.googleapis.com/css?family=Open+Sans:300')#
		<!-- Additional styles -->
		
		<!-- JavaScript at bottom except for Modernizr -->
		#JavascriptIncludeTag("libs/modernizr.custom")#
	</cfoutput>

	<!-- iOS web-app metas -->
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">

	<!-- Startup image for web apps -->
	<link rel="apple-touch-startup-image" href="/images/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
	<link rel="apple-touch-startup-image" href="/images/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
	<link rel="apple-touch-startup-image" href="/images/splash/iphone.png" media="screen and (max-device-width: 320px)">

	<!-- Microsoft clear type rendering -->
	<meta http-equiv="cleartype" content="on">

	<!-- IE9 Pinned Sites: http://msdn.microsoft.com/en-us/library/gg131029.aspx -->
	<meta name="application-name" content="Contestate!">
	<meta name="msapplication-tooltip" content="Cross-platform admin template.">
	<meta name="msapplication-starturl" content="http://www.contestate.net/login">
	<!-- These custom tasks are examples, you need to edit them to show actual pages -->
	<meta name="msapplication-task" content="name=Agenda;action-uri=http://www.display-inline.fr/demo/developr/agenda.html;icon-uri=http://www.display-inline.fr/demo/developr/images/favicons/favicon.ico">
	<meta name="msapplication-task" content="name=My profile;action-uri=http://www.display-inline.fr/demo/developr/profile.html;icon-uri=http://www.display-inline.fr/demo/developr/images/favicons/favicon.ico">
</head>

<body class="clearfix <cfif isDefined("SESSION.user") AND isStruct(SESSION.user)>with-menu with-shortcuts</cfif>">
	<!--- facebook buttons setup --->
	<div id="fb-root"></div>
	<script>(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/en_GB/all.js";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));</script>
	<!-- Prompt IE 6 users to install Chrome Frame -->
	<!--[if lt IE 7]><p class="message red-gradient simpler">Your browser is <em>ancient!</em> <a href="http://browsehappy.com/">Upgrade to a different browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to experience this site.</p><![endif]-->

	<!-- Title bar -->
	<header role="banner" id="title-bar">
		<h2><cfoutput>#pagename#</cfoutput></h2>
	</header>
	
	<cfif isDefined("SESSION.user") AND isStruct(SESSION.user)>
		<!-- Button to open/hide menu -->
		<a href="#" id="open-menu"><span>Menu</span></a>
	
		<!-- Button to open/hide shortcuts -->
		<a href="#" id="open-shortcuts"><span class="icon-thumbs"></span></a>
	</cfif>

	<!-- Main content -->
	<section role="main" id="main">

		<!-- Visible only to browsers without javascript -->
		<noscript class="message black-gradient simpler">Your browser does not support JavaScript! Some features won't work as expected...</noscript>

		<!-- Main title -->
		<hgroup id="main-title">
			<div style="float: right;" class="fb-like" data-href="<cfoutput>#pageurl#</cfoutput>" data-send="false" data-layout="button_count" data-width="450" data-show-faces="false" data-font="arial"></div>
			<cfif NOT isDefined("SESSION.user")><b><cfoutput>#linkTo(route="login", text="Login", class="button blue-gradient glossy float-right")#</cfoutput></b></cfif>
			<h1 class="thin"><cfoutput>#title#</cfoutput></h1>
		</hgroup>

		<!-- The padding wrapper may be omitted -->
		<div class="with-padding">
			<!-- Main content here -->
			<cfoutput>#includeContent()#</cfoutput>
		</div>

	</section>
	<!-- End main content -->
	
	<cfif isDefined("SESSION.user") AND isStruct(SESSION.user)><cfoutput>
		<!-- Side tabs shortcuts -->
		<ul id="shortcuts" role="complementary" class="children-tooltip tooltip-right">
			<li<cfif params.controller EQ 'dashboard'> class="current"</cfif>>#LinkTo(route="dashboard", class="shortcut-dashboard", title="Dashboard", text="Dashboard")#</li>
			<li<cfif params.controller EQ 'contests'> class="current"</cfif>>#LinkTo(controller="contests", class="shortcut-stats", title="Contests", text="Contests")#</li>
			<li<cfif params.controller EQ 'contestors'> class="current"</cfif>>#LinkTo(controller="contestors", class="shortcut-contacts", title="Contestors", text="Contestors")#</li>
		</ul>

		<!-- Sidebar/drop-down menu -->
		<section id="menu" role="complementary">
	
			<!-- This wrapper is used by several responsive layouts -->
			<div id="menu-content">
	
				<header>
					&nbsp;
				</header>
	
				<div id="profile">
					<img src="/images/user.png" width="64" height="64" alt="User name" class="user-icon">
					Hello
					<span class="name"><b>#capitalize(SESSION.user.fullname)#</b></span>
				</div>
	
				<!-- By default, this section is made for 4 icons, see the doc to learn how to change this, in "basic markup explained" -->
				<ul id="access" class="children-tooltip">
					<!--- Reference for when we need more than just one icon for the user sidebar
<!-- Icon with count -->
					<li><a href="##" title="Messages">
						<span class="icon-inbox"></span>
						<span class="count">2</span>
					</a></li>
					<!-- Simple icon -->
					<li><a href="##" title="Calendar">
						<span class="icon-calendar"></span></a>
					</li>
--->
					<li style="width: 50%;">#linkTo(route="user", text='<span class="icon-gear mid-margin-right"></span>Profile')#</li>
					<li style="width: 50%;">#linkTo(route="logout", text='<span class="icon-extract mid-margin-right"></span>Logout')#</li>
				</ul>
	
				<!-- Navigation menu goes here -->
	
			</div>
			<!-- End content wrapper -->
	
			<!-- This is optional -->
			<footer id="menu-footer">
				<!-- Any content -->
			</footer>
	
		</section>
		<!-- End sidebar/drop-down menu -->
	</cfoutput></cfif>

	<!-- JavaScript at the bottom for fast page loading -->
	
	<!-- Scripts -->
	<cfif jsincludes NEQ "">
		<cfset jsincludes = ", " & jsincludes>
	</cfif>
	<cfoutput>#JavascriptIncludeTag("libs/jquery-1.7.2.min, setup" & jsincludes)#</cfoutput>
	<cfif fileExists(ExpandPath("/views/#params.controller#/#params.action#.js.cfm"))><script type="text/javascript">
		<cfinclude template="/views/#params.controller#/#params.action#.js.cfm">
	</script></cfif>
	
	<!-- Libs go here -->
</body>
</html>