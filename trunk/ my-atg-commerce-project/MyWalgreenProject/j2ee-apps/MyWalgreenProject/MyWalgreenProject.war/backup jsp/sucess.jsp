<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<%@ taglib uri = "http://java.sun.com/jstl/core" prefix = "c"%>
<%@ page import="atg.servlet.*"%>
<dsp:page>
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Welcome to the Success Page</title>
	</head>
	<body>

	<dsp:importbean bean="/atg/droplets/LoginDroplet" />
	<dsp:droplet name="LoginDroplet">
		<dsp:oparam name="output"><I>
	Hello 
	<dsp:valueof param="user"></dsp:valueof><br>
	Welcome to the Success Page
	
	<br><dsp:getvalueof id="userName" param="user" idtype="java.lang.String"></dsp:getvalueof><b><br>
	This is from using user:
	<c:out value="${userName}"/><br>
	
	<br><dsp:getvalueof var="map" param="HashMap" vartype="java.util.HashMap"></dsp:getvalueof>
	This is from using HashMap:
	<c:out value="${map}"/><br>
	
	<b><dsp:setvalue param="user" value="Monu Singh"/>
	<dsp:valueof param="user"></dsp:valueof>
	
	<dsp:droplet name="/atg/dynamo/droplet/ForEach">
	<dsp:param name="array" param="HashMap"/>
	<dsp:oparam name="output"><b><br>
	<dsp:setvalue param="HashMap" paramvalue="element"/><br>
	</dsp:oparam>
	</dsp:droplet>	
	
	</dsp:oparam>
	</dsp:droplet>
	
		
		
		<!--<dsp:droplet name="/atg/dynamo/droplet/Switch">
				<dsp:param param="user" name="value" />
				<dsp:oparam name="Sonu"><br><b>
				Welcome User
				</dsp:oparam>
				<dsp:oparam name="default">
				User!!! You are not welcome.
				</dsp:oparam>
			</dsp:droplet>
	
	
	--><!--<dsp:droplet name="/atg/dynamo/droplet/ForEach">
	<dsp:param name="array" param="HashMap"/>
	<dsp:oparam name="output"><b>
	<dsp:include page="details.jsp">
	<dsp:param name="UserDetails" param="HashMap"/>
	<dsp:valueof param="key"></dsp:valueof>
	<dsp:valueof param="element"></dsp:valueof><br>
	</dsp:include>
	</dsp:oparam>
	</dsp:droplet>
	
	  -->
	
	
	<dsp:a href="${map}"/>
	

	<!--<dsp:droplet name="/atg/dynamo/droplet/Range">
	<dsp:param name="array" param="HashMap"/>
	<dsp:param name="howMany" value="8"/>
	<dsp:param name="sortProperties" value="+_key"/><b>
	<dsp:oparam name="output">
	<br><dsp:valueof param="key"></dsp:valueof>
	<dsp:valueof param="element"></dsp:valueof><br>
	</dsp:oparam>
	</dsp:droplet>
	
	-->
	
	
	<dsp:droplet name="/atg/dynamo/droplet/IsEmpty">
	<dsp:param param="HashMap" name="value"/>
	<dsp:oparam name="false">
		The values are:
	
	<dsp:droplet name="/atg/dynamo/droplet/ForEach">
	<dsp:param name="array" param="HashMap"/>
	<dsp:oparam name="output">
		<dsp:valueof param="key"></dsp:valueof>
		<dsp:valueof param="element"></dsp:valueof>
	</dsp:oparam>
	</dsp:droplet>
	</dsp:oparam>
	
	<dsp:oparam name="true">
	There are no values in the Map.
	</dsp:oparam>
	</dsp:droplet>
	
	
	
	
	<!--<br><c:out value="${userName}"/>
	<br><c:out value="${map}"/>
	
	--><!--<dsp:droplet name="/atg/dynamo/droplet/IsNull">
	<dsp:param param="userName" name="value"/>
	<dsp:oparam name="true">
		String is null
	</dsp:oparam>
	<dsp:oparam name="false">
	Yes the name is Sonu and String is not null
	</dsp:oparam>
	</dsp:droplet>

	-->
	
	<c:out value="${map}"/><br>
	
	<br><c:out value="${userName}"/><br>

	

	</body>
	</html>
</dsp:page>