<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/dynamo/droplet/Compare"/>
<dsp:importbean bean="/atg/dynamo/droplet/IsNull"/>
<dsp:importbean bean="/atg/commerce/order/OrderLookup"/>

                            
<span class=profilelittle> <b><dsp:a href="../profile/my_profile.jsp">My Profile</dsp:a></b> > 
ORDER HISTORY</span>
<p>
<span class=profilebig>My Orders</span>
<p>
<table cellspacing=0 cellpadding=0 border=0>

<!-- Setup gutter and make space -->
  <tr>
    <td width=30%><dsp:img height="1" width="100" src="../images/d.gif"/><br></td>
    <td>&nbsp;&nbsp;</td>
    <td><dsp:img height="1" width="400" src="../images/d.gif"/></td>
  </tr>
  
  <tr valign=top>
    <td>
      <span class=help>These orders are still being processed, or have only
      partially shipped.
    </td>
    <td></td>
    <td>
      <table width=100% cellpadding=0 cellspacing=0 border=0>
      <tr><td class=box-top-profile>My open orders</td></tr></table>
      <p>
        <dsp:droplet name="OrderLookup">
          <dsp:param bean="/atg/userprofiling/Profile.repositoryId" name="userId"/>
          <dsp:param name="state" value="open"/>
	  <dsp:param name="startIndex" param="openStartIndex"/>
	  <dsp:param name="numOrders" value="10"/>

	  <dsp:oparam name="output">
	    <dsp:droplet name="IsNull">
	      <dsp:param name="value" param="previousIndex"/>
	      <dsp:oparam name="false">
		<dsp:droplet name="Compare">
		  <dsp:param name="obj1" param="openStartIndex"/>
		  <dsp:param name="obj2" value="0"/>
		   <dsp:oparam name="greaterthan"> 
		    <dsp:a href="order_history.jsp"><i>Previous orders</i>
		    <dsp:param name="openStartIndex" param="previousIndex"/>
		    <dsp:param name="closedStartIndex" param="closedStartIndex"/>
		    <dsp:param name="cancelledStartIndex" param="cancelledStartIndex"/>
		    </dsp:a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  </dsp:oparam>
	        </dsp:droplet>
	      </dsp:oparam>
	    </dsp:droplet>

	    <dsp:droplet name="ForEach">
	      <dsp:param name="array" param="result"/>
              <dsp:oparam name="outputStart">
		<dsp:droplet name="IsNull">
		  <dsp:param name="value" param="nextIndex"/>
		  <dsp:oparam name="false">
		    <dsp:a href="order_history.jsp"><i>More orders</i>
		    <dsp:param name="openStartIndex" param="nextIndex"/>
		    <dsp:param name="closedStartIndex" param="closedStartIndex"/>
		    <dsp:param name="cancelledStartIndex" param="cancelledStartIndex"/>
		    </dsp:a><br>
	          </dsp:oparam>
	        </dsp:droplet>

                <OL>
              </dsp:oparam>
              <dsp:oparam name="outputEnd">
                </OL>
              </dsp:oparam>
              <dsp:oparam name="empty">
                 No open orders.
              </dsp:oparam>
              <dsp:oparam name="output">
                <LI> <dsp:a href="order.jsp">
                <dsp:param name="orderId" param="element.id"/>
                #<dsp:valueof param="element.id">no order number</dsp:valueof></dsp:a>
                <dsp:valueof date="MMMMM d, yyyy" param="element.submittedDate"/>
                &nbsp;&nbsp;
                <dsp:droplet name="/atg/commerce/order/OrderStatesDetailed">
                  <dsp:param name="state" param="element.state"/>
                  <dsp:oparam name="output"><dsp:valueof param="detailedState"/></dsp:oparam>
                </dsp:droplet>

              </dsp:oparam>
            </dsp:droplet>
          </dsp:oparam>

          <dsp:oparam name="error">
            <span class=profilebig>ERROR:
              <dsp:valueof param="errorMsg">no error message</dsp:valueof>
            </span>
          </dsp:oparam>
        </dsp:droplet>

      <p>
      &nbsp;<br>
    </td>
  </tr>
  
  <tr valign=top>
    <td>
      <span class=help>These orders have been shipped to you.
    </td>
    <td></td>
    <td>
      <table width=100% cellpadding=0 cellspacing=0 border=0>
      <tr><td class=box-top-profile>My shipped orders</td></tr></table>
      <p>
        <dsp:droplet name="OrderLookup">
          <dsp:param bean="/atg/userprofiling/Profile.repositoryId" name="userId"/>
          <dsp:param name="state" value="closed"/>
	  <dsp:param name="startIndex" param="closedStartIndex"/>
	  <dsp:param name="numOrders" value="10"/>

	  <dsp:oparam name="output">
	    <dsp:droplet name="IsNull">
	      <dsp:param name="value" param="previousIndex"/>
	      <dsp:oparam name="false">
		<dsp:droplet name="Compare">
		  <dsp:param name="obj1" param="closedStartIndex"/>
		  <dsp:param name="obj2" value="0"/>
		  <dsp:oparam name="greaterthan">
		    <dsp:a href="order_history.jsp"><i>Previous orders</i>
		    <dsp:param name="openStartIndex" param="openStartIndex"/>
		    <dsp:param name="closedStartIndex" param="previousIndex"/>
		    <dsp:param name="cancelledStartIndex" param="cancelledStartIndex"/>
		    </dsp:a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  </dsp:oparam>
	        </dsp:droplet>
	      </dsp:oparam>
	    </dsp:droplet>

            <dsp:droplet name="ForEach">                            
              <dsp:param name="array" param="result"/>
              <dsp:oparam name="outputStart">
		<dsp:droplet name="IsNull">
		  <dsp:param name="value" param="nextIndex"/>
		  <dsp:oparam name="false">
		    <dsp:a href="order_history.jsp"><i>More orders</i>
		    <dsp:param name="openStartIndex" param="openStartIndex"/>
		    <dsp:param name="closedStartIndex" param="nextIndex"/>
		    <dsp:param name="cancelledStartIndex" param="cancelledStartIndex"/>
		    </dsp:a><br>
	          </dsp:oparam>
	        </dsp:droplet>

                <OL>
              </dsp:oparam>
              <dsp:oparam name="outputEnd">
                </OL>
              </dsp:oparam>
              <dsp:oparam name="empty">
                 No shipped orders.
              </dsp:oparam>
              <dsp:oparam name="output">
                <LI> <dsp:a href="order.jsp">
                <dsp:param name="orderId" param="element.id"/>
                #<dsp:valueof param="element.id">no order number</dsp:valueof></dsp:a>
                <dsp:valueof date="MMMMM d, yyyy" param="element.submittedDate"/>
              </dsp:oparam>
            </dsp:droplet>
          </dsp:oparam>

          <dsp:oparam name="error">
            <span class=profilebig>ERROR:
              <dsp:valueof param="errorMsg">no error message</dsp:valueof>
            </span>
          </dsp:oparam>
        </dsp:droplet>
        </OL>
      
      <p>&nbsp;<br>
    </td>
  </tr>

  <tr valign=top>
    <td>
      <span class=help>These orders have been cancelled.
    </td>
    <td></td>
    <td>
      <table width=100% cellpadding=0 cellspacing=0 border=0>
      <tr><td class=box-top-profile>My cancelled orders</td></tr></table>
      <p>
        <dsp:droplet name="OrderLookup">
          <dsp:param bean="/atg/userprofiling/Profile.repositoryId" name="userId"/>
          <dsp:param name="state" value="removed"/>
	  <dsp:param name="startIndex" param="cancelledStartIndex"/>
	  <dsp:param name="numOrders" value="10"/>

	  <dsp:oparam name="output">
	    <dsp:droplet name="IsNull">
	      <dsp:param name="value" param="previousIndex"/>
	      <dsp:oparam name="false">
		<dsp:droplet name="Compare">
		  <dsp:param name="obj1" param="cancelledStartIndex"/>
		  <dsp:param name="obj2" value="0"/>
		  <dsp:oparam name="greaterthan">
		    <dsp:a href="order_history.jsp"><i>Previous orders</i>
		    <dsp:param name="openStartIndex" param="openStartIndex"/>
		    <dsp:param name="closedStartIndex" param="closedStartIndex"/>
		    <dsp:param name="cancelledStartIndex" param="previousIndex"/>
		    </dsp:a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  </dsp:oparam>
	        </dsp:droplet>
	      </dsp:oparam>
	    </dsp:droplet>

            <dsp:droplet name="ForEach">                            
              <dsp:param name="array" param="result"/>
              <dsp:oparam name="outputStart">
		<dsp:droplet name="IsNull">
		  <dsp:param name="value" param="nextIndex"/>
		  <dsp:oparam name="false">
		    <dsp:a href="order_history.jsp"><i>More orders</i>
		    <dsp:param name="openStartIndex" param="openStartIndex"/>
		    <dsp:param name="closedStartIndex" param="closedStartIndex"/>
		    <dsp:param name="cancelledStartIndex" param="nextIndex"/>
		    </dsp:a><br>
	          </dsp:oparam>
	        </dsp:droplet>

                <OL>
              </dsp:oparam>
              <dsp:oparam name="outputEnd">
                </OL>
              </dsp:oparam>
              <dsp:oparam name="empty">
                 No cancelled orders.
              </dsp:oparam>
              <dsp:oparam name="output">
                <LI> <dsp:a href="order.jsp">
                <dsp:param name="orderId" param="element.id"/>
                #<dsp:valueof param="element.id">no order number</dsp:valueof></dsp:a>
                <dsp:valueof date="MMMMM d, yyyy" param="element.lastModifiedDate"/>

                <dsp:droplet name="/atg/commerce/order/OrderStatesDetailed">
                  <dsp:param name="state" param="element.state"/>
                  <dsp:oparam name="output"><dsp:valueof param="detailedState"/></dsp:oparam>
                </dsp:droplet>

              </dsp:oparam>
            </dsp:droplet>
          </dsp:oparam>

          <dsp:oparam name="error">
            <span class=profilebig>ERROR:
              <dsp:valueof param="errorMsg">no error message</dsp:valueof>
            </span>
          </dsp:oparam>
        </dsp:droplet>
        </OL>
      
      <p>&nbsp;<br>
    </td>
  </tr>
</table>

</BODY>
</HTML>


</dsp:page>
<%-- @version $Id: //product/DCS/version/9.0/release/PioneerCyclingJSP/j2ee-apps/pioneer/web-app/en/user/order_history.jsp#1 $$Change: 508164 $--%>
