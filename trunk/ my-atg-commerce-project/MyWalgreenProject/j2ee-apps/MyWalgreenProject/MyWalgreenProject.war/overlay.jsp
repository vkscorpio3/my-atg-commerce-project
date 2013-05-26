<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<dsp:page>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Tutorial - Simple OverlayBox using JQuery - By Kalyan</title>
<script language="javascript" src="jquery-1.2.6.min.js"></script>
<style type="text/css">
body { font:76% verdana; }
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

<div class="bgCover">&nbsp;</div>
<div class="overlayBox">
	<div class="overlayContent">
        <a href="#" class="closeLink">Close</a>
		<dsp:include page="login.jsp"></dsp:include>
	</div>
</div>
<a href="#" class="launchLink">Launch Window</a>
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
</html>
</dsp:page>