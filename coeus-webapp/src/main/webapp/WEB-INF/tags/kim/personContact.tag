<%--
 Copyright 2008-2009 The Kuali Foundation
 
 Licensed under the Educational Community License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.opensource.org/licenses/ecl2.php
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
--%>
<%@ include file="/kr/WEB-INF/jsp/tldHeader.jsp"%>

<c:set var="personAttributes" value="${DataDictionary.IdentityManagementPersonDocument.attributes}" />


<!-- KC-553 Lock down person edit page -->
<script src="../scripts/jquery/jquery.js"></script>
<script>
	var uhSelectedTypes = {};
	var uhBuildSelector = function(n) {
		var parts = n.split('.');
		var k = "name='" + parts[0] + "." + parts[1];
		k = k.replace(/[\[]/g,"\\[");
		k = k.replace(/[\]]/g,"\\]");
		k = k.replace(/[.]/g,"\\.");
		return k;
	};
	
	var uhDisableFields = function(e, typeCode, fields) {
		if (e.value == typeCode) {
			e.setAttribute('disabled',true);
			var k = uhBuildSelector(e.name);
			for (var i in fields) {
				$("[" + k + "\\." + fields[i] + "']").attr("disabled", true);					
			}
		}
	};

    $(document).ready(function() { 
		$("[name$=emailTypeCode]").each(function() {
			uhSelectedTypes[this.name] = this.selectedIndex;
		});
		$("[name$=emailTypeCode]").change(function() {uhValidateType(this, 'Work')});
		
		$("[name$=nameTypeCode]").each(function() {
			uhSelectedTypes[this.name] = this.selectedIndex;
		});
		$("[name$=nameTypeCode]").change(function() {uhValidateType(this, 'Preferred')});

		$("select.[id ^= document.emails]").each(function() {
			uhDisableFields(this, 'WRK', ['emailAddress']); 
		});

		$("select.[id ^= document.names]").each(function() { 
			uhDisableFields(this, 'PRFR', ['title','firstName','lastName','suffix']); 		
		});

    });

	function uhValidateType(s, t) {
		var oldIdx = uhSelectedTypes[s.name];
		var newIdx = s.selectedIndex

		if ( (s[oldIdx].text == t)
			 || (s[newIdx].text == t) ) {
			alert("Error: " + t + " type is reserved for the system- users must choose another type.");
			var jqSel = $(s);
			jqSel.val(s[oldIdx].value);
			return false;
		}
	}
</script>
<!-- KC-553 END -->


<kul:tab tabTitle="Contact" defaultOpen="false" tabErrorKey="document.names*,document.phones*,newName.*,newPhone.*,document.addrs*,newAddr.*,document.emails*,newEmail.*">
	<div class="tab-container" align="center">
		<kim:personName />
		<kim:personAddress />
		<kim:personPhone />
		<kim:personEmail />		
	</div>
</kul:tab>
