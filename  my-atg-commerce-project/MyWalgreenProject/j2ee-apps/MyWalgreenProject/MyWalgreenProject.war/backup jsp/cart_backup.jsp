<%@ taglib uri="/dspTaglib" prefix="dsp"%>

<dsp:page>
	<dsp:importbean bean="/atg/dynamo/droplet/ForEach" />
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>View Cart</title>
	</head>
	<body>
	<h1 align="CENTER" style="color: blue;">My Cart</h1>

	<table align="center" cellspacing="5" cellpadding="5" border="3"
		bordercolor="purple">
		<tr>

			<td style="COLOR: red"><b>Product Id</b></td>
			<td style="COLOR: red"><b>Product Name</b></td>
			<td style="COLOR: red"><b>Sku Id</b></td>
			<td style="COLOR: red"><b>Sku Name</b></td>
			<td style="COLOR: red"><b>Price</b></td>
			<td style="COLOR: red"><b>Quantity</b></td>
			<td style="COLOR: red"><b>Remove</b></td>
		</tr>
		<td><dsp:valueof param="prodId" /></td>
		<td><dsp:valueof param="prodName" /></td>
		<td><dsp:valueof param="skuId" /></td>
		<td><dsp:valueof param="skuName" /></td>
		<td><dsp:valueof param="price" /></td>
		<td><dsp:valueof param="quantity" /></td>
		<td><dsp:a href="">
			<dsp:valueof value="Remove"></dsp:valueof>
			<dsp:param name="productId" param="prodId" />
			<dsp:param name="skuId" param="skuId" />
		</dsp:a></td>
		<tr>

		</tr>
	</table>
	<dsp:importbean bean="/atg/commerce/ShoppingCart" />

	<dsp:form action="" method="post">

		<!-- We have other shopping carts, so let them do everything -->
     Shopping Cart 
				<dsp:droplet name="ForEach">
			<dsp:param bean="ShoppingCart.current" name="array" />
			<dsp:param value="commerceItem" name="elementName" />
			<dsp:oparam name="output">
				<dsp:valueof param="commerceItem.id" />
			</dsp:oparam>
		</dsp:droplet>
	</dsp:form>

	</body>
	</html>
</dsp:page>

