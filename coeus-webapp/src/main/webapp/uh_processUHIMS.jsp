<%
    String result = edu.hawaii.rice.kew.web.UhKcAuthServiceUserLoginFilter.executeUHIMSprocess();
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
