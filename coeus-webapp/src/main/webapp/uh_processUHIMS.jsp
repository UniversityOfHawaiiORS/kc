<%
    String result = edu.hawaii.rice.kew.web.UhKcUserLoginFilter.executeShellCommand(); 
%>

UHIMS has been run.
<br>
Response
<br>
================================================
<br>
<%
out.println(result);
%>
<br>
================================================
<br>