<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<%         
/* -------------------------------------------------------
 * Display an address 
 * ------------------------------------------------------- */
%>
<dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>

<DECLAREPARAM NAME="address" 
              CLASS="java.lang.Object" 
              DESCRIPTION="A ContactInfo Repository Item to display">

<DECLAREPARAM NAME="private" 
              CLASS="boolean" 
              DESCRIPTION="If true, we will hide the details of the address.">

<dsp:droplet name="/atg/dynamo/droplet/Switch">
  <dsp:param param="address.country" name="value"/>
  <dsp:oparam name="default">
    <% /* U.S. Address format */ %>
    <dsp:valueof param="address.firstName"/>
    <dsp:valueof param="address.middleName"/>
    <dsp:valueof param="address.lastName"/>
    <br>
    <dsp:droplet name="Switch">
      <dsp:param name="value" param="private"/>
      <dsp:oparam name="true">
      </dsp:oparam>
      <dsp:oparam name="default">
        <dsp:valueof param="address.address1"/><br>
        <dsp:droplet name="IsEmpty">
          <dsp:param name="value" param="address.address2"/>
          <dsp:oparam name="false">
            <dsp:valueof param="address.address2"/><br>
          </dsp:oparam>
        </dsp:droplet>
      </dsp:oparam>
    </dsp:droplet>
    <dsp:valueof param="address.city"/>,
    <dsp:valueof param="address.state"/>
    <dsp:valueof param="address.postalCode"/>
    <br>
  </dsp:oparam>

  <dsp:oparam name="fr">
    <% /* French Address */ %>
    <dsp:valueof param="address.firstName"/>
    <dsp:valueof param="address.middleName"/>
    <dsp:valueof param="address.lastName"/>
    <br>
    <dsp:droplet name="Switch">
      <dsp:param name="value" param="private"/>
      <dsp:oparam name="true">
      </dsp:oparam>
      <dsp:oparam name="default">
        <dsp:valueof param="address.address1"/><br>
        <dsp:droplet name="IsEmpty">
          <dsp:param name="value" param="address.address2"/>
          <dsp:oparam name="false">
            <dsp:valueof param="address.address2"/><br>
          </dsp:oparam>
        </dsp:droplet>
      </dsp:oparam>
    </dsp:droplet>
    <dsp:valueof param="address.postalCode"/> <dsp:valueof param="address.city"/><br>
    <dsp:droplet name="IsEmpty">
      <dsp:param name="value" param="address.state"/>
      <dsp:oparam name="false">
        <dsp:valueof param="address.state"/><br>
      </dsp:oparam>
    </dsp:droplet>
  </dsp:oparam>

  <dsp:oparam name="jp">
    <% /* Japanese Address */ %>
    <dsp:valueof param="address.lastName"/>
    <dsp:valueof param="address.middleName"/>
    <dsp:valueof param="address.firstName"/>
    <br>
    <dsp:valueof param="address.postalCode"/>
    <br>
    <dsp:valueof param="address.state"/>
    <dsp:valueof param="address.city"/>
    <br>
    <dsp:droplet name="Switch">
      <dsp:param name="value" param="private"/>
      <dsp:oparam name="true">
      </dsp:oparam>
      <dsp:oparam name="default">
        <dsp:valueof param="address.address1"/><br>
        <dsp:droplet name="IsEmpty">
          <dsp:param name="value" param="address.address2"/>
          <dsp:oparam name="false">
            <dsp:valueof param="address.address2"/><br>
          </dsp:oparam>
        </dsp:droplet>
      </dsp:oparam>
    </dsp:droplet>
  </dsp:oparam>

</dsp:droplet>

</dsp:page>
<%-- @version $Id: //product/DCS/version/9.0/release/PioneerCyclingJSP/j2ee-apps/pioneer/web-app/en/user/DisplayAddress.jsp#1 $$Change: 508164 $--%>
