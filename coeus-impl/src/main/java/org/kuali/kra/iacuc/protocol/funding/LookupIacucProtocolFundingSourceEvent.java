/*
 * Kuali Coeus, a comprehensive research administration system for higher education.
 * 
 * Copyright 2005-2016 Kuali, Inc.
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 * 
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.kuali.kra.iacuc.protocol.funding;

import org.kuali.kra.iacuc.IacucProtocolDocument;
import org.kuali.kra.protocol.ProtocolEventBase;
import org.kuali.kra.protocol.protocol.funding.LookupProtocolFundingSourceEventBase;
import org.kuali.kra.protocol.protocol.funding.LookupProtocolFundingSourceRule;

public class LookupIacucProtocolFundingSourceEvent extends LookupProtocolFundingSourceEventBase {

    public LookupIacucProtocolFundingSourceEvent(String errorPathPrefix, IacucProtocolDocument document, String fundingSourceTypeCode, ProtocolEventBase.ErrorType type) {
        super(errorPathPrefix, document, fundingSourceTypeCode, type);
    }

    @Override
    public LookupProtocolFundingSourceRule getRule() {
        return new LookupIacucProtocolFundingSourceRule();
    }

}
