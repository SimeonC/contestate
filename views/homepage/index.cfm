<!doctype html>
<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!-- Consider adding a manifest.appcache: h5bp.com/d/Offline -->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
	<meta charset="utf-8">

	<!-- Use the .htaccess and remove these lines to avoid edge case issues.
			 More info: h5bp.com/i/378 -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>Contestate</title>
	<meta name="description" content="Contestate is a web app to track contests, of any type, size or number.">
	<meta name="author" content="Simeon Cheeseman">
	
	<cfoutput>
		#StyleSheetLinkTag("homepagestyle,../javascripts/libs/jquery.sharrre/sharrre,../javascripts/libs/colorbox/colorbox")#
		#includePartial("/icons")#
		#includePartial("/facebookopengraph")#
		
		<!-- All JavaScript at the bottom, except this Modernizr build.
				 Modernizr enables HTML5 elements & feature detects for optimal performance.
				 Create your own custom Modernizr build: www.modernizr.com/download/ -->
		#JavascriptIncludeTag("libs/modernizr.custom")#
	</cfoutput>
</head>

<body role="document">

	<!-- Prompt IE 6 users to install Chrome Frame. Remove this if you support IE 6.
			 chromium.org/developers/how-tos/chrome-frame-getting-started -->
	<!--[if lt IE 7]><p class=chromeframe>Your browser is <em>ancient!</em> <a href="http://browsehappy.com/">Upgrade to a different browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to experience this site.</p><![endif]-->

	<header role="banner" id="top"><div class="container">

		<nav role="navigation">
			<cfoutput>
				#linkTo(route="login", title="Login to your account", class="nav-right", text="Login")#
				#linkTo(route="login", anchor="form-register", title="Create a new account", class="nav-right", text="Sign Up")#
			</cfoutput>
		</nav>

		<hgroup>
			<div id="logo"></div>
			<h1>Contestat<b>e</b></h1>
			<h2>Resolving the<br>
			<b>Competition</b></h2>
		</hgroup>
		<p class="tagline">Your <span class="term">contest</span>. <strong>Anywhere.</strong></p>

		<ul id="mind">
			<li>
				<a href="#intro" title="Learn more about Developr">
					<span id="what-picto"></span>
					<strong>What?</strong><br>
					Learn more
				</a>
			</li>
			<!---
<li>
				<a href="#" title="Purchase template on ThemeForest">
					<span id="want-picto">20$</span>
					<strong>Want!</strong><br>
					Buy on ThemeForest
				</a>
			</li>
--->
		</ul>

		<!-- Devices pictures -->
		<div id="smartphone"></div>
		<div id="tablet"></div>
		<div id="desktop"></div>

		<!---
<a href="img/qrcode.png" id="qr-code-block" title="Click to show the QR-code">
			<span id="qr-code"></span>
			<h3>Scan the QR code</h3>
			Try it on your smartphone
		</a>
--->

	</div></header>
	<div role="main"><div class="container">

		<article>

			<p class="intro" id="intro">Welcome to Contestate, a site designed to keep track of whatever you want anywhere.</p>

			<p class="intro"><cfoutput>#linkTo(route="login", anchor="form-register", title="Have a go, Sign Up for free!", text="Give it a try &raquo;")#</cfoutput></p>

			<nav role="navigation" id="features">
				<a href="#top" title="Go to top">Top</a>
				<span>Introduction</span>
				<cfoutput>
					<!---
<a href="##screenshots" title="Mobile and desktop screenshots">Screenshots</a>
					<a href="##versions" title="Update history">Version history</a>
--->
					#linkTo(route="login", anchor="form-register", title="Create a new account", class="nav-right", text="Sign Up")#
				</cfoutput>
			</nav>

			<h2>Introduction</h2>
			<section id="introduction">
				<p>Welcome to Contestate, currently this site is in <b style="color: red">OPEN ALPHA</b> and as such is well open to suggestions, also there will most likely be bugs, please report them at the <a href="https://github.com/SimeonC/contestate/issues">Contestate Github Repository</a></p>
				<p>More information is to follow soon with regards to tutorials and videos to come.</p>
				<p>Also this page is a mess, I'll fix it eventually!! (And those pictures top right are only the template ones, haven't bothered on changing them yet)</p>
			</section>

			<!---
