<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="atg.servlet.*"%>
<html>
<dsp:page>
	<head>
	<title>Sku Search Result</title>
	</head>
	<body>
	<center>
	<h1>Product Details</h1>
	</center>

	<dsp:importbean bean="/atg/droplet/SearchDroplet" />
	<dsp:importbean
		bean="/atg/commerce/order/purchase/CartModifierFormHandler" />
	<dsp:importbean bean="/atg/commerce/order/ShoppingCartModifier" />

	<dsp:droplet name="/atg/commerce/catalog/ProductLookup">
		<dsp:param name="id" param="prodId" />
		<dsp:oparam name="output">
			<table border=2 cellpadding=4 cellspacing=10 width=500 align="center">
				<tr bgcolor="yellow">
					<td><b style="color: blue">Product Name</b></td>
					<td><b style="color: blue">Image</b></td>
					<td><b style="color: blue">Sku Details</b></td>
				</tr>
				<tr>
					<td><dsp:valueof param="element.displayName" /></td>
					<td align="center"><dsp:getvalueof id="path"
						value="product_images/" idtype="java.lang.String">
						<dsp:getvalueof id="image" param="element.thumbnailImage.name"
							idtype="java.lang.String">
							<!-- change to original jsp -->
							<dsp:img src="<%=path + image%>" />

						</dsp:getvalueof>
					</dsp:getvalueof></td>
					<%-- Select Sku --%>

					<%-- Sku Details --%>
					<td>
					<table border=1 cellpadding=4 cellspacing=5 align="center"
						bgcolor="#B0C4DE">
						<th>Sku Id</th>
						<th>Name</th>
						<th>M.R.P</th>
						<th>Sale Price</th>
						<th>Quantity</th>
						<th>Select SKU</th>
						<dsp:droplet name="/atg/dynamo/droplet/ForEach">
							<dsp:param name="array" param="element.childSKUs" />
							<dsp:param value="sku" name="elementName" />
							<dsp:oparam name="output">

								<tr>
									<td><dsp:valueof param="sku.id" /></td>
									<td><dsp:valueof param="sku.displayName" /></td>
									<td><dsp:valueof param="sku.listPrice" /></td>
									<td><dsp:droplet name="/atg/dynamo/droplet/Switch">
										<dsp:param name="value" param="sku.onSale" />
										<dsp:oparam name="false">
										</dsp:oparam>
										<dsp:oparam name="true">
											<dsp:valueof param="sku.salePrice" />
										</dsp:oparam>
									</dsp:droplet></td>
									<dsp:form action="cart.jsp" formid="cart" method="post">
										<td><dsp:input maxlength="2"
											bean="CartModifierFormHandler.quantity" size="2" value="1"
											type="text" name="quantity" /></td>
										<td><dsp:include page="addtocart_fg.jsp">
											<dsp:param name="Prod" param="prodId" />
										</dsp:include></td>
									</dsp:form>
								</tr>
								<br>
							</dsp:oparam>
						</dsp:droplet>
					</table>
					</td>
				</tr>
			</table>

			<br>

		</dsp:oparam>
	</dsp:droplet>
	</body>
</dsp:page>
</html>
