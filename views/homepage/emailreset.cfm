<!DOCTYPE html>

<!--[if IEMobile 7]><html class="no-js iem7 oldie linen"><![endif]-->
<!--[if (IE 7)&!(IEMobile)]><html class="no-js ie7 oldie linen" lang="en"><![endif]-->
<!--[if (IE 8)&!(IEMobile)]><html class="no-js ie8 oldie linen" lang="en"><![endif]-->
<!--[if (IE 9)&!(IEMobile)]><html class="no-js ie9 linen" lang="en"><![endif]-->
<!--[if (gt IE 9)|(gt IEMobile 7)]><!--><html class="no-js linen" lang="en"><!--<![endif]-->

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>Contestate</title>
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
		#StyleSheetLinkTag('styles/form,styles/switches,login')#
		
		<!-- JavaScript at bottom except for Modernizr -->
		#JavascriptIncludeTag("libs/modernizr.custom")#
	</cfoutput>

	<!-- iOS web-app metas -->
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">

	<!-- Startup image for web apps -->
	<link rel="apple-touch-startup-image" href="img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
	<link rel="apple-touch-startup-image" href="img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
	<link rel="apple-touch-startup-image" href="img/splash/iphone.png" media="screen and (max-device-width: 320px)">

	<!-- Microsoft clear type rendering -->
	<meta http-equiv="cleartype" content="on">

	<!-- IE9 Pinned Sites: http://msdn.microsoft.com/en-us/library/gg131029.aspx -->
	<meta name="application-name" content="Developr Admin Skin">
	<meta name="msapplication-tooltip" content="Cross-platform admin template.">
	<meta name="msapplication-starturl" content="http://www.display-inline.fr/demo/developr">
	<!-- These custom tasks are examples, you need to edit them to show actual pages -->
	<meta name="msapplication-task" content="name=Agenda;action-uri=http://www.display-inline.fr/demo/developr/agenda.html;icon-uri=http://www.display-inline.fr/demo/developr/img/favicons/favicon.ico">
	<meta name="msapplication-task" content="name=My profile;action-uri=http://www.display-inline.fr/demo/developr/profile.html;icon-uri=http://www.display-inline.fr/demo/developr/img/favicons/favicon.ico">
</head>

