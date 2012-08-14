<html class="linen">
<head>
	<style>
		/* styles from reset.css */
		html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre,
		abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp,
		small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li,
		fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td,
		article, aside, canvas, details, figcaption, figure,  footer, header, hgroup,
		menu, nav, section, summary, time, mark, audio, video {
		  margin:0;
		  padding:0;
		  border:0;
		  outline:0;
		  font-size:100%;
		  vertical-align:baseline;
		  background:transparent;
		}
		body { font:13px/1.231 sans-serif; *font-size:small; }
		h3 {
			font-weight: 500;
			font-size: 21px;
			line-height: 36px;
			margin: 30px 0 20px;
		}
		.align-center	{ text-align: center; }
		.blue-gradient{
			color: white !important;
			background: #00438d url(../images/old-browsers/colors/bg_blue-gradient.png) repeat-x;
			-webkit-background-size: 100% 100%;
			-moz-background-size: 100% 100%;
			-o-background-size: 100% 100%;
			background-size: 100% 100%;
			background: -webkit-gradient(linear, left top, left bottom, from(#006aac), to(#00438d));
			background: -webkit-linear-gradient(top, #006aac, #00438d);
			background: -moz-linear-gradient(top, #006aac, #00438d);
			background: -ms-linear-gradient(top, #006aac, #00438d);
			background: -o-linear-gradient(top, #006aac, #00438d);
			background: linear-gradient(top, #006aac, #00438d);
			border-color: #004795;
		}
		.message{
			display: block;
			position: relative;
			border-width: 1px;
			border-style: solid;
			line-height: 16px;
			-webkit-background-clip: padding-box;
			-webkit-border-radius: 4px;
			-moz-border-radius: 4px;
			border-radius: 4px;
			-webkit-box-shadow: inset 0 1px 0 white, 0 1px 5px rgba(0, 0, 0, 0.3);
			-moz-box-shadow: inset 0 1px 0 white, 0 1px 5px rgba(0, 0, 0, 0.3);
			box-shadow: inset 0 1px 0 white, 0 1px 5px rgba(0, 0, 0, 0.3);
			padding: 6px 8px;
			-webkit-border-radius: 3px;
			-moz-border-radius: 3px;
			border-radius: 3px;
			color: black;
		}
		.wrapped {
			display: block;
			border-width: 1px;
			border-style: solid;
			padding: 10px;
			-webkit-border-radius: 7px;
			-moz-border-radius: 7px;
			border-radius: 7px;
			background: #e3e5ea;
			color: #666666;
			border-color: #cccccc;
		}
		.relative { position: relative; }
		.block, details.details {
	border: 1px solid #bfbfbf;
	position: relative;
	background-color: white;
	color: #666666;
	-webkit-border-radius: 9px;
	-moz-border-radius: 9px;
	border-radius: 9px;
	}
	.block-title, details.details > summary {
		display: block;
		position: relative;
		padding: 18px 19px;
		border-bottom-width: 1px;
		border-bottom-style: solid;
		-webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.75), 0 1px 1px rgba(0, 0, 0, 0.15);
		-moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.75), 0 1px 1px rgba(0, 0, 0, 0.15);
		box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.75), 0 1px 1px rgba(0, 0, 0, 0.15);
		-webkit-text-shadow: 0 1px 0 white;
		-moz-text-shadow: 0 1px 0 white;
		text-shadow: 0 1px 0 white;
		}
		.block-title {
			-webkit-border-top-left-radius: 8px;
			-webkit-border-top-right-radius: 8px;
			-moz-border-radius-topleft: 8px;
			-moz-border-radius-topright: 8px;
			border-top-left-radius: 8px;
			border-top-right-radius: 8px;
		}
		h3.block-title {
			padding: 15px 19px;
			margin: 0;
		}
.eight-columns	{ width: 64%; margin-left: 18%; padding: 0; margin-right: 18%; margin-top: 42px; margin-bottom: 42px;}
.with-padding {padding: 20px;}
.linen {
	color: white;
	border-color: #929ba6;
	background: #a7b2be url(<cfoutput>#URLFor(controller="images", action="textures", key="fabric.png", onlyPath=false)#</cfoutput>);
}
	</style>
</head>
<body>
<div class="block eight-columns">
	<h3 class="block-title message align-center blue-gradient">Welcome To Contestate!</h3>
	<div class="with-padding">
		<p>We send this email to give you some initial information about <cfoutput>#LinkTo(route="home", text="Contestate", onlyPath=false)#</cfoutput>, confirm your email address and to securely set your password, to do so <cfoutput>#LinkTo(controller="homepage", action="emailreset", key=params.resetkey, text="Click Here!", onlyPath=false)#</cfoutput> (this link will expire in 24 hours, if you wait longer than that just go to the <cfoutput>#linkTo(route="login", anchor="form-password", text="Login Page", onlyPath=false)#</cfoutput> and request to reset your password)</p>
		<br/>
		<p>Currently <cfoutput>#LinkTo(route="home", text="Contestate", onlyPath=false)#</cfoutput> is in open alpha state and as at such we cannot guarantee that you will keep your data (we will do our best thou!) and we would be very grateful if you could report any bugs you find to the <a href="https://github.com/SimeonC/contestate/issues">Contestate Github Repository</a></p>
		<p>If you have trouble or a request feel free to email us <a href="mailto:info@contestate.net">info@contestate.net</a>, I will be putting up tutorial videos on <cfoutput>#LinkTo(route="home", text="contestate.net", onlyPath=false)#</cfoutput> as I get the time to make them.</p>
		<br/>
		<p>Thanks for signing up,<br/>
		The Contestate Team.</p>
	</div>
</body>
</html>