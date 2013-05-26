<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<%@ page import="atg.servlet.*"%>
<dsp:page>

	<dsp:importbean bean="/atg/formhandler/RegistrationFormHandler" />
	<head>
	<title>Registration</title>
	</head>
	<h1 align="center">Registration</h1>

	<dsp:form>
		<center>
		<table border="5" width="500">
			<tr>
				<td>Login Id</td>
				<td><dsp:input bean="RegistrationFormHandler.userId"
					type="text" /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><dsp:input bean="RegistrationFormHandler.password"
					type="text" /></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><dsp:input bean="RegistrationFormHandler.userName"
					type="text" /></td>
			</tr>
			<tr>
				<td>Date Of Birth</td>
				<td><dsp:input bean="RegistrationFormHandler.dateOfBirth"
					type="text" /></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><dsp:input bean="RegistrationFormHandler.email" type="text" /></td>
			</tr>
			<tr>
				<td>Address</td>
				<td><dsp:input bean="RegistrationFormHandler.address"
					type="text" /></td>
			</tr>
			<tr>
				<td>Gender</td>
				<td><dsp:input bean="RegistrationFormHandler.sex" type="text" /></td>
			</tr>
			<tr><td></td>
				<td><dsp:input bean="RegistrationFormHandler.submit"
					type="Submit" value="Register" /></td>
			</tr>
		</table>
		</center>
	</dsp:form>
</dsp:page>