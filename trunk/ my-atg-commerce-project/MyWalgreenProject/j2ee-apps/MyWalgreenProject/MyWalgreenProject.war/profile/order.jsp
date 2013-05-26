<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsNull"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<span class=profilelittle> <dsp:a href="my_profile.jsp">MY PROFILE</dsp:a> > 
<dsp:a href="order_history.jsp">ORDER HISTORY</dsp:a> >
ORDER</span>


<dsp:droplet name="/atg/commerce/order/OrderLookup">
  <dsp:param name="orderId" param="orderId"/>

  <dsp:oparam name="error">
    <p>
    <span class=profilebig>ERROR:
    <dsp:valueof param="errorMsg">no error message</dsp:valueof>
    </span>
    <p>  
  </dsp:oparam>

  <dsp:oparam name="output">
    <dsp:setvalue paramvalue="result" param="order"/>
    <p>
    <span class=profilebig>order #<dsp:valueof param="order.id">no order id</dsp:valueof></span>
    <p>

    <p>
    <table cellspacing=0 cellpadding=0 border=0>

      <!-- Setup gutter and make space -->
      <tr>
        <td><dsp:img height="1" width="100" src="../images/d.gif"/><br></td>
        <td>&nbsp;&nbsp;</td>
        <td><dsp:img height="1" width="400" src="../images/d.gif"/></td>
      </tr>

      <dsp:droplet name="Switch">
        <dsp:param name="value" param="order.stateAsString"/>

        <dsp:oparam name="NO_PENDING_ACTION">
          <tr valign=top>
            <td>
              <span class=help>Gosh. You should have this one by now.</span>
            </td>

            <td></td>

            <td>
              <table width=100% cellpadding=0 cellspacing=0 border=0>
              <tr><td class=box-top-profile>Order status</td></tr></table>
              <p>                                
              This order was placed on 
              <dsp:valueof date="MMMMM d, yyyy" param="order.submittedDate"/>
              and shipped on  
              <dsp:valueof date="MMMMM d, yyyy" param="order.completedDate"/>.

              <p>                                
              If there is a problem with this order, please <dsp:a href="contact_customer_service.jsp">contact
              a customer service representative</dsp:a>.                                
              <p>                                
              &nbsp;<br>
            </td>
          </tr>
        </dsp:oparam>

        <dsp:oparam name="REMOVED">
          <tr valign=top>
            <td>
              <span class=help>This order has been cancelled.</span>
            </td>

            <td></td>

            <td>
              <table width=100% cellpadding=0 cellspacing=0 border=0>
              <tr><td class=box-top-profile>Order status</td></tr></table>
              <p>                                
              This order was placed on  
              <dsp:valueof date="MMMMM d, yyyy" param="order.submittedDate"/>. <br>
              Its status is <dsp:valueof param="order.stateAsString">UNKNOWN STATUS</dsp:valueof>. <br>
              <p>                                
              To make any other changes to this order, please 
              <dsp:a href="contact_customer_service.jsp">contact a customer service representative</dsp:a>.
              </span>
              <p>                                
              &nbsp;<br>
            </td>
          </tr>
          </tr>
        </dsp:oparam>

        <dsp:oparam name="default">            
          <tr valign=top>
            <td>
              <span class=help>Since this order has not yet shipped, you may still 
              change it.</span>
            </td>

            <td></td>

            <td>
              <table width=100% cellpadding=0 cellspacing=0 border=0>
              <tr><td class=box-top-profile>Order status</td></tr></table>
              <p>                                
              This order was placed on  
              <dsp:valueof date="MMMMM d, yyyy" param="order.submittedDate"/>. <br>
              Its status is <dsp:valueof param="order.stateAsString">UNKNOWN STATUS</dsp:valueof>. <br>
              <p>                                
              > <dsp:a href="cancel_order.jsp">
                 <dsp:param name="orderId" param="order.id"/>
                 cancel the order</dsp:a><br>
              <p>
              To make any other changes to this order, please 
              <dsp:a href="contact_customer_service.jsp">contact a customer service representative</dsp:a>.
              </span>
              <p>                                
              &nbsp;<br>
            </td>
          </tr>
        </dsp:oparam>
      </dsp:droplet>

      <tr valign=top>
        <td>      
          <span class=help>This is the contents of the order.</span>
        </td>
        <td></td>
        <td>
        <table width=100% cellpadding=0 cellspacing=0 border=0>
        <tr><td class=box-top-profile>Order details</td></tr></table>
        <p>

        <table cellspacing=2 cellpadding=0 border=0>
          <tr><td></td><td>&nbsp;&nbsp;</td><td></td><td>&nbsp;&nbsp;</td><td></td></tr>

          <tr valign=top> 
            <td colspan=3>

              <b>Order # <dsp:valueof param="order.id">no order id</dsp:valueof></b><br>
              <dsp:valueof date="h:mma MMMMM d, yyyy" param="order.submittedDate"/><br>
              Sales: orders@example.com
            </td>
            <td colspan=2></td>
          </tr>
          <tr><td colspan=5><hr size=0></td></tr>

          <tr valign=top> 
            <td colspan=3>
              <dsp:getvalueof id="pval0" param="order" idtype=" atg.commerce.order.Order"><dsp:include page="OrderBillingInfo.jsp"><dsp:param name="order" value="<%=pval0%>"/></dsp:include></dsp:getvalueof>
            </td>
            <td colspan=2></td>
          </tr>

          <tr><td colspan=5><hr size=0></td></tr>

          <dsp:getvalueof id="pval0" param="order" idtype=" atg.commerce.order.Order"><dsp:include page="OrderShippingInfo.jsp"><dsp:param name="order" value="<%=pval0%>"/></dsp:include></dsp:getvalueof>

          <tr><td colspan=5><hr size=0></td></tr>

        </table>
      </td>
    </tr>
  </table>
  <P>

  </dsp:oparam>
</dsp:droplet>


</body>
</html>

</dsp:page>
