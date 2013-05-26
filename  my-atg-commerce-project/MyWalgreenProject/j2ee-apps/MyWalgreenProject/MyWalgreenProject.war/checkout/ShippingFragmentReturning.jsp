<%@ taglib uri="core" prefix="core" %>
<%@page import="atg.beans.DynamicBeans"%>
<%--
This fragment gathers hardgood shipping info for a order's items
that are not gifts. This is used for returning customers.
--%>


    <% atg.servlet.DynamoHttpServletRequest dynrequest =
      atg.servlet.ServletUtil.getDynamoRequest(request); 
    %>

<tr valign=top>
	<td>
		<dsp:include page="YourItems.jsp"></dsp:include>
	</td>
	<td></td>
	<td>

	 <table width=100% cellpadding=0 cellspacing=0 border=0>
	 <tr><td class=box-top-store>Ship your items</td></tr></table>
	  <p>
	  
<%-- If user has a shipping address, that's where it's going to go by default.
  If there is no shipping address yet, then we have the form to enter one. --%>
  
<% Boolean noShippingAddr = Boolean.FALSE; %>
  
<dsp:getvalueof id="shipAddress" bean="Profile.shippingAddress">
<%
   if (null == shipAddress) {
     noShippingAddr = Boolean.TRUE;
   }
   else {
       String profileName = (String)DynamicBeans.getPropertyValue(
	       shipAddress, "firstName"); 
       if((profileName== null) || (profileName.equals(""))) {
          noShippingAddr = Boolean.TRUE;
       }
   }
 %>
</dsp:getvalueof>


<core:switch value="<%=noShippingAddr%>">
  <core:case value="<%= Boolean.TRUE %>">

    <%@ include file="NoShippingAddress.jspf" %>
  </core:case>  
  <core:case value="<%= Boolean.FALSE %>">

    <%-- Set the shipping address to be the user's default  --%>
    <dsp:input bean="ShoppingCartModifier.shippingGroup.shippingAddress.firstName" beanvalue="Profile.shippingAddress.firstName" size="30" type="hidden"/>
    <dsp:input bean="ShoppingCartModifier.shippingGroup.shippingAddress.middleName" beanvalue="Profile.shippingAddress.middleName" size="15" type="hidden"/>
    <dsp:input bean="ShoppingCartModifier.shippingGroup.shippingAddress.lastName" beanvalue="Profile.shippingAddress.lastName" size="30" type="hidden"/>
    <dsp:input bean="ShoppingCartModifier.shippingGroup.shippingAddress.address1" beanvalue="Profile.shippingAddress.address1" size="40" type="hidden"/>
    <dsp:input bean="ShoppingCartModifier.shippingGroup.shippingAddress.address2" size="40" type="hidden"/>
    <dsp:input bean="ShoppingCartModifier.shippingGroup.shippingAddress.address2" beanvalue="Profile.shippingAddress.address2" size="40" type="hidden"/>
    <dsp:input bean="ShoppingCartModifier.shippingGroup.shippingAddress.city" beanvalue="Profile.shippingAddress.city" size="20" type="hidden"/>
    <dsp:input bean="ShoppingCartModifier.shippingGroup.shippingAddress.state" beanvalue="Profile.shippingAddress.state" size="10" type="hidden"/>
    <dsp:input bean="ShoppingCartModifier.shippingGroup.shippingAddress.postalCode" beanvalue="Profile.shippingAddress.postalCode" size="10" type="hidden"/>
    <dsp:input bean="ShoppingCartModifier.shippingGroup.shippingAddress.country" beanvalue="Profile.shippingAddress.country" size="20" type="hidden"/>
    <dsp:input bean="ShoppingCartModifier.shippingGroup.shippingAddress.ownerId" beanvalue="Profile.shippingAddress.ownerId" size="20" type="hidden"/>
		
		Your items will be shipped to your default shipping address, unless you
		choose otherwise.
		<p>
		<dsp:include page="../../user/DisplayAddress.jsp">
		  <dsp:param name="address" bean="Profile.shippingAddress"/>
		</dsp:include>
      	<p>
    <input type=submit value="Ship somewhere else">
    
  </core:case> 	

</core:switch> 	

 <p>&nbsp;<br>
	
	</td>
</tr>
	
 <tr>
 	<td></td><td></td>
 	<td>
 	
      <p>&nbsp;<br>
      Shipping Method<br>

  <%/* Get a listing of the shipping methods that a user can select */%>
            
  <dsp:droplet name="AvailableShippingMethods">
  <dsp:param bean="ShoppingCartModifier.shippingGroup" name="shippingGroup"/>
  <dsp:param bean="UserPricingModels.shippingPricingModels" name="pricingModels"/>
  <dsp:param bean="Profile" name="profile"/>
  <dsp:oparam name="output">
    <dsp:select bean="ShoppingCartModifier.shippingGroup.shippingMethod">
    <core:forEach id="methods" values='<%= dynrequest.getObjectParameter("availableShippingMethods") %>'    	     
      castClass="String" elementId="method">
        <dsp:option value="<%=method%>"/> <%=method%>
    </core:forEach>
    </dsp:select>
  </dsp:oparam>
  </dsp:droplet>
  
  </td>
  
</tr>
<%-- @version $Id: //product/DCS/version/9.0/release/PioneerCyclingJSP/j2ee-apps/pioneer/web-app/en/checkout/full/ShippingFragmentReturning.jspf#1 $$Change: 508164 $--%>
