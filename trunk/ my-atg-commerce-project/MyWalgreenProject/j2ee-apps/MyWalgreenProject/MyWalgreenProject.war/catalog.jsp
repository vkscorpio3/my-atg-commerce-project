<%@ taglib uri="/dspTaglib" prefix="dsp" %>

<dsp:page>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<dsp:droplet name="/atg/targeting/TargetingForEach">
  <dsp:param
       bean="/atg/registry/RepositoryTargeters/ProductCatalog/RootCategories"
       name="targeter"/>

  <dsp:oparam name="output">
  
		<dsp:a href="category.jsp">
    		<dsp:valueof param="element.displayName"/><br/>
    		<dsp:param param="element.repositoryId" name="catId"/>
    	</dsp:a>
  </dsp:oparam>
</dsp:droplet>
</body>
</html>
</dsp:page>