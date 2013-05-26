<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/order/ShoppingCartModifier"/>
<dsp:setvalue bean="Profile.currentLocation" value="shopping_cart"/>
<dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach"/>
<body>
<html>
<p>
<span class=storebig><b>Order Information</span><br>
<p>
<dsp:form action="" method="POST">
			<dsp:droplet name="/atg/dynamo/droplet/Switch">
              <dsp:param bean="ShoppingCartModifier.formError" name="value"/>
              <dsp:oparam name="true">
                <span class=registrationerror>
                  <span class=help>checkout  Error !:</span><p>
                  <UL>
                    <dsp:droplet name="ErrorMessageForEach">
                      <dsp:param bean="ShoppingCartModifier.formExceptions" name="exceptions"/>
                      <dsp:oparam name="output">
                       <LI> <dsp:valueof param="message"/>
                      </dsp:oparam>
                    </dsp:droplet>
                  </UL>
                </span>
              </dsp:oparam>
            </dsp:droplet>

<table cellspacing=0 cellpadding=0 border=0>

  <tr valign=top>
    <td width=200>
      <span class=help><b>Enter a billing address. </span>
    </td>
    <td></td>
    <td>
      <table width=100% cellpadding=0 cellspacing=0 border=0>
      <tr><td class=box-top-store><b>My billing address</td></tr></table>
      <p>

Name<br>      
<dsp:input bean="ShoppingCartModifier.paymentGroup.billingAddress.firstName" size="15" type="text"/>
<dsp:input bean="ShoppingCartModifier.paymentGroup.billingAddress.middleName" size="10" type="text"/>
<dsp:input bean="ShoppingCartModifier.paymentGroup.billingAddress.lastName" size="15" type="text"/><br>

Street address <br>
<dsp:input bean="ShoppingCartModifier.paymentGroup.billingAddress.address1" size="40" type="text"/><br>
<dsp:input bean="ShoppingCartModifier.paymentGroup.billingAddress.address2" size="40" type="text"/><br>

City, State/Province, Postal Code<br>
<dsp:input bean="ShoppingCartModifier.paymentGroup.billingAddress.city" size="20" type="text"/>
<dsp:select bean="ShoppingCartModifier.paymentGroup.billingAddress.state">
<%-- 
This page fragment generates a series of dsp:option tags, one for each
state or Candian province we want to let the user select as part of an
address. 
--%>

    <% atg.servlet.DynamoHttpServletRequest dynamoRequest =
      atg.servlet.ServletUtil.getDynamoRequest(request); 
    %>

<%-- Generate an empty option tag for no selection --%>
<dsp:option value=""/>

<%-- Iterate over the list of known destinations and generate an option tag for each --%>

<dsp:droplet name="/atg/dynamo/droplet/ForEach">
  <dsp:param name="array" bean="/atg/commerce/util/StateList.places"/>
  <dsp:param name="elementName" value="state"/>    
  <dsp:oparam name="output">
    <dsp:option value='<%=dynamoRequest.getParameter("state.code")%>'/>
    <%=dynamoRequest.getParameter("state.displayName")%>
  </dsp:oparam>
</dsp:droplet>
</dsp:select>

<dsp:input bean="ShoppingCartModifier.paymentGroup.billingAddress.postalCode" size="10" type="text"/>
<br>

Country<br>
<dsp:input bean="ShoppingCartModifier.paymentGroup.billingAddress.country" maxlength="10" size="10" type="text" required="<%=true%>"/>
<br>

Email<br>
      <dsp:input bean="Profile.email" size="20" type="text"/><br>
      
      <p>&nbsp;<br>
    </td>
  </tr>
  
  
  <tr valign=top>
    <td width=200>
      <span class=help><b>Decide if you wish to ship all items to
      your billing address or a different address.</span>
    </td>
    <td></td>
    <td>
      <table width=100% cellpadding=0 cellspacing=0 border=0>
      <tr><td class=box-top-store><b>My shipping address</td></tr></table>

      <p>

      
      <p>
	
	

Name<br>      

<!-- Store the ProfileID in ownerId field of the new address.
     This tells us this address "belongs to" (and can be 
     edited) by the user. -->
<dsp:input bean="ShoppingCartModifier.shippingGroup.shippingAddress.ownerId" beanvalue="Profile.id" type="hidden"/>
<dsp:input bean="ShoppingCartModifier.shippingGroup.shippingAddress.firstName" size="15" type="text"/>
<dsp:input bean="ShoppingCartModifier.shippingGroup.shippingAddress.middleName" size="10" type="text"/>
<dsp:input bean="ShoppingCartModifier.shippingGroup.shippingAddress.lastName" size="15" type="text"/><br>

