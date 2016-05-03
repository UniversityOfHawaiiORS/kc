<%--
   - Kuali Coeus, a comprehensive research administration system for higher education.
   - 
   - Copyright 2005-2016 Kuali, Inc.
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
<c:set var="subAwardAmountInfoAttributes" value="${DataDictionary.SubAwardAmountInfo.attributes}" />
<c:set var="subAwardAttributes" value="${DataDictionary.SubAward.attributes}" />
<%@ attribute name="amountInfo" required="true" type="org.kuali.kra.subaward.bo.SubAwardAmountInfo" %>
<%@ attribute name="amountInfoPath" required="true" %>
<%@ attribute name="index" required="true" %>
<%@ attribute name="currentTabIndex" required="true" %>
<%@ attribute name="readOnly" required="true" %>
<%@ attribute name="formAction" required="true" %>

<%-- KC-1364 Bring in BU contributions - Transaction Type --%>
<tr>
	<th width="9%" class="infoline" rowspan="6"><c:out value="${index+1}" /></th>
	<th><div align="center"><kul:htmlAttributeLabel attributeEntry="${subAwardAmountInfoAttributes.effectiveDate}" /></div></th>
	<th><div align="center"><kul:htmlAttributeLabel attributeEntry="${subAwardAmountInfoAttributes.obligatedChange}" /></div></th>
	<th><div align="center"><kul:htmlAttributeLabel attributeEntry="${subAwardAmountInfoAttributes.anticipatedChange}" /></div></th>
	<th><div align="center"><kul:htmlAttributeLabel attributeEntry="${subAwardAmountInfoAttributes.fileName}" /></div></th>
	<%-- <c:if test="${canModify}">  --%>
	<kul:htmlAttributeHeaderCell literalLabel="Actions" scope="col"/>
	<%-- </c:if> --%>
</tr>
<%-- KC-1364 End --%>
<tr>
	<td width="9%" valign="middle">
		<div align="center">
			<kul:htmlControlAttribute property="${amountInfoPath}.effectiveDate"
				attributeEntry="${subAwardAmountInfoAttributes.effectiveDate}"
				datePicker="true" readOnly="${readOnly}" />
		</div>
	</td>
	<td width="9%" valign="middle">
		<div align="center">
			<kul:htmlControlAttribute property="${amountInfoPath}.obligatedChange"
				attributeEntry="${subAwardAmountInfoAttributes.obligatedChange}"
				readOnly="${readOnly}" />
		</div>
	</td>
	<td width="9%" valign="middle">
		<div align="center">
			<kul:htmlControlAttribute property="${amountInfoPath}.anticipatedChange"
				attributeEntry="${subAwardAmountInfoAttributes.anticipatedChange}"
				readOnly="${readOnly}" />
		</div>
	<td width="9%" valign="middle">

		<div align="center"></div>
		<div id="replaceDiv${index}" style="display: block;">
			<c:if test="${amountInfo.fileName!=null}">
				<kra:fileicon attachment="${amountInfo}" />
			</c:if>
			<kul:htmlControlAttribute property="${amountInfoPath}.fileName"
				readOnly="true"
				attributeEntry="${subAwardAmountInfoAttributes.fileName}" />
		</div> <c:if test="${!readOnly}">
			<div id="fileDiv${index}" valign="middle" style="display: none;">
				<html:file property="${amountInfoPath}.newFile" />
				<html:image
					property="methodToCall.replaceHistoryOfChangesAttachment.line${index}.anchor${currentTabIndex}"
					src='${ConfigProperties.kra.externalizable.images.url}tinybutton-add1.gif'
					styleClass="tinybutton" />
			</div>
		</c:if>
	</td>
	<%-- KC-1364 Bring in BU contributions - Transaction Type --%>
	<td width="10%" valign="middle" rowspan="5">
		<div align="center">Attachment Actions :</div>
		<br></br>
		<div align="center">
			<c:if test="${amountInfo.fileName!=null}">
				<html:image
						styleId="downloadHistoryOfChangesAttachment.line${amountInfo.subAwardAmountInfoId}"
						property="methodToCall.downloadHistoryOfChangesAttachment.line${amountInfo.subAwardAmountInfoId}.anchor${currentTabIndex}"
						src='${ConfigProperties.kra.externalizable.images.url}tinybutton-view.gif'
						styleClass="tinybutton"
						onclick="javascript: openNewWindow('${formAction}','downloadHistoryOfChangesAttachment','${amountInfo.subAwardAmountInfoId}',${KualiForm.formKey},'${KualiForm.document.sessionDocument}'); return false" />
			</c:if>
			<c:if test="${!readOnly}">
				<html:image styleId="replaceHistoryOfChangesAttachment.line${index}"
							onclick="javascript: showHide('fileDiv${index}','replaceDiv${index}') ; return false"
							src='${ConfigProperties.kra.externalizable.images.url}tinybutton-replace.gif'
							styleClass="tinybutton"
							property="methodToCall.replaceNarrativeAttachment.line${index}.anchor${currentTabIndex};return false" />
				<c:if test="${amountInfo.fileName!=null}">
					<html:image
							property="methodToCall.deleteAmountInfo.line${index}.anchor${currentTabIndex}"
							src='${ConfigProperties.kra.externalizable.images.url}tinybutton-delete1.gif'
							styleClass="tinybutton" />
				</c:if>
			</c:if>
			<c:if test="${readOnly}">&nbsp;</c:if>
		</div>
	</td>
