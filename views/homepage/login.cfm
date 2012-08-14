﻿<!DOCTYPE html>

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
	<meta name="application-name" content="Contestate">
	<meta name="msapplication-tooltip" content="Contestate, a site designed to track, tally and count anything anywhere you want.">
	<meta name="msapplication-starturl" content="http://www.contestate.net">
</head>

<body>

	<div id="container">

		<hgroup id="login-title" class="large-margin-bottom">
			<h1 class="login-title-image">Contestate</h1>
			<h5>&copy; Simeon Cheeseman</h5>
		</hgroup>

		<div id="form-wrapper">

			<div id="form-block" class="scratch-metal">
				<div id="form-viewport">

					<form method="post" action="" id="form-login" class="input-wrapper blue-gradient glossy" title="Login">
						<ul class="inputs black-input large">
							<!-- The autocomplete="off" attributes is the only way to prevent webkit browsers from filling the inputs with yellow -->
							<li><span class="icon-user mid-margin-right"></span><input type="text" name="name" id="login" value="" class="input-unstyled" placeholder="Username" autocomplete="off"></li>
							<li><span class="icon-lock mid-margin-right"></span><input type="password" name="pass" id="pass" value="" class="input-unstyled" placeholder="Password" autocomplete="off"></li>
						</ul>

						<p class="button-height">
							<button type="submit" class="button glossy float-right" id="login">Login</button>
							<input type="checkbox" name="remind" id="remind" value="1" checked="checked" class="switch tiny mid-margin-right with-tooltip" title="Enable auto-login">
							<label for="remind">Remind me</label>
						</p>
					</form>

					<form method="post" action="" id="form-password" class="input-wrapper orange-gradient glossy" title="Lost password?">

						<p class="message">
							If you can’t remember your password, fill the input below with your e-mail and we’ll send you a new one:
							<span class="block-arrow"><span></span></span>
						</p>

						<ul class="inputs black-input large">
							<li><span class="icon-mail mid-margin-right"></span><input type="email" name="mail" id="mail" value="" class="input-unstyled" placeholder="Your e-mail" autocomplete="off"></li>
						</ul>

						<button type="submit" class="button glossy full-width" id="send-password">Send new password</button>

					</form>

					<form method="post" action="" id="form-register" class="input-wrapper green-gradient glossy" title="Register">

						<p class="message">
							New user? Yay! Let us know a little bit about you before you start:
							<span class="block-arrow"><span></span></span>
						</p>

						<ul class="inputs black-input large">
							<li><span class="icon-card mid-margin-right"></span><input type="text" name="name" id="name-register" value="" class="input-unstyled" placeholder="Your Name" autocomplete="off"></li>
							<li><span class="icon-mail mid-margin-right"></span><input type="email" name="mail" id="mail-register" value="" class="input-unstyled" placeholder="Your E-mail" autocomplete="off"></li>
						</ul>
						<ul class="inputs black-input large">
							<li><span class="icon-user mid-margin-right"></span><input type="text" name="login" id="login-register" value="" class="input-unstyled" placeholder="Your Username" autocomplete="off"></li>
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

				// Doors
				topDoor = $('<div id="top-door" class="form-door"><div></div></div>').appendTo(formViewport),
				botDoor = $('<div id="bot-door" class="form-door"><div></div></div>').appendTo(formViewport),
				doors = topDoor.add(botDoor),

				// Switch
				formSwitch = $('<div id="form-switch"><span class="button-group"></span></div>').appendTo(formBlock).children(),

				// Current form
				hash = (document.location.hash.length > 1) ? document.location.hash.substring(1) : false,

				// If layout is centered
				centered,

				// Store current form
				currentForm,

				// Animation interval
				animInt,

				// Work vars
				maxHeight = false,
				blocHeight;

			/*
			 * Login
			 * These functions will handle the login process through AJAX
			 */
			$('#form-login').submit(function(event)
			{
				// Values
				var login = $.trim($('#login').val()),
					pass = $.trim($('#pass').val());

				// Check inputs
				if (login.length === 0)
				{
					// Display message
					displayError('Please fill in your login');
					return false;
				}
				else if (pass.length === 0)
				{
					// Remove empty login message if displayed
					formWrapper.clearMessages('Please fill in your login');

					// Display message
					displayError('Please fill in your password');
					return false;
				}
				else
				{
					// Remove previous messages
					formWrapper.clearMessages();

					// Show progress
					displayLoading('Checking credentials...');

					// Stop normal behavior
					event.preventDefault();
					
					$.ajax("<cfoutput>#URLFor(action="loginattempt")#</cfoutput>", {
						data: {
							logindetails: {
								login:	login,
								pass:	pass
							}
						},
						success: function(data)
						{
							if (data)
							{
								document.location.href = '<cfoutput>#URLFor(controller="dashboard")#</cfoutput>';
							}
							else
							{
								formWrapper.clearMessages();
								displayError('Invalid user/password, please try again');
							}
						},
						error: function()
						{
							formWrapper.clearMessages();
							displayError('Error while contacting server, please try again');
						},
						dataType: "json"
					});
				}
			});

			/*
			 * Password recovery
			 */
			$('#form-password').submit(function(event)
			{
				event.preventDefault();
				// Values
				var mail = $.trim($('#mail').val());

				// Check inputs
				if (mail.length === 0)
				{
					// Display message
					displayError('Please fill in your email');
				}
				else if (!/^[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/.test(mail))
				{
					// Remove empty email message if displayed
					formWrapper.clearMessages('Please fill in your email');

					// Display message
					displayError('Email is not valid');
					return false;
				}
				else
				{
					// Remove previous messages
					formWrapper.clearMessages();

					// Show progress
					displayLoading('Sending credentials...');
					
					$.ajax("<cfoutput>#URLFor(action="passwordretrieve")#</cfoutput>", {
						data: {
							details: {
								mail: mail
							}
						},
						success: function(data)
						{
							if (data)
							{
								formWrapper.clearMessages();
								displayError('An email has been sent with your new password');
							}
							else
							{
								formWrapper.clearMessages();
								displayError('There is no user with this email, please try again');
							}
						},
						error: function()
						{
							formWrapper.clearMessages();
							displayError('Error while contacting server, please try again');
						},
						dataType: "json"
					});
				}
				return false;
			});

			/*
			 * Register
			 */
			$('#form-register').submit(function(event)
			{
				// Values
				var name = $.trim($('#name-register').val()),
					mail = $.trim($('#mail-register').val()),
					login = $.trim($('#login-register').val());

				// Remove previous messages
				formWrapper.clearMessages();

				// Check inputs
				if (name.length === 0)
				{
					// Display message
					displayError('Please fill in your name');
					return false;
				}
				else if (mail.length === 0)
				{
					// Display message
					displayError('Please fill in your email');
					return false;
				}
				else if (!/^[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/.test(mail))
				{
					// Display message
					displayError('Email is not valid');
					return false;
				}
				else if (login.length === 0)
				{
					// Display message
					displayError('Please fill in your Username');
					return false;
				}else if(!/^[a-zA-Z0-9]{4,16}$/.test(login))
				{
					displayError('Username must be alphanumeric and between 4 and 16 characters in length')
				}else
				{
					// Show progress
					displayLoading('Registering...');

					// Stop normal behavior
					event.preventDefault();
					
					$.ajax("<cfoutput>#URLFor(action="register")#</cfoutput>", {
						data: {
							details: {
								login:	login,
								name:	name,
								mail:	mail
							}
						},
						success: function(data)
						{
							if (data)
							{
								formWrapper.clearMessages();
								displayError('You have successfully registered, please check your email for a confirmation message');
							}
							else
							{
								formWrapper.clearMessages();
								displayError('This email and/or username is already in use, please try again');
							}
						},
						error: function()
						{
							formWrapper.clearMessages();
							displayError('Error while contacting server, please try again');
						},
						dataType: "json"
					});
				}
			});

			/*
			 * Animated login
			 */

			// Prepare forms
			forms.each(function(i)
			{
				var form = $(this),
					height = form.outerHeight(),
					active = (hash === false && i === 0) || (hash === this.id),
					color = this.className.match(/[a-z]+-gradient/) ? ' '+(/([a-z]+)-gradient/.exec(this.className)[1])+'-active' : '';

				// Store size
				form.data('height', height);

				// Min-height for mobile layout
				if (maxHeight === false || height > maxHeight)
				{
					maxHeight = height;
				}

				// Button in the switch
				form.data('button', $('<a href="#'+this.id+'" class="button anthracite-gradient'+color+(active ? ' active' : '')+'">'+this.title+'</a>')
									.appendTo(formSwitch)
									.data('form', form));

				// If active
				if (active)
				{
					// Store
					currentForm = form;

					// Height of viewport
					formViewport.height(height);
				}
				else
				{
					// Hide for now
					form.hide();
				}
			});

			// Main bloc height (without form height)
			blocHeight = formBlock.height()-currentForm.data('height');

			// Handle resizing (mostly for debugging)
			function handleLoginResize()
			{
				// Detect mode
				centered = (container.css('position') === 'absolute');

				// Set min-height for mobile layout
				if (!centered)
				{
					formWrapper.css('min-height', (blocHeight+maxHeight+20)+'px');
					container.css('margin-top', '');
				}
				else
				{
					formWrapper.css('min-height', '');
					if (parseInt(container.css('margin-top'), 10) === 0)
					{
						centerForm(currentForm, false);
					}
				}
			};

			// Register and first call
			$(window).bind('normalized-resize', handleLoginResize);
			handleLoginResize();

			// Switch behavior
			formSwitch.on('click', 'a', function(event)
			{
				var link = $(this),
					form = link.data('form'),
					previousForm = currentForm;

				event.preventDefault();
				if (link.hasClass('active'))
				{
					return;
				}

				// Refresh forms sizes
				forms.each(function(i)
				{
					var form = $(this),
						hidden = form.is(':hidden'),
						height = form.show().outerHeight();

					// Store size
					form.data('height', height);

					// If not active
					if (hidden)
					{
						// Hide for now
						form.hide();
					}
				});

				// Clear messages
				formWrapper.clearMessages();

				// If an animation is already running
				if (animInt)
				{
					clearTimeout(animInt);
				}
				formViewport.stop(true);

				// Update active button
				currentForm.data('button').removeClass('active');
				link.addClass('active');

				// Set as current
				currentForm = form;

				// if CSS transitions are available
				if (doc.hasClass('csstransitions'))
				{
					// Close doors - step 1
					doors.removeClass('door-closed').addClass('door-down');
					animInt = setTimeout(function()
					{
						// Close doors, step 2
						doors.addClass('door-closed');
						animInt = setTimeout(function()
						{
							// Hide previous form
							previousForm.hide();

							// Show target form
							form.show();

							// Center layout
							centerForm(form, true);

							// Height of viewport
							formViewport.animate({
								height: form.data('height')+'px'
							}, function()
							{
								// Open doors, step 1
								doors.removeClass('door-closed');
								animInt = setTimeout(function()
								{
									// Open doors - step 2
									doors.removeClass('door-down');
								}, 300);
							});
						}, 300);
					}, 300);
				}
				else
				{
					// Close doors
					topDoor.animate({ top: '0%' }, 300);
					botDoor.animate({ top: '50%' }, 300, function()
					{
						// Hide previous form
						previousForm.hide();

						// Show target form
						form.show();

						// Center layout
						centerForm(form, true);

						// Height of viewport
						formViewport.animate({
							height: form.data('height')+'px'
						}, {

							/* IE7 is a bit buggy, we must force redraw */
							step: function(now, fx)
							{
								topDoor.hide().show();
								botDoor.hide().show();
								formSwitch.hide().show();
							},

							complete: function()
							{
								// Open doors
								topDoor.animate({ top: '-50%' }, 300);
								botDoor.animate({ top: '105%' }, 300);
								formSwitch.hide().show();
							}
						});
					});
				}
			});

			// Initial vertical adjust
			centerForm(currentForm, false);

			/*
			 * Center function
			 * @param jQuery form the form element whose height will be used
			 * @param boolean animate whether or not to animate the position change
			 * @param string|element|array any jQuery selector, DOM element or set of DOM elements which should be ignored
			 * @return void
			 */
			function centerForm(form, animate, ignore)
			{
				// If layout is centered
				if (centered)
				{
					var siblings = formWrapper.siblings().not('.closing'),
						finalSize = blocHeight+form.data('height');

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
					container[animate ? 'animate' : 'css']({ marginTop: -Math.round((finalSize/2)+20)+'px' });
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
				centerForm(currentForm, true, 'fast');

				// Watch for closing and show with effect
				message.bind('endfade', function(event)
				{
					// This will be called once the message has faded away and is removed
					centerForm(currentForm, true, message.get(0));

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
				centerForm(currentForm, true, 'fast');

				// Watch for closing and show with effect
				message.bind('endfade', function(event)
				{
					// This will be called once the message has faded away and is removed
					centerForm(currentForm, true, message.get(0));

				}).hide().slideDown('fast');
			};
		});

	</script>

</body>
</html>