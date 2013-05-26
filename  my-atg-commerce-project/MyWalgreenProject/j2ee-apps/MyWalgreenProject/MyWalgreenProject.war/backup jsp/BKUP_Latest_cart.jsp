<%@ taglib uri="/dspTaglib" prefix="dsp"%>

<%@page import="atg.servlet.DynamoHttpServletRequest"%>
<%@page import="atg.servlet.ServletUtil"%>
<dsp:page>
	<dsp:importbean
		bean="/atg/commerce/order/purchase/CartModifierFormHandler" />
	<dsp:importbean bean="/atg/commerce/ShoppingCart" />
	<dsp:importbean bean="/atg/commerce/order/ShoppingCartModifier" />
	<dsp:importbean
		bean="/atg/formhandler/BikeStoreCartModifierFormHandler" />
	<dsp:importbean bean="/atg/droplet/GroupItemsDroplet" />
	<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach" />
	<dsp:importbean bean="/atg/commerce/gifts/IsGiftShippingGroup" />
	<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
	<dsp:importbean bean="/atg/dynamo/droplet/Switch" />
	<dsp:importbean bean="/atg/dynamo/droplet/IsNull" />
	<%
		DynamoHttpServletRequest drequest = ServletUtil
					.getDynamoRequest(request);
	%>

	<dsp:form action="cart.jsp" method="POST">

		<p><span class=storebig><b>My Shopping Cart</span>
		<hr size=0>
		<br>
		<dsp:droplet name="Switch">
			<dsp:param bean="/atg/commerce/ShoppingCart.currentEmpty"
				name="value" />
			<dsp:oparam name="true">
   cart empty
  </dsp:oparam>
			<dsp:oparam name="false">
				<dsp:droplet name="/atg/dynamo/droplet/Switch">
					<dsp:param name="value"
						bean="/atg/commerce/ShoppingCart.current.TotalCommerceItemCount" />
					<dsp:oparam name="1">
						<dsp:valueof
							bean="/atg/commerce/ShoppingCart.current.TotalCommerceItemCount" /> item
        <dsp:valueof converter="currency"
							bean="/atg/commerce/ShoppingCart.current.priceInfo.amount" />
					</dsp:oparam>
					<dsp:oparam name="default">
						<dsp:valueof
							bean="/atg/commerce/ShoppingCart.current.TotalCommerceItemCount" /> items
	<dsp:valueof converter="currency"
							bean="/atg/commerce/ShoppingCart.current.priceInfo.amount" />
					</dsp:oparam>
				</dsp:droplet>


				<table align="center" border="6">

					<tr align=left style="color: red">

						<td><b>Product Name</td>
						<td><b>Qty</td>
						<td><b>Rate</td>
						<td><b>Price</b></td>
						<td><b>Edit</b></td>
						<td></td>
					</tr>

					<dsp:droplet name="GroupItemsDroplet">
						<dsp:param name="order" bean="/atg/commerce/ShoppingCart.current" />
						<dsp:oparam name="output">

							<dsp:droplet name="ForEach">
								<dsp:param name="array" param="itemGroups" />
								<dsp:param name="elementName" value="commerceItem" />
								<dsp:param name="indexName" value="index" />
								<dsp:oparam name="outputStart">

								</dsp:oparam>
								<dsp:oparam name="output">
									<dsp:droplet name="IsNull">
										<dsp:param
											param="commerceItem.auxiliaryData.productRef.repositoryId"
											name="value" />
										<dsp:oparam name="true">
											<h4 class="mrgLt5px prodName"><dsp:a iclass="underline"
												rel="nofollow"
												href="<%="../product/view_product_details.jsp?prdId="
																		+ drequest
																				.getParameter("commerceItem.auxiliaryData.productRef.repositoryId")%>">
												<dsp:param param="commerceItem.auxiliaryData.catalogRef.id"
													name="skuid" />
												<dsp:param param="commerceItem.auxiliaryData.productRef.id"
													name="prdId" />
												<dsp:param
													param="commerceItem.auxiliaryData.productRef.parentCategory.id"
													name="CatId" />


											</dsp:a></h4>
										</dsp:oparam>
									</dsp:droplet>
									<tr align=left>
										<td><dsp:valueof
											param="commerceItem.auxiliaryData.catalogRef.displayName" /></td>
										<td><input type="text"
											name='<dsp:valueof param="commerceItem.quantity"/>'
											value='<dsp:valueof param="commerceItem.quantity"/>'
											class="wid35" maxlength="3" /></td>
										<td>$<dsp:valueof
											param="commerceItem.priceInfo.listPrice" /></td>
										<!--<td>Update <dsp:input
											bean="CartModifierFormHandler.setOrderByCommerceId"
											border="0" alt="update" src="update.png" type="image" /></td>
										-->
										<td>$<dsp:valueof
											param="commerceItem.priceInfo.rawTotalPrice" /></td>
										<td>
										<!--<dsp:a href="cart.jsp">
											<dsp:param param="commerceItem.Id" name="removalCommerceIds" />
											<dsp:valueof value="Remove Item" />
										</dsp:a>
										-->
										<dsp:input value="Delete" type="submit" bean="CartModifierFormHandler.removalCommerceIds" beanvalue="commerceItem.Id"/>
										 
										<!--<dsp:input
											bean="BikeStoreCartModifierFormHandler.commerceIds"
											paramvalue="removalCommerceIds" type="hidden"></dsp:input> <dsp:input
											bean="BikeStoreCartModifierFormHandler.removeItemFromOrder"
											type="Submit" value="Delete"></dsp:input>
											--></td>
									</tr>
								</dsp:oparam>
							</dsp:droplet>
						</dsp:oparam>
					</dsp:droplet>


					<!--<dsp:input
						bean="CartModifierFormHandler.moveToPurchaseInfoByRelIdSuccessURL"
						type="hidden" value="cart.jsp" />
					<dsp:input
						bean="CartModifierFormHandler.moveToPurchaseInfoByRelIdErrorURL"
						type="hidden" value="cart.jsp" />
					<tr>
						<td align="center" colspan="5"><dsp:input
							bean="CartModifierFormHandler.moveToPurchaseInfoByRelId"
							type="submit" value="  Checkout" /></td>
					</tr>
				-->
				</table>
			</dsp:oparam>
		</dsp:droplet>
		<dsp:a href="home.jsp">Back To Search</dsp:a>
	</dsp:form>
</dsp:page>