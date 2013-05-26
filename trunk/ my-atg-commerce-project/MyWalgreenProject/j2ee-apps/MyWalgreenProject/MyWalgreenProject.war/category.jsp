<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<dsp:page>
		<!-- Display the categories 
		<dsp:droplet name="/atg/commerce/catalog/CategoryLookup">
			<dsp:param name="id" value="cat10002" />
			<dsp:oparam name="output">
				<dsp:droplet name="/atg/dynamo/droplet/ForEach">
					<dsp:param name="array" param="element.childCategories" />
					<dsp:oparam name="output">
						<tr>
							<td><dsp:a href="../product/category.jsp">
								<dsp:param name="id" param="element.id" />
								<dsp:valueof param="element.displayName" />
							</dsp:a></td>
						</tr>
					</dsp:oparam>
				</dsp:droplet>

			</dsp:oparam>
		</dsp:droplet>
		-->
		<dsp:droplet name="/atg/commerce/catalog/CategoryLookup">
			<dsp:param name="id" param="catId" />
			<dsp:oparam name="output">

				<dsp:droplet name="/atg/dynamo/droplet/ForEach">
					<dsp:param name="array" param="element.childCategories" />
					<dsp:param name="elementName" value="subCategory" />
					<dsp:oparam name="output">

						<dsp:a href="category.jsp">
							<dsp:param name="catId" param="subCategory.id" />
							<dsp:valueof param="subCategory.displayName" />
						</dsp:a>
					<br class="clearfix" />
					<br>
					</dsp:oparam>
				</dsp:droplet>

			</dsp:oparam>
		</dsp:droplet>

		<!-- Display the products 
		<dsp:droplet name="/atg/dynamo/droplet/ForEach">
			<dsp:param name="array" param="catId" />
			<dsp:oparam name="output">
				<tr>
					<td><dsp:a href="#">
						<dsp:param name="prdId" param="element.id" />
						<dsp:valueof param="element.displayName" />
					</dsp:a></td>
				</tr>
			</dsp:oparam>
		</dsp:droplet>
	-->
</dsp:page>