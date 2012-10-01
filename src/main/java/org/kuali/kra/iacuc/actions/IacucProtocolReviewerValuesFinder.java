/*
 * Copyright 2005-2010 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.osedu.org/licenses/ECL-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.kra.iacuc.actions;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.kuali.kra.common.committee.service.CommitteeServiceBase;
import org.kuali.kra.iacuc.IacucProtocolForm;
import org.kuali.kra.iacuc.actions.submit.IacucProtocolSubmissionStatus;
import org.kuali.kra.iacuc.committee.service.IacucCommitteeService;
import org.kuali.kra.protocol.ProtocolBase;
import org.kuali.kra.protocol.actions.submit.ProtocolReviewer;
import org.kuali.kra.protocol.actions.submit.ProtocolSubmissionBase;
import org.kuali.rice.core.api.util.ConcreteKeyValue;
import org.kuali.rice.core.api.util.KeyValue;
import org.kuali.rice.kns.util.KNSGlobalVariables;
import org.kuali.rice.kns.web.struts.form.KualiForm;


public class IacucProtocolReviewerValuesFinder extends IacucActionsKeyValuesBase {
    
    /**
     * Comment for <code>serialVersionUID</code>
     */
    private static final long serialVersionUID = 8186396635481365939L;

    public List<KeyValue> getKeyValues() {
        List<KeyValue> keyValues = new ArrayList<KeyValue>();
        keyValues.add(new ConcreteKeyValue("", "select"));
        
        ProtocolBase protocol = getProtocol();
        if (protocol != null) {
            ProtocolSubmissionBase submission = getCurrentSubmission(protocol);
            if (submission != null) {
                List<ProtocolReviewer> reviewers = submission.getProtocolReviewers();
                for (ProtocolReviewer reviewer : reviewers) {
                    keyValues.add(new ConcreteKeyValue(reviewer.getProtocolReviewerId().toString(), reviewer.getFullName()));
                }
            }
        }
        
        return keyValues;
    }

//    private String getPersonName(ProtocolReviewer reviewer) {
//        if (reviewer.getNonEmployeeFlag()) {
//            return getRolodexService().getRolodex(reviewer.getRolodexId()).getFullName();            
//        } else {
//           return getKcPersonService().getKcPersonByPersonId(reviewer.getPersonId()).getFullName();
//        }
//    }

    private ProtocolSubmissionBase getCurrentSubmission(ProtocolBase protocol) {
        for (ProtocolSubmissionBase submission : protocol.getProtocolSubmissions()) {
            if (StringUtils.equals(submission.getSubmissionStatusCode(), IacucProtocolSubmissionStatus.IN_AGENDA) ||
                StringUtils.equals(submission.getSubmissionStatusCode(), IacucProtocolSubmissionStatus.SUBMITTED_TO_COMMITTEE)) {
                return submission;
            }
        }
        return null;
    }

    private ProtocolBase getProtocol() {
        KualiForm form = KNSGlobalVariables.getKualiForm();
        if (form != null && form instanceof IacucProtocolForm) {
            return ((IacucProtocolForm) form).getProtocolDocument().getProtocol();
        }
        return null;
    }

    @Override
    protected Class<? extends CommitteeServiceBase> getCommitteeServiceClassHook() {
        return IacucCommitteeService.class;
    }
}
