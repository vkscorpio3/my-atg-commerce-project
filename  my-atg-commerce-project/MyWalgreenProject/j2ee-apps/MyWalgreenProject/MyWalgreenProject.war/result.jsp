<%@ page import="atg.servlet.*"%>
<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<dsp:page>
	<dsp:importbean bean="/atg/droplet/ViewCartDroplet" />
	<dsp:droplet name="/atg/droplet/ViewCartDroplet">
		<dsp:param name="pageOption" param="optionVal" />
	</dsp:droplet>
</dsp:page>