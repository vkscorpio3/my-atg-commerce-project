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

	<dsp:droplet name="SearchDroplet">
		<dsp:param name="searchProductValue" param="prodId" />
		<dsp:oparam name="output">
			<table border=1 cellpadding=4 cellspacing=10 width=700 align="center">
				<tr bgcolor=#DBDBDB >
					<td><b style="color: blue">Product ID</b></td>
					<td><b style="color: blue">Product Name</b></td>
					<td><b style="color: blue">Select Sku</b></td>
					<td><b style="color: blue">Sku Details</b></td>
				</tr>
				<dsp:droplet name="/atg/dynamo/droplet/ForEach">
					<tr>
						<dsp:param name="array" param="droplet_skus" />
						<dsp:param value="product" name="elementName" />
						<dsp:oparam name="output">
							<td><dsp:valueof param="product.id" /></td>
							<td><dsp:valueof param="product.displayName" /></td>

							<td><dsp:form>
								<dsp:select bean="CartModifierFormHandler.catalogRefIds">
									<dsp:droplet name="/atg/dynamo/droplet/ForEach">
										<dsp:param param="product.childSKUs" name="array" />
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
							</dsp:form></td>


							<td><dsp:droplet name="/atg/dynamo/droplet/ForEach">
								<dsp:param name="array" param="product.childSKUs" />
								<dsp:param value="sku" name="elementName" />
								<dsp:oparam name="output">
									<dsp:valueof param="sku.smallImage" />
									<dsp:a href="displayProdSku.jsp">
										<dsp:param name="skuId" param="sku.id" />
									</dsp:a>

									<table border=1 cellpadding=4 cellspacing=5 align="center" width="300">
										<tr>
											<td>Sku Id</td>
											<td><dsp:valueof param="sku.id" /></td>
										</tr>
										<tr>
											<td>Name</td>
											<td><dsp:valueof param="sku.displayName" /></td>
										</tr>
										<tr>
											<td>M.R.P</td>
											<td><dsp:valueof param="sku.listPrice" /></td>
										</tr>
										<dsp:droplet name="/atg/dynamo/droplet/Switch">
											<dsp:param name="value" param="sku.onSale" />
											<dsp:oparam name="false">
											</dsp:oparam>
											<dsp:oparam name="true">
												<tr>
													<td>Sale Price</td>
													<td><dsp:valueof param="sku.salePrice" /></td>
												</tr>
											</dsp:oparam>
										</dsp:droplet>

										<!--<tr>
											<td>Image</td>
											<td><dsp:getvalueof id="path" value="product_images/"
												idtype="java.lang.String">
												<dsp:getvalueof id="image" param="sku.smallImage"
													idtype="java.lang.String">
													<dsp:img src="<%=path + image%>" />
												</dsp:getvalueof>
											</dsp:getvalueof> <dsp:valueof param="sku.thumbnailImage" />
											</td>
										</tr>
										-->
										<dsp:form action="cart.jsp" formid="cart" method="post" >
											<tr>
												<td>Quantity</td>
												<td><dsp:input bean="CartModifierFormHandler.quantity"
													size="2" value="1" type="text" name="quantity" /></td>
											</tr>
											<tr>
												<td colspan="2" align="center">
													<dsp:input bean="CartModifierFormHandler.ProductId"
													type="hidden" paramvalue="product.displayName"
													name="prodName" /> 
													
													<dsp:input
													bean="CartModifierFormHandler.catalogRefIds" type="hidden"
													paramvalue="sku.displayName" name="skuName" /> 
													
													<dsp:input
													bean="CartModifierFormHandler.catalogRefIds" type="hidden"
													paramvalue="sku.listPrice" name="price" /> 
													
													<dsp:input
													bean="CartModifierFormHandler.ProductId" type="hidden"
													paramvalue="product.id" name="prodId" /> 
													
													<dsp:input
													bean="CartModifierFormHandler.catalogRefIds" type="hidden"
													paramvalue="sku.id" name="skuId" /> 
													
													<dsp:input
													bean="CartModifierFormHandler.addItemToOrder"
													value="Add to Cart" type="submit" /></td>

											</tr>
										</dsp:form>
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
