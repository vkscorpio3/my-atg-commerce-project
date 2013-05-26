<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<%@ page import="atg.servlet.*"%>
<dsp:page>
	<dsp:droplet name="/atg/commerce/catalog/ProductLookup">
		<dsp:param name="id" param="productId" />
		<dsp:param name="elementName" value="product" />
		<dsp:oparam name="output">
			<br>
			<a href="vpd.jsp?ID=<dsp:valueof param="product.id"/>">
			<dsp:valueof param="product.displayName" /> </a>
			<br>
			<dsp:droplet name="/atg/commerce/inventory/InventoryLookup">
				<dsp:param param="product.childSKUs[0].id" name="itemId" />
				<dsp:param value="true" name="useCache" />
				<dsp:oparam name="output">
									This item is
									<dsp:valueof param="inventoryInfo.availabilityStatusMsg" />
					<br>
									There are
									<dsp:valueof param="inventoryInfo.stockLevel" />
									left in the inventory.<br>
				</dsp:oparam>
			</dsp:droplet>
			<dsp:valueof param="product.childSKUs[0].listPrice" />
		</dsp:oparam>
	</dsp:droplet>
</dsp:page>