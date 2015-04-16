<%-- KC-517 Add Help/Resources Tab --%>
<%--
 Copyright 2005-2010 The Kuali Foundation
 
 Licensed under the Educational Community License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.osedu.org/licenses/ECL-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
--%>
<%@ include file="/WEB-INF/jsp/kraTldHeader.jsp"%>

<script src="scripts/jquery/jquery.js"></script>
<script>

$(document).ready(function() {
// helpUrl = '/mygrant/static/help/Documents/mygrant.html';
helpUrl = '/myGRANTwww/mygrant.html';
<%-- KC-617 BEGIN - change to use KC 5.1 new classes/url format --%>
<%-- KC-675 Have "All my proposals" run when selected (changed methodToCall to search from start) --%>
allMyProposalsUrl = 'portal.do?channelTitle=All%20My%20Proposals&channelUrl=${ConfigProperties.workflow.url}/DocumentSearch.do?methodToCall=search&businessObjectClassName=org.kuali.rice.kew.impl.document.search.DocumentSearchCriteriaBo&documentTypeName=ProposalDevelopmentDocument&initiatorPrincipalName=${UserSession.principalName}';
<%-- KC-617 END --%>
<%-- KC-616 BEGIN  - added to use KC 5.1 new url format --%>
createProposalUrl = 'portal.do?channelTitle=Create%20Proposal&channelUrl=${ConfigProperties.application.url}/proposalDevelopmentProposal.do?methodToCall=docHandler&command=initiate&docTypeName=ProposalDevelopmentDocument';
<%-- KC-616 END --%>
<%-- KC-549 message of the day --%>
motd = '${UHMessageOfTheDay}';
<%-- KC-549 END --%>

 $.ajax({
  url: helpUrl,
  type: 'GET',
  success: function(data, status) {
    $("#helpContainer").html(data);
    
    var initialTab = getInitialTab();
    if (initialTab != 'portalHelpBody') {
      $("#skip_help").attr("checked",true);
    }
    
    $("#skip_help").click(function() {
	    if (this.checked) {
    		set_cookie("mgInitialTab","portalResearcherBody");
    	} else {
    		set_cookie("mgInitialTab","portalHelpBody");
    	}
  	});
    <%-- KC-616 BEGIN - added to use KC 5.1 new url format --%>
    $("#createProposal").attr("href",createProposalUrl);
    <%-- KC-616 END --%>
  	$("#allMyProposals").attr("href",allMyProposalsUrl);
  },
  error: function(jqXHR, status, e) {
    alert('couldnt get the remote content: ' + helpUrl);
  },
 });

 function set_cookie(key, value, d) {
   exp_date = new Date();
   exp_date.setDate(exp_date.getDate() + d ? d : 356);
   var cookie_stuff = [ encodeURIComponent(key), '=', encodeURIComponent(value),
     ';expires=', exp_date.toUTCString() ].join('');
   return (document.cookie = cookie_stuff);
  }
  
  function getInitialTab() {
    var cookies = document.cookie.split('; ');
    for (i=0;i<cookies.length;i++) {
      var parts = cookies[i].split('=');
      if (parts[0] == 'mgInitialTab') {
        return parts[1];
      }
    }
  }
});

</script>

<div style="height:100%" class="body" id="helpContainer"></div>
