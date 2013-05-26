<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>

<!---- BILLING INFORMATION ----->
          
<b>Bill To:</b><br>
<dsp:droplet name="ForEach">
  <dsp:param name="array" param="order.paymentGroups"/>
  <dsp:param name="elementName" value="pGroup"/>
  <dsp:oparam name="output">
    <dsp:droplet name="Switch">
      <dsp:param name="value" param="size"/>
      <dsp:oparam name="1">
      </dsp:oparam>
      <dsp:oparam name="default"> 
        <LI> Due: <dsp:valueof converter="currency" param="pGroup.amount"><i>undef</i></dsp:valueof> (<dsp:valueof param="pGroup.currencyCode"/>)
      </dsp:oparam>
    </dsp:droplet>

     <dsp:droplet name="Switch">
       <dsp:param name="value" param="pGroup.paymentMethod"/>
       <dsp:oparam name="creditCard">
         <dsp:getvalueof id="pval0" param="pGroup.billingAddress"><dsp:include page="DisplayAddress.jsp"><dsp:param name="address" value="<%=pval0%>"/><dsp:param name="private" value="false"/></dsp:include></dsp:getvalueof>
       </dsp:oparam>
      </dsp:droplet>
     <br>--<br>
     Payment type:
     <dsp:droplet name="Switch">
       <dsp:param name="value" param="pGroup.paymentMethod"/>
       <dsp:oparam name="creditCard">
         <dsp:valueof param="pGroup.creditCardType"/> 
         <dsp:valueof converter="creditcard" param="pGroup.creditCardNumber"/><BR>
       </dsp:oparam>
       <dsp:oparam name="giftCertificate">
         Gift Certificate: <dsp:valueof param="pGroup.id"/><BR>
       </dsp:oparam>
     </dsp:droplet>

    <dsp:droplet name="Switch">
      <dsp:param name="value" param="size"/>
      <dsp:oparam name="1">
      </dsp:oparam>
      <dsp:oparam name="default"> 
        State: <dsp:valueof param="pGroup.stateDetail"><dsp:valueof param="pGroup.state"><i>undef</i></dsp:valueof></dsp:valueof><br>
        Pays For:<br>
        <dsp:getvalueof id="pval0" param="pGroup"><dsp:include page="OrderItemsPerGroup.jsp"><dsp:param name="group" value="<%=pval0%>"/><dsp:param name="empty_msg" value="This Pays for Nothing"/></dsp:include></dsp:getvalueof><br>
        <dsp:getvalueof id="pval0" param="pGroup"><dsp:include page="ShippingCharges.jsp"><dsp:param name="group" value="<%=pval0%>"/><dsp:param name="empty_msg" value="This group pays for Nothing"/></dsp:include></dsp:getvalueof><br>
        <dsp:getvalueof id="pval0" param="pGroup"><dsp:include page="OrderCharges.jsp"><dsp:param name="group" value="<%=pval0%>"/><dsp:param name="empty_msg" value="This group pays for Nothing"/></dsp:include></dsp:getvalueof>
        </dt></dt>
        <br>
      </dsp:oparam>
    </dsp:droplet>
  </dsp:oparam>      
  <dsp:oparam name="empty">
    <i>There is No Billing Information in the Order</i> 
  </dsp:oparam>
</dsp:droplet>
<!---- END BILLING INFORMATION ---->


</dsp:page>
<%-- @version $Id: //product/DCS/version/9.0/release/PioneerCyclingJSP/j2ee-apps/pioneer/web-app/en/user/OrderBillingInfo.jsp#1 $$Change: 508164 $--%>
