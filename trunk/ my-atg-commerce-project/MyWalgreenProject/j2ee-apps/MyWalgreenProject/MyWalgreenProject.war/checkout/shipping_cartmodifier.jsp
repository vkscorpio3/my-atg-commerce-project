<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<dsp:page>
<title>Shipping Option and Address</title>
	<dsp:importbean bean="/atg/userprofiling/Profile" />
	<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty" />
	<dsp:importbean bean="/atg/dynamo/droplet/IsNull" />
	<dsp:importbean bean="/atg/dynamo/droplet/Switch" />
	<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
	<dsp:importbean bean="/atg/userprofiling/Profile" />
	<dsp:importbean bean="/atg/commerce/ShoppingCart" />
	<dsp:importbean bean="/atg/commerce/order/ShoppingCartModifier" />
	<dsp:importbean	bean="/atg/commerce/order/purchase/CartModifierFormHandler" />
	<dsp:importbean bean="/atg/commerce/pricing/UserPricingModels" />
	<dsp:importbean bean="/atg/commerce/pricing/AvailableShippingMethods" />
	<dsp:importbean
		bean="/atg/commerce/order/purchase/ShippingGroupDroplet" />
	<dsp:importbean
		bean="/atg/commerce/order/purchase/ShippingGroupFormHandler" />
	<h1 align="center">Shipping Page</h1>
	<h2 align="right"><dsp:droplet name="/atg/dynamo/droplet/IsEmpty">
		<dsp:param name="value" bean="Profile.Login" />
		<dsp:oparam name="true">
			<dsp:a href="../login.jsp">
				<dsp:param name="shipping" value="shipping" />
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

	<table border=1 cellpadding=4 cellspacing=10 width=50% align="center" bgcolor="#F0E68C" bordercolor="#1E90FF">
		<!--<tr bgcolor=#DBDBDB>
			<td><b style="color: blue">Login ID</b></td>
			<td><dsp:valueof bean="Profile.id" /></td>
		</tr>
		-->
		<tr>
			<td><b style="color: blue">Customer Name</b></td>
			<td><dsp:valueof bean="Profile.firstName" />&nbsp;<dsp:valueof
				bean="Profile.lastName" /></td>
		</tr>
		<tr>
			<td><b style="color: blue">Email</b></td>
			<td><dsp:valueof bean="Profile.email" /></td>
		</tr>
		<tr>		
			<td><b style="color: blue">Date Of Birth</b></td>
			<td><dsp:valueof date="dd-MMM-yyyy" bean="Profile.dateOfBirth" /></td>
		</tr>
		<tr>
			<td><b style="color: blue">Shipping Address</b></td>
			<td>
			<table border=1 cellpadding=4 cellspacing=10 width=250 align="center">
				<tr>
					<td align="center" colspan="2">Address1</td>
					<td><dsp:valueof
						bean="CartModifierFormHandler.shippingGroup.shippingAddress.address1" /></td>
				</tr>
				<!--<tr>
					<td align="center" colspan="2">Address2</td>
					<td><dsp:valueof
						bean="CartModifierFormHandler.shippingGroup.shippingAddress.address2" /></td>
				</tr>
				<tr>
					<td align="center" colspan="2">Address3</td>
					<td><dsp:valueof
						bean="CartModifierFormHandler.shippingGroup.shippingAddress.address3" /></td>
				</tr>
				--><tr>
					<td align="center" colspan="2">Zip Code</td>
					<td><dsp:valueof
						bean="CartModifierFormHandler.shippingGroup.shippingAddress.postalCode" /></td>
				</tr>
				<tr>
					<td align="center" colspan="2">City</td>
					<td><dsp:valueof
						bean="CartModifierFormHandler.shippingGroup.shippingAddress.city" /></td>
				</tr>
				<tr>
					<td align="center" colspan="2">State</td>
					<td><dsp:valueof
						bean="CartModifierFormHandler.shippingGroup.shippingAddress.state" /></td>
				</tr>
				<tr>
					<td align="center" colspan="2">Country</td>
					<td><dsp:valueof
						bean="CartModifierFormHandler.shippingGroup.shippingAddress.country" /></td>
				</tr>
				<tr>
					<td align="center" colspan="2">Contact No.</td>
					<td><dsp:valueof
						bean="CartModifierFormHandler.shippingGroup.shippingAddress.phoneNumber" /></td>
				</tr>
			</table>
			</td>
		</tr>
		<%--<tr>
			<td><b style="color: blue">Billing Address</b></td>
			<td><dsp:include page="billing.jsp"/></td>
		</tr>--%>
		
		
		
		<dsp:droplet name="ShippingGroupDroplet">
			<dsp:param name="clear" value="true" />
			<dsp:param name="shippingGroupTypes" value="hardgoodShippingGroup" />
			<dsp:param name="initShippingGroups" value="true" />
			<dsp:param name="initShippingInfos" value="true" />
			<dsp:oparam name="output">
				<dsp:droplet name="IsNull">
					<dsp:param bean="ShippingGroupDroplet.defaultShippingGroup"
						name="value" />

					<dsp:oparam name="false">
						<dsp:droplet name="AvailableShippingMethods">
							<dsp:param bean="CartModifierFormHandler.shippingGroup"
								name="shippingGroup" />

							<!-- <dsp:valueof
									bean="CartModifierFormHandler.shippingGroup.shippingMethod"></dsp:valueof><br> -->
							<dsp:param bean="UserPricingModels.shippingPricingModels"
								name="pricingModels" />
							<dsp:param bean="Profile" name="profile" />
							<dsp:oparam name="output">

								<dsp:form>
									<dsp:input
										bean="CartModifierFormHandler.shippingGroup.shippingAddress.firstName"
										beanvalue="Profile.shippingAddress.firstName" size="30"
										type="hidden" />
									<dsp:input
										bean="CartModifierFormHandler.shippingGroup.shippingAddress.middleName"
										beanvalue="Profile.shippingAddress.middleName" size="15"
										type="hidden" />
									<dsp:input
										bean="CartModifierFormHandler.shippingGroup.shippingAddress.lastName"
										beanvalue="Profile.shippingAddress.lastName" size="30"
										type="hidden" />
									<dsp:input
										bean="CartModifierFormHandler.shippingGroup.shippingAddress.address1"
										beanvalue="Profile.shippingAddress.address1" size="40"
										type="hidden" />
									<dsp:input
										bean="CartModifierFormHandler.shippingGroup.shippingAddress.address2"
										size="40" type="hidden" />
									<dsp:input
										bean="CartModifierFormHandler.shippingGroup.shippingAddress.address2"
										beanvalue="Profile.shippingAddress.address2" size="40"
										type="hidden" />
									<dsp:input
										bean="CartModifierFormHandler.shippingGroup.shippingAddress.city"
										beanvalue="Profile.shippingAddress.city" size="20"
										type="hidden" />
									<dsp:input
										bean="CartModifierFormHandler.shippingGroup.shippingAddress.state"
										beanvalue="Profile.shippingAddress.state" size="10"
										type="hidden" />
									<dsp:input
										bean="CartModifierFormHandler.shippingGroup.shippingAddress.postalCode"
										beanvalue="Profile.shippingAddress.postalCode" size="10"
										type="hidden" />
									<dsp:input
										bean="CartModifierFormHandler.shippingGroup.shippingAddress.country"
										beanvalue="Profile.shippingAddress.country" size="20"
										type="hidden" />
									<dsp:input
										bean="CartModifierFormHandler.shippingGroup.shippingAddress.ownerId"
										beanvalue="Profile.shippingAddress.ownerId" size="20"
										type="hidden" />
									<%-- 	
										<dsp:select
											bean="CartModifierFormHandler.shippingGroup.shippingMethod">
											<dsp:droplet name="ForEach">
												<dsp:param param="availableShippingMethods" name="array" />
												<dsp:param value="method" name="elementName" />
												<dsp:oparam name="output">
													<dsp:getvalueof id="option"
														bean="CartModifierFormHandler.shippingGroup.shippingMethod"
														idtype="java.lang.String">
														<dsp:option value="<%=option%>" />
													</dsp:getvalueof>
													<dsp:valueof
														bean="CartModifierFormHandlerCartModifierFormHandler.shippingGroup.shippingMethod" />
												</dsp:oparam>
											</dsp:droplet>
										</dsp:select>
									--%>
								</dsp:form>
							</dsp:oparam>
						</dsp:droplet>
					</dsp:oparam>
				</dsp:droplet>
			</dsp:oparam>
		</dsp:droplet>
	</table>
	<dsp:valueof param="fromHomePage"></dsp:valueof>
	<h3 align="center"><dsp:droplet name="/atg/dynamo/droplet/IsEmpty">
		<dsp:param name="value" bean="Profile.Login" />
		<dsp:oparam name="true">
		</dsp:oparam>
		<dsp:oparam name="false">
			<dsp:form formid="10">
				<dsp:input
					bean="ShippingGroupFormHandler.applyShippingGroupsErrorURL"
					type="hidden" value="shipping_cartmodifier.jsp" />
					<dsp:input
					bean="ShippingGroupFormHandler.applyShippingGroupsSuccessURL"
					type="hidden" value="../checkout/payment_info_returning.jsp" />
				
				
				<dsp:input bean="ShippingGroupFormHandler.applyShippingGroups"
					type="submit" value="Payment" />
			</dsp:form>
		</dsp:oparam>
	</dsp:droplet></h3>
</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/9.0/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/en/checkout/shipping.jsp#1 $$Change: 508164 $--%>
