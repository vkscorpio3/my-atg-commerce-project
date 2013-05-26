<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="atg.servlet.*"%>
<html>
<dsp:page>
	<head>
	<title>Sku Search Result</title>
	</head>
	<body>
	<h1><center>Product Details</center></h1>

	<dsp:importbean bean="/atg/droplet/SearchDroplet" />
	<dsp:droplet name="SearchDroplet">
		<dsp:param name="searchProductValue" param="prodId" />
		<dsp:oparam name="output">
			<table border="5" align="center" bordercolor="black">
				<tr bgcolor="yellow">
					<td><b style="color: blue">Product ID</b></td>
					<td><b style="color: blue">Product Name</b></td>
					<td><b style="color: blue">Sku ID</b></td>
				</tr>
				<dsp:droplet name="/atg/dynamo/droplet/ForEach">
					<tr>
						<dsp:param name="array" param="droplet_skus" />
						<dsp:param value="product" name="elementName" />
						<dsp:oparam name="output">
							<td><dsp:valueof param="product.id" /></td>
							<td><dsp:valueof param="product.displayName" /></td>
							<td><dsp:droplet name="/atg/dynamo/droplet/ForEach">
								<dsp:param name="array" param="product.childSKUs" />
								<dsp:param value="sku" name="elementName" />
								<dsp:oparam name="output">
									<dsp:a href="displayProdSku.jsp">
										<dsp:param name="skuId" param="sku.id" />
									</dsp:a>
									<table border="2" bordercolor="green">
										<tr><td>Sku Id</td><td><dsp:valueof param="sku.id" /></td></tr>
										<tr><td>Name</td><td><dsp:valueof param="sku.displayName" /></td></tr>
										<tr><td>List Price</td><td><dsp:valueof param="sku.listPrice" /></td></tr>
										<tr><td>Created On</td><td><dsp:valueof param="sku.creationDate" /></td></tr>
										<tr><td>WholeSale Price</td><td><dsp:valueof param="sku.wholesalePrice" /></td></tr>
										<tr><td></td><td><a href="cart.jsp">Add to Cart</a></td></tr>
									</table>
									<br>
								</dsp:oparam>
							</dsp:droplet></td>
						</dsp:oparam>
					</tr>
				</dsp:droplet>
			</table>
		</dsp:oparam>
	</dsp:droplet>
	</body>
</dsp:page>
</html>
