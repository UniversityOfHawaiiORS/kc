DELIMITER /
INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0001', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'InstitutionalProposalDocument'), 'F', 'KC-CGB Demo Data - LOC - by award',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0001','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0002', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'InstitutionalProposalDocument'), 'F', 'KC-CGB Demo Data - LOC - by account',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0002','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0003', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'InstitutionalProposalDocument'), 'F', 'KC-CGB Demo Data - LOC - by cc acct',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0003','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0004', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'InstitutionalProposalDocument'), 'F', 'KC-CGB Demo Data - MILE - by acct',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0004','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0005', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'InstitutionalProposalDocument'), 'F', 'KC-CGB Demo Data - PD - by acct',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0005','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0006', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'InstitutionalProposalDocument'), 'F', 'KC-CGB Demo Data - MONTHLY - by award',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0006','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0007', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'InstitutionalProposalDocument'), 'F', 'KC-CGB Demo Data - MONTHLY - by acct',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0007','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0008', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'InstitutionalProposalDocument'), 'F', 'KC-CGB Demo Data - MONTHLY - by cc acct',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0008','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0009', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument'), 'F', 'KC-CGB Demo Data - LOC - by award',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0009','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0010', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument'), 'F', 'KC-CGB Demo Data - LOC - by award',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0010','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0011', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument'), 'F', 'KC-CGB Demo Data - LOC - by award',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0011','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0012', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument'), 'F', 'KC-CGB Demo Data - LOC - by acct',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0012','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0013', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument'), 'F', 'KC-CGB Demo Data - LOC - by acct',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0013','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0014', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument'), 'F', 'KC-CGB Demo Data - LOC - by cc acct',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0014','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0015', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument'), 'F', 'KC-CGB Demo Data - LOC - by cc acct',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0015','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0016', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument'), 'F', 'KC-CGB Demo Data - LOC - by cc acct',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0016','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0017', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument'), 'F', 'KC-CGB Demo Data - LOC - by cc acct',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0017','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0018', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument'), 'F', 'KC-CGB Demo Data - LOC - by cc acct',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0018','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0019', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument'), 'F', 'KC-CGB Demo Data - MILE - by acct',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0019','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0020', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument'), 'F', 'KC-CGB Demo Data - PD - by acct',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0020','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0021', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument'), 'F', 'KC-CGB Demo Data - MONTHLY - by award',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0021','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0022', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument'), 'F', 'KC-CGB Demo Data - MONTHLY - by award',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0022','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0023', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument'), 'F', 'KC-CGB Demo Data - MONTHLY - by award',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0023','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0024', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument'), 'F', 'KC-CGB Demo Data - MONTHLY by acct',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0024','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0025', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument'), 'F', 'KC-CGB Demo Data - MONTHLY by acct',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0025','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0026', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument'), 'F', 'KC-CGB Demo Data - MONTHLY - by cc acct',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0026','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0027', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument'), 'F', 'KC-CGB Demo Data - MONTHLY - by cc acct',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0027','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0028', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument'), 'F', 'KC-CGB Demo Data - MONTHLY - by cc acct',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0028','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0029', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument'), 'F', 'KC-CGB Demo Data - MONTHLY - by cc acct',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0029','')
/

INSERT INTO KREW_DOC_HDR_T (DOC_HDR_ID, DOC_TYP_ID, DOC_HDR_STAT_CD, TTL, 
						INITR_PRNCPL_ID, RTE_PRNCPL_ID, DOC_VER_NBR, RTE_LVL, 
						CRTE_DT, RTE_STAT_MDFN_DT, APRV_DT, FNL_DT, STAT_MDFN_DT, 
						OBJ_ID, VER_NBR) 
VALUES ('KCCGB0030', (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument'), 'F', 'KC-CGB Demo Data - MONTHLY - by cc acct',
		(SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'quickstart'), 1, 4,
		NOW(), NOW(), NOW(), NOW(), NOW(),
		UUID(), 1)
/

INSERT INTO KREW_DOC_HDR_CNTNT_T (DOC_HDR_ID,DOC_CNTNT_TXT)
    VALUES ('KCCGB0030','')
/

 
DELIMITER ;
