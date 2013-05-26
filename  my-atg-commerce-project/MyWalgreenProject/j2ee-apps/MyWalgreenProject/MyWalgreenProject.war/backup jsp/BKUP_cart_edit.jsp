<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<dsp:page>

	<dsp:importbean bean="/atg/commerce/ShoppingCart" />
	<dsp:importbean bean="/atg/commerce/order/ShoppingCartModifier" />
	<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
	<dsp:importbean bean="/atg/dynamo/droplet/Switch" />
	<dsp:importbean bean="/atg/userprofiling/Profile" />
	<dsp:setvalue bean="Profile.currentLocation" value="checkout" />

	<HTML>
	<HEAD>
	<TITLE>Pioneer Cycling Store</TITLE>
	<dsp:link rel="STYLESHEET" href="../../common/Style.css"
		type="text/css" title="Prototype Stylesheet" />
	</HEAD>
	<BODY>

	<p><span class=storebig>Edit Item in Shopping Cart</span>
	<p><dsp:form action="cart.jsp" method="post">

		<!-- By default this object will be deleted from the order.  It will not be deleted if the user selects -->
		<!-- cancel.  Else, if they press delete, it is deleted or if they press make changes then the object   -->
		<!-- is removed from the cart and a new object is added via the removeAndAddItemToOrder method.         -->
		<!-- the removalCatalogRefIds property tells us what to remove, so set this.                            -->
		<dsp:input bean="ShoppingCartModifier.removalCommerceIds"
			beanvalue="ShoppingCartModifier.commerceItemToEdit.Id" type="hidden" />


		<table cellspacing=0 cellpadding=0 border=0>

			<tr valign=top>
				<td><!-- Display the product Category display name, product display name -->
				<!-- and price.  This info is obtained from the commerceItemToEdit -->
				<!-- that gets set when a user goes to edit an item.                 -->
				<dsp:setvalue
					beanvalue="ShoppingCartModifier.commerceItemToEdit.auxiliaryData.productRef.thumbnailImage.url"
					param="ImageURL" /> <dsp:droplet name="/atg/dynamo/droplet/IsNull">
					<dsp:param name="value" param="ImageURL" />
					<dsp:oparam name="false">
						<dsp:getvalueof id="img54" param="ImageURL"
							idtype="java.lang.String">
							<dsp:img src="<%=img54%>" />
						</dsp:getvalueof>
					</dsp:oparam>
					<dsp:oparam name="true">
						<dsp:img src="../../images/no_image.gif" />
					</dsp:oparam>
				</dsp:droplet>
				<p><b> <dsp:valueof
					bean="ShoppingCartModifier.commerceItemToEdit.auxiliaryData.productRef.parentCategory.displayName" />
				</b><br>
				<b> <dsp:valueof
					bean="ShoppingCartModifier.commerceItemToEdit.auxiliaryData.productRef.displayName" />
				</b><br>
				<dsp:valueof converter="currency"
					bean="ShoppingCartModifier.commerceItemToEdit.priceInfo.amount" />
				<P>
				</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td><br>
				Model Selection</b><br>

				<!-- Set the product id, so that this item can be added to the cart if necessary -->
				<dsp:input bean="ShoppingCartModifier.productId"
					beanvalue="ShoppingCartModifier.commerceItemToEdit.auxiliaryData.productRef.repositoryId"
					type="hidden" /> <!-- Display all the child SKUs for this particular SKUs parent product -->
				<!-- When displaying info to the user, grab the displayableSKUAttributes-->
				<!-- property from the product and iterate through the list getting     -->
				<!-- the SKU property for each one                                      -->
				<dsp:select bean="ShoppingCartModifier.catalogRefIds">

					<dsp:droplet name="/atg/dynamo/droplet/ForEach">
						<dsp:param
							bean="ShoppingCartModifier.commerceItemToEdit.auxiliaryData.productRef.childSKUs"
							name="array" />
						<dsp:param name="elementName" value="sku" />
						<dsp:param name="indexName" value="skuIndex" />
						<dsp:oparam name="output">
							<dsp:droplet name="/atg/commerce/catalog/DisplaySkuProperties">
								<dsp:param name="delimiter" value=" | " />
								<dsp:param name="sku" param="sku" />
								<dsp:param
									bean="ShoppingCartModifier.commerceItemToEdit.auxiliaryData.productRef"
									name="product" />
								<dsp:param name="displayElementName" value="outputString" />
								<dsp:oparam name="output">
									<dsp:droplet name="/atg/dynamo/droplet/Switch">
										<dsp:param name="value" param="sku.repositoryId" />

										<!-- The current Sku object is the same as one in cart, make it default selected -->
										<dsp:getvalueof id="nameval2"
											bean="ShoppingCartModifier.commerceItemToEdit.auxiliaryData.catalogRef.repositoryId"
											idtype="java.lang.String">
											<dsp:oparam name="<%=nameval2%>">
												<dsp:getvalueof id="option131" param="sku.repositoryId"
													idtype="java.lang.String">
													<dsp:option selected="<%=true%>" value="<%=option131%>" />
												</dsp:getvalueof>
												<dsp:valueof param="sku.displayName" />
											</dsp:oparam>
										</dsp:getvalueof>

										<!-- The current Sku object does NOT match one is the shopping cart, don't make selected -->
										<dsp:oparam name="default">
											<dsp:getvalueof id="option139" param="sku.repositoryId"
												idtype="java.lang.String">
												<dsp:option value="<%=option139%>" />
											</dsp:getvalueof>
											<dsp:valueof param="sku.displayName" />
										</dsp:oparam>
									</dsp:droplet>
								</dsp:oparam>
								<dsp:oparam name="empty">
									<dsp:droplet name="/atg/dynamo/droplet/Switch">
										<dsp:param name="value" param="sku.repositoryId" />

										<!-- The current Sku object is the same as one in cart, make it default selected -->
										<dsp:getvalueof id="nameval2"
											bean="ShoppingCartModifier.commerceItemToEdit.auxiliaryData.catalogRef.repositoryId"
											idtype="java.lang.String">
											<dsp:oparam name="<%=nameval2%>">
												<dsp:getvalueof id="option157" param="sku.repositoryId"
													idtype="java.lang.String">
													<dsp:option selected="<%=true%>" value="<%=option157%>" />
												</dsp:getvalueof>
												<dsp:valueof param="sku.displayName" />
											</dsp:oparam>
										</dsp:getvalueof>

										<!-- The current Sku object does NOT match one is the shopping cart, don't make selected -->
										<dsp:oparam name="default">
											<dsp:getvalueof id="option165" param="sku.repositoryId"
												idtype="java.lang.String">
												<dsp:option value="<%=option165%>" />
											</dsp:getvalueof>
											<dsp:valueof param="sku.displayName" />
										</dsp:oparam>
									</dsp:droplet>
								</dsp:oparam>
								<dsp:oparam name="empty">
									<dsp:getvalueof id="option177" param="sku.repositoryId"
										idtype="java.lang.String">
										<dsp:option selected="<%=true%>" value="<%=option177%>" />
									</dsp:getvalueof>
									<dsp:valueof param="sku.displayName" />
								</dsp:oparam>
							</dsp:droplet>
						</dsp:oparam>
					</dsp:droplet>

				</dsp:select>
				<P><b>Quantity </b> <!-- Display the current quantity of the item -->
				<dsp:input bean="ShoppingCartModifier.quantity"
					beanvalue="ShoppingCartModifier.commerceItemToEdit.quantity"
					size="4" type="text" />
				<p>&nbsp;<br>

				<!-- Pages to go to for the pressing of the MAKE CHANGES button -->
				<!----------------------------------------------------------> <!-- Go to this URL if user selects Make changes and there are no erros -->
				<dsp:input
					bean="ShoppingCartModifier.RemoveAndAddItemToOrderSuccessURL"
					type="hidden" value="cart.jsp" /> <!-- Go to this URL if user selects Make changes and there are erros -->
				<dsp:input
					bean="ShoppingCartModifier.RemoveAndAddItemToOrderErrorURL"
					type="hidden" value="cart.jsp" /> <!-- Pages to go to for the pressing of the DELETE button -->
				<!----------------------------------------------------------> <!-- Go to this URL if user selects Cancel -->
				<dsp:input bean="ShoppingCartModifier.RemoveItemFromOrderErrorURL"
					type="hidden" value="cart_edit.jsp" /> <!-- Go to this URL if user selects Cancel -->
				<dsp:input bean="ShoppingCartModifier.RemoveItemFromOrderSuccessURL"
					type="hidden" value="cart.jsp" /> <!-- Go to this URL if user's session expired while he pondered this page -->
				<dsp:input bean="ShoppingCartModifier.sessionExpirationURL"
					type="hidden" value="../../common/SessionExpired.jsp" /> <!-- Make the user selected  changes -->
				<dsp:input bean="ShoppingCartModifier.removeAndAddItemToOrder"
					type="submit" value="Make Changes" /> &nbsp; &nbsp; <!-- Delete the item from the cart -->
				<dsp:input bean="ShoppingCartModifier.RemoveItemFromOrder"
					type="submit" value="Delete" /> &nbsp; &nbsp; <!-- Cancel this edit, return to the cart page with the cart unmodified -->
				<input type=submit value="Cancel">
				</td>
			</tr>

		</table>
	</dsp:form>
	<p>&nbsp;<br>

	<dsp:include page="../../common/ModalFooter.jsp"></dsp:include>
	</BODY>
	</HTML>


</dsp:page>
<%-- @version $Id: //product/DCS/version/9.0/release/PioneerCyclingJSP/j2ee-apps/pioneer/web-app/en/checkout/full/cart_edit.jsp#1 $$Change: 508164 $--%>
