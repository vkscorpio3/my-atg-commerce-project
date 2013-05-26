<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="atg.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>

<script type="text/javascript" src="overlay.js"></script>
<title>CSS and jQuery Tutorial: Overlay with Slide Out Box</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="overlayStyle.css" rel="stylesheet" type="text/css" />
<body>
<div class="overlay" id="overlay" style="display: none;"></div>
<div class="box" id="box"><a class="boxclose" id="boxclose"></a>
<h1>Important message</h1>
<p>Here comes a very important message for your user. Turn this
window off by clicking the cross.</p>
</div>
</body>
</html>