<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>

<!---- SHIPPING INFORMATION ----->
<dsp:droplet name="ForEach">
  <dsp:param name="array" param="order.shippingGroups"/>
  <dsp:param name="elementName" value="sGroup"/>
  <dsp:oparam name="output">
    <tr valign=top> 
      <td colspan=3>
        <dsp:droplet name="Switch">
          <dsp:param name="value" param="sGroup.shippingGroupClassType"/>
          <dsp:oparam name="electronicShippingGroup">
            Delivered to <dsp:valueof param="sGroup.emailAddress"/>
          </dsp:oparam>
          
          <dsp:oparam name="default">
        <%/* if gift, say so, and use the private address */%>     
        <dsp:droplet name="/atg/dynamo/droplet/IsEmpty">
          <dsp:param name="value" param="sGroup.handlingInstructions"/>
          <dsp:oparam name="true">
            <b>Ship To:</b><br>
            <dsp:getvalueof id="pval0" param="sGroup.shippingAddress"><dsp:include page="DisplayAddress.jsp"><dsp:param name="address" value="<%=pval0%>"/><dsp:param name="private" value="false"/></dsp:include></dsp:getvalueof>
          </dsp:oparam>
          <dsp:oparam name="false">
            <b>Ship GIFT To:</b><br>
            <dsp:getvalueof id="pval0" param="sGroup.shippingAddress"><dsp:include page="DisplayAddress.jsp"><dsp:param name="address" value="<%=pval0%>"/><dsp:param name="private" value="true"/></dsp:include></dsp:getvalueof>
          </dsp:oparam>
        </dsp:droplet>
         --<br>         
        Shipping Method: <dsp:valueof param="sGroup.shippingMethod"><i>no shipping method</i></dsp:valueof>
        <br>--<br>
        Shipping Status: <dsp:valueof param="sGroup.stateDetail"><i>no status</i></dsp:valueof>

        </dsp:oparam>
        </dsp:droplet>
      </td>
      <td colspan=2></td>
    </tr>

    <tr><td colspan=5><hr size=0></td></tr>
    
    <dsp:droplet name="ForEach">
      <dsp:param name="array" param="sGroup.CommerceItemRelationships"/>
      <dsp:param name="elementName" value="CiRelationship"/>
      <dsp:oparam name="output">
        <tr valign=top> 
          <td align=right><dsp:valueof param="CiRelationship.Quantity"/></td>
          <td></td>
          <td>
            <i><dsp:valueof param="CiRelationship.CommerceItem.auxiliaryData.productRef.displayName"/></i>
              <br>
              <dsp:droplet name="Switch">
                <dsp:param name="value" param="CiRelationship.state"/>
                <dsp:oparam name="4">
                  BACK ORDERED 
                </dsp:oparam>
              </dsp:droplet>
          </td>
          <td align=left></td>
          <td align=right><dsp:valueof converter="currency" param="CiRelationship.CommerceItem.PriceInfo.amount"/></td>
  </tr>
      </dsp:oparam>
    </dsp:droplet>  

    <!-- End the information on the ShippingGroup level -->
    <tr><td colspan=5><hr size=0></td></tr>
    <tr valign=top>
      <td colspan=2></td>
      <td align=right>shipping</td>
      <td></td><td align=right><dsp:valueof converter="currency" param="sGroup.PriceInfo.amount"/></td>
    </tr>

    <tr><td colspan=5><hr></td></tr>

    <dsp:droplet name="Switch">
      <dsp:param name="value" param="count"/>
      <dsp:oparam name="default">
      </dsp:oparam>
      <dsp:getvalueof id="nameval1" param="size" idtype="java.lang.Integer">
      <dsp:oparam name="<%=nameval1.toString()%>">
        <tr valign=top>
          <td colspan=2></td>
          <td align=right>subtotal</td>
          <td></td><td align=right><dsp:valueof converter="currency" param="order.priceInfo.rawSubtotal"/></td>
        </tr>
        <tr valign=top>
          <td colspan=2></td>
          <td align=right>sales tax</td>
          <td></td><td align=right><dsp:valueof converter="currency" param="order.priceInfo.tax">no tax</dsp:valueof></td>
        </tr>
        <tr valign=top>
          <td colspan=2></td>
          <td align=right>order total</td>
          <td></td><td align=right><b><dsp:valueof converter="currency" param="order.priceInfo.total"/></b></td> 
        </tr>
      </dsp:oparam>
      </dsp:getvalueof>
    </dsp:droplet>
  </dsp:oparam>

  <dsp:oparam name="empty">
    <i>There is No Shipping Information in the order</i> 
  </dsp:oparam>
</dsp:droplet> 
<!---- END SHIPPING INFORMATION ---->



<%--
  </dsp:oparam>
  <dsp:oparam name="empty"></dsp:oparam>              
</dsp:droplet>
--%>


</dsp:page>
<%-- @version $Id: //product/DCS/version/9.0/release/PioneerCyclingJSP/j2ee-apps/pioneer/web-app/en/user/OrderShippingInfo.jsp#1 $$Change: 508164 $--%>
