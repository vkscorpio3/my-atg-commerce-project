<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<dsp:page>

<dsp:importbean bean="/atg/commerce/order/ShoppingCartModifier"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsNull"/>

<dsp:include page="../../common/HeadBody.jsp"></dsp:include>
<dsp:include page="../../common/ModalBrand.jsp"></dsp:include>

<span class=storelittle> 
<dsp:a href="../cart.jsp">SHOPPING CART</dsp:a> > CHECKOUT
</span>
<p>
<span class=storebig>Confirm your Order</span><br>
<span class=help>Make sure everything is correct, and then submit your order.</span>
<p>

<dsp:include page="../../common/DisplayShoppingCartModifierErrors.jsp"></dsp:include>

<dsp:getvalueof id="form44" bean="/OriginatingRequest.requestURI" idtype="java.lang.String">
<dsp:form action="<%=form44%>">
<dsp:input bean="ShoppingCartModifier.orderId" beanvalue="ShoppingCart.current.Id" type="hidden"/>

<table cellspacing=0 cellpadding=0 border=0>

<!-- Setup gutter and make space -->
  <tr>
    <td width=200><dsp:img height="1" width="100" src="../../images/d.gif"/><br></td>
    <td>&nbsp;&nbsp;</td>
    <td><dsp:img height="1" width="400" src="../../images/d.gif"/></td>
  </tr>
  
  <tr valign=top>
    <td width=200>
      <span class=help>Please check your order one last time, before
      submitting it. This is the final step.
      <p>
      If you have made an error, then you may click the appropriate
      link to return to the page to make changes. You will not have
      to reenter correct information.</span>
    </td>
    <td></td>
    <td>
      <table width=100% cellpadding=0 cellspacing=0 border=0>
      <tr><td class=box-top-store>Verify my order</td></tr></table>
      <p>
      <table cellspacing=2 cellpadding=0 border=0>
  <tr><td></td><td>&nbsp;&nbsp;</td><td></td><td>&nbsp;&nbsp;</td><td></td></tr>
  
  
  <!-- Display the current billing address information for the user.  This info is contained -->
  <!-- in some object that implements the PaymentGroup interface.  In this case, the object  -->
  <!-- is a CreditCard which contains billing address info.                                  -->
  <tr valign=top> 
    <td colspan=3>
    
      <b>Bill to:</b>
      <BR>
      <dsp:droplet name="ForEach">
       <dsp:param bean="ShoppingCartModifier.order.paymentGroups" name="array"/>
       <dsp:param name="elementName" value="paymentGroup"/>
       <dsp:oparam name="output">
         <dsp:droplet name="Switch">
         <dsp:param name="value" param="paymentGroup.paymentMethod"/>
         <dsp:oparam name="creditCard">
           
            <dsp:getvalueof id="pval0" param="paymentGroup.billingAddress"><dsp:include page="../../user/DisplayAddress.jsp"><dsp:param name="address" value="<%=pval0%>"/><dsp:param name="private" value="false"/></dsp:include></dsp:getvalueof>

            <br>--<br>
            
            Credit Card: 
			<dsp:valueof param="paymentGroup.creditCardType"/> 
            <dsp:valueof converter="creditcard" param="paymentGroup.creditCardNumber"/>

          <BR>
          </dsp:oparam>
          <dsp:oparam name="giftCertificate">
            Gift Certificate: <dsp:valueof param="paymentGroup.giftCertificateNumber"/><BR>
          </dsp:oparam>
          </dsp:droplet> <!-- End Switch on type of payment group -->

        </dsp:oparam>
        <dsp:oparam name="empty">
          No payment
        </dsp:oparam>
        </dsp:droplet> <!-- End ForEach on payment groups -->
    </td>
    <td colspan=2></td>
  </tr>
  
  <tr><td colspan=5><hr size=0></td></tr>

<!--------------------------------------------------------------------->
<!-- Begin Printing out each shipping group, with associated Commerce-->
<!-- items, quantity, price and finally the cost of shipping         -->
<!--------------------------------------------------------------------->

