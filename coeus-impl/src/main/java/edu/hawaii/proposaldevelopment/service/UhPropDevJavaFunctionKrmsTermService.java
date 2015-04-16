/* New code for KC-801 */
/*
 * Copyright 2005-2013 The Kuali Foundation
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
package edu.hawaii.proposaldevelopment.service;

import org.kuali.coeus.propdev.impl.core.DevelopmentProposal;


/**
 * This interface is to declare all methods which are used as KRMS Terms in KC
 */
public interface UhPropDevJavaFunctionKrmsTermService {
    public String hasUnrecoveredFandA(DevelopmentProposal developmentProposal);
    // KC-837 KRMS - New term needed, "Prime Sponsor ID"
    public String hasPrimeSponsor(DevelopmentProposal developmentProposal, String sponsorCode);
    // KC-917 KRMS - New term needed, "has Prime Sponsor Type"
    public String hasSponsorOrPrimeSponsorCode(DevelopmentProposal developmentProposal, String sponsorCode);
    public String hasPrimeSponsorTypeCode(DevelopmentProposal developmentProposal, String sponsorTypeCode);
    public String hasSponsorOrPrimeSponsorTypeCode(DevelopmentProposal developmentProposal, String sponsorTypeCode);
    // KC-917 END
}
