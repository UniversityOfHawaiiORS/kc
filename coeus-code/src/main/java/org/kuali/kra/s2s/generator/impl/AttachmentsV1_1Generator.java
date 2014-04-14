/*
 * Copyright 2005-2014 The Kuali Foundation.
 * 
 * Licensed under the Educational Community License, Version 1.0 (the "License");
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
package org.kuali.kra.s2s.generator.impl;


import gov.grants.apply.forms.attachmentsV11.AttachmentsDocument;
import gov.grants.apply.forms.attachmentsV11.AttachmentsDocument.Attachments;
import gov.grants.apply.forms.attachmentsV11.AttachmentsDocument.Attachments.*;
import gov.grants.apply.system.attachmentsV10.AttachedFileDataType;
import org.apache.xmlbeans.XmlObject;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocument;
import org.kuali.coeus.propdev.impl.attachment.Narrative;
import org.kuali.kra.s2s.generator.S2SBaseFormGenerator;
import org.kuali.kra.s2s.util.S2SConstants;

/**
 * 
 * This class is used to generate XML Document object for grants.gov AttachmentsV1.1. This form is generated using XMLBean API's
 * generated by compiling AttachmentsV1.1 schema.
 * 
 * @author Kuali Research Administration Team (kualidev@oncourse.iu.edu)
 */
public class AttachmentsV1_1Generator extends S2SBaseFormGenerator {

    private static final int NARRATIVECODE_ATTACHMENTS = 61;

    /**
     * 
     * This method returns the Other type attachments based on the narrative type code. It gets the attachment if the narrative type
     * code is 8(narrative type code for Other type)
     * 
     * @return attachmentsDocument(AttachmentsDocument) {@link XmlObject} of type AttachmentsDocument.
     */
    private AttachmentsDocument getAttachment() {

        AttachmentsDocument attachmentsDocument = AttachmentsDocument.Factory.newInstance();
        Attachments attachments = Attachments.Factory.newInstance();
        attachments.setFormVersion(S2SConstants.FORMVERSION_1_1);
        ATT1 att1 = ATT1.Factory.newInstance();
        ATT2 att2 = ATT2.Factory.newInstance();
        ATT3 att3 = ATT3.Factory.newInstance();
        ATT4 att4 = ATT4.Factory.newInstance();
        ATT5 att5 = ATT5.Factory.newInstance();
        ATT6 att6 = ATT6.Factory.newInstance();
        ATT7 att7 = ATT7.Factory.newInstance();
        ATT8 att8 = ATT8.Factory.newInstance();
        ATT9 att9 = ATT9.Factory.newInstance();
        ATT10 att10 = ATT10.Factory.newInstance();
        ATT11 att11 = ATT11.Factory.newInstance();
        ATT12 att12 = ATT12.Factory.newInstance();
        ATT13 att13 = ATT13.Factory.newInstance();
        ATT14 att14 = ATT14.Factory.newInstance();
        ATT15 att15 = ATT15.Factory.newInstance();
        int countAttachments = 0;
        AttachedFileDataType attachedFileDataType = null;
        for (Narrative narrative : pdDoc.getDevelopmentProposal().getNarratives()) {
            if (narrative.getNarrativeTypeCode() != null
                    && Integer.parseInt(narrative.getNarrativeTypeCode()) == NARRATIVECODE_ATTACHMENTS) {
            	attachedFileDataType = getAttachedFileType(narrative);
            	if(attachedFileDataType == null){
            		continue;
            	}
                countAttachments++;
                switch (countAttachments) {
                    case 1: {
                        att1.setATT1File(attachedFileDataType);
                        attachments.setATT1(att1);
                        break;
                    }
                    case 2: {
                        att2.setATT2File(attachedFileDataType);
                        attachments.setATT2(att2);
                        break;
                    }
                    case 3: {
                        att3.setATT3File(attachedFileDataType);
                        attachments.setATT3(att3);
                        break;
                    }
                    case 4: {
                        att4.setATT4File(attachedFileDataType);
                        attachments.setATT4(att4);
                        break;
                    }
                    case 5: {
                        att5.setATT5File(attachedFileDataType);
                        attachments.setATT5(att5);
                        break;
                    }
                    case 6: {
                        att6.setATT6File(attachedFileDataType);
                        attachments.setATT6(att6);
                        break;
                    }
                    case 7: {
                        att7.setATT7File(attachedFileDataType);
                        attachments.setATT7(att7);
                        break;
                    }
                    case 8: {
                        att8.setATT8File(attachedFileDataType);
                        attachments.setATT8(att8);
                        break;
                    }
                    case 9: {
                        att9.setATT9File(attachedFileDataType);
                        attachments.setATT9(att9);
                        break;
                    }
                    case 10: {
                        att10.setATT10File(attachedFileDataType);
                        attachments.setATT10(att10);
                        break;
                    }
                    case 11: {
                        att11.setATT11File(attachedFileDataType);
                        attachments.setATT11(att11);
                        break;
                    }
                    case 12: {
                        att12.setATT12File(attachedFileDataType);
                        attachments.setATT12(att12);
                        break;
                    }
                    case 13: {
                        att13.setATT13File(attachedFileDataType);
                        attachments.setATT13(att13);
                        break;
                    }
                    case 14: {
                        att14.setATT14File(attachedFileDataType);
                        attachments.setATT14(att14);
                        break;
                    }
                    case 15: {
                        att15.setATT15File(attachedFileDataType);
                        attachments.setATT15(att15);
                        break;
                    }
                    default: {
                        break;
                    }
                }
            }
        }
        attachmentsDocument.setAttachments(attachments);
        return attachmentsDocument;
    }

    /**
     * This method creates {@link XmlObject} of type {@link AttachmentsDocument} by populating data from the given
     * {@link ProposalDevelopmentDocument}
     * 
     * @param proposalDevelopmentDocument for which the {@link XmlObject} needs to be created
     * @return {@link XmlObject} which is generated using the given {@link ProposalDevelopmentDocument}
     * 
     * @see org.kuali.kra.s2s.generator.S2SFormGenerator#getFormObject(ProposalDevelopmentDocument)
     */
    public XmlObject getFormObject(ProposalDevelopmentDocument proposalDevelopmentDocument) {

        this.pdDoc = proposalDevelopmentDocument;
        return getAttachment();
    }

    /**
     * This method typecasts the given {@link XmlObject} to the required generator type and returns back the document of that
     * generator type.
     * 
     * @param xmlObject which needs to be converted to the document type of the required generator
     * @return {@link XmlObject} document of the required generator type
     * @see org.kuali.kra.s2s.generator.S2SFormGenerator#getFormObject(XmlObject)
     */
    public XmlObject getFormObject(XmlObject xmlObject) {

        AttachmentsDocument attachmentsDocument = AttachmentsDocument.Factory.newInstance();
        Attachments attachments = (Attachments) xmlObject;
        attachmentsDocument.setAttachments(attachments);
        return attachmentsDocument;
    }
}
