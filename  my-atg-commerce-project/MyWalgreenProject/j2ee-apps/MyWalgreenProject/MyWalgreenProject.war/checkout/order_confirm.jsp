<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/commerce/order/ShoppingCartModifier"/>
<dsp:importbean bean="/atg/commerce/ShoppingCart"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsNull"/>
<dsp:importbean bean="/atg/commerce/util/PlaceLookup"/>



<p>
<span class=storebig>Confirm your Order</span><br>
<span class=help>Make sure everything is correct, and then submit your order.</span>
<p>

<dsp:form action="">
<dsp:input bean="ShoppingCartModifier.orderId" beanvalue="ShoppingCart.current.Id" type="hidden"/>

<table cellspacing=0 cellpadding=0 border=0>

      Please check your order one last time, before
      submitting it. This is the final step.
      If you have made an error, then you may click the appropriate
      link to return to the page to make changes. You will not have
      to reenter correct information.
    <td>
      <table width=100% cellpadding=0 cellspacing=0 border=0>
      <tr><td class=box-top-store>Verify my order</td></tr></table>
      <p>
      <table cellspacing=2 cellpadding=0 border=0>
  <tr><td></td><td>&nbsp;&nbsp;</td><td></td><td>&nbsp;&nbsp;</td><td></td></tr>
  
  
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
           
            <dsp:valueof param="paymentGroup.billingAddress.city"/>,
    <dsp:valueof param="paymentGroup.billingAddress.state"/>,
    <dsp:valueof param="paymentGroup.billingAddress.postalCode"/>,
    <dsp:valueof param="paymentGroup.billingAddress.country"/>
 

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
<dsp:oparam name="output">
<dsp:droplet name="IsEmpty">
  <dsp:param name="value" param="ShippingGroup.CommerceItemRelationships"/>
  <dsp:oparam name="false">
  <tr valign=top> 
  <td colspan=3>
  <dsp:droplet name="Switch">
  <dsp:param name="value" param="ShippingGroup.shippingGroupClassType"/>
  <dsp:oparam name="hardgoodShippingGroup"> 
    <b>Ship to:</b><br>   
  
<dsp:valueof param="ShippingGroup.shippingAddress.city"/>,
    <dsp:valueof param="ShippingGroup.shippingAddress.state"/>,
    <dsp:valueof param="ShippingGroup.shippingAddress.postalCode"/>,
    <dsp:valueof param="ShippingGroup.shippingAddress.country"/>
    <br>
    
    

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

          <dsp:input bean="ShoppingCartModifier.moveToOrderCommitSuccessURL" value="../checkout/order_summary.jsp" type="hidden"/>

  
      <!-- Location to go to on order error -->
      <dsp:input bean="ShoppingCartModifier.moveToOrderCommitErrorURL" type="hidden" value="order_confirm.jsp"/>
      
      <!-- Go to this URL if user's session expired while he pondered this page -->
      <dsp:input bean="ShoppingCartModifier.sessionExpirationURL" type="hidden" value="../../common/SessionExpired.jsp"/>

      
  
        <dsp:input bean="ShoppingCartModifier.MoveToOrderCommit" type="submit" value="   Place my order -->   "/>
      <p>&nbsp;<br>
    </td>
  </tr>
</table>


<p>&nbsp;<br>

<hr size=0>
</dsp:form>
</dsp:page>
