<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<dsp:page>

	<dsp:importbean bean="/atg/commerce/ShoppingCart" />
	<dsp:importbean bean="/atg/commerce/order/ShoppingCartModifier" />
	<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
	<dsp:importbean bean="/atg/dynamo/droplet/Switch" />
	<dsp:importbean bean="/atg/userprofiling/Profile" />
	<dsp:setvalue bean="Profile.currentLocation" value="checkout" />

	<HTML>
	<HEAD>
	<TITLE>Pioneer Cycling Store</TITLE>
	</HEAD>
	<body>

	<dsp:valueof param="removalProductId" />
	<dsp:valueof param="removalSkuId" />
	<dsp:valueof param="removalCommerceIds" />
	<dsp:valueof param="commerceIds" />
	<br>
	<dsp:a href="cart.jsp">Back to cart</dsp:a>
	</body>
	</HTML>
</dsp:page>