<dsp:droplet name="ForEach">
<dsp:param bean="ShoppingCartModifier.Order.ShippingGroups" name="array"/>
<dsp:param name="elementName" value="ShippingGroup"/>
<dsp:param name="indexName" value="shippingGroupIndex"/>

<!-- First output all of the address information for this shipping group -->
<dsp:oparam name="output">

<%/* If there is nothing in the group, do not display it */%>

<dsp:droplet name="IsEmpty">
  <dsp:param name="value" param="ShippingGroup.CommerceItemRelationships"/>
  <dsp:oparam name="false">

  <!-- Default formatting info -->
  <tr valign=top> 
  <td colspan=3>

  <dsp:droplet name="Switch">
  <dsp:param name="value" param="ShippingGroup.shippingGroupClassType"/>
  <dsp:oparam name="hardgoodShippingGroup"> 
    <b>Ship to:</b><br>   
  
    <!-- If address owner id = profile id, then display street address -->   
    <dsp:droplet name="Switch">
      <dsp:param name="value" param="ShippingGroup.shippingAddress.ownerId"/>

      <!-- If this user "owns" this address, pass in private=false: -->
      <dsp:getvalueof id="nameval3" bean="Profile.id" idtype="java.lang.String">
<dsp:oparam name="<%=nameval3%>">    
        <dsp:getvalueof id="pval0" param="ShippingGroup.shippingAddress"><dsp:include page="../../user/DisplayAddress.jsp"><dsp:param name="address" value="<%=pval0%>"/><dsp:param name="private" value="false"/></dsp:include></dsp:getvalueof>
      </dsp:oparam>
</dsp:getvalueof>

      <!-- Else pass in private=true: -->
      <dsp:oparam name="default">
        <dsp:getvalueof id="pval0" param="ShippingGroup.shippingAddress"><dsp:include page="../../user/DisplayAddress.jsp"><dsp:param name="address" value="<%=pval0%>"/><dsp:param name="private" value="true"/></dsp:include></dsp:getvalueof>
      </dsp:oparam>
    </dsp:droplet>
    

    <!-- End the default shipping information -->
    <br>--<br>
    Shipping method: <dsp:valueof param="ShippingGroup.shippingMethod"/>
    ( <dsp:valueof converter="currency" param="ShippingGroup.PriceInfo.amount"/> )<br>
    </dsp:oparam> <!-- End print out info for hardgood shipping group -->

    <dsp:oparam name="electronicShippingGroup">
     <b>Email to:</b><br>
     <dsp:valueof param="ShippingGroup.emailAddress"/>
    </dsp:oparam>
    </dsp:droplet> <!-- End switch on type of shipping Group -->
    </td> 
    <td colspan=2></td>
    </tr>
   
  
    <!---------------------------------------------------------------------------------------->
    <!-- List out each item that is associated with this shipping group.  We iterate over   -->
    <!-- each item and print out both its quantity and its CatalogRefId.                    -->
    <!---------------------------------------------------------------------------------------->
  
    <!-- Default output for each item listing -->

    <!------------------------------------------>

    <dsp:droplet name="ForEach">
    <dsp:param name="array" param="ShippingGroup.CommerceItemRelationships"/>
    <dsp:param name="elementName" value="CiRelationship"/>
    <dsp:oparam name="output">
      <tr valign=top>
      <td align=right><dsp:valueof param="CiRelationship.Quantity"/></td>
      <td></td>
      <td><i><dsp:valueof param="CiRelationship.CommerceItem.auxiliaryData.productRef.displayName"/></i></td>
      <td></td><td align=right></td>
      </tr>
      
    </dsp:oparam>
    </dsp:droplet>  

  <!--------------------------------------------------------------------------------------->
  <!-- End the information on the ShippingGroup level                                    -->
  
 <tr><td colspan=5><hr size=0></td></tr>

