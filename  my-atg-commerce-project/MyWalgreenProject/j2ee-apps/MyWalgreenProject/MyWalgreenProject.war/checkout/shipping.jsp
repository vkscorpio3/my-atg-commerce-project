<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<html>
<dsp:page>
	<title>Shipping Option and Address</title>
	<dsp:importbean bean="/atg/userprofiling/Profile" />
	<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty" />
	<dsp:importbean bean="/atg/dynamo/droplet/IsNull" />
	<dsp:importbean bean="/atg/dynamo/droplet/Switch" />
	<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
	<dsp:importbean bean="/atg/commerce/order/ShoppingCartModifier" />
	<dsp:setvalue bean="Profile.currentLocation" value="shopping_cart" />
	<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach" />
	<head>
	<script type="text/javascript">
		function changeToShipAddress(){
			document.forms["form1"]["billingFirstName"].value=document.forms["form1"]["shipFirstName"].value;
			document.forms["form1"]["billingMiddleName"].value=document.forms["form1"]["shipMiddleName"].value;
			document.forms["form1"]["billingLastName"].value=document.forms["form1"]["shipLastName"].value;
			document.forms["form1"]["billingAddress1"].value=document.forms["form1"]["shipAddress1"].value;
			document.forms["form1"]["billingPhone"].value=document.forms["form1"]["shipPhone"].value;
			document.forms["form1"]["billingZip"].value=document.forms["form1"]["shipZip"].value;
			document.forms["form1"]["billingCity"].value=document.forms["form1"]["shipCity"].value;
			document.forms["form1"]["billingState"].value=document.forms["form1"]["shipState"].value;
			document.forms["form1"]["billingCountry"].value=document.forms["form1"]["shipCountry"].value;
		}
	</script>
	</head>
	<h1 align="center">Shipping and Payment</h1>
	<dsp:droplet name="ErrorMessageForEach">
		<dsp:param bean="ShoppingCartModifier.formExceptions"
			name="exceptions" />
		<dsp:oparam name="output">
                       <center><li><b><STRIKE></STRIKE><dsp:valueof param="message"/></b></li></center>
                      </dsp:oparam>
	</dsp:droplet>
	<dsp:form name="form1" action="order_confirm.jsp" method="post">
		<table cellspacing=0 cellpadding=0 border=1 bgcolor="#B0C4DE"
			align="center"><!--
			<tr>
				<td><b style="color: blue">Shipping Method </b></td>
				<td><dsp:valueof
					bean="ShoppingCartModifier.shippingGroup.shippingMethod" /></td>
			</tr>

			--><tr>
				<td><b style="color: blue">Personal Information</b></td>
				<td>
				<table border=1 cellpadding=4 cellspacing=10 width=700
					align="center">
					<tr>
						<td><dsp:input
							bean="ShoppingCartModifier.shippingGroup.shippingAddress.firstName"
							type="text" value="First Name" id="shipFirstName" onclick="this.value=''" /></td>
						<td><dsp:input
							bean="ShoppingCartModifier.shippingGroup.shippingAddress.middleName"
							type="text" value="Middle Name" id="shipMiddleName" onclick="this.value=''" /></td>
						<td><dsp:input
							bean="ShoppingCartModifier.shippingGroup.shippingAddress.lastName"
							type="text" value="Last Name" id="shipLastName" onclick="this.value=''" /></td>
					</tr>
				</table>
			</td>
			</tr>

			<tr>
				<td><b style="color: blue">Shipping Address</b></td>
				<td>
				<table border=1 cellpadding=4 cellspacing=10 width=700
					align="center">

					<tr>
						<td align="center" colspan="2">Address1</td>
						<td><dsp:input
							bean="ShoppingCartModifier.shippingGroup.shippingAddress.address1"
							type="text" size="50" id="shipAddress1"/></td>
						<td align="center" colspan="2">Contact No.</td>
						<td><dsp:input
							bean="ShoppingCartModifier.shippingGroup.shippingAddress.phoneNumber"
							type="text" id="shipPhone"/></td>
					</tr>
					<tr>
						<td align="center" colspan="2">Zip Code</td>
						<td><dsp:input
							bean="ShoppingCartModifier.shippingGroup.shippingAddress.postalCode"
							type="text" id="shipZip"/></td>
						<td align="center" colspan="2">City</td>
						<td><dsp:input
							bean="ShoppingCartModifier.shippingGroup.shippingAddress.city"
							type="text" id="shipCity"/></td>
					</tr>
					<tr>
						<td align="center" colspan="2">State</td>
						<td><dsp:select
							bean="ShoppingCartModifier.shippingGroup.shippingAddress.state" id="shipState">
							<%
								atg.servlet.DynamoHttpServletRequest dynamoRequest = atg.servlet.ServletUtil
													.getDynamoRequest(request);
							%>

							<%-- Generate an empty option tag for no selection --%>
							<dsp:option value="" />

							<%-- Iterate over the list of known destinations and generate an option tag for each --%>

							<dsp:droplet name="/atg/dynamo/droplet/ForEach">
								<dsp:param name="array"
									bean="/atg/commerce/util/StateList.places" />
								<dsp:param name="elementName" value="state" />
								<dsp:oparam name="output">
									<dsp:option
										value='<%=dynamoRequest
												.getParameter("state.code")%>' />
									<%=dynamoRequest
														.getParameter("state.displayName")%>
								</dsp:oparam>
							</dsp:droplet>
						</dsp:select></td>
						<td align="center" colspan="2">Country</td>
						<td><dsp:input
							bean="ShoppingCartModifier.shippingGroup.shippingAddress.country"
							type="text" id="shipCountry"/></td>
					</tr>
					<!--<dsp:input
						bean="ShoppingCartModifier.shippingGroup.shippingAddress.ownerId"
						beanvalue="Profile.id" type="hidden" />-->
				</table>
			</td>
			</tr>

			<tr>
				<td><b style="color: blue">Billing Address</b><br>
				<input type="radio" name="sameAsShipping" onclick="changeToShipAddress()">Same
				As Shipping Address</input></td>
				<td>
				<table border=1 cellpadding=4 cellspacing=10 width=700
					align="center">
						<dsp:input
							bean="ShoppingCartModifier.paymentGroup.billingAddress.firstName"
							type="hidden" id="billingFirstName"/>
						<dsp:input
							bean="ShoppingCartModifier.paymentGroup.billingAddress.middleName"
							type="hidden"  id="billingMiddleName"/>
						<dsp:input
							bean="ShoppingCartModifier.paymentGroup.billingAddress.lastName"
							type="hidden"  id="billingLastName"/>
					<tr>
						<td align="center" colspan="2">Address1</td>
						<td><dsp:input
							bean="ShoppingCartModifier.paymentGroup.billingAddress.address1"
							type="text" size="50" id="billingAddress1" /></td>
						<td align="center" colspan="2">Contact No.</td>
						<td><dsp:input
							bean="ShoppingCartModifier.paymentGroup.billingAddress.phoneNumber"
							type="text" id="billingPhone" /></td>
					</tr>
					<tr>
						<td align="center" colspan="2">Zip Code</td>
						<td><dsp:input
							bean="ShoppingCartModifier.paymentGroup.billingAddress.postalCode"
							type="text" id="billingZip" /></td>
						<td align="center" colspan="2">City</td>
						<td><dsp:input
							bean="ShoppingCartModifier.paymentGroup.billingAddress.city"
							type="text" id="billingCity" /></td>
					</tr>
					<tr>
						<td align="center" colspan="2">State</td>
						<td><dsp:select
							bean="ShoppingCartModifier.paymentGroup.billingAddress.state"
							id="billingState">
							<%
								atg.servlet.DynamoHttpServletRequest dynamoRequest = atg.servlet.ServletUtil
													.getDynamoRequest(request);
							%>

							<%-- Generate an empty option tag for no selection --%>
							<dsp:option value="" />

							<%-- Iterate over the list of known destinations and generate an option tag for each --%>

							<dsp:droplet name="/atg/dynamo/droplet/ForEach">
								<dsp:param name="array"
									bean="/atg/commerce/util/StateList.places" />
								<dsp:param name="elementName" value="state" />
								<dsp:oparam name="output">
									<dsp:option
										value='<%=dynamoRequest
												.getParameter("state.code")%>' />
									<%=dynamoRequest
														.getParameter("state.displayName")%>
								</dsp:oparam>
							</dsp:droplet>
						</dsp:select></td>
						<td align="center" colspan="2">Country</td>
						<td><dsp:input
							bean="ShoppingCartModifier.paymentGroup.billingAddress.country"
							type="text" id="billingCountry" /></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td><b style="color: blue">Credit Card</b></td>
				<td>
				<table border=1 cellpadding=4 cellspacing=10 width=700
					align="center">
					<tr>
						<td>Card Type</td>
						<td><dsp:select
							bean="ShoppingCartModifier.paymentGroup.creditCardType"
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
							bean="ShoppingCartModifier.paymentGroup.creditCardNumber"
							maxlength="16" size="20" type="text" value="4111111111111111" /></td>
					</tr>
					<tr>
						<td>Expiration Date</td>
						<td>Month: <dsp:select
							bean="ShoppingCartModifier.paymentGroup.expirationMonth">
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
							bean="ShoppingCartModifier.paymentGroup.expirationYear">
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
				<td colspan="2" align="center">
				<dsp:input bean="ShoppingCartModifier.moveToConfirmationSuccessURL"
					type="hidden" value="order_confirm.jsp" />

				<!-- Set the Location to go to if there are error on this form.  We stay on this page and then -->
				<!-- just display the error messages.                                                          -->
				<dsp:input bean="ShoppingCartModifier.moveToConfirmationErrorURL"
					type="hidden" value="shipping.jsp" />

				<!-- Go to this URL if user's session expired while he pondered this page -->
				<dsp:input bean="ShoppingCartModifier.sessionExpirationURL"
					type="hidden" value="home.jsp" />

				<dsp:input bean="ShoppingCartModifier.moveToConfirmation"
					type="submit" value="   Continue   " />
				</td>
			</tr>
		</table>
	</dsp:form>
</dsp:page>
</html>