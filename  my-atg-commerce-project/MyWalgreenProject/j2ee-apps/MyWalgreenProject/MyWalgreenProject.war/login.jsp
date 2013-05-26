<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<title>ATG Login Page</title>
</head>
<dsp:page>
	<dsp:importbean bean="/atg/userprofiling/Profile" />
	<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler" />
	<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty" />
	<dsp:importbean bean="/atg/dynamo/droplet/IsNull" />
	<dsp:importbean bean="/atg/dynamo/droplet/Switch" />
	<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach" />
	<body>
	<div>
	<div>ATG out of the box authentication capability.</div>
	<br />
	<dsp:form formid="loginForm" method="post">
		<div>
		<div>Please enter your user id and password below</div>
		<table>
			<tbody>

				<tr>
					<td width="150">User ID:</td>
					<td><dsp:input bean="ProfileFormHandler.value.login"
						maxlength="30" size="25" type="text" required="true" /></td>
				</tr>

				<tr>
					<td>Password:</td>
					<td><dsp:input bean="ProfileFormHandler.value.password"
						maxlength="30" size="25" type="password" required="true" /></td>
				</tr>

				<tr>
					<td>&nbsp;</td>
					<td><dsp:droplet name="/atg/dynamo/droplet/IsEmpty">
						<dsp:param name="value" bean="Profile.Login" />
						<dsp:oparam name="false">
							<dsp:input bean="ProfileFormHandler.logout" type="submit"
								value="Log Out" />
						</dsp:oparam>
						<dsp:oparam name="true">
							<dsp:input bean="ProfileFormHandler.login" type="submit"
								value="Log In" />
						</dsp:oparam>
					</dsp:droplet> <dsp:droplet name="/atg/dynamo/droplet/Switch">
						<dsp:param name="value" param="shipping" />
						<dsp:oparam name="shipping">
							<dsp:input bean="ProfileFormHandler.loginSuccessURL"
								type="hidden" value="checkout/shipping.jsp" />
						</dsp:oparam>
						<dsp:oparam name="payment">
							<dsp:input bean="ProfileFormHandler.loginSuccessURL"
								type="hidden" value="checkout/payment_info_returning.jsp" />
						</dsp:oparam>
						<dsp:oparam name="default">
							<dsp:input bean="ProfileFormHandler.loginSuccessURL"
								type="hidden" value="home.jsp" />
							<dsp:input bean="ProfileFormHandler.logoutSuccessURL"
								type="hidden" value="home.jsp" />	
						</dsp:oparam>
					</dsp:droplet> <dsp:input bean="ProfileFormHandler.loginErrorURL" type="hidden"
						value="fail.jsp" /></td>
				</tr>
				<tr>

					<td colspan="2">
					<ul>
						<dsp:droplet name="ErrorMessageForEach">
							<dsp:param bean="ProfileFormHandler.formExceptions"
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

	</dsp:form></div>

	</body>
</dsp:page>
</html>
