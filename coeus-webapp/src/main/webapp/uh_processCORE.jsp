<%
    String result = edu.hawaii.rice.kew.web.UhKcAuthServiceUserLoginFilter.executeCOREsync(); 
%>

CORE has been run.
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
