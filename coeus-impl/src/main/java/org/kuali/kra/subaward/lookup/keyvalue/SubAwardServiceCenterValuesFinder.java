package org.kuali.kra.subaward.lookup.keyvalue;

import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.kuali.rice.core.api.util.ConcreteKeyValue;
import org.kuali.rice.core.api.util.KeyValue;
import org.kuali.rice.coreservice.framework.CoreFrameworkServiceLocator;
import org.kuali.rice.krad.uif.control.UifKeyValuesFinderBase;

// KC-1412 Make Service Center ID a dropdown
public class SubAwardServiceCenterValuesFinder extends UifKeyValuesFinderBase {
    private static List<KeyValue> values;

    static {
        values = initializeList();
    }
    
    private static List<KeyValue> initializeList() {
        Log LOG = LogFactory.getLog(SubAwardServiceCenterValuesFinder.class);
        ArrayList<KeyValue> values = new ArrayList<KeyValue>();
        String param = CoreFrameworkServiceLocator.getParameterService()
            .getParameterValueAsString("KC-GEN", "All", "uh_service_center_ids");

        if (param != null && !param.isEmpty()) {
            ArrayList<String> entries = new ArrayList<String>(Arrays.asList(param.split(",")));
            //Add blank row to select options
            values.add(new ConcreteKeyValue("", ""));
            for (String entry : entries) {
                String[] pair = entry.split(":", -1);
                if (pair.length != 2) {
                    LOG.error("uh_service_center_ids configuration error id:name pair doesn't have 2 seperated elements");
                } else {
                    String id = pair[0];
                    String name = pair[1];
                    values.add(new ConcreteKeyValue(id, id.concat(" (" + name + ")")));
                }
            }
        } else {
            LOG.error("uh_service_center_ids parameters not configured");
        }
        return values;
    }

    public List<KeyValue> getKeyValues() {
        return values;
    }
}
