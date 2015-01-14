/*
 * Copyright 2005-2014 The Kuali Foundation
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
package org.kuali.coeus.propdev.impl.hierarchy;


import java.util.Arrays;

public class ProposalHierarchyErrorWarningDto {
    private boolean severe;
    private String errorKey;
    private String[] errorParameters;

    /**
     * Constructs a ProposalHierarchyErrorDto.
     * @param errorKey
     * @param errorParameters
     */
    public ProposalHierarchyErrorWarningDto(String errorKey, boolean severe, String... errorParameters) {
        this.errorKey = errorKey;
        this.errorParameters = errorParameters;
        this.severe = severe;
    }

    /**
     * Gets the errorKey attribute.
     * @return Returns the errorKey.
     */
    public boolean isSevere() {
        return severe;
    }

    /**
     * Sets the errorKey attribute value.
     * @param errorKey The errorKey to set.
     */
    public void setSevere(boolean errorKey) {
        this.severe = severe;
    }

    /**
     * Gets the errorKey attribute. 
     * @return Returns the errorKey.
     */
    public String getErrorKey() {
        return errorKey;
    }

    /**
     * Sets the errorKey attribute value.
     * @param errorKey The errorKey to set.
     */
    public void setErrorKey(String errorKey) {
        this.errorKey = errorKey;
    }

    /**
     * Gets the errorParms attribute. 
     * @return Returns the errorParameters.
     */
    public String[] getErrorParameters() {
        return errorParameters;
    }

    /**
     * Sets the errorParameters attribute value.
     * @param errorParameters The errorParameters to set.
     */
    public void setErrorParameters(String... errorParameters) {
        this.errorParameters = errorParameters;
    }

    @Override
    public String toString() {
        return "ProposalHierarchyErrorWarningDto{" +
                "severe=" + severe +
                ", errorKey='" + errorKey + '\'' +
                ", errorParameters=" + Arrays.toString(errorParameters) +
                '}';
    }
}
