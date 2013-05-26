<%@ page import="atg.servlet.*"%>
<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<dsp:page>
	<dsp:importbean bean="/atg/formhandler/ViewCartFormHandler" />
	<dsp:importbean bean="/atg/droplet/ViewCartDroplet" />
	<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
	<dsp:importbean bean="/atg/dynamo/droplet/Switch" />
	<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty" />
	<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<title>Buy from home || get at your doorstep</title>
	<link href="http://fonts.googleapis.com/css?family=Oswald"
		rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="ajax.js"></script>
	<script src="jquery-1.7.1.min.js"></script>
	<script type="text/javascript">
	function changeLocation(val) {
		var xmlhttp;
		var object;
		if (window.XMLHttpRequest)
		  {// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		  }
		else
		  {// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
		xmlhttp.onreadystatechange=function()
		  {
		  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		    {
			    var obj=JSON.parse(xmlhttp.responseText);
		    	$("#div1").load(obj.result.div1);		    	
		    	$("#div2").load(obj.result.div2);		    	
		    	$("#div3").load(obj.result.div3);		    	
		    	//document.getElementById("div3").innerHTML=obj.result.div3;
		    }
		  }
		xmlhttp.open("GET","result.jsp?optionVal="+val,true);
		xmlhttp.send();
	}
</script>

	</head>
	<body>
	<div id="wrapper">
	<div id="splash"><img src="images/store.jpg" alt="" /></div>
	<div id="header">
	<div id="logo">
	<h3><dsp:form>
		<!--<dsp:input bean="ViewCartFormHandler.selectText" type="radio" value="A"
			onclick="javascript:ajaxpage1('login.jsp', 'div1','cart.jsp', 'div2','registration.jsp', 'div3');">A</dsp:input>
		-->
		<input name="optionRadio" type="radio"
			value="A" onclick="changeLocation(this.value);">A</input>

		<input name="optionRadio" type="radio"
			value="B" onclick="changeLocation(this.value);">B</input>

		<input name="optionRadio" type="radio"
			value="C" onclick="changeLocation(this.value);">C</input>

	</dsp:form></h3>
	</div>
	</div>
	</div>
	<div id="div1"></div>
	<div id="div2"></div>
	<div id="div3"></div>
	
	</body>
</dsp:page>
</html>