<body>

	<div id="container" style="margin-top: -280px;">

		<hgroup id="login-title" class="large-margin-bottom">
			<h1 class="login-title-image">Contestate</h1>
			<h5>&copy; Simeon Cheeseman</h5>
		</hgroup>

		<div id="form-wrapper">

			<div id="form-block" class="scratch-metal">
				<div id="form-viewport">
					<form method="post" action="<cfoutput>#URLFor(action="resetpassword", key=params.key)#</cfoutput>" id="form-register" class="input-wrapper green-gradient glossy" title="Register">

						<p class="message">
							Enter your username to confirm this is you and your new password!
							<span class="block-arrow"><span></span></span>
						</p>
						
						<ul class="inputs black-input large">
							<li><span class="icon-user mid-margin-right"></span><input type="text" name="username" id="name-reset" value="" class="input-unstyled" placeholder="Your Username" autocomplete="off"></li>
						</ul>
						
						<ul class="inputs black-input large">
							<li><span class="icon-lock mid-margin-right"></span><input type="password" name="password" id="password-reset" value="" class="input-unstyled" placeholder="New Password" autocomplete="off"></li>
							<li><span class="icon-lock mid-margin-right"></span><input type="password" name="confirm" id="confirm-reset" value="" class="input-unstyled" placeholder="Confirm Password" autocomplete="off"></li>
						</ul>

						<button type="submit" class="button glossy full-width" id="send-register">Register</button>

					</form>

				</div>
			</div>

		</div>

	</div>

	<!-- JavaScript at the bottom for fast page loading -->
	<cfoutput>#JavascriptIncludeTag("libs/jquery-1.7.2.min, setup, developr.input, developr.message, developr.notify, developr.tooltip")#</cfoutput>

	<script>

		/*
		 * How do I hook my login script to these?
		 * --------------------------------------
		 *
		 * These scripts are meant to be non-obtrusive: if the user has disabled javascript or if an error occurs, the forms
		 * works fine without ajax.
		 *
		 * The only part you need to edit are the scripts between the EDIT THIS SECTION tags, which do inputs validation and
		 * send data to server. For instance, you may keep the validation and add an AJAX call to the server with the user
		 * input, then redirect to the dashboard or display an error depending on server return.
		 *
		 * Or if you don't trust AJAX calls, just remove the event.preventDefault() part and let the form be submitted.
		 */

		$(document).ready(function()
		{
			/*
			 * JS login effect
			 * This script will enable effects for the login page
			 */
				// Elements
			var doc = $('html').addClass('js-login'),
				container = $('#container'),
				formWrapper = $('#form-wrapper'),
				formBlock = $('#form-block'),
				formViewport = $('#form-viewport'),
				forms = formViewport.children('form'),
				
				centered = true;

			/*
			 * Register
			 */
			$('#form-register').submit(function(event)
			{
				// Values
				var username = $.trim($('#name-reset').val()),
					password = $.trim($('#password-reset').val()),
					confirm = $.trim($('#confirm-reset').val());

				// Remove previous messages
				formWrapper.clearMessages();

				// Check inputs
				if (username.length === 0)
				{
					// Display message
					displayError('Please fill in your username');
					return false;
				}
				else if (password.length === 0)
				{
					// Display message
					displayError('Please fill in your new password');
					return false;
				}
				else if (confirm.length === 0)
				{
					// Display message
					displayError('Please confirm your password');
					return false;
				}
				else if (confirm !== password)
				{
					// Display message
					displayError('Please make sure your passwords match');
					return false;
				}
				else
				{
					// Show progress
					displayLoading('Resetting Password...');
				}
			});

			// Main bloc height (without form height)
			blocHeight = formBlock.height()-$('#form-register').data('height');
			
			// Initial vertical adjust
			centerForm(false);

			/*
			 * Center function
			 * @param jQuery form the form element whose height will be used
			 * @param boolean animate whether or not to animate the position change
			 * @param string|element|array any jQuery selector, DOM element or set of DOM elements which should be ignored
			 * @return void
			 */
			function centerForm(animate, ignore)
			{
				// If layout is centered
				if (centered)
				{
					var siblings = formWrapper.siblings().not('.closing'),
						finalSize = blocHeight+$('#form-register').data('height');

					// Ignored elements
					if (ignore)
					{
						siblings = siblings.not(ignore);
					}

					// Get other elements height
					siblings.each(function(i)
					{
						finalSize += $(this).outerHeight(true);
					});

					// Setup
					container[animate ? 'animate' : 'css']({ marginTop: -Math.round((finalSize/2)+100)+'px' });
				}
			};

			/**
			 * Function to display error messages
			 * @param string message the error to display
			 */
			function displayError(message)
			{
				// Show message
				var message = formWrapper.message(message, {
					append: false,
					arrow: 'bottom',
					classes: ['red-gradient'],
					animate: false					// We'll do animation later, we need to know the message height first
				});

				// Vertical centering (where we need the message height)
				centerForm(true, 'fast');

				// Watch for closing and show with effect
				message.bind('endfade', function(event)
				{
					// This will be called once the message has faded away and is removed
					centerForm(true, message.get(0));

				}).hide().slideDown('fast');
			};

			/**
			 * Function to display loading messages
			 * @param string message the message to display
			 */
			function displayLoading(message)
			{
				// Show message
				var message = formWrapper.message('<strong>'+message+'</strong>', {
					append: false,
					arrow: 'bottom',
					classes: ['blue-gradient', 'align-center'],
					stripes: true,
					darkStripes: false,
					closable: false,
					animate: false					// We'll do animation later, we need to know the message height first
				});

				// Vertical centering (where we need the message height)
				centerForm(true, 'fast');

				// Watch for closing and show with effect
				message.bind('endfade', function(event)
				{
					// This will be called once the message has faded away and is removed
					centerForm(true, message.get(0));

				}).hide().slideDown('fast');
			};
		});

	</script>

</body>
</html>