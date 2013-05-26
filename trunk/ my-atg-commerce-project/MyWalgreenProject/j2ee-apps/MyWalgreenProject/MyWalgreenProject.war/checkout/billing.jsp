<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<dsp:page>
	<title>Payment and Billing</title>
	<dsp:importbean bean="/atg/userprofiling/Profile" />
	<dsp:importbean bean="/atg/commerce/ShoppingCart" />
	<dsp:importbean bean="/atg/commerce/order/ShoppingCartModifier" />
	<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
	<dsp:importbean bean="/atg/dynamo/droplet/Switch" />
	<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty" />
	<dsp:form formid="45">
		<table border=1 cellpadding=4 cellspacing=10 width=300 align="center">
			<dsp:droplet name="ForEach">
				<dsp:param bean="ShoppingCartModifier.creditCardPaymentGroups"
					name="array" />
				<dsp:oparam name="output">
					<!--<tr>
						<td align="center" colspan="2">Name</td>
						<td><dsp:droplet name="IsEmpty">
							<dsp:param
								bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.firstName"
								name="value" />
							<%-- paymentGroup can also be used instead of creditCardPaymentGroups[param:index] --%>
							<dsp:oparam name="false">
								<dsp:input
									bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.firstName"
									size="15" type="text" />
							</dsp:oparam>
							<dsp:oparam name="true">
								<dsp:input
									bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.firstName"
									beanvalue="Profile.billingAddress.firstName" size="15"
									type="text" />
							</dsp:oparam>
						</dsp:droplet> <dsp:droplet name="IsEmpty">
							<dsp:param
								bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.middleName"
								name="value" />
							<dsp:oparam name="false">
								<dsp:input
									bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.middleName"
									size="10" type="text" />
							</dsp:oparam>
							<dsp:oparam name="true">
								<dsp:input
									bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.middleName"
									beanvalue="Profile.billingAddress.middleName" size="10"
									type="text" />
							</dsp:oparam>
						</dsp:droplet> <dsp:droplet name="IsEmpty">
							<dsp:param
								bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.lastName"
								name="value" />
							<dsp:oparam name="false">
								<dsp:input
									bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.lastName"
									size="15" type="text" />
								<br>
							</dsp:oparam>
							<dsp:oparam name="true">
								<dsp:input
									bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.lastName"
									beanvalue="Profile.billingAddress.lastName" size="15"
									type="text" />
								<br>
							</dsp:oparam>
						</dsp:droplet></td>
					</tr>
					--><tr>
						<td align="center" colspan="2">Street address</td>
						<td><dsp:droplet name="IsEmpty">
							<dsp:param
								bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.address1"
								name="value" />
							<dsp:oparam name="false">
								<dsp:input
									bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.address1"
									size="40" type="text" />
								<br>
							</dsp:oparam>
							<dsp:oparam name="true">
								<dsp:input
									bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.address1"
									beanvalue="Profile.billingAddress.address1" size="40"
									type="text" />
								<br>
							</dsp:oparam>
						</dsp:droplet> 
						</td>
					</tr>
					<tr>
						<dsp:droplet name="IsEmpty">
							<dsp:param
								bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.address2"
								name="value" />
							<dsp:oparam name="false">
							<td align="center" colspan="2">Address2</td>
								<dsp:input
									bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.address2"
									size="40" type="text" />
								<br>
							</dsp:oparam>
							<dsp:oparam name="true">
								<dsp:input
									bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.address2"
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
								bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.postalCode"
								name="value" />
							<dsp:oparam name="false">
								<dsp:input
									bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.postalCode"
									size="10" type="text" />
							</dsp:oparam>
							<dsp:oparam name="true">
								<dsp:input
									bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.postalCode"
									beanvalue="Profile.billingAddress.postalCode" size="10"
									type="text" />
							</dsp:oparam>
						</dsp:droplet></td>
					</tr>
					<tr>
						<td align="center" colspan="2">City</td>
						<td><dsp:droplet name="IsEmpty">
							<dsp:param
								bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.city"
								name="value" />
							<dsp:oparam name="false">
								<dsp:input
									bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.city"
									size="20" type="text" />
							</dsp:oparam>
							<dsp:oparam name="true">
								<dsp:input
									bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.city"
									beanvalue="Profile.billingAddress.city" size="20" type="text" />
							</dsp:oparam>
						</dsp:droplet></td>
					</tr>
					<tr>
						<td align="center" colspan="2">State</td>
						<td><dsp:droplet name="IsEmpty">
							<dsp:param
								bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.state"
								name="value" />
							<dsp:oparam name="true">
								<dsp:setvalue
									bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.state"
									beanvalue="Profile.billingAddress.state" />
							</dsp:oparam>
						</dsp:droplet> <dsp:select
							bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.state">
							<%@ include file="StatePicker.jspf"%>
						</dsp:select></td>
					</tr>
					<tr>
						<td align="center" colspan="2">Country</td>
						<td><dsp:valueof
							bean="ShoppingCartModifier.shippingGroup.shippingAddress.country" /></td>
					</tr>
					<tr>
						<td align="center" colspan="2">Contact No.</td>
						<td><dsp:valueof
							bean="ShoppingCartModifier.shippingGroup.shippingAddress.phoneNumber" /></td>
					</tr>
				</dsp:oparam>
			</dsp:droplet>
		</table>

		<%--Country<br>
		<dsp:droplet name="IsEmpty">
			<dsp:param
				bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.country"
				name="value" />
			<dsp:oparam name="true">
				<dsp:setvalue
					bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.country"
					beanvalue="US" />
			</dsp:oparam>
		</dsp:droplet>
		<dsp:input
			bean="ShoppingCartModifier.creditCardPaymentGroups[param:index].billingAddress.country"
			type="text" disabled="true" />
		<br> --%>


	</dsp:form>
</dsp:page>
