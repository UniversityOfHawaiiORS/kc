package org.kuali.kra.subaward.bo;

import org.kuali.rice.krad.bo.BusinessObjectBase;

// KC-1412 Make Service Center ID a dropdown
public class SubAwardServiceCenter extends BusinessObjectBase {
    private String code;
    private String description;

    public void refresh() {
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
