<%@ page import="atg.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<dsp:page>
	<dsp:importbean bean="/atg/dynamo/Configuration" />
	<dsp:importbean bean="/atg/formhandler/SearchFormHandler" />
	<dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
		<dsp:param name="exceptions" bean="SearchFormHandler.formExceptions" />
		<dsp:oparam name="output">
			<b> <dsp:valueof param="message" /> </b>
			<p>
		</dsp:oparam>
	</dsp:droplet>

	<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<title>Buy from home || get at your doorstep</title>
	<link href="http://fonts.googleapis.com/css?family=Oswald"
		rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="style.css" />
	<script type="text/javascript" src="jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="jquery.dropotron-1.0.js"></script>
	<script type="text/javascript" src="init.js"></script>
	<script type="text/javascript">
	/***********************************************
	 * Dynamic Ajax Content- © Dynamic Drive DHTML code library (www.dynamicdrive.com)
	 * This notice MUST stay intact for legal use
	 * Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
	 ***********************************************/

	var bustcachevar = 1
	//bust potential caching of external pages after initial request? (1=yes, 0=no)
	var loadedobjects = ""
	var rootdomain = "http://" + window.location.hostname
	var bustcacheparameter = ""

	function ajaxpage(url, containerid) {
		var page_request = false
		if (window.XMLHttpRequest) // if Mozilla, Safari etc
			page_request = new XMLHttpRequest()
		else if (window.ActiveXObject) { // if IE
			try {
				page_request = new ActiveXObject("Msxml2.XMLHTTP")
			} catch (e) {
				try {
					page_request = new ActiveXObject("Microsoft.XMLHTTP")
				} catch (e) {
				}
			}
		} else
			return false
		page_request.onreadystatechange = function() {
			loadpage(page_request, containerid)
		}
		if (bustcachevar) //if bust caching of external page
			bustcacheparameter = (url.indexOf("?") != -1) ? "&"
					+ new Date().getTime() : "?" + new Date().getTime()
		page_request.open('GET', url + bustcacheparameter, true)
		page_request.send(null)
	}

	function loadpage(page_request, containerid) {
		if (page_request.readyState == 4
				&& (page_request.status == 200 || window.location.href
						.indexOf("http") == -1))
			document.getElementById(containerid).innerHTML = page_request.responseText
	}

	function loadobjs() {
		if (!document.getElementById)
			return
		for (i = 0; i < arguments.length; i++) {
			var file = arguments[i]
			var fileref = ""
			if (loadedobjects.indexOf(file) == -1) { //Check to see if this object has not already been added to page before proceeding
				if (file.indexOf(".js") != -1) { //If object is a js file
					fileref = document.createElement('script')
					fileref.setAttribute("type", "text/javascript");
					fileref.setAttribute("src", file);
				} else if (file.indexOf(".css") != -1) { //If object is a css file
					fileref = document.createElement("link")
					fileref.setAttribute("rel", "stylesheet");
					fileref.setAttribute("type", "text/css");
					fileref.setAttribute("href", file);
				}
			}
			if (fileref != "") {
				document.getElementsByTagName("head").item(0).appendChild(
						fileref)
				loadedobjects += file + " " //Remember this object as being already added to page
			}
		}
	}
</script>

	</head>
	<body>
	<div id="wrapper">
	<div id="splash"><img src="images/pic1.jpg" alt="" /></div>

	<div id="menu"><dsp:droplet
		name="/atg/commerce/catalog/CategoryLookup">
		<dsp:param name="id" value="cat10002" />
		<dsp:oparam name="output">
			<ul>

				<dsp:droplet name="/atg/dynamo/droplet/ForEach">
					<dsp:param name="array" param="element.childCategories" />
					<dsp:param name="elementName" value="category" />
					<dsp:oparam name="output">
						<!-- Display Categories like WholeBikes,Parts etc -->
						<li><dsp:valueof param="category.displayName" /> <span
							class="arrow"></span>
						<ul>
							<dsp:droplet name="/atg/dynamo/droplet/ForEach">
								<dsp:param name="array" param="category.childCategories" />
								<dsp:param name="elementName" value="subCategory" />
								<dsp:oparam name="output">
									<!-- Display Sub Categories -->
									<li><dsp:a href="searchResult.jsp">
										<dsp:valueof param="subCategory.displayName" />
										<br class="clearfix" />
										<dsp:param name="subCategoryId"
											param="subCategory.id" />
									</dsp:a>
								</dsp:oparam>
							</dsp:droplet>
						</ul>
					</dsp:oparam>
				</dsp:droplet>
			</ul>
		</dsp:oparam>
	</dsp:droplet></div>
	<div id="header">
	<div id="logo">
	<h3><dsp:a href="javascript:ajaxpage('registration.jsp', 'page');">New User?</dsp:a>
	&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"> Sign In</a>
	&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">Checkout
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></h3>
	</div>
	<div id="search">
	<form action="" method="post">
	<div><dsp:form>
		<dsp:input type="text" bean="SearchFormHandler.searchText"
			value="Enter Product Name" name="search" size="32" maxlength="64"
			onclick="this.value=''" />
		<dsp:input type="submit" value="Search"
			bean="SearchFormHandler.submit" />
	</dsp:form></div>
	</form>
	</div>
	</div>
	<div id="page">
	<div id="content">
	<div class="box">
	<h2>Welcome &nbsp;&nbsp; to&nbsp;&nbsp;&nbsp;  <a href="www.walgreens.com">Walgreens.com</a></h2>

	</div>
	<!--<div id="col1">
	<h3></h3>
	</div>
	<div id="col2">
	<h3></h3>
	</div>
	--><br class="clearfix" />
	</div>
	<!--<div id="sidebar">
	<div class="box">
	<h3></h3>
	</div>
	<div class="box">
	<h3></h3>
	</div>
	</div>
	--><br class="clearfix" />
	</div>
	</div>
	<div id="footer">&copy; 2012 Walgreens | Powered by <a
		href="http://www.walgreens.com">Walgreens</a> | Design by <a
		href="http://www.cognizant.com">Cognizant</a></div>
	</body>
</dsp:page>
</html>
