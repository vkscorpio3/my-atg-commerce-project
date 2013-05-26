<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="atg.servlet.*"%>
<dsp:page>

	<dsp:importbean bean="/atg/formhandler/RegistrationFormHandler" />
	<head>
	<title>Search Result</title>
	</head>
	<h1 align="center">Search Result</h1>

	<dsp:form>
		<center><dsp:param name="subCategoryId" param="subCategoryId" />
		<dsp:droplet name="/atg/commerce/catalog/CategoryLookup">
			<dsp:param name="id" param="subCategoryId" />
			<dsp:oparam name="output">
				<table border="0" cellpadding="0" cellspacing="10" width="1000"
					align="center">
					<tr bgcolor="#666666" height="40">
						<td style="color: white" align="center"><span class=smallbw><b>Product
						Image</b></span></td>
						<td style="color: white" align="center"><b>Product Name</b></td>
						<td style="color: white" align="center"><b>Product
						Description</b></td>

					</tr>

					<dsp:droplet name="/atg/dynamo/droplet/ForEach">
						<tr>
							<dsp:param name="array" param="element.fixedChildProducts" />
							<dsp:param name="elementName" value="product" />
							<dsp:oparam name="output">
								<!-- Display Products-->
								<td><!--<dsp:getvalueof id="path"
									value="C:/ATG_Practice/ATG/ATG9.0/home/doc">
									<dsp:getvalueof id="imageURL"
										param="product.smallImage.url" idtype="java.lang.String">
										<dsp:img hspace="70" alt="Product image" src="<%=path + imageURL%>" />
										<dsp:valueof value="<%=path + imageURL%>"></dsp:valueof>
									</dsp:getvalueof>
								</dsp:getvalueof>--> <dsp:getvalueof id="path"
									value="product_images/" idtype="java.lang.String">
									<dsp:getvalueof id="image" param="product.thumbnailImage.name"
										idtype="java.lang.String">
										<!-- change to original jsp -->
										<dsp:a href="displayProdSku_OOB_droplet.jsp">
											<dsp:param name="prodId" param="product.id" />
											<dsp:img src="<%=path
																+ image%>" />
										</dsp:a>
										<!--<dsp:valueof value="<%=path
																	+ image%>"/>-->
									</dsp:getvalueof>
								</dsp:getvalueof></td>
								<td><dsp:a href="displayProdSku_OOB_droplet.jsp">
									<dsp:valueof param="product.displayName" />
									<dsp:param name="prodId" param="product.id" />
								</dsp:a></td>
								<td><dsp:valueof param="product.description" /></td>

							</dsp:oparam>
						</tr>
					</dsp:droplet>
				</table>
<%--/****************************************** Pagination *************************/--%>
				
<%--/****************************************** End *************************/--%>

			</dsp:oparam>
		</dsp:droplet></center>
	</dsp:form>
</dsp:page>