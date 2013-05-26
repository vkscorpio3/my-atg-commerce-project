<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<dsp:page>
<%!String[] sports;%><center>You have selected:
<%
	sports = request.getParameterValues("sports");
	if (sports != null) {
		for (int i = 0; i < sports.length; i++) {
			out.println("<b>" + sports[i] + "<b>");
		}
	} else
		out.println("<b>none<b>");
%>
</center>
</dsp:page>