Street address <br>
<dsp:input bean="ShoppingCartModifier.shippingGroup.shippingAddress.address1" size="40" type="text"/><br>
<dsp:input bean="ShoppingCartModifier.shippingGroup.shippingAddress.address2" size="40" type="text"/><br>

City, State/Province, Postal Code<br>
<dsp:input bean="ShoppingCartModifier.shippingGroup.shippingAddress.city" size="20" type="text"/>
<dsp:select bean="ShoppingCartModifier.shippingGroup.shippingAddress.state">
<%-- 
This page fragment generates a series of dsp:option tags, one for each
state or Candian province we want to let the user select as part of an
address. 
--%>

    <% atg.servlet.DynamoHttpServletRequest dynamoRequest =
      atg.servlet.ServletUtil.getDynamoRequest(request); 
    %>

<%-- Generate an empty option tag for no selection --%>
<dsp:option value=""/>

<%-- Iterate over the list of known destinations and generate an option tag for each --%>

<dsp:droplet name="/atg/dynamo/droplet/ForEach">
  <dsp:param name="array" bean="/atg/commerce/util/StateList.places"/>
  <dsp:param name="elementName" value="state"/>    
  <dsp:oparam name="output">
    <dsp:option value='<%=dynamoRequest.getParameter("state.code")%>'/>
    <%=dynamoRequest.getParameter("state.displayName")%>
  </dsp:oparam>
</dsp:droplet>
</dsp:select>
<dsp:input bean="ShoppingCartModifier.shippingGroup.shippingAddress.postalCode" size="10" type="text"/><br>

Country<br>
<dsp:input bean="ShoppingCartModifier.shippingGroup.shippingAddress.country" maxlength="10" size="10" type="text" required="<%=true%>"/>
<br>


      <p>&nbsp;<br>
	
<b>Shipping Method :</b> <dsp:valueof bean="ShoppingCartModifier.shippingGroup.shippingMethod"></dsp:valueof><br>

      
      
      
      <p>
      &nbsp;<br>
    </td>
  </tr> 
  
  <tr valign=top>
    <td width=200>
      <span class=help><b>We accept credit card payments in the form of master card, visa,
      american express, and discover.
      
      </span>
    </td>
    <td></td>
    <td>
      <table width=100% cellpadding=0 cellspacing=0 border=0>
      <tr><td class=box-top-store><b>Payment method</td></tr></table>
      <p>
      
      I will pay with this credit card
      <blockquote>
        <p>
	New card type 
	<dsp:select bean="ShoppingCartModifier.paymentGroup.creditCardType" required="<%=true%>">
	<dsp:option value="Visa"/>Visa
	<dsp:option value="MasterCard"/>Master Card
	<dsp:option value="AmericanExpress"/>American Express
	<dsp:option value="Discover"/>Discover
	</dsp:select><br>

        New card number and expiration date<br>
	<dsp:input bean="ShoppingCartModifier.paymentGroup.creditCardNumber" maxlength="16" size="16" type="text" required="<%=true%>"/><br>

	<!-- Set the month that the card will expire on -->
	Month: <dsp:select bean="ShoppingCartModifier.paymentGroup.expirationMonth">
	<dsp:option value="1"/>January
	<dsp:option value="2"/>February
	<dsp:option value="3"/>March
	<dsp:option value="4"/>April
	<dsp:option value="5"/>May
	<dsp:option value="6"/>June
	<dsp:option value="7"/>July
	<dsp:option value="8"/>August
	<dsp:option value="9"/>September
	<dsp:option value="10"/>October
	<dsp:option value="11"/>November
	<dsp:option value="12"/>December
	</dsp:select>
	
	<!-- Set the year that the card will expire on -->
	Year: <dsp:select bean="ShoppingCartModifier.paymentGroup.expirationYear">
	<dsp:option value="2013"/>2013
	</dsp:select>

      </blockquote>
      
      <p>&nbsp;<br>

<!-- Set the Location to go to if there are no errors when processing this form -->
<dsp:input bean="ShoppingCartModifier.moveToConfirmationSuccessURL" type="hidden" value="../checkout/order_confirm.jsp"/>

<!-- Set the Location to go to if there are error on this form.  We stay on this page and then -->
<!-- just display the error messages.                                                          -->
<dsp:input bean="ShoppingCartModifier.moveToConfirmationErrorURL" type="hidden" value="order_info.jsp"/>

<!-- Go to this URL if user's session expired while he pondered this page -->
<dsp:input bean="ShoppingCartModifier.sessionExpirationURL" type="hidden" value="../index.jsp"/>
      
      <dsp:input bean="ShoppingCartModifier.moveToConfirmation" type="submit" value="   Continue   "/>
      
    </td>
  </tr>
    
  </table>


</dsp:form>
<p>&nbsp;<br>

</body>
</html>
</dsp:page>
