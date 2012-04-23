<!doctype html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8">
		<title>{{ store.name }} &bull; {{ page.name }}</title>
		<meta name="description" content="{{ page.meta_description }}" />
		<meta name="keywords" content="{{ page.meta_keywords }}" />
		<link href="/products.rss" rel="alternate" title="Products RSS Feed" type="application/rss+xml" />
		<meta name="author" content="Richard Caraballo,Timothy Caraballo">
		<meta name="viewport" content="width=device-width">
		<link href="http://monobomb.com/favicon.ico" type="image/x-icon" rel="icon" />
		<link href="http://monobomb.com/favicon.ico" type="image/x-icon" rel="shortcut icon">
		<link href="http://monobomb.com/favicon.ico" rel="apple-touch-icon">
		<link href="http://monobomb.com/favicon.ico" rel="apple-touch-icon-precomposed">
		<link rel="stylesheet" href="http://monobomb.com/css/Tex-Gyre-Adventor/stylesheet.css?v=2">
		<link href="{{ theme | theme_css_url }}" rel="Stylesheet" type="text/css" />
		<script src="{{ 'prototype' | theme_js_url }}" type="text/javascript"></script>
		<script src="{{ 'effects' | theme_js_url }}" type="text/javascript"></script>
		<!-- <script src="{{ 'store' | theme_js_url }}" type="text/javascript"></script> -->
		<script src="{{ 'fancyzoom' | theme_js_url }}" type="text/javascript"></script>
		<script src="{{ 'api' | theme_js_url }}" type="text/javascript"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
		<script type="text/javascript">
			$j = jQuery.noConflict();

			(function ($) {
				$(document).ready(function () {
					setupZoom();
				});
			}($j));
		</script>
		<script type="text/javascript" charset="utf-8">
		/*
			Store.currency_sign  = "{{ store.currency.sign }}";
			Store.item_singular  = "item";
			Store.item_plural  = "items";
			Store.discount_off  = "% off";
			Store.show_shipping = {{ cart.shipping.enabled }};
			*/
		</script>
		{{ head_content }}
		<script src="http://monobomb.com/js/libs/modernizr.custom.08729.js"></script>
		<!--[if lt IE 9]>
			<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	</head>
	<body id="{{ page.permalink }}">
		<div id="push_wrapper">
			<header><div class="wrapper">
				<nav>
					<ul>
						<li><a href="http://monobomb.com" class="about">monobomb.com</a></li>
						<li><a href="/contact" class="contact-us">Contact Us</a></li>
					</ul>
				</nav>
				<div id="cart-notice">
					<a href="/cart" class="cart-icon">Vew cart</a>
					<span id="cart-message">You have <span class="count">{{ cart.item_count | pluralize: 'item', 'items' }}</span> in your cart.</span>
				</div>
			</div></header>
			<section id="content">
				<header><div class="wrapper"><a href="/" class="where-to home">Home</a> <img src="http://monobomb.com/shop/images/logo.png" alt="monobomb" width="155" height="119"></div></header>
				<div class="wrapper main">
					{% if errors != blank %}
					<div id="error" class="error">
						<ul>
							{% for error in errors %}<li>{{ error }}</li>{% endfor %}
						</ul>
					</div>
					{% endif %}

					{% if page.category == 'custom' %}
					{{ page_content | paragraphs }}
					{% else %}
					{{ page_content }}
					{% endif %}
				</div>
			</section>
			<footer><div class="wrapper">&copy; 2012 monobomb records</div></footer>
		</div>
		<!--[if lt IE 7 ]>
			<script src="http://monobomb.comjs/libs/dd_belatedpng.js"></script>
			<script> DD_belatedPNG.fix('img'); </script>
		<![endif]-->
		<!--[if (gte IE 6)&(lte IE 8)]>
			<script src="http://monobomb.com/js/nwmatcher-1.2.5.js"></script>
			<script type="text/javascript" src="http://monobomb.com/js/selectivizr-min.js"></script>
		<![endif]-->
	</body>
</html>
