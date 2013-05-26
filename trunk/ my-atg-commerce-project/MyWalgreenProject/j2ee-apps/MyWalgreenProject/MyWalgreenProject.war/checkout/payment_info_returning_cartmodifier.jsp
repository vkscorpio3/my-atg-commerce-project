<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<center><dsp:page>
<title>Payment and Billing</title>
	<dsp:importbean bean="/atg/commerce/ShoppingCart" />
	<dsp:importbean bean="/atg/commerce/order/ShoppingCartModifier" />
	<dsp:importbean	bean="/atg/commerce/order/purchase/CartModifierFormHandler" />
	<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
	<dsp:importbean bean="/atg/dynamo/droplet/Switch" />
	<dsp:importbean bean="/atg/userprofiling/Profile" />
	<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty" />

	<!------------------------------------------------------------------>
	<!-- This is used for customers who are on this site for the      -->
	<!-- For at least the second time.  Most likely they have credit  -->
	<!-- card objects stored.  They are given a list of credit        -->
	<!-- card objects that they can use to make this purchase.        -->
	<!------------------------------------------------------------------>
	<h2 align="right"><dsp:droplet name="/atg/dynamo/droplet/IsEmpty">
		<dsp:param name="value" bean="Profile.Login" />
		<dsp:oparam name="true">
			<dsp:a href="../login.jsp">
				<dsp:param name="shipping" value="payment" />
				<dsp:valueof value="Login" />
			</dsp:a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</dsp:oparam>
		<dsp:oparam name="false">
			Welcome &nbsp;
			<dsp:a href="#">
				<dsp:valueof bean="Profile.firstName" />&nbsp;<dsp:valueof
					bean="Profile.lastName" />
			</dsp:a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
		</dsp:oparam>
	</dsp:droplet></h2>
	<p><!-- Check to see if there are any errors on the form --> 
	<dsp:droplet
		name="/atg/dynamo/droplet/Switch">
		<dsp:param bean="CartModifierFormHandler.formError" name="value" />
		<dsp:oparam name="true">
			<font color=cc0000><strong>
			<ul>
				<dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
					<dsp:param bean="CartModifierFormHandler.formExceptions"
						name="exceptions" />
					<dsp:oparam name="output">
						<LI><dsp:valueof param="message" />
					</dsp:oparam>
				</dsp:droplet>
			</ul>
			</<strong></font>
		</dsp:oparam>
	</dsp:droplet>
	<p><dsp:form action="co_confirm.jsp" method="post">
		<table cellspacing=0 cellpadding=0 border=1 bgcolor="#B0C4DE">

			<!-- Setup gutter and make space -->


			<tr valign=top>

				<td>
				<h2 align="center" style="color: red">Payment method</h2>
				<!----------------------------------------------------------------->
				<!-- Iterate over the list of users credit card.  Display each   -->
				<!-- one so that the user can select it.  The value to be        -->
				<!-- returned is a key into the map of a users credit cards      -->
				<!----------------------------------------------------------------->

				<dsp:droplet name="ForEach">
					<dsp:param bean="Profile.creditCards" name="array" />
					<dsp:param name="elementName" value="creditCard" />
					<dsp:oparam name="output">
						<dsp:droplet name="Switch">
							<dsp:param name="value" param="count" />
							<dsp:oparam name="1">
								<dsp:input bean="CartModifierFormHandler.CreditCard"
									paramvalue="key" name="creditCardToUse" type="radio"
									checked="<%=true%>" />
							</dsp:oparam>
							<dsp:oparam name="default">
								<dsp:input bean="CartModifierFormHandler.CreditCard"
									paramvalue="key" name="creditCardToUse" type="radio" />
							</dsp:oparam>
						</dsp:droplet>
						<b><dsp:valueof converter="creditcard" param="key" /></b>
					</dsp:oparam>
				</dsp:droplet>
				PaymentGroup<dsp:valueof bean="CartModifierFormHandler.PaymentGroup"></dsp:valueof>
				<dsp:droplet name="ForEach">
					<dsp:param bean="CartModifierFormHandler.PaymentGroup"
						name="array" />
					<dsp:oparam name="output">
						<%-- For Billing Address --%>
						<table border=1 cellpadding=4 cellspacing=10 width=700
							align="center">
							<tr>
								<td colspan="2"><dsp:input
									bean="CartModifierFormHandler.CreditCard"
									name="creditCardToUse" type="radio" value="new" checked="true" /><b>New
								card below</b></td>
							</tr>
							<tr>
								<td><b>Billing Address</b></td>
								<td>
								<table border="2" cellspacing="5" bgcolor="#F0FFFF">
									<tr>
										<td align="center" colspan="2">Name</td>
										<td><dsp:droplet name="IsEmpty">
											<dsp:param
												bean="CartModifierFormHandler.CreditCard.Address.firstName"
												name="value" />
											<%-- paymentGroup can also be used instead of creditCardPaymentGroups[param:index] --%>
											<dsp:oparam name="false">
												<dsp:input
													bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.firstName"
													size="15" type="text" />
											</dsp:oparam>
											<dsp:oparam name="true">
												<dsp:input
													bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.firstName"
													beanvalue="Profile.billingAddress.firstName" size="15"
													type="text" />
											</dsp:oparam>
										</dsp:droplet> <dsp:droplet name="IsEmpty">
											<dsp:param
												bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.middleName"
												name="value" />
											<dsp:oparam name="false">
												<dsp:input
													bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.middleName"
													size="10" type="text" />
											</dsp:oparam>
											<dsp:oparam name="true">
												<dsp:input
													bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.middleName"
													beanvalue="Profile.billingAddress.middleName" size="10"
													type="text" />
											</dsp:oparam>
										</dsp:droplet> <dsp:droplet name="IsEmpty">
											<dsp:param
												bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.lastName"
												name="value" />
											<dsp:oparam name="false">
												<dsp:input
													bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.lastName"
													size="15" type="text" />
												<br>
											</dsp:oparam>
											<dsp:oparam name="true">
												<dsp:input
													bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.lastName"
													beanvalue="Profile.billingAddress.lastName" size="15"
													type="text" />
												<br>
											</dsp:oparam>
										</dsp:droplet></td>
									</tr>
									<tr>
										<td align="center" colspan="2">Street address</td>
										<td><dsp:droplet name="IsEmpty">
											<dsp:param
												bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.address1"
												name="value" />
											<dsp:oparam name="false">
												<dsp:input
													bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.address1"
													size="40" type="text" />
												<br>
											</dsp:oparam>
											<dsp:oparam name="true">
												<dsp:input
													bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.address1"
													beanvalue="Profile.billingAddress.address1" size="40"
													type="text" />
												<br>
											</dsp:oparam>
										</dsp:droplet></td>
									</tr>
									<tr>
										<dsp:droplet name="IsEmpty">
											<dsp:param
												bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.address2"
												name="value" />
											<dsp:oparam name="false">
												<td align="center" colspan="2">Address2</td>
												<dsp:input
													bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.address2"
													size="40" type="text" />
												<br>
											</dsp:oparam>
											<dsp:oparam name="true">
												<dsp:input
													bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.address2"
													beanvalue="Profile.billingAddress.address2" size="40"
													type="hidden" />
												<br>
											</dsp:oparam>
										</dsp:droplet>
									</tr>
									<tr>
										<td align="center" colspan="2">Zip Code</td>
										<td><dsp:droplet name="IsEmpty">
											<dsp:param
												bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.postalCode"
												name="value" />
											<dsp:oparam name="false">
												<dsp:input
													bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.postalCode"
													size="10" type="text" />
											</dsp:oparam>
											<dsp:oparam name="true">
												<dsp:input
													bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.postalCode"
													beanvalue="Profile.billingAddress.postalCode" size="10"
													type="text" />
											</dsp:oparam>
										</dsp:droplet></td>
									</tr>
									<tr>
										<td align="center" colspan="2">City</td>
										<td><dsp:droplet name="IsEmpty">
											<dsp:param
												bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.city"
												name="value" />
											<dsp:oparam name="false">
												<dsp:input
													bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.city"
													size="20" type="text" />
											</dsp:oparam>
											<dsp:oparam name="true">
												<dsp:input
													bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.city"
													beanvalue="Profile.billingAddress.city" size="20"
													type="text" />
											</dsp:oparam>
										</dsp:droplet></td>
									</tr>
									<tr>
										<td align="center" colspan="2">State</td>
										<td><dsp:droplet name="IsEmpty">
											<dsp:param
												bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.state"
												name="value" />
											<dsp:oparam name="true">
												<dsp:setvalue
													bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.state"
													beanvalue="Profile.billingAddress.state" />
											</dsp:oparam>
										</dsp:droplet> <dsp:select
											bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.state">
											<%@ include file="StatePicker.jspf"%>
										</dsp:select></td>
									</tr>
									<tr>
										<td align="center" colspan="2">Country</td>

										<td><dsp:setvalue
											bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.country"
											beanvalue="Profile.billingAddress.country" /> <dsp:select
											bean="CartModifierFormHandler.creditCardPaymentGroups[param:index].billingAddress.country">
											<dsp:option value="us">US</dsp:option>
										</dsp:select></td>
									</tr>
									<tr>
										<td align="center" colspan="2">Contact No.</td>
										<td><dsp:valueof
											bean="CartModifierFormHandler.shippingGroup.shippingAddress.phoneNumber" /></td>
									</tr>
									<tr></tr>
									<tr>
								</table>
								</td>
							</tr>
							<tr>
								<td><b>Credit Card</b></td>
								<td>
								<table border="2" cellspacing="5" bgcolor="#F5F5DC">
									<tr>
										<td>Card Type</td>
										<td><dsp:select
											bean="CartModifierFormHandler.creditCardPaymentGroups[0].creditCardType"
											required="<%=true%>">
											<dsp:option value="Visa" />Visa
											<dsp:option value="MasterCard" />Master Card
											<dsp:option value="AmericanExpress" />American Express
											<dsp:option value="Discover" />Discover
										</dsp:select></td>
									</tr>
									<tr>
										<td>Credit Card Number</td>
										<td><dsp:input
											bean="CartModifierFormHandler.creditCardPaymentGroups[0].creditCardNumber"
											maxlength="16" size="20" type="text" /></td>
									</tr>
									<tr>
										<td>Expiration Date</td>
										<td>Month: <dsp:select
											bean="CartModifierFormHandler.creditCardPaymentGroups[0].expirationMonth">
											<dsp:option value="1" />January
										<dsp:option value="2" />February
										<dsp:option value="3" />March
										<dsp:option value="4" />April
										<dsp:option value="5" />May
										<dsp:option value="6" />June
										<dsp:option value="7" />July
										<dsp:option value="8" />August
										<dsp:option value="9" />September
										<dsp:option value="10" />October
										<dsp:option value="11" />November
										<dsp:option value="12" />December
											</dsp:select> Year: <dsp:select
											bean="CartModifierFormHandler.creditCardPaymentGroups[0].expirationYear">
											<dsp:option value="2013" />2013
										<dsp:option value="2014" />2014
										<dsp:option value="2015" />2015
										<dsp:option value="2016" />2016
										<dsp:option value="2017" />2017
										<dsp:option value="2018" />2018
										<dsp:option value="2026" />2026
									</dsp:select></td>
									</tr>
								</table>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center"><dsp:input
									bean="CartModifierFormHandler.MoveToConfirmationSuccessURL"
									type="hidden" value="co_confirm.jsp" /> <!-- Location to go to on an error.  We stay on this page and display all errors -->
								<dsp:input
									bean="CartModifierFormHandler.MoveToConfirmationErrorURL"
									type="hidden" value="payment_info_returning.jsp" /> <!-- Go to this URL if user's session expired while he pondered this page -->
								<dsp:input bean="CartModifierFormHandler.sessionExpirationURL"
									type="hidden" value="../../common/SessionExpired.jsp" /> <dsp:input
									bean="CartModifierFormHandler.MoveToConfirmation" type="submit"
									value="Continue" /></td>
							</tr>
						</table>
					</dsp:oparam>
				</dsp:droplet>
			</tr>
		</table>
	</dsp:form></p>
</dsp:page></center>
<%-- @version $Id: //product/DCS/version/9.0/release/PioneerCyclingJSP/j2ee-apps/pioneer/web-app/en/checkout/full/payment_info_returning.jsp#1 $$Change: 508164 $--%>