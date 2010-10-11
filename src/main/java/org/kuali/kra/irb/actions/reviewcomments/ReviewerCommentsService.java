/*
 * Copyright 2005-2010 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.opensource.org/licenses/ecl1.php
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.kra.irb.actions.reviewcomments;


import java.util.List;

import org.kuali.kra.irb.Protocol;
import org.kuali.kra.irb.actions.submit.ProtocolReviewer;
import org.kuali.kra.irb.actions.submit.ProtocolSubmission;
import org.kuali.kra.irb.onlinereview.ProtocolOnlineReview;
import org.kuali.kra.meeting.CommitteeScheduleMinute;

public interface ReviewerCommentsService {
    
    /**
     * Determines whether the given principal can view the list of online reviewer comments for the given protocol submission.
     * 
     * This is true when 
     *   1) The principal is an IRB Administrator
     *   2) The principal is an online reviewer of the given protocol submission
     *   3) The protocol submission processing has been completed
     * @param principalId the id of the user
     * @param protocolSubmission the protocol submission
     * @return true if the principal can view the list of online reviewer comments for the given protocol submission, false otherwise
     */
    boolean canViewOnlineReviewerComments(String principalId, ProtocolSubmission protocolSubmission);
    
    /**
     * Determines whether the given principal can view the list of online reviewers for the given protocol submission.
     * 
     * This is true when the principal is an IRB Administrator or an online reviewer of the given protocol submission.
     * @param principalId the id of the user
     * @param protocolSubmission the protocol submission
     * @return true if the principal can view the list of online reviewers, false otherwise
     */
    boolean canViewOnlineReviewers(String principalId, ProtocolSubmission protocolSubmission);    
    
    /**
     * Finds and returns the reviewer comments for a protocol number and a certain submission.
     * @param protocolNumber The protocol number
     * @param submissionNumber The number of the submission
     * @return a list of reviewer comments
     */
    List<CommitteeScheduleMinute> getReviewerComments(String protocolNumber, int submissionNumber);
    
    /**
     * 
     * This method is to get a list or protocol reviewers for this submission.
     * @param protocolNumber
     * @param submissionNumber
     * @return
     */
    List<ProtocolReviewer> getProtocolReviewers(String protocolNumber, int submissionNumber);
    
    void persistReviewerComments(ReviewerComments reviewComments, Protocol protocol);
    void persistReviewerComments(ReviewerComments reviewComments, Protocol protocol, ProtocolOnlineReview protocolOnlineReview);

}
