<%--
   - Kuali Coeus, a comprehensive research administration system for higher education.
   - 
   - Copyright 2005-2015 Kuali, Inc.
   - 
   - This program is free software: you can redistribute it and/or modify
   - it under the terms of the GNU Affero General Public License as
   - published by the Free Software Foundation, either version 3 of the
   - License, or (at your option) any later version.
   - 
   - This program is distributed in the hope that it will be useful,
   - but WITHOUT ANY WARRANTY; without even the implied warranty of
   - MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   - GNU Affero General Public License for more details.
   - 
   - You should have received a copy of the GNU Affero General Public License
   - along with this program.  If not, see <http://www.gnu.org/licenses/>.
--%>
<%@ include file="/WEB-INF/jsp/kraTldHeader.jsp"%>

<%@ attribute name="parentTab" required="true" %>
<%@ attribute name="activityIndex" required="true" %>
<%@ attribute name="activity" required="true" type="org.kuali.kra.negotiations.bo.NegotiationActivity" %>
<%@ attribute name="tabDivClass" required="false" %>
<%@ attribute name="readOnly" required="true" %>

<script src="scripts/jquery/jquery.js"></script>

<c:set var="activityAttributes" value="${DataDictionary.NegotiationActivity.attributes}" />
<c:set var="attachmentAttributes" value="${DataDictionary.NegotiationActivityAttachment.attributes}" />


<c:if test="${empty tabDivClass}">
  <c:set var="tabDivClass" value="innerTab-head"/>
</c:if>

<c:set var="newActivity" value="${activityIndex == -1}"/>
<c:choose><c:when test="${activityIndex == -1}">
  <c:set var="tabTitle" value="Add Activity"/>
  <c:set var="activityPath" value="negotiationActivityHelper.newActivity"/>
  <c:set var="fileDescriptionValidationFunctionName" value="validateNewFileDescriptionField"/>
  <c:set var="bodyClass" value="addline"/>
</c:when><c:otherwise>
  <c:set var="activityPath" value="document.negotiationList[0].activities[${activityIndex}]"/>
  <c:set var="fileDescriptionValidationFunctionName" value="validateFileDescriptionField${activityIndex}"/>
  <c:set var="startDate"><bean:write name="KualiForm" property="${activityPath}.startDate"/></c:set>
  <c:set var="lastUpdate"><bean:write name="KualiForm" property="${activityPath}.lastModifiedDate"/></c:set>
  <c:set var="tabTitle" value="${activity.activityType.description} - ${activity.location.description} - ${startDate} - ${activity.lastModifiedUserFullName} - ${lastUpdate}"/>
  <c:set var="bodyClass" value=""/>
