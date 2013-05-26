<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>User Registration Page</title>
</head>

<body>
<dsp:page>
	<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach" />
	<dsp:form id="registerForm" method="post" action="user.jsp">
		<div>
		<br />
		<table>
			<tbody>
				<tr>
					<td width="150">User Id *</td>
					<td><dsp:input bean="UserProfileFormHandler.value.firstName"
						maxlength="30" size="25" type="text" required="true" /></td>
				</tr>

				<tr>
					<td>Name *</td>
					<td><dsp:input bean="UserProfileFormHandler.value.login"
						maxlength="30" size="25" type="text" required="true" /></td>
				</tr>

				<tr>
					<td>Password *</td>
					<td><dsp:input bean="UserProfileFormHandler.value.password"
						maxlength="30" size="25" type="password" required="true" /></td>
				</tr>

				<tr>
					<td>Confirm Password *</td>
					<td><dsp:input bean="UserProfileFormHandler.value.password"
						maxlength="30" size="25" type="password" required="true" /></td>
				</tr>

				<tr>
					<td>Email ID *</td>
					<td><dsp:input bean="UserProfileFormHandler.value.email"
						maxlength="30" size="25" type="password" required="true" /></td>
				</tr>

				<tr>
					<td>Gender *</td>
					<td><dsp:input bean="UserProfileFormHandler.value.gender"
						type="radio" required="true">Male </dsp:input> <dsp:input
						bean="UserProfileFormHandler.value.gender" type="radio"
						required="true">Female </dsp:input></td>
				</tr>

				<tr>
					<td colspan="2"><dsp:input bean="UserProfileFormHandler.create"
						type="submit" value="Register" /> <dsp:input
						bean="UserProfileFormHandler.createSuccessURL" type="hidden"
						value="registrationSuccess.jsp" /></td>
				</tr>

				<tr>
					<td colspan="2">
					<ul>
						<dsp:droplet name="ErrorMessageForEach">
							<dsp:param bean="UserProfileFormHandler.formExceptions"
								name="exceptions" />
							<dsp:oparam name="output">
								<li><dsp:valueof param="message" /></li>
							</dsp:oparam>
						</dsp:droplet>
					</ul>
					</td>
				</tr>

			</tbody>
		</table>
		</div>
	</dsp:form>
</dsp:page>
</body>
</html>