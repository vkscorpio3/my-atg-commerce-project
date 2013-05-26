<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="atg.servlet.*"%>
<dsp:page>

	<dsp:importbean bean="/atg/dynamo/Configuration" />
	<dsp:importbean bean="/atg/formhandler/LoginFormHandler" />
	<head>
	<title>MyWalgreenProject JSP Index Page</title>
	</head>
	<h1>MyWalgreenProject Test JSP Page</h1>

	<dsp:getvalueof id="backcolor" bean="LoginFormHandler.color" scope="page"/>

	<dsp:form>


		<dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
			<dsp:param name="exceptions" bean="LoginFormHandler.formExceptions" />
			<dsp:oparam name="output">
				<b> <dsp:valueof param="message" /> </b>
				<p>
			</dsp:oparam>
		</dsp:droplet>
		
		<dsp:input bean="LoginFormHandler.color" type="text" />
		<dsp:input bean="LoginFormHandler.submit" type="submit" />
		
	</dsp:form>
		Selected Color:
	<b><c:out value="${backcolor}"></c:out></b>
		<br>


	<body bgcolor="${backcolor}">
		
	<dsp:setvalue param="backcolor" value="red" />
	<p>My Color:</p>
	<dsp:valueof param="backcolor"></dsp:valueof>
	</body>
</dsp:page>
<%-- @version $Id: //product/Eclipse/main/plugins/atg.project/templates/index.jsp#1 $$Change: 425088 $--%>