</c:otherwise></c:choose>
<span class="subhead-right"><kul:help parameterNamespace="KC-NEGOTIATION" parameterDetailType="Document" parameterName="negotiationActivitiesHelp" altText="help"/></span>
<!-- KC-814 Default tab to open to make data entry easier -->
<!-- KC-871 Change negotiation activities back to closed -->
<!--        Close individual activities but keep the "Add" activity open by setting defaultOpen to the newActivity variable -->
<kul:innerTab parentTab="${parentTab}" tabTitle="${tabTitle}" defaultOpen="${newActivity}" tabErrorKey="${activityPath}*" useCurrentTabIndexAsKey="true" overrideDivClass="${tabDivClass}">
            <div class="innerTab-container" align="left">
        
        <table cellpadding="0" cellspacing="0" border="0">
        <tbody class="${bodyClass}"> 
        <td>
        <table cellpadding="4" cellspacing="0" summary="">
            <tr>
		        <th><div align="right"><kul:htmlAttributeLabel attributeEntry="${activityAttributes.locationId}" /></div></th>
                <td>
                	<kul:htmlControlAttribute property="${activityPath}.locationId" attributeEntry="${activityAttributes.locationId}" readOnly="${readOnly}"/>
                </td>
		        <th><div align="right"><kul:htmlAttributeLabel attributeEntry="${activityAttributes.activityTypeId}" /></div></th>
                <td>
                	<kul:htmlControlAttribute property="${activityPath}.activityTypeId" attributeEntry="${activityAttributes.activityTypeId}" readOnly="${readOnly}"/>
                </td>
		        <th><div align="right">Number of Days:</div></th>
                <td>
                	<c:out value="${activity.numberOfDays}"/>
                </td>                
            </tr>
            <tr>
		        <th><div align="right"><kul:htmlAttributeLabel attributeEntry="${activityAttributes.startDate}" /></div></th>
                <td>
                	<kul:htmlControlAttribute property="${activityPath}.startDate" attributeEntry="${activityAttributes.startDate}" readOnly="${readOnly}"/>
                </td>
		        <th><div align="right"><kul:htmlAttributeLabel attributeEntry="${activityAttributes.endDate}" /></div></th>
                <td>
                	<kul:htmlControlAttribute property="${activityPath}.endDate" attributeEntry="${activityAttributes.endDate}" readOnly="${readOnly}"/>
                	<c:if test="${readOnly}"><input type="hidden" id="${activityPath}.endDate" value="${activity.endDate}" disabled="true"/></c:if>
                </td>
		        <th><div align="right"><kul:htmlAttributeLabel attributeEntry="${activityAttributes.createDate}" /></div></th>
                <td>
                	<kul:htmlControlAttribute property="${activityPath}.createDate" attributeEntry="${activityAttributes.createDate}" readOnly="true"/>
                </td>             
            </tr>
            <tr>
		        <th><div align="right"><kul:htmlAttributeLabel attributeEntry="${activityAttributes.followupDate}" /></div></th>
                <td>
                	<kul:htmlControlAttribute property="${activityPath}.followupDate" attributeEntry="${activityAttributes.followupDate}" readOnly="${readOnly}"/>
                </td>
		        <th><div align="right"><kul:htmlAttributeLabel attributeEntry="${activityAttributes.lastModifiedDate}" /></div></th>
                <td>
                	<kul:htmlControlAttribute property="${activityPath}.lastModifiedDate" attributeEntry="${activityAttributes.lastModifiedDate}" readOnly="true"/>
                </td>
		        <th><div align="right"><kul:htmlAttributeLabel attributeEntry="${activityAttributes.lastModifiedUsername}" /></div></th>
                <td>
                	<kul:htmlControlAttribute property="${activityPath}.lastModifiedUserFullName" 
                		attributeEntry="${activityAttributes.lastModifiedUsername}" readOnly="true"/>
                </td>             
            </tr> 
            <tr>
		        <th><div align="right"><kul:htmlAttributeLabel attributeEntry="${activityAttributes.description}" /></div></th>
                <td colspan="5">
                	<c:if test="${!activity.restricted || KualiForm.editingMode['view_unrestricted']}">
                	  <kul:htmlControlAttribute property="${activityPath}.description" attributeEntry="${activityAttributes.description}" readOnly="${readOnly}"/>
 <!-- KC-820 Modify Negotiation Description restricted/unrestricted
 Commenting out section which displays the restrict/unrestrict buttons  	  
		              <c:if test="${!readOnly}">
		               	<c:choose>
		               	  <c:when test="${activity.restricted}">
		               	   <html:image property="methodToCall.unrestrictActivity.activityIndex${activityIndex}"
		  		  					src="${ConfigProperties.kra.externalizable.images.url}tinybutton-unrestrict.gif" styleClass="tinybutton"/>
		               	  </c:when>
		               	  <c:otherwise>
		               	   <html:image property="methodToCall.restrictActivity.activityIndex${activityIndex}"
		  		  					src="${ConfigProperties.kra.externalizable.images.url}tinybutton-restrict.gif" styleClass="tinybutton"/>                	
		               	</c:otherwise>
		               	</c:choose>
		              </c:if>
 KC-820 END -->
                	</c:if>
                </td>
            </tr>
        </table>
		<c:choose>
			<c:when test="${activityIndex == -1}">
			  <c:set var="addButtonStyleClass" value="tinybutton"/>
			  <c:set var="newBody" value="false"/>
			</c:when>
			<c:otherwise>
			  <c:set var="addButtonStyleClass" value="tinybutton addButton"/>
			  <c:set var="newBody" value="true"/>
			</c:otherwise>
		</c:choose>
        <table cellpadding="4" cellspacing="0" summary="">
            <c:if test="${newBody}">
            	<tbody class="addline">
            </c:if>
            <c:if test="${!readOnly}">
            <tr>
            	<th><div align="right">Attachments:</div></th>
            	<th>* File: <html:file property="${activityPath}.newAttachment.newFile"/><kul:checkErrors keyMatch="${activityPath}.newAttachment.newFile" auditMatch="${activityPath}.newAttachment.newFile"/>  
            		<c:if test="${hasErrors}">
	 					<kul:fieldShowErrorIcon />
  					</c:if>
            	</th>
            	<th><kul:htmlAttributeLabel attributeEntry="${attachmentAttributes.description}" useShortLabel="true" /> <kul:htmlControlAttribute property="${activityPath}.newAttachment.description" attributeEntry="${attachmentAttributes.description}" readOnly="${readOnly}"/></th>
            	<th>
            		<html:image property="methodToCall.addAttachment.activityIndex${activityIndex}"
            			src="${ConfigProperties.kra.externalizable.images.url}tinybutton-add1.gif" styleClass="${addButtonStyleClass}"
   		  				onclick="return ${fileDescriptionValidationFunctionName}();"/>
   		  				<script language="javascript">
   		  					<!--
   		  						function ${fileDescriptionValidationFunctionName}() {
				  					var fileField = document.getElementsByName('${activityPath}.newAttachment.newFile')[0];
				  					if (fileField.value != '') {
				  						var errorString = '';
				  						var fileFieldDescriptionField = document.getElementsByName('${activityPath}.newAttachment.description')[0];
				  						
				  						if (fileFieldDescriptionField.value == '') {
			  								window.alert('Please enter an Attachment Description.');
			  								return false;
			  							} else {
			  								return true;
			  							}
				  					} else {
				  						return true;
				  					}
				  				}
   		  					-->
   		  				</script>
            	</th>
            </tr>
            </c:if>
            <c:if test="${newBody}">
            	</tbody>
            </c:if>
            <c:forEach items="${activity.attachments}" var="attachment" varStatus="ctr">
              <c:if test="${!attachment.restricted || KualiForm.editingMode['view_unrestricted']}">
              <tr>
                <th style="text-align: right;"><c:out value="${ctr.count}"/></th>
                <td><a href="#" class="attachmentLink"><kra:fileicon attachment="${attachment.file}"/><c:out value="${attachment.file.name}"/></a>
                        	<html:image property="methodToCall.viewAttachment.activityIndex${activityIndex}.attachmentIndex${ctr.count-1}"
   		  				src="${ConfigProperties.kra.externalizable.images.url}tinybutton-view.gif" styleClass="tinybutton" />
                </td>
                <td><kul:htmlControlAttribute property="${activityPath}.attachments[${ctr.count-1}].description" attributeEntry="${attachmentAttributes.description}" readOnly="${readOnly}"/></td>
                <td><c:if test="${!readOnly}"><html:image property="methodToCall.deleteAttachment.activityIndex${activityIndex}.attachmentIndex${ctr.count-1}"
   		  				src="${ConfigProperties.kr.externalizable.images.url}tinybutton-delete1.gif" styleClass="tinybutton"/>
   		  			<c:choose><c:when test="${attachment.restricted}">
   		  			<html:image property="methodToCall.unrestrictAttachment.activityIndex${activityIndex}.attachmentIndex${ctr.count-1}"
   		  				src="${ConfigProperties.kra.externalizable.images.url}tinybutton-unrestrict.gif" styleClass="tinybutton"/>
   		  			</c:when><c:otherwise>
   		  			<html:image property="methodToCall.restrictAttachment.activityIndex${activityIndex}.attachmentIndex${ctr.count-1}"
   		  				src="${ConfigProperties.kra.externalizable.images.url}tinybutton-restrict.gif" styleClass="tinybutton"/>
   		  			</c:otherwise></c:choose></c:if>
   		  		</td>
              </tr>
              </c:if>
            </c:forEach>
            <c:if test="${newActivity && !readOnly}">
			<tr>
			    <td class="infoline" style="text-align:center;" colspan="6">
					<html:image property="methodToCall.addActivity"
   		  				src="${ConfigProperties.kra.externalizable.images.url}tinybutton-addactivity.gif" styleClass="tinybutton addButton"
   		  				onclick="return validateForm()"/>
   		  			<script language="javascript">
   		  			<!--
   		  				function validateForm() {
   		  					var fileField = document.getElementsByName('negotiationActivityHelper.newActivity.newAttachment.newFile')[0];
   		  					if (fileField.value != '') {
   		  						var errorString = '';
   		  						var activityDescriptionField = document.getElementsByName('negotiationActivityHelper.newActivity.description')[0];
   		  						var fileFieldDescriptionField = document.getElementsByName('negotiationActivityHelper.newActivity.newAttachment.description')[0];
   		  						var activityStartDateField = document.getElementsByName('negotiationActivityHelper.newActivity.startDate')[0];
   		  						var locationField = document.getElementsByName('negotiationActivityHelper.newActivity.locationId')[0];
   		  						var locationValue = locationField.options[locationField.selectedIndex].text;
   		  						var activityTypeField = document.getElementsByName('negotiationActivityHelper.newActivity.activityTypeId')[0];
   		  						var activityTypeValue = activityTypeField.options[activityTypeField.selectedIndex].text;
   		  						if (activityDescriptionField.value == '') {
   		  							errorString = errorString + 'Please enter an Activity Description.\n';
   		  						}
   		  						if (fileFieldDescriptionField.value == '') {
		  							errorString = errorString + 'Please enter an Attachment Description.\n';
		  						}
   		  						if (activityStartDateField.value == '') {
	  								errorString = errorString + 'Please enter an Activity Start Date.\n';
	  							}
   		  						if (locationValue == 'select') {
  									errorString = errorString + 'Please enter a Location.\n';
  								}
   		  						if (activityTypeValue == 'select') {
									errorString = errorString + 'Please enter an Activity Type.\n';
								}
   		  						if (errorString != '') {
   		  							window.alert(errorString);
   		  							return false;
   		  						} else {
   		  							return true;
   		  						}
   		  						//return confirm('validateForm');
   		  					} else {
   		  						return true;
   		  					}
   		  				}
   		  			-->
   		  			</script>
			    </td>
			</tr>
			</c:if>
			
			 <c:if test="${!newActivity && !readOnly}">
				<tr>
			     <td class="infoline" style="text-align:center;" colspan="6">
					<html:image property="methodToCall.printActivity.activityIndex${activityIndex}"
   		  				src="${ConfigProperties.kra.externalizable.images.url}tinybutton-print.gif" styleClass="tinybutton"/>
   		  			<html:image property="methodToCall.deleteActivity.activityIndex${activityIndex}"
   		  				src="${ConfigProperties.kr.externalizable.images.url}tinybutton-delete1.gif" styleClass="tinybutton"/>
   		  			<!-- KC-822 Add send notification button and a link to launch Award Memo Tool -->
   		  			<!-- KC-886 After sorting was added to negotiation activities memo tool launches with wrong code -->
   		  			<!--        changed activityIndex to activityId for KC-886 -->
   		  			<html:image property="methodToCall.launchNotificationTool.activityId${activity.activityId}"
   		  				src="${ConfigProperties.kra.externalizable.images.url}tinybutton-sendmemo.gif" styleClass="tinybutton"/>
			    </td>
			</tr>
			</c:if>
        </table>
        </td>
        </tbody>
        </table>
        </div>