</dsp:oparam>
</dsp:droplet>

</dsp:oparam>

<dsp:oparam name="empty">
No items in the cart!
</dsp:oparam>

</dsp:droplet>

<!-- End displaying each Shipping Group and their associated items         -->
<!--------------------------------------------------------------------------->


<!-------------------------------------------------------------------------->
<!-- Print out order totals                                               -->


  
  <tr valign=top>
    <td colspan=2></td>
    <td align=right>order subtotal</td>
    <td></td><td align=right><dsp:valueof converter="currency" bean="ShoppingCartModifier.order.priceInfo.amount"/></td>
  </tr>
  <tr valign=top>
    <td colspan=2></td>
    <td align=right>sales tax</td>
    <td></td><td align=right><dsp:valueof converter="currency" bean="ShoppingCartModifier.order.priceInfo.tax"/></td>
  </tr>
  <tr valign=top>
    <td colspan=2></td>
    <td align=right>shipping</td>
    <td></td><td align=right><dsp:valueof converter="currency" bean="ShoppingCartModifier.order.priceInfo.shipping"/></td>
  </tr>
  <tr><td colspan=5><hr size=0></td></tr>
  <tr valign=top>
    <td colspan=2></td>
    <td align=right>order total including discounts</td>
    <td></td><td align=right><b><dsp:valueof converter="currency" bean="ShoppingCartModifier.order.priceInfo.total"/></b></td>
  </tr>
  
 

  

</table>
                        <p>&nbsp;<br>
                </td>


    <tr valign=top>
    <td>
      <span class=help>This is it!</span>
      <p>
      
    </td>
    <td></td>
    <td>
  
      <!------------------------------------------------------------------->
    
      <!-- Location to go to on order success -->
      <%
      /*  Use this snippet if you are using regular http checkout:
      <dsp:input bean="ShoppingCartModifier.moveToOrderCommitSuccessURL" type="hidden" value="../co_thank_you.jsp"/>
      */%>

      <%
      /*  Use this snippet if you are using SSL checkout: */
      %>
      <dsp:droplet name="/atg/dynamo/droplet/ProtocolChange">
        <dsp:param name="inUrl" value="../co_thank_you.jsp"/>
        <dsp:oparam name="output">
          <dsp:input bean="ShoppingCartModifier.moveToOrderCommitSuccessURL" paramvalue="nonSecureUrl" type="hidden"/>
        </dsp:oparam>
      </dsp:droplet>
  
      <!-- Location to go to on order error -->
      <dsp:input bean="ShoppingCartModifier.moveToOrderCommitErrorURL" type="hidden" value="co_confirm.jsp"/>
      
      <!-- Go to this URL if user's session expired while he pondered this page -->
      <dsp:input bean="ShoppingCartModifier.sessionExpirationURL" type="hidden" value="../../common/SessionExpired.jsp"/>

      <table width=100% cellpadding=0 cellspacing=0 border=0>
      <tr><td class=box-top-store>Place my order</td></tr></table>
      <p>
        You may fix any errors now.
        <p>
        > <dsp:a href="../cart.jsp">return to shopping cart</dsp:a><br>
        > <dsp:a href="EditShippingAddresses.jsp">change shipping destinations</dsp:a><br>
        > <dsp:a href="payment_info_returning.jsp">change payment method</dsp:a>
        <p>
        Clicking below will place your order.
        <p>
  
        <dsp:input bean="ShoppingCartModifier.MoveToOrderCommit" type="submit" value="   Place my order -->   "/>
      <p>&nbsp;<br>
    </td>
  </tr>
</table>
</dsp:form></dsp:getvalueof>


<p>&nbsp;<br>

<hr size=0>

</body>
</html>


</dsp:page>
<%-- @version $Id: //product/DCS/version/9.0/release/PioneerCyclingJSP/j2ee-apps/pioneer/web-app/en/checkout/full/co_confirm.jsp#1 $$Change: 508164 $--%>
