package edu.hawaii.infrastructure;

/**
 * This class contains constants.
 */
public final class UhKeyConstants {
    
    public static final String ERROR_DOCUMENT_ABSTRACT_PROJECT_SUMMARY_MISSING = "error.document.abstract.projectSummary.missing";
    //KC-306 - Primary performance site is not set as a default so it must be a required field now.
    public static final String ERROR_PROPOSAL_SITES_PRIMARY_REQUIRED = "error.required.primaryPerformanceSite";
    //KC-515 limit length of Project Summary to 1000 chars or less
    public static final String ERROR_DOCUMENT_ABSTRACT_PROJECT_SUMMARY_TOOLONG = "error.document.abstract.projectSummary.toolong";
    //KC-680 - improve budget finalization
    public static final String CLEAR_AUDIT_ERRORS_BEFORE_FINALIZE = "clear.audit.error.before.finalize";    
    // KC-764 If the modular budget checkbox is checked, the proposal cannot be "submitted to sponsor" for non S2S
    public static final String CLEAR_MODULAR_ERROR_BEFORE_FINALIZE = "clear.modular.error.before.finalize";
    // KC-815 Negotiation should populate with default data
    public static final String ERROR_NEGOTIATION_DESCRIPTION_REQUIRED = "error.negotiation.description.required";
    
    // KC-892  Enforce some negotiation activity type entries to single occurrence per award 
    public static final String ERROR_NEGOTIATION_SINGLE_ACTIVITY_ALLOWED = "error.negotiation.single_activity.allowed"; 
    
    /**
     * private utility class ctor.
     * @throws UnsupportedOperationException if called.
     */
    private UhKeyConstants() {
        throw new UnsupportedOperationException("do not call me");
    }
}
