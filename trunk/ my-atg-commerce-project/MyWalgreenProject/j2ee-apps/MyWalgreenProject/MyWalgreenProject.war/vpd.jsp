<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<%@ page import="atg.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<dsp:importbean
	bean="/atg/commerce/order/purchase/CartModifierFormHandler" />
<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
<dsp:page>
	<head>
	<title><dsp:droplet name="/atg/commerce/catalog/ProductLookup">
		<dsp:param name="id" param="ID" />
		<dsp:param name="elementName" value="Product" />
		<dsp:oparam name="output">
			<dsp:valueof param="Product.displayName" />
		</dsp:oparam>
	</dsp:droplet></title>
	</head>
	<body>
	<dsp:droplet name="/atg/commerce/catalog/ProductLookup">
		<dsp:param name="id" param="ID" />
		<dsp:param name="elementName" value="Product" />
		<dsp:oparam name="output">
			<dsp:valueof param="Product.longDescription" />
			<dsp:form action="" method="post">
				<dsp:input bean="CartModifierFormHandler.ProductId"
					paramvalue="Product.repositoryId" type="hidden" />
				<dsp:input bean="CartModifierFormHandler.quantity" size="4"
					value="1" type="text" />
				<dsp:select bean="CartModifierFormHandler.catalogRefIds">
					<dsp:droplet name="ForEach">
						<dsp:param param="Product.childSKUs" name="array" />
						<dsp:param value="Sku" name="elementName" />
						<dsp:oparam name="output">
							<dsp:getvalueof id="option" param="Sku.repositoryID"
								idtype="java.lang.String">
								<dsp:option value="<%=option%>" />
							</dsp:getvalueof>
							<dsp:valueof param="Sku.displayName" />
						</dsp:oparam>
					</dsp:droplet>
				</dsp:select>
				

				<br>
				<dsp:input bean="CartModifierFormHandler.addItemToOrder"
					value="Add to Cart" type="submit" />
				<dsp:input bean="CartModifierFormHandler.addItemToOrderSuccessURL"
					value="addtocart_fg.jsp" type="hidden" />
			</dsp:form>
		</dsp:oparam>
	</dsp:droplet>
	</body>
</dsp:page>