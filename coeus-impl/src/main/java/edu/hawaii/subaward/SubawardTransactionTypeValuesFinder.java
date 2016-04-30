package edu.hawaii.subaward;

import org.kuali.rice.core.api.util.ConcreteKeyValue;
import org.kuali.rice.krad.uif.control.UifKeyValuesFinderBase;

import java.util.ArrayList;
import java.util.List;

public class SubawardTransactionTypeValuesFinder extends
		UifKeyValuesFinderBase {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public List getKeyValues() {
		List<ConcreteKeyValue> keyValues = new ArrayList<ConcreteKeyValue>();
		keyValues.add(0, new ConcreteKeyValue("", "select"));
		keyValues.add(1, new ConcreteKeyValue("1", "Initial"));
		keyValues.add(2, new ConcreteKeyValue("2", "Ammendment $"));
		keyValues.add(3, new ConcreteKeyValue("3", "Ammendment"));
		keyValues.add(4, new ConcreteKeyValue("4", "Rebuild"));
		keyValues.add(5, new ConcreteKeyValue("5", "Correction"));
		keyValues.add(6, new ConcreteKeyValue("6", "Other"));

		return keyValues;
	}
}
