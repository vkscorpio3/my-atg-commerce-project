<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="atg.servlet.*"%>
<dsp:page>

	<dsp:importbean bean="/atg/formhandler/RegistrationFormHandler" />
	<head>
	<title>Search Result</title>
	<style type="text/css">
.pg-normal {
	color: #0000FF;
	font-weight: normal;
	text-decoration: none;
	cursor: pointer;
}

.pg-selected {
	color: #800080;
	font-weight: bold;
	text-decoration: underline;
	cursor: pointer;
}
</style>
	</head>
	<script type="text/javascript">
function Pager(tableName, itemsPerPage) {
    this.tableName = tableName;
    this.itemsPerPage = itemsPerPage;
    this.currentPage = 1;
    this.pages = 0;
    this.inited = false;
    
    this.showRecords = function(from, to) {        
        var rows = document.getElementById(tableName).rows;
        // i starts from 1 to skip table header row
        for (var i = 1; i < rows.length; i++) {
            if (i < from || i > to)  
                rows[i].style.display = 'none';
            else
                rows[i].style.display = '';
        }
    }
    
    this.showPage = function(pageNumber) {
     if (! this.inited) {
      alert("not inited");
      return;
     }

        var oldPageAnchor = document.getElementById('pg'+this.currentPage);
        oldPageAnchor.className = 'pg-normal';
        
        this.currentPage = pageNumber;
        var newPageAnchor = document.getElementById('pg'+this.currentPage);
        newPageAnchor.className = 'pg-selected';
        
        var from = (pageNumber - 1) * itemsPerPage + 1;
        var to = from + itemsPerPage - 1;
        this.showRecords(from, to);
    }   
    
    this.prev = function() {
        if (this.currentPage > 1)
            this.showPage(this.currentPage - 1);
    }
    
    this.next = function() {
        if (this.currentPage < this.pages) {
            this.showPage(this.currentPage + 1);
        }
    }                        
    
    this.init = function() {
        var rows = document.getElementById(tableName).rows;
        var records = (rows.length - 1); 
        this.pages = Math.ceil(records / itemsPerPage);
        this.inited = true;
    }

    this.showPageNav = function(pagerName, positionId) {
     if (! this.inited) {
      alert("not inited");
      return;
     }
     var element = document.getElementById(positionId);
     
     var pagerHtml = '<span onclick="' + pagerName + '.prev();" class="pg-normal"> « Prev </span> | ';
        for (var page = 1; page <= this.pages; page++) 
            pagerHtml += '<span id="pg' + page + '" class="pg-normal" onclick="' + pagerName + '.showPage(' + page + ');">' + page + '</span> | ';
        pagerHtml += '<span onclick="'+pagerName+'.next();" class="pg-normal"> Next »</span>';            
        
        element.innerHTML = pagerHtml;
    }
}

</script>
	<h1 align="center">Search Result</h1>

	<dsp:form>
		<center><dsp:param name="subCategoryId" param="subCategoryId" />
		<dsp:droplet name="/atg/commerce/catalog/CategoryLookup">
			<dsp:param name="id" param="subCategoryId" />
			<dsp:oparam name="output">
				<table border="0" cellpadding="0" cellspacing="10" width="1000"
					align="center" id="results">
					<tr bgcolor="#666666" height="40">
						<td style="color: white" align="center"><span class=smallbw><b>Product
						Image</b></span></td>
						<td style="color: white" align="center"><b>Product Name</b></td>
						<td style="color: white" align="center"><b>Stock</b></td>
						<td style="color: white" align="center"><b>Product
						Description</b></td>

					</tr>

					<dsp:droplet name="/atg/dynamo/droplet/ForEach">
						<tr>
							<dsp:param name="array" param="element.fixedChildProducts" />
							<dsp:param name="elementName" value="product" />
							<dsp:oparam name="output">
								<!-- Display Products-->
								<td align="center"> <dsp:getvalueof id="path"
									value="product_images/" idtype="java.lang.String">
									<dsp:getvalueof id="image" param="product.thumbnailImage.name"
										idtype="java.lang.String">
										<!-- change to original jsp -->
										<dsp:a href="vpd.jsp">
											<dsp:param name="ID" param="product.id" />
											<dsp:img src="<%=path
																+ image%>"/>
										</dsp:a>
										
									</dsp:getvalueof>
								</dsp:getvalueof></td>
								<td  align="center"><dsp:a href="vpd.jsp">
									<dsp:valueof param="product.displayName" />
									<dsp:param name="ID" param="product.id" />
								</dsp:a></td>
								<td>
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
								
								</td>
								<td  align="center"><dsp:valueof param="product.description" /></td>

							</dsp:oparam>
						</tr>
					</dsp:droplet>
				</table>
				<div id="pageNavPosition"></div>
<%--/****************************************** Pagination *************************/--%>
				
<%--/****************************************** End *************************/--%>

			</dsp:oparam>
		</dsp:droplet></center>
	</dsp:form>
	<script type="text/javascript"><!--
        var pager = new Pager('results', 5); 
        pager.init(); 
        pager.showPageNav('pager', 'pageNavPosition'); 
        pager.showPage(1);
    //--></script>
</dsp:page>