<h2>Built-in plugins</h2>
			<section id="plugins">
				<span class="illustration"></span>

				<ul class="bullets">
					<li>Powerfull and highly customizable features: tooltips, modal windows, notifications, confirmation message, tabs, styled form elements, navigable menus...</li>
					<li>Most plugins allow inline configuration with classes and data attributes - no script needed.</li>
					<li>Plugins are touch-screen ready</li>
				</ul>

			</section>

			<h2>Everything you need</h2>
			<section id="everything">
				<span class="illustration"></span>

				<ul class="bullets">
					<li>Ready to use styles for most needed features: lists, tables, agenda, blocks, forms, icons, messages, sliders, progress... And much more.</li>
					<li>Includes plugins for WYSIWYG editor, date picker, table sorting...</li>
					<li>Large set of utility classes to build your own styles and elements in no time and without touching CSS: layout, colors, shadows, gradients, position...</li>
				</ul>

			</section>

			<nav role="navigation" id="screenshots">
				<a href="#top" title="Go to top">Top</a>
				<a href="#features" title="Have a look at what's inside">Features</a>
				<span>Screenshots</span>
				<a href="#versions" title="Update history">Version history</a>
				<a href="#" title="Buy on ThemeForest" class="nav-right">Purchase</a>
			</nav>

			<h2>Smartphone</h2>
			<ul class="screenshots clearfix" id="screenshots-mobile">
				<li><a href="screenshots/mobile-1.png" title="Dashboard"><img src="screenshots/mobile-1-mini.png" width="80" height="120" title="Developr - Dashboard" alt="Screenshot of an example dashboard, with chart and stats"></a></li>
				<li><a href="screenshots/mobile-2.png" title="Lists"><img src="screenshots/mobile-2-mini.png" width="80" height="120" title="Developr - Lists" alt="Screenshot of a users list with context tooltip menu"></a></li>
				<li><a href="screenshots/mobile-3.png" title="Events"><img src="screenshots/mobile-3-mini.png" width="80" height="120" title="Developr - Events" alt="Screenshot of a list of events"></a></li>
				<li><a href="screenshots/mobile-4.png" title="Menu"><img src="screenshots/mobile-4-mini.png" width="80" height="120" title="Developr - Menu" alt="Screenshot of the navigation menu on mobile devices"></a></li>
				<li><a href="screenshots/mobile-5.png" title="Modal window"><img src="screenshots/mobile-5-mini.png" width="80" height="120" title="Developr - Modal window" alt="Screenshot of an example modal window"></a></li>
				<li><a href="screenshots/mobile-6.png" title="Prompt"><img src="screenshots/mobile-6-mini.png" width="80" height="120" title="Developr - Prompt" alt="Screenshot of a prompt window"></a></li>
			</ul>

			<h2>Tablet / desktop</h2>
			<ul class="screenshots clearfix" id="screenshots-desktop">
				<li><a href="screenshots/desktop-1.png" title="Dashboard"><img src="screenshots/desktop-1-mini.png" width="192" height="120" title="Developr - Dashboard" alt="Screenshot of an example dashboard, with chart and stats"></a></li>
				<li><a href="screenshots/desktop-2.png" title="Tables"><img src="screenshots/desktop-2-mini.png" width="192" height="120" title="Developr - Tables" alt="Screenshot of tables styles"></a></li>
				<li><a href="screenshots/desktop-3.png" title="Forms"><img src="screenshots/desktop-3-mini.png" width="192" height="120" title="Developr - Forms" alt="Screenshot of some of the many form elements"></a></li>
				<li><a href="screenshots/desktop-4.png" title="Messages"><img src="screenshots/desktop-4-mini.png" width="192" height="120" title="Developr - Messages" alt="Screenshot of examples of messages"></a></li>
				<li><a href="screenshots/desktop-5.png" title="Modal window"><img src="screenshots/desktop-5-mini.png" width="192" height="120" title="Developr - Modal window" alt="Screenshot of an example modal window"></a></li>
				<li><a href="screenshots/desktop-6.png" title="Prompt"><img src="screenshots/desktop-6-mini.png" width="192" height="120" title="Developr - Prompt" alt="Screenshot of a prompt window"></a></li>
			</ul>

			<nav role="navigation" id="versions">
				<a href="#top" title="Go to top">Top</a>
				<a href="#features" title="Have a look at what's inside">Features</a>
				<a href="#screenshots" title="Mobile and desktop screenshots">Screenshots</a>
				<span>Version history</span>
				<a href="#" title="Buy on ThemeForest" class="nav-right">Purchase</a>
			</nav>

			<h2>1.0 <span>//</span> Initial release <small>March 29th 2012</small></h2>

			<ul class="version-history">
				<li><span class="version-new">New</span> New element</li>
				<li><span class="version-fixed">Fixed</span> Fixed element</li>
				<li><span class="version-upgraded">Upg.</span> Upgraded element</li>
			</ul>
