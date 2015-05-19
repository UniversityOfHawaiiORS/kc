set define off
set sqlblanklines on
spool uh_fix_issues_missed_by_kualico.log

-- KC-934 Unable to edit institutional proposal due to 3 unknown errors
alter table proposal
   MODIFY (COST_SHARING_INDICATOR varchar(2),
          IDC_RATE_INDICATOR varchar(2),
          SPECIAL_REVIEW_INDICATOR varchar(2))
;
update proposal set COST_SHARING_INDICATOR = LTRIM(RTRIM(COST_SHARING_INDICATOR));
update proposal set IDC_RATE_INDICATOR = LTRIM(RTRIM(IDC_RATE_INDICATOR));
update proposal set SPECIAL_REVIEW_INDICATOR = LTRIM(RTRIM(SPECIAL_REVIEW_INDICATOR));
alter table proposal
   MODIFY (COST_SHARING_INDICATOR char(1),
          IDC_RATE_INDICATOR char(1),
          SPECIAL_REVIEW_INDICATOR char(1))
;
-- KC-934 END