</tr>
<%-- KC-1364 Bring in BU contributions - Transaction Type --%>
<tr>
	<th><div align="center"><kul:htmlAttributeLabel attributeEntry="${subAwardAmountInfoAttributes.modificationEffectiveDate}" /></div></th>
	<th><div align="center"><kul:htmlAttributeLabel attributeEntry="${subAwardAmountInfoAttributes.modificationID}" /></div></th>
	<th><div align="center"><kul:htmlAttributeLabel attributeEntry="${subAwardAmountInfoAttributes.periodofPerformanceStartDate}" /></div></th>
	<th><div align="center"><kul:htmlAttributeLabel attributeEntry="${subAwardAmountInfoAttributes.periodofPerformanceEndDate}" /></div></th>
</tr>
<%-- KC-1364 End --%>
<tr>
	<td width="9%" valign="middle">
		<div align="center">
			<kul:htmlControlAttribute
				property="${amountInfoPath}.modificationEffectiveDate"
				attributeEntry="${subAwardAmountInfoAttributes.modificationEffectiveDate}"
				datePicker="true" readOnly="${readOnly}" />
		</div>
	</td>
	<td width="9%" valign="middle">
		<div align="center">
			<kul:htmlControlAttribute property="${amountInfoPath}.modificationID"
				attributeEntry="${subAwardAmountInfoAttributes.modificationID}"
				readOnly="${readOnly}" />
		</div>
	</td>
	<td width="9%" valign="middle">
		<div align="center">
			<kul:htmlControlAttribute
				property="${amountInfoPath}.periodofPerformanceStartDate"
				attributeEntry="${subAwardAmountInfoAttributes.periodofPerformanceStartDate}"
				datePicker="true" readOnly="${readOnly}" />
		</div>
	</td>
	<td width="9%" valign="middle">
		<div align="center">
			<kul:htmlControlAttribute
				property="${amountInfoPath}.periodofPerformanceEndDate"
				attributeEntry="${subAwardAmountInfoAttributes.periodofPerformanceEndDate}"
				datePicker="true" readOnly="${readOnly}" />
		</div>
	</td>
</tr>
<%-- KC-1364 Bring in BU contributions - Transaction Type --%>
<tr>
	<th><div align="center"><kul:htmlAttributeLabel attributeEntry="${subAwardAmountInfoAttributes.transactionTypeCode}" /></div></th>
	<th colspan="3"><div align="center"><kul:htmlAttributeLabel attributeEntry="${subAwardAmountInfoAttributes.comments}" /></div></th>
</tr>
<tr>
	<td><kul:htmlControlAttribute
			property="${amountInfoPath}.transactionTypeCode"
			attributeEntry="${subAwardAmountInfoAttributes.transactionTypeCode}"
			readOnly="${readOnly}" /></td>
	<td colspan="3"><kul:htmlControlAttribute
			property="${amountInfoPath}.comments"
			attributeEntry="${subAwardAmountInfoAttributes.comments}"
			readOnly="${readOnly}" /></td>
</tr>
<%-- KC-1364 End --%>