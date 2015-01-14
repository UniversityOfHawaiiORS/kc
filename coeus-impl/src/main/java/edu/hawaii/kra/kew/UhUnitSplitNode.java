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
package edu.hawaii.kra.kew;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocument;
import org.kuali.coeus.propdev.impl.person.ProposalPerson;
import org.kuali.coeus.propdev.impl.person.ProposalPersonUnit;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.rice.coreservice.framework.CoreFrameworkServiceLocator;
import org.kuali.rice.kew.engine.RouteContext;
import org.kuali.rice.kew.engine.RouteHelper;
import org.kuali.rice.kew.engine.node.RouteNode;
import org.kuali.rice.kew.engine.node.RouteNodeConfigParam;
import org.kuali.rice.kew.engine.node.SplitNode;
import org.kuali.rice.kew.engine.node.SplitResult;
import org.kuali.rice.krad.document.Document;
import org.kuali.rice.krad.service.DocumentService;

import com.google.common.collect.Lists;

/**
 *  UH Unit Split Node.  Generates a Branch Name based on the unit's hierarchy
 *  configured using param uh_pd_routing_branch_units
 */
public class UhUnitSplitNode implements SplitNode {

    private static org.apache.commons.logging.Log LOG = org.apache.commons.logging.LogFactory.getLog(UhUnitSplitNode.class);

    private UhUnitToBranchDecoder unitToBranch;
    
    // For performance this could be made into a singleton but this would require a way to flush it
    // if the parameter is changed.  So for now I am allowing this to get built every time UhUnitSplit Node is called
    // which should be only once per submit to routing.  
    protected UhUnitToBranchDecoder getUhUnitToBranchDecoder() {
    	if (this.unitToBranch == null) {
    		unitToBranch = new UhUnitToBranchDecoder();
    	}
    	return unitToBranch;
    }
    
    public SplitResult process(RouteContext context, RouteHelper helper ) throws Exception {
        String documentID = context.getDocument().getDocumentId().toString();
        String routeNodeName = context.getNodeInstance().getRouteNode().getRouteNodeName();
             
        if( LOG.isDebugEnabled() )
            LOG.debug(String.format("Entering routeNode:%s for documentId:%s",routeNodeName,documentID ));
        
        // Note: this split node was only written for PD documents.  If used for other documents then the cast
        //       needs to be replaced with logic to determine the correct document type.
        ProposalDevelopmentDocument document = (ProposalDevelopmentDocument) 
            KcServiceLocator.getService(DocumentService.class).getByDocumentHeaderIdSessionless(documentID);
        
        String nodeBranch = context.getNodeInstance().getRouteNode().getBranchName();
        List<String> branches = new ArrayList<String>();
        
        for (ProposalPerson keyPersonnel : document.getDevelopmentProposal().getProposalPersons()) {
        	List <ProposalPersonUnit> units = keyPersonnel.getUnits();
        	for (ProposalPersonUnit unit : units) {	
        		String branch=getUhUnitToBranchDecoder().findUnitBranchName(unit.getUnit().getUnitNumber());
        		//  Check if the node being processed has resolvers for the branch type.
        		//  only include the branch type if it does
        		List<RouteNode> nextNodes=context.getNodeInstance().getRouteNode().getNextNodes();
        		for (RouteNode routeNode : nextNodes)
                {
        			if (branch.equals(routeNode.getBranch().getName())) {
        			    if (!branches.contains(branch)) {
        			        branches.add(branch); 
        			    }
        			}
                }
        	}
        }
        if (branches.isEmpty()) {
        	branches.add("DEFAULT");
        }
        return new SplitResult(branches);
    }
}
