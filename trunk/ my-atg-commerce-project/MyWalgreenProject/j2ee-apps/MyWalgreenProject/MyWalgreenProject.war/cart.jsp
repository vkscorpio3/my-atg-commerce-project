<%@ taglib uri="/dspTaglib" prefix="dsp"%>

<%@page import="java.util.ArrayList"%><dsp:page>
	<title>Cart</title>
	<dsp:importbean	bean="/atg/commerce/order/purchase/CartModifierFormHandler" />
	<dsp:importbean	bean="/atg/commerce/order/purchase/StoreCartFormHandler" />
	<dsp:importbean	bean="/atg/formhandler/MyCartModifierFormHandler" />
	<dsp:importbean	bean="/atg/commerce/pricing/ItemPricingEngine" />
		
	<dsp:importbean bean="/atg/commerce/ShoppingCart" />
	<dsp:importbean bean="/atg/store/order/purchase/ShoppingCartModifier" />
	
	<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
	<dsp:importbean bean="/atg/dynamo/droplet/Switch" />
	<dsp:importbean bean="/atg/dynamo/droplet/Compare" />
	<script type="text/javascript">
	  function submit(form) {
		    form.submit();
	  }
	  function handleClick(cb,id) { 
		  var fields = document.getElementsByName("sports");   
		  var myArray = new Array();
		  
			  if(cb.checked){
			  		 myArray[id]=cb.value;
				  }
			else{
					  myArray[id]=null;
				  }
			  alert(myArray);
	  } 
	</script>
	<% ArrayList listCommerceItems=new ArrayList(); %>
	
	<table border=1 cellpadding=0 cellspacing=0 width=600 align="center">
		<tr bgcolor="#DBDBDB">
			<td colspan=1 height=18><span class=small> <dsp:droplet
				name="Switch">
				<dsp:param name="value" param="noCrumbs" />
				<dsp:oparam name="false">
				</dsp:oparam>
				<dsp:oparam name="default">
					<dsp:param name="noCrumbs" value="true" />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b
						style="color: blue">Current Order</b>
				</dsp:oparam>
			</dsp:droplet></td>
		</tr>


		<tr valign=top>
			<td valign="top" width=600><%-- put errors here --%> <%-- this table just for indent --%>
			<table border=0 cellpadding=4 width=90%>
				<tr>
					<td><dsp:droplet name="Switch">
						<dsp:param bean="ShoppingCart.current.CommerceItemCount"
							name="value" />
						<dsp:oparam name="0">
            There are no items in your current order.
          </dsp:oparam>
						<dsp:oparam name="default">
							<dsp:form action="cart.jsp" name="testForm" method="post">
								<table border=0 cellpadding=4 cellspacing=1 width=100%>
									<tr bgcolor="lime">
										<td align=center colspan=2><span class=smallbw>Part
										#</span></td>
										<td align=center colspan=3><span class=smallbw>Name</span></td>
										<td align=center colspan=1><span class=smallbw>Qty</span></td>
										<td align=center colspan=1><span class=smallbw>Rate</span></td>
										<td align=center colspan=1><span class=smallbw>TOTAL</span></td>
										<td align=center colspan=2><b><span class=smallbw>Remove</span><b></td>
									</tr>
									<tr>
									</tr>
									<dsp:param name="count" value="1"/>
		<%-- get the real shopping cart items --%>
									<dsp:droplet name="ForEach">
									<% int i=0; %>
										<dsp:param name="array"
											bean="ShoppingCart.current.CommerceItems" />
										<dsp:param name="elementName" value="CommerceItem" />
										<dsp:oparam name="output">
											<dsp:getvalueof id="currentItem" param="CommerceItem"
												idtype="atg.commerce.order.CommerceItem">
		<%-- Remove Selected Link --%>
										<dsp:droplet name="Switch">
											<dsp:param name="value" param="count"/>
											<dsp:oparam name="1">
												<tr>
													<td colspan="10" align="right">
												
								<!--<dsp:a value="" bean="CartModifierFormHandler.removalCommerceIds" href="javascript:submit(document.testForm)">Submit</dsp:a>
								
								<dsp:a href="#" value="" bean="MyCartModifierFormHandler.removeItems">Remove Selected Item
									<dsp:param name="sports" value="<%=listCommerceItems %>"/>
								</dsp:a>
								
													--></td>
												
												</tr>
											
											</dsp:oparam>
										
										</dsp:droplet>
												<tr valign=top>

		<%-- Display part number, product name/link, inventory info columns --%>

													<td>
					<dsp:valueof param="CommerceItem.auxiliaryData.catalogRef.id"></dsp:valueof></td>
													<td></td>
		<%-- Display editable quantity column --%>
													<td><dsp:param name="prodName"
														param="CommerceItem.auxiliaryData.catalogRef.displayName" />
													<dsp:valueof param="prodName"></dsp:valueof></td>
													<td></td>
													<td></td>
													<td><input type="text" size="3"
														name="<dsp:valueof param='CommerceItem.id'/>"
					value="<dsp:valueof param='CommerceItem.quantity'/>" /></td>

		<%-- display Sale Price/List Price --%>
													<td><dsp:droplet name="Switch">
														<dsp:param name="value"
															param="CommerceItem.priceInfo.onSale" />
														<dsp:oparam name="false">
					<dsp:valueof param="CommerceItem.priceInfo.listPrice" />
					
														</dsp:oparam>
														<dsp:oparam name="true">
					<STRIKE><dsp:valueof param="CommerceItem.priceInfo.listPrice" /></STRIKE><br>
					<dsp:valueof param="CommerceItem.priceInfo.salePrice" />
														</dsp:oparam>
													</dsp:droplet></td>
		<!-- TOTAL Price -->
													<td>
													<dsp:droplet name="Switch">
														<dsp:param name="value"
															param="CommerceItem.priceInfo.onSale" />
														<dsp:oparam name="false">
					<dsp:valueof param="CommerceItem.priceInfo.rawTotalPrice"  />
					
														</dsp:oparam>
														<dsp:oparam name="true">
					<STRIKE><dsp:valueof param="CommerceItem.priceInfo.rawTotalPrice" /></STRIKE><br>
					<dsp:valueof param="CommerceItem.priceInfo.amount" />
														</dsp:oparam>
													</dsp:droplet>
													</td>
		<%-- Display "remove" checkbox column --%>
													<td align=middle>
													
													<dsp:getvalueof vartype="java.lang.Object" var="CommerceItemIds" param="CommerceItem.id"/>
													
													<dsp:getvalueof id="commerceItemId"
														param="CommerceItem.id">
				
					<dsp:input type="checkbox" bean="CartModifierFormHandler.removalCommerceIds" value="<%=commerceItemId%>" />
					
				<%-- <input TYPE=checkbox name=sports id="<%=i %>" VALUE="<%=commerceItemId%>" onclick="javascript:handleClick(this,this.id);">--%>
				<%i++; %>
													<%
													listCommerceItems.add(commerceItemId);
													%>
														
													</dsp:getvalueof>
													</td>
													<td>
													
													</td>

												</tr>
											</dsp:getvalueof>
										</dsp:oparam>

									</dsp:droplet>
									<%-- end ForEach over shipping groups --%>
									<tr>
										<td colspan=9>
										<table border=0 cellpadding=0 cellspacing=0 width=100%>
											<tr bgcolor="#666666">
												<td></td>
											</tr>
										</table>
										<td>
									</tr>
									<span class=smallbw></span>
									<dsp:droplet name="Compare">
										<dsp:param bean="ShoppingCart.current.priceInfo.amount"
											name="obj1" />
										<dsp:param bean="ShoppingCart.current.priceInfo.rawSubtotal"
											name="obj2" />
										<dsp:oparam name="default">
											<tr>
												<td colspan=5>&nbsp;</td>
												<td valign=top>Subtotal:</td>
												<td align=right><b> <dsp:valueof
													bean="ShoppingCart.current.priceInfo.amount" /> </b></td>
											</tr>
										</dsp:oparam>
										<dsp:oparam name="equal">
											<tr>
												<td colspan=5>
												<hr color="red" size="5" width=200%>
												</td></tr>
											<tr>
												<td colspan=4></td>
		<%-- Total No of Items  bean="ShoppingCart.current.CommerceItemCount"--%>
												<td>Unique Items:</td>
												<td><dsp:valueof
						bean="ShoppingCart.current.TotalCommerceItemCount" /></td>
		<%-- Total Amount Payable--%>
												<td colspan="1">Total Amount:</td>
												<td align=right><b> $<dsp:valueof
													bean="ShoppingCart.current.priceInfo.amount" /> </b></td>
											</tr>

										</dsp:oparam>
									</dsp:droplet>
								</table>
								<hr color="red" size="5" width=200%>
								<center>
		<%-- Update Order button: --%>
								<dsp:input bean="CartModifierFormHandler.setOrderByCommerceId"
									type="submit" value="Update" />
								
									
		<%-- Remove Selected Items Link: --%>
								<dsp:a href="cart.jsp" bean="CartModifierFormHandler.setOrderByCommerceId" 
								 value="" >
								 	<dsp:valueof value="Remove All"></dsp:valueof>
								</dsp:a>
								
		<%-- GoTo this URL if user pushes RECALCULATE button and there are no errors: --%>
								<dsp:input bean="CartModifierFormHandler.setOrderSuccessURL"
									type="hidden" value="cart.jsp" />
										
								<%
									/* stay here */
								%>
								<%--
					              		GoTo this URL if user pushes RECALCULATE button and there are errors:
					            --%>
								<dsp:input bean="CartModifierFormHandler.setOrderErrorURL"
									type="hidden" value="cart.jsp" />
								
								<%
									/* stay here */
								%>
		<%-- CHECKOUT Order button: --%> &nbsp; &nbsp; 
									<dsp:input
									bean="CartModifierFormHandler.moveToPurchaseInfoByCommerceId"
									type="submit" value="Checkout" />
									
									<dsp:a href="home.jsp">
									<dsp:valueof value="Back to Search" />
								</dsp:a>
									</center>
									<dsp:param name="fromHomePage" value="false"/>
		<%-- If Order is Successful --%>
								<dsp:input
									bean="CartModifierFormHandler.moveToPurchaseInfoSuccessURL"
									type="hidden" value="checkout/shipping.jsp" />
								
								<%-- move on to shipping --%>

								<dsp:input
									bean="CartModifierFormHandler.moveToPurchaseInfoErrorURL"
									type="hidden" value="cart.jsp" />
							</dsp:form>
						</dsp:oparam>

					</dsp:droplet></td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</table>
			<%-- end indent table --%></td>
		</tr>
	</table>
</dsp:page>
<%-- @version $Id: //product/B2BCommerce/version/9.0/release/MotorpriseJSP/j2ee-apps/motorprise/web-app/en/checkout/cart.jsp#1 $$Change: 508164 $--%>
