<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="atg.servlet.*"%>

<%@page import="java.util.ArrayList"%>
<html>
<dsp:page>
	<head>
	<title>Search Result</title>
	</head>
	<body>
	<h1>Search Result</h1>
	<!--
	<dsp:importbean bean="/atg/droplet/SearchDroplet" />
	<dsp:droplet name="SearchDroplet">
		<dsp:param name="searchValue"
			value="<%=session.getAttribute("req_userName")%>" />
		<dsp:oparam name="output">
		Here goes your Details...
		 <br>
			
		 <table border="5" align="center">
		 <tr bgcolor="yellow">
					<td><b style="color:blue">Login Id</b></td>
					<td><b style="color:blue">Name</b></td>
					<td><b style="color:blue">Password</b></td>
					<td><b style="color:blue">Email</b></td>
					<td><b style="color:blue">Date Of Birth</b></td>
					<td><b style="color:blue">Address</b></td>
					<td><b style="color:blue">Gender</b></td>
					
				</tr>
			<dsp:droplet name="/atg/dynamo/droplet/ForEach">
				<tr>
					<dsp:param name="array" param="droplet_searchText" />
					<dsp:oparam name="output">
						<td><dsp:valueof param="element.Login_ID" /></td>
						<td><dsp:valueof param="element.UserName" /></td>
						<td><dsp:valueof param="element.Password" /></td>
						<td><dsp:valueof param="element.Email" /></td>
						<td><dsp:valueof param="element.DateOfBirth" /></td>
						<td><dsp:valueof param="element.Address" /></td>
						<td><dsp:valueof param="element.Gender" /></td>
						<td>Add to cart</td>
					</dsp:oparam>
				</tr>
			</dsp:droplet>
			</table>
		-->
		<dsp:param name="productList" param="subCategory"/>
		<dsp:valueof param="productList[0].displayName"></dsp:valueof>
	<table border="5" align="center">
		<tr bgcolor="yellow">
			<td><b style="color: blue">Product</b></td>
		</tr>
		<dsp:droplet name="/atg/dynamo/droplet/ForEach">
			<tr>
				<dsp:param name="array" param="productList" />
				<dsp:param value="product" name="elementName" />
				<dsp:oparam name="output">
					<td><dsp:valueof param="product.displayName" />(<dsp:valueof
						param="product.id" />)</td><br>
					<!--<td><dsp:valueof param="category.parentCategory.id" /></td>
					<td><dsp:valueof param="category.parentCategory.displayName" /></td>
					<td><dsp:droplet name="/atg/dynamo/droplet/ForEach">
						<dsp:param name="array" param="category.fixedChildProducts" />
						<dsp:param value="product" name="elementName" />
						<dsp:oparam name="output">
							<dsp:a href="displayProdSku.jsp">
								<dsp:valueof param="product.displayName" />(<dsp:valueof
									param="product.id" />)
										<dsp:param name="prodId" param="product.id" />
							</dsp:a>
							<br>
						</dsp:oparam>
					</dsp:droplet></td>
				--></dsp:oparam>
			</tr>
		</dsp:droplet>
	</table>

	<!--</dsp:oparam>
	</dsp:droplet>
	-->
	<!--
	<dsp:droplet name="/atg/targeting/TargetingForEach">
		<dsp:param
			bean="/atg/registry/RepositoryTargeters/ProductCatalog/RootCategories"
			name="targeter" />

		<dsp:oparam name="output">

			<dsp:a href="category.jsp">
				<dsp:valueof param="element.displayName" />
				<br />
				<dsp:param param="element.repositoryId" name="itemId" />
			</dsp:a>
		</dsp:oparam>
	</dsp:droplet>
	-->
	</body>
</dsp:page>
</html>
<%-- @version $Id: //product/Eclipse/main/plugins/atg.project/templates/index.jsp#1 $$Change: 425088 $--%>
