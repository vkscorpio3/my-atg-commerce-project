<%@ page import="atg.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<dsp:page>
	<dsp:importbean bean="/atg/userprofiling/Profile" />
	<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler" />
	<dsp:importbean bean="/atg/dynamo/Configuration" />
	<dsp:importbean bean="/atg/formhandler/SearchFormHandler" />
	<dsp:importbean bean="/atg/commerce/ShoppingCart" />
	<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
	<dsp:importbean bean="/atg/dynamo/droplet/Switch" />
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
	<script type="text/javascript" src="ajax.js"></script>
	<!--<script type="text/javascript"></script>-->
	<style type="text/css">
.bgCover { background:#000; position:absolute; left:0; top:0; display:none; overflow:hidden }
.overlayBox {
	border:5px solid #09F;
	position:absolute;
	display:none;
	width:500px;
	height:300px;
	background:#fff;
}
.overlayContent {
	padding:10px;
}
.closeLink {
	float:right;
	color:red;
}
a:hover { text-decoration:none; }

</style>
	</head>
	<body>
	<div id="wrapper">
	<div id="splash"><img src="images/store.jpg" alt="" /></div>
	<h5 align="right">
	<div>
	Welcome &nbsp;
		<dsp:droplet name="/atg/dynamo/droplet/IsEmpty">
						<dsp:param name="value" bean="Profile.Login" />
						<dsp:oparam name="false">
						<dsp:a href="profile/my_profile.jsp">
							<dsp:valueof bean="/atg/userprofiling/Profile.firstName"/>&nbsp;&nbsp;
							<dsp:valueof bean="/atg/userprofiling/Profile.lastName"/>
						</dsp:a>
						</dsp:oparam>
						<dsp:oparam name="true">
							<dsp:valueof value="Guest"/>
						</dsp:oparam>
	</dsp:droplet>
	&nbsp;&nbsp;&nbsp;
	</div>
	</h5>
	<div id="menu"><dsp:droplet
		name="/atg/commerce/catalog/CategoryLookup">
		<dsp:param name="id" value="cat10002" />
		<dsp:oparam name="output">
			<ul>

				<dsp:droplet name="ForEach">
					<dsp:param name="array" param="element.childCategories" />
					<dsp:param name="elementName" value="category" />
					<dsp:oparam name="output">
						<!-- Display Categories like WholeBikes,Parts etc -->
						<li><dsp:a href="searchResult.jsp">
							<dsp:valueof param="category.displayName" />
							<dsp:param name="subCategoryId" param="category.id" />
							<span class="arrow"></span>
						</dsp:a>
						<ul>
							<dsp:droplet name="/atg/dynamo/droplet/ForEach">
								<dsp:param name="array" param="category.childCategories" />
								<dsp:param name="elementName" value="subCategory" />
								<dsp:oparam name="output">
									<!-- Display Sub Categories -->
									<li><dsp:a href="searchResult.jsp">
										<dsp:valueof param="subCategory.displayName" />
										<dsp:droplet name="/atg/dynamo/droplet/IsEmpty">
											<dsp:param name="value" param="subCategory.childCategories" />
											<dsp:oparam name="false">
												<span class="arrow"></span>
											</dsp:oparam>
										</dsp:droplet>
										<br class="clearfix" />
										<dsp:param name="subCategoryId" param="subCategory.id" />
									</dsp:a> <dsp:droplet name="/atg/dynamo/droplet/IsEmpty">
										<dsp:param name="value" param="subCategory.childCategories" />
										<dsp:oparam name="true">
											<ul></ul>
										</dsp:oparam>
										<dsp:oparam name="false">
											<ul>
												<dsp:droplet name="/atg/dynamo/droplet/ForEach">
													<dsp:param name="array" param="subCategory.childCategories" />
													<dsp:param name="elementName" value="childSubCategory" />
													<dsp:oparam name="output">
														<!-- Display Sub categories of Sub Categories -->
														<li><dsp:a href="searchResult.jsp">
															<dsp:valueof param="childSubCategory.displayName" />
															<br class="clearfix" />
															<dsp:param name="subCategoryId"
																param="childSubCategory.id" />
														</dsp:a>
													</dsp:oparam>
												</dsp:droplet>
											</ul>
										</dsp:oparam>
									</dsp:droplet>
								</dsp:oparam>
							</dsp:droplet>
						</ul>
					</dsp:oparam>
				</dsp:droplet>
			</ul>
		</dsp:oparam>
	</dsp:droplet>
	</div>
	<div id="header">
	<div id="logo">
	<h3><dsp:a href="javascript:ajaxpage('registration.jsp', 'page');">New User?</dsp:a>
	&nbsp;&nbsp;&nbsp;&nbsp;
	
	<dsp:droplet name="/atg/dynamo/droplet/IsEmpty">
						<dsp:param name="value" bean="Profile.Login" />
						<dsp:oparam name="false">
							<!--<dsp:a
		href="javascript:ajaxpage('login.jsp', 'page');"> Sign Out</dsp:a>-->
		<a href="#" class="launchLink">Sign Out</a>
						</dsp:oparam>
						<dsp:oparam name="true">
							<!--<dsp:a
		href="javascript:ajaxpage('login.jsp', 'page');"> Sign In</dsp:a>-->
		<a href="#" class="launchLink">Sign In</a>
						</dsp:oparam>
	</dsp:droplet>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<dsp:a
		href="javascript:ajaxpage('cart.jsp', 'page');">Checkout
	</dsp:a>
	&nbsp;&nbsp;&nbsp;&nbsp; <a
		href="javascript:ajaxpage('cart.jsp', 'page');">Cart</a> 
	<dsp:droplet
		name="Switch">
		<dsp:param bean="ShoppingCart.current.CommerceItemCount" name="value" />
		<dsp:oparam name="0">
			<dsp:valueof value="(empty)"/>
		</dsp:oparam>
		<dsp:oparam name="default">
		<dsp:valueof value="("/>
		<dsp:valueof bean="ShoppingCart.current.CommerceItemCount"/>
		<dsp:valueof value=")"/>
		</dsp:oparam>
	</dsp:droplet> 
	
	</h3>
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
	<div id="page"><dsp:include page="fg/fg_page.jsp"></dsp:include>
	</div>
	</div>
	<div id="footer">&copy; 2012 Walgreens | Powered by <a
		href="http://www.walgreens.com">Walgreens</a> | Design by <a
		href="http://www.cognizant.com">Cognizant</a></div>
	<div class="bgCover">&nbsp;</div>
<div class="overlayBox">
	<div class="overlayContent">
        <a href="#" class="closeLink">Close</a>
		<dsp:include page="login.jsp"></dsp:include>
	</div>
</div>

<script language="javascript">

function showOverlayBox() {
	//if box is not set to open then don't do anything
	if( isOpen == false ) return;
	// set the properties of the overlay box, the left and top positions
	$('.overlayBox').css({
		display:'block',
		left:( $(window).width() - $('.overlayBox').width() )/2,
		top:( $(window).height() - $('.overlayBox').height() )/2 -20,
		position:'absolute'
	});
	// set the window background for the overlay. i.e the body becomes darker
	$('.bgCover').css({
		display:'block',
		width: $(window).width(),
		height:$(window).height(),
	});
}
function doOverlayOpen() {
	//set status to open
	isOpen = true;
	showOverlayBox();
	$('.bgCover').css({opacity:0}).animate( {opacity:0.5, backgroundColor:'#000'} );
	// dont follow the link : so return false.
	return false;
}
function doOverlayClose() {
	//set status to closed
	isOpen = false;
	$('.overlayBox').css( 'display', 'none' );
	// now animate the background to fade out to opacity 0
	// and then hide it after the animation is complete.
	$('.bgCover').animate( {opacity:0}, null, null, function() { $(this).hide(); } );
}
// if window is resized then reposition the overlay box
$(window).bind('resize',showOverlayBox);
// activate when the link with class launchLink is clicked
$('a.launchLink').click( doOverlayOpen );
// close it when closeLink is clicked
$('a.closeLink').click( doOverlayClose );

</script>
	</body>
</dsp:page>
</html>