<!-- KC-814 Set Start to Default to Today --> 
<c:set var="oneDayNegotiationActivityTypes" value="<%=org.kuali.rice.coreservice.framework.CoreFrameworkServiceLocator.getParameterService().getParameterValueAsString(\"KC-GEN\", \"All\", \"uh_one_day_negotiation_activity_types\")%>"/>
<c:set var="restricted_negotiation_activity_types" value="<%=org.kuali.rice.coreservice.framework.CoreFrameworkServiceLocator.getParameterService().getParameterValueAsString(\"KC-GEN\", \"All\", \"uh_restricted_negotiation_activity_types\")%>"/>
<script language="JavaScript">

jQuery.noConflict();

jQuery(document).ready(function($) {
function getToday() {
                            var today = new Date();
                            var dd = today.getDate();
                            var mm = today.getMonth()+1; //January is 0!
                            var yyyy = today.getFullYear();
    
                            if(dd<10) {
                               dd='0'+dd
                            } 
    
                            if(mm<10) {
                                mm='0'+mm
                            } 

                            today = mm+'/'+dd+'/'+yyyy;
                            return today;
                        }

//KC-870 Negotiation Start Date resets to today's data when user attaches document 
         
function getStartDate() {
             var startDate =  $("#negotiationActivityHelper\\\.newActivity\\\.startDate").val();
             return startDate;
}

function populateEndDate(){

    var selected = $("#negotiationActivityHelper\\\.newActivity\\\.activityTypeId :selected").text();
    var oneDayNegotiationTypes = "${oneDayNegotiationActivityTypes}";
    var oneDaySelection = oneDayNegotiationTypes.indexOf("[" + selected + "]") > -1;
   
    if (oneDaySelection) {
        $("#negotiationActivityHelper\\\.newActivity\\\.endDate").val(getStartDate());
    } else {
        $("#negotiationActivityHelper\\\.newActivity\\\.endDate").val("");
    }
 }
 
//Set Negotiation startDate to today's date when the start date is blank. 
//This occurs the first time and when a new activity is added.

if ( $("#negotiationActivityHelper\\\.newActivity\\\.startDate").val() == "" )
{                         
   $("#negotiationActivityHelper\\\.newActivity\\\.startDate").val(getToday());
}


//Change the endDate when the startDate was changed per the ActivityType, only on new activity
if (${newActivity}) {
  $("#negotiationActivityHelper\\\.newActivity\\\.startDate").change(populateEndDate);
}
 
//Change the endDate per the ActivityType, only on new activity 
if (${newActivity}) {
  $("#negotiationActivityHelper\\\.newActivity\\\.activityTypeId").change(populateEndDate);
}  
//KC-870 END

//KC-897 Negotiation - Default a location based on selected activity type
<c:set var="uh_negotiations_activity_to_location" value="<%=org.kuali.rice.coreservice.framework.CoreFrameworkServiceLocator.getParameterService().getParameterValueAsString(\"KC-GEN\", \"All\", \"uh_negotiations_activity_to_location\")%>"/>

function populateLocation(){

     var selectedActivity = $("#negotiationActivityHelper\\\.newActivity\\\.activityTypeId :selected").text();
     var activityToLocationStringArray ="${uh_negotiations_activity_to_location}".split(";");
     var i = 0, defaultLocation = "select";
     
     while (i < activityToLocationStringArray.length && !activityFound) {
            var activityFound = (activityToLocationStringArray[i].indexOf( "[" + selectedActivity + "]")) >= 0;
            if (activityFound) {
                // Get the default location Format LOCATION:[activity type][activity type2]...
                defaultLocation = activityToLocationStringArray[i].split(':')[0].trim();
            }
            i++;
      }      
      $("#negotiationActivityHelper\\\.newActivity\\\.locationId option:contains(" + defaultLocation + ")").attr('selected', 'selected');

 }
 
// Popoulate Location Based on activity selected, only apply to the new activity section
if (${newActivity}) {
    $("#negotiationActivityHelper\\\.newActivity\\\.activityTypeId").change(populateLocation);
}
//KC-897 END
 
 <!-- KC-820 Modify Negotiation Description restricted/unrestricted -->
 function setDescriptionColor() {
    var escapedString=jq_escape("${activityPath}.activityTypeId") + " :selected";
    var restricted_negotiation_activity_types="${restricted_negotiation_activity_types}";
    var selected = $(escapedString).text();
    var resticted = restricted_negotiation_activity_types.indexOf("[" + selected + "]") > -1;
    if (resticted) {
        $(jq_escape("${activityPath}.description")).css({'background-color': 'pink'});
    } else {
        $(jq_escape("${activityPath}.description")).css({'background-color': 'white'});
    }
 }

<!-- Set the initial color when the document is ready -->
setDescriptionColor();
 
<!-- Change the color when activity Type is changed. -->
$(jq_escape("${activityPath}.activityTypeId")).change(function () {
    setDescriptionColor();
});
 
 });
</script>
<!-- KC-820 END -->
</kul:innerTab>

        