--->

		</article>

		<aside>

			<!---
<div class="aside-icon-block" id="aside-technos">
				<span class="aside-icon"></span>
				<h3>HTML5, CSS3, jQuery...</h3>
				<p>Bleeding edge technologies for an awesome look and feel.</p>
			</div>

			<div class="aside-icon-block" id="aside-features">
				<span class="aside-icon"></span>
				<h3>Unique features</h3>
				<p>Custom tailored plugins that are incredibly easy to use.</p>
			</div>

			<div class="aside-icon-block" id="aside-responsive">
				<span class="aside-icon"></span>
				<h3>Fully responsive</h3>
				<p>From smartphones to wide screens, seamlessly.</p>
			</div>

			<div class="aside-icon-block" id="aside-doc">
				<span class="aside-icon"></span>
				<h3>Comprehensive doc</h3>
				<p>Every feature is detailled with ready-to-use examples.</p>
			</div>
--->

			<!---
<h4>And also...</h4>

			<p><a href="template/colors.html" title="See the demo page">9 colors sets</a> with for each one a solid background color, a border color, a gradient, a hover style and an active style for buttons.</p>

			<p><a href="template/icons.html" title="See the demo page">122 vector icons</a> using the awesome icon webfont Entypo.</p>

			<div id="bonus">
				<h4>Bonus</h4>
				<p>This landing page is included in the template package, <strong>for free!</strong></p>
			</div>

			<h4 id="share">Share</h4>

			<div id="sharrre">
				<div id="twitter" data-url="http://www.display-inline.fr/demo/developr/" data-text="Building a web app for desktop and mobile devices? Developr Admin Skin is for you: http://goo.gl/GDdmr"></div>
				<div id="facebook" data-url="http://www.display-inline.fr/demo/developr/" data-text="Building a web app for desktop and mobile devices? Developr Admin Skin is for you: http://goo.gl/GDdmr"></div>
				<div id="googleplus" data-url="http://www.display-inline.fr/demo/developr/" data-text="Building a web app for desktop and mobile devices? Developr Admin Skin is for you: http://goo.gl/GDdmr"></div>
			</div>
--->

		</aside>

	</div></div>
	<footer role="contentinfo"><div class="container">

	</div></footer>


	<!-- JavaScript at the bottom for fast page loading -->

	<!-- Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if offline -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/libs/jquery-1.7.2.min.js"><\/script>')</script>

	<script>

		// List of changing terms
		var terms = ['contest', 'tally', 'competition', 'game', 'event'];

	</script>

	<!-- Libs -->
	<cfoutput>
		#javascriptIncludeTag("libs/colorbox/jquery.colorbox-min,libs/jquery.sharrre/jquery.sharrre-1.3.2.min")#
	</cfoutput>
	
	<script>

		// Colorbox
		$('#qr-code-block').colorbox({ title:'Scan this QRcode to go to the online demo' });
		$('#screenshots-mobile a').colorbox({rel:'mobile-screenshots', loop:false});
		$('#screenshots-desktop a').colorbox({rel:'desktop-screenshots', loop:false});

		// Sharrre
		$('#twitter').sharrre({
			share: {
				twitter: true
			},
			template: '<a class="box" href="#"><div class="count" href="#">{total}</div><div class="share"><span></span>Tweet</div></a>',
			enableHover: false,
			enableTracking: true,
			buttons: { twitter: {via: 'displayinline'}},
			click: function(api, options){
				api.simulateClick();
				api.openPopup('twitter');
			}
		});
		$('#facebook').sharrre({
			share: {
				facebook: true
			},
			template: '<a class="box" href="#"><div class="count" href="#">{total}</div><div class="share"><span></span>Like</div></a>',
			enableHover: false,
			enableTracking: true,
			click: function(api, options){
				api.simulateClick();
				api.openPopup('facebook');
			}
		});
		$('#googleplus').sharrre({
			share: {
				googlePlus: true
			},
			template: '<a class="box" href="#"><div class="count" href="#">{total}</div><div class="share">+1</div></a>',
			enableHover: false,
			enableTracking: true,
			click: function(api, options){
				api.simulateClick();
				api.openPopup('googlePlus');
			}
		});

	</script>

	<!-- scripts -->
	<cfoutput>#javascriptIncludeTag("homepagescript")#</cfoutput>

	<script>
		var _gaq=[['_setAccount','UUA-10643639-5'],['_trackPageview']];
		(function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
		g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
		s.parentNode.insertBefore(g,s)}(document,'script'));
	</script>
</body>
</html>