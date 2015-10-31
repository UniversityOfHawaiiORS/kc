CREATE OR REPLACE package uh_krim_delta_pkg AUTHID CURRENT_USER is


procedure processDeltas;

--procedure processDelta(stagingRecordId in varchar2);

procedure updateStagingStatusAndMessage(stagingRecordId in varchar2, processStatus in varchar2, processMessage in varchar2);

procedure addPersonOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2);

procedure retrofitPersonOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2);

procedure retrofitUsernameOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2);

procedure modifyPersonUhuuidOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2);

procedure retrofitContactInfoOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2);

procedure retrofitEmailOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2);

--procedure updateEntities(oldEntityId in varchar2, newEntityId in varchar2);

--procedure updateEntities(oldEntityId in varchar2, newEntityId in varchar2, newUserName in varchar2);

procedure completelyRemoveEntity(entityId in varchar2);

procedure modifyPersonFullNameOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2);

procedure deletePersonOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2);

procedure addAffiliationOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2);

procedure processEmploymentInfo(entityId in varchar2, affiliationId in varchar2, psEmplRecId in varchar2,
	psEmplStatusCode in varchar2, psEmplTypeCode in varchar2, psCampusKey in varchar2, psPositionNo in varchar2,
	psUhUnitCode in varchar2, dataOrigin in varchar2, ldapRole in varchar2);

procedure deleteAffiliationOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2);

procedure modifyAffiliationOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2);

procedure addUsernameOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2);

procedure processPrincipal(entityId in varchar2, principalName in varchar2, stagingRecordId in varchar2);

procedure modifyUsernameUhUuidOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2);

procedure modifyUsernameUidOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2);

procedure modifyUsernameAccessOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2);

procedure deleteUsernameOperation(xmlMessage in XMLTYPE,  stagingRecordId in varchar2);

procedure addEmailOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2);

procedure processEmailAddress(entityId in varchar2, emailAddress in varchar2, operation in varchar2);

procedure deleteEmailOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2);

procedure modifyContactInfoOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2);

procedure processPhone(entityId in varchar2, remainingContactInfo in XMLTYPE);

procedure insertPhone(entityId in varchar2, entityPhone in varchar2, phoneType in varchar2, defaultInd in varchar2);

--procedure insertCachedEntity(entityId in varchar2);

procedure testLoop(stagingRecordId in varchar2);

procedure copyEntity(oldEntityid in varchar2, newEntityId in varchar2);

function does_principal_exist (entityId in varchar2, principalName in varchar2)
        return boolean;
        
function does_principal_exist (entityId in varchar2)
return boolean;

function retrieveEntityIdByPrincpalName (principalName in varchar2)
		return varchar2;

function does_entity_exist (entityId in varchar2)
        return boolean;

function does_entity_ent_typ_exist(entityId in varchar2, entTypCd in varchar2)
        return boolean;
        
function does_entity_nm_exist(entityId in varchar2)
        return boolean;
        
function does_entity_email_exist(entityId in varchar2)
        return boolean;
        
function does_entity_address_exist(entityId in varchar2)
        return boolean;

function does_entity_phone_exist(entityId in varchar2)
        return boolean;
        
function does_entity_afltn_exist(entityId in varchar2)
        return boolean;

function does_entity_empinfo_exist(entityId in varchar2)
        return boolean;
/* function does_cached_entity_exist (entityId in varchar2)
        return boolean; */

function convertLdapOrg(org in varchar2)
		return varchar2;

function convertLdapRole(ldapRole in varchar2)
		return varchar2;

function convertPSEmplType(employeeType in varchar2)
		return varchar2;

function convertPSEmplStatus(employeeStatus in varchar2)
		return varchar2;

function retrieveAffiliationId (entityId in varchar2, campus in varchar2, affiliation in varchar2)
		return varchar2;

function retrieveAffIdFromEmpRecord (entityId in varchar2, employeeRecordNo in varchar2)
		return varchar2;

function doesEmplRecIdExist (entityId in varchar2, employeeRecordId in varchar2)
		return boolean;

function doesAffiliationHaveEmplRecs (entityId in varchar2, affiliationId in varchar2)
		return boolean;

function retrieveEmailId (entityId in varchar2, emailAddress in varchar2)
		return varchar2;

function retrievePrimaryEmplAffId (entityId in varchar2)
		return varchar2;

function retrive_kim_primary_dept_code (entityId in varchar2)
	return varchar2;

function doesAffiliationHaveStdEmplRecs (entityId in varchar2, affiliationId in varchar2) return boolean;

function doesDfltOtherEmailRecExist (entityId in varchar2) return boolean;

function getDfltEmailRecForMerge(oldEntityId in varchar2, newEntityId in varchar2)
          return varchar2;
          
function getDfltNameRecForMerge(oldEntityId in varchar2, newEntityId in varchar2)
      return varchar2;
      
function getDfltAddrRecForMerge(oldEntityId in varchar2, newEntityId in varchar2)
      return varchar2;
      
function getDfltPhoneRecForMerge(oldEntityId in varchar2, newEntityId in varchar2)
      return varchar2;

function getDfltAfltnRecForMerge(oldEntityId in varchar2, newEntityId in varchar2)
      return varchar2;
      
function getPrimEmpRecForMerge(oldEntityId in varchar2, newEntityId in varchar2)
      return varchar2;

function getDuplicateNameRec(entityId in varchar2)
      return varchar2;
end;
/


CREATE OR REPLACE package body uh_krim_delta_pkg is



--------------------------
-- Main method
--------------------------

	procedure processDeltas is

		xmlMessage		XMLTYPE;
		entityId        krim_entity_t.entity_id%TYPE;
		oldEntityId     krim_entity_t.entity_id%TYPE;
		activeInd       varchar2(1);
        defaultInd      varchar2(1);
    	v_pending_count   	number;
    	v_processed_count   number;
    	rootElementName	varchar2(40);

        runDate         timestamp;
        operation_addPerson						varchar2(40) := 'addPerson';
        operation_modifyPersonUhUuid			varchar2(40) := 'modifyPersonUhUuid';
        operation_modifyPersonFullName			varchar2(40) := 'modifyPersonFullName';
        --operation_modifyPersonSsn				varchar2(40) := 'modifyPersonSsn';
        --operation_modifyPersonDob				varchar2(40) := 'modifyPersonDob';
		operation_deletePerson					varchar2(40) := 'deletePerson';
		operation_addAffiliation				varchar2(40) := 'addAffiliation';
		operation_deleteAffiliation				varchar2(40) := 'deleteAffiliation';
		operation_modifyAffiliation				varchar2(40) := 'modifyAffiliation';
		operation_addUsername					varchar2(40) := 'addUsername';
		operation_modifyUsernameUid				varchar2(40) := 'modifyUsernameUid';
		operation_modifyUsernameUhUuid			varchar2(40) := 'modifyUsernameUhUuid';
		operation_modifyUsernameAccess			varchar2(40) := 'modifyUsernameAccess';
		operation_deleteUsername				varchar2(40) := 'deleteUsername';
		operation_addEmail						varchar2(40) := 'addEmail';
		operation_deleteEmail					varchar2(40) := 'deleteEmail';
		operation_addContactInfo				varchar2(40) := 'addContactInfo';
		operation_modifyContactInfo				varchar2(40) := 'modifyContactInfo';
		operation_deleteContactInfo				varchar2(40) := 'deleteContactInfo';

		-- retrofit operations
		operation_retrofitPerson				varchar2(40) := 'retrofitPerson';
		operation_retrofitUsername				varchar2(40) := 'retrofitUsername';
		operation_retrofitEmail					varchar2(40) := 'retrofitEmail';
		operation_retrofitContactInfo			varchar2(40) := 'retrofitContactInfo';

		v_errm  varchar2(4000);

		begin
			v_pending_count := 0;
			v_processed_count := 0;

			dbms_output.enable(buffer_size => NULL);

			select systimestamp into runDate from dual;
			dbms_output.put_line('KIM delta processing started at '||runDate);

			select count(*) into v_pending_count from uh_message_queue_t where process_status is null;
			dbms_output.put_line(v_pending_count || ' messages will be processed');

			FOR i IN (select * from uh_message_queue_t where process_status is null order by to_number(id)) LOOP
				begin
					xmlMessage := i.xml;
					select xmlMessage.getRootElement() into rootElementName from dual;
					dbms_output.put_line('Root element of this message is ' || rootElementName);

					select extractValue(xmlMessage, '/'||rootElementName||'/messageData/uhUuid') into entityId from dual;
					dbms_output.put_line('EntityId of this message is ' || entityId);

					-- determine what operation to perform
					if rootElementName = operation_addPerson then
            dbms_output.put_line('addPersonOperation found');
						addPersonOperation(xmlMessage, i.id);

					elsif rootElementName = operation_modifyPersonUhUuid then
            dbms_output.put_line('modifyPersonUhuuidOperation found');
						modifyPersonUhuuidOperation(xmlMessage, i.id);

					elsif rootElementName = operation_modifyPersonFullName then
           dbms_output.put_line('modifyPersonFullNameOperation found');
           modifyPersonFullNameOperation(xmlMessage, i.id);

					elsif rootElementName = operation_deletePerson then
           dbms_output.put_line('deletePersonOperation found');
						deletePersonOperation(xmlMessage, i.id);

					elsif rootElementName = operation_addAffiliation then
          dbms_output.put_line('addAffiliationOperation found');
						addAffiliationOperation(xmlMessage, i.id);

					elsif rootElementName = operation_deleteAffiliation then
						deleteAffiliationOperation(xmlMessage, i.id);
						--updateStagingStatusAndMessage(i.id, 'P', 'Ignoring operation '||rootElementName);

					elsif rootElementName = operation_modifyAffiliation then
          dbms_output.put_line('modifyAffiliationOperation found');
						modifyAffiliationOperation(xmlMessage, i.id);

					elsif rootElementName = operation_addUsername then
          dbms_output.put_line('addUsernameOperation found');
          addUsernameOperation(xmlMessage, i.id);

					elsif rootElementName = operation_modifyUsernameUid then
           dbms_output.put_line('modifyUsernameUidOperation found');
						modifyUsernameUidOperation(xmlMessage, i.id);

					elsif rootElementName = operation_modifyUsernameUhUuid then
          dbms_output.put_line('modifyUsernameUhUuidOperation found');
						modifyUsernameUhUuidOperation(xmlMessage, i.id);

					elsif rootElementName = operation_modifyUsernameAccess then
          dbms_output.put_line('modifyUsernameAccessOperation found');
						modifyUsernameAccessOperation(xmlMessage, i.id);

					elsif rootElementName = operation_deleteUsername then
           dbms_output.put_line('deleteUsernameOperation found');
						deleteUsernameOperation(xmlMessage, i.id);

					elsif rootElementName = operation_addEmail then
           dbms_output.put_line('addEmailOperation found');
          addEmailOperation(xmlMessage, i.id);

					elsif rootElementName = operation_deleteEmail then
          dbms_output.put_line('deleteEmailOperation found');
						deleteEmailOperation(xmlMessage, i.id);

					elsif rootElementName = operation_addContactInfo then
           dbms_output.put_line('addContactInfoOperation found');
						modifyContactInfoOperation(xmlMessage, i.id);

					elsif rootElementName = operation_modifyContactInfo then
          dbms_output.put_line('modifyContactInfoOperation found');
						modifyContactInfoOperation(xmlMessage, i.id);

					elsif rootElementName = operation_deleteContactInfo then
           dbms_output.put_line('deleteContactInfoOperation found');
						modifyContactInfoOperation(xmlMessage, i.id);

					--retrofit operations
					elsif rootElementName = operation_retrofitPerson then
          dbms_output.put_line('retrofitPersonOperation found');
						retrofitPersonOperation(xmlMessage, i.id);

					elsif rootElementName = operation_retrofitUsername then
          dbms_output.put_line('retrofitUsernameOperation found');
						retrofitUsernameOperation(xmlMessage, i.id);

					elsif rootElementName = operation_retrofitEmail then
          dbms_output.put_line('retrofitEmailOperation found');
						retrofitEmailOperation(xmlMessage, i.id);

					elsif rootElementName = operation_retrofitContactInfo then
          dbms_output.put_line('retrofitContactInfoOperation found');
						retrofitContactInfoOperation(xmlMessage, i.id);

					else
						--dbms_output.put_line('ignoring the ' || rootElementName || ' operation');
						updateStagingStatusAndMessage(i.id, 'P', 'Ignoring operation '||rootElementName);
					end if;
					commit;
				exception
					when others then
					rollback;
		            v_errm := substr(SQLERRM, 1, 4000);
			        updateStagingStatusAndMessage(i.id, 'E', v_errm);
			        continue;
				end;
			end loop;
		end;

	procedure updateStagingStatusAndMessage(stagingRecordId in varchar2, processStatus in varchar2, processMessage in varchar2) is
		begin
			update uh_message_queue_t set process_status=processStatus, process_msg=processMessage, processed_date=sysdate() where id=stagingRecordId;
			commit;
		end;

  --rbl reviewed
	procedure addPersonOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2) is
		entityId		krim_entity_t.entity_id%TYPE;
		firstName		varchar2(100);
		lastName		varchar2(100);
		middleName		varchar2(100);

		begin
			select extractValue(xmlMessage, '//messageData/uhUuid') into entityId from dual;

			if does_entity_exist(entityId) then
        --make sure they also have a record in krim_entity_ent_typ_t otherwise you will get fk constraint error when adding email for this user
        if not does_entity_ent_typ_exist(entityId,'PERSON') then
            insert into krim_entity_ent_typ_t (ent_typ_cd, entity_id, obj_id) values ('PERSON', entityId, sys_guid());
        end if;
        -- also make sure they have a record in krim_entity_nm_t otherwise add one e.g. terminated employees that are being reactivated
        if not does_entity_nm_exist(entityId) then
        -- get entity name
	            select extractValue(xmlMessage, '//messageData/firstName') into firstName from dual;
	            select extractValue(xmlMessage, '//messageData/lastName') into lastName from dual;
	            select extractValue(xmlMessage, '//messageData/middleName') into middleName from dual;

	            if length(firstName) > 40 then
	              firstName := substr(firstName,1,40);
	            end if;

	            if length(lastName) > 80 then
	              lastName := substr(lastName,1,80);
	            end if;

	            if length(middleName) > 40 then
	              middleName := substr(middleName,1,40);
          	    end if;

				-- insert entity name record
				-- perform some length checks because Hawaiian names can be really long
				insert into krim_entity_nm_t (entity_nm_id, entity_id, nm_typ_cd, first_nm, last_nm, middle_nm, dflt_ind, obj_id) values
      				(krim_entity_nm_id_s.NEXTVAL, entityId, 'PRFR', firstName, lastName, middleName, 'Y', sys_guid());

        end if;
			    -- update status/message for auditing purposes
				updateStagingStatusAndMessage(stagingRecordId, 'P', 'Entity already exists');
			else
			    -- get entity name
	            select extractValue(xmlMessage, '//messageData/firstName') into firstName from dual;
	            select extractValue(xmlMessage, '//messageData/lastName') into lastName from dual;
	            select extractValue(xmlMessage, '//messageData/middleName') into middleName from dual;

	            if length(firstName) > 40 then
	              firstName := substr(firstName,1,40);
	            end if;

	            if length(lastName) > 80 then
	              lastName := substr(lastName,1,80);
	            end if;

	            if length(middleName) > 40 then
	              middleName := substr(middleName,1,40);
          	    end if;

			    -- insert entity record
				insert into krim_entity_t (entity_id, obj_id) values (entityId, sys_guid());

				-- insert entity type record
				insert into krim_entity_ent_typ_t (ent_typ_cd, entity_id, obj_id) values ('PERSON', entityId, sys_guid());

				-- insert entity name record
				-- perform some length checks because Hawaiian names can be really long
				insert into krim_entity_nm_t (entity_nm_id, entity_id, nm_typ_cd, first_nm, last_nm, middle_nm, dflt_ind, obj_id) values
      				(krim_entity_nm_id_s.NEXTVAL, entityId, 'PRFR', firstName, lastName, middleName, 'Y', sys_guid());

      			-- update status/message for auditing purposes
				updateStagingStatusAndMessage(stagingRecordId, 'P', 'Entity created');
			end if;
			commit;
		end;

	--rbl reviewed
	procedure retrofitPersonOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2) is
		entityId		krim_entity_t.entity_id%TYPE;
		retrofitActions	XMLTYPE;
		addPersonXml	XMLTYPE;
		c_addPerson		number(2) := 1;

		begin

			select extract(xmlMessage, '//messageData/actions') into retrofitActions from dual;

			while retrofitActions.existsNode('//addPerson['||c_addPerson||']') = 1 loop
			  --dbms_output.put_line('uhuuid = '||retrofitActions.extract('//addPerson[' || c_addPerson || ']/messageData/uhUuid/text()').getStringVal());
              --dbms_output.put_line('firstName = '||retrofitActions.extract('//addPerson[' || c_addPerson || ']/messageData/firstName/text()').getStringVal());
              --dbms_output.put_line('lastName = '||retrofitActions.extract('//addPerson[' || c_addPerson || ']/messageData/lastName/text()').getStringVal());
              entityId := retrofitActions.extract('//addPerson[' || c_addPerson || ']/messageData/uhUuid/text()').getStringVal();
              dbms_output.put_line('uhuuid = '||entityId);

              select extract(retrofitActions, '//addPerson['||c_addPerson||']') into addPersonXml from dual;
              addPersonOperation(addPersonXml, stagingRecordId);
              c_addPerson := c_addPerson + 1;
            END LOOP;

		end;

  -- rbl modified 3/6/13
	procedure modifyPersonUhuuidOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2) is
		newEntityId		krim_entity_t.entity_id%TYPE;
		oldEntityId		krim_entity_t.entity_id%TYPE;
    mostRecentDfltEmailId krim_entity_email_t.entity_email_id%TYPE;
    mostRecentDfltNameId krim_entity_nm_t.entity_nm_id%TYPE;
    mostRecentDfltAddrId krim_entity_addr_t.entity_addr_id%TYPE;
    mostRecentDfltPhoneId krim_entity_phone_t.entity_phone_id%TYPE;
    mostRecentDfltAfltnId krim_entity_afltn_t.entity_afltn_id%TYPE;
    mostRecentPrimEmpId krim_entity_emp_info_t.entity_emp_id%TYPE;
    dupNameRecId krim_entity_nm_t.entity_nm_id%TYPE;
    v_myerrrm  varchar2(4000);

		begin
			select extractValue(xmlMessage, '//messageDataBefore/uhUuid') into oldEntityId from dual;
			select extractValue(xmlMessage, '//messageData/uhUuid') into newEntityId from dual;


      SAVEPOINT sp_uhuuid_change;
			if does_entity_exist(oldEntityId) then
      
   
            if not does_entity_exist(newEntityId) then 
            -- then insert a new record otherwise you will get fk constraint errors on krim_entity_t.entity_id
              insert into krim_entity_t (entity_id, actv_ind, obj_id) values (newEntityId, 'Y', sys_guid());          
            end if;
            
          
            if not does_principal_exist(newEntityId) then 
               update krim_prncpl_t set prncpl_id = newEntityId, entity_id = newEntityId where prncpl_id = oldEntityId;
            end if;
            
           
            if not does_entity_ent_typ_exist(newEntityId, 'PERSON') then
             -- then insert a new record otherwise you will get fk constraint errors on krim_entity_ent_typ_t.entity_id
                insert into krim_entity_ent_typ_t (ent_typ_cd, actv_ind, entity_id, obj_id) values ('PERSON', 'Y', newEntityId, sys_guid());
            end if;
            
             --email
            if not does_entity_email_exist(newEntityId) then
              update krim_entity_email_t set entity_id = newEntityId where entity_id = oldEntityId;
            else
               --get the default entity_email_id before merging
               mostRecentDfltEmailId := getDfltEmailRecForMerge(oldEntityId, newEntityId);
              -- merge 
              update krim_entity_email_t set entity_id = newEntityId, dflt_ind='N' where entity_id = oldEntityId;
              update krim_entity_email_t set dflt_ind='N' where entity_id = newEntityId;
              --reset the default entity_email rec to default
               if mostRecentDfltEmailId is not null then
                update krim_entity_email_t set dflt_ind='Y' where entity_email_id = mostRecentDfltEmailId;
               end if;
            end if;
            
            --name
            if not does_entity_nm_exist(newEntityId) then
              update krim_entity_nm_t set entity_id = newEntityId where entity_id = oldEntityId;
              
            else
               --get the default entity_nm_id before merging
               mostRecentDfltNameId := getDfltNameRecForMerge(oldEntityId, newEntityId);
              -- merge 
              update krim_entity_nm_t set entity_id = newEntityId, dflt_ind='N' where entity_id = oldEntityId;
              update krim_entity_nm_t set dflt_ind='N' where entity_id = newEntityId;
              --reset the default name rec to default
               if mostRecentDfltNameId is not null then
                update krim_entity_nm_t set dflt_ind='Y' where entity_nm_id = mostRecentDfltNameId;
               end if;
            end if;
            
            --deactivate any active NON-DEFAULT duplicated name reccords
            dupNameRecId := getDuplicateNameRec(newEntityId);
            
            WHILE dupNameRecId is not null
            LOOP
                  update krim_entity_nm_t set actv_ind = 'N' where entity_nm_id = dupNameRecId;
                  dupNameRecId := getDuplicateNameRec(newEntityId);
            END LOOP;
            
            
            -- address
            if not does_entity_address_exist(newEntityId) then
            
             update krim_entity_addr_t set entity_id = newEntityId where entity_id = oldEntityId;
            else
              --get the default entity_addr_id before merging
               mostRecentDfltAddrId := getDfltAddrRecForMerge(oldEntityId, newEntityId);
              -- merge 
              update krim_entity_addr_t set entity_id = newEntityId, dflt_ind='N' where entity_id = oldEntityId;
              update krim_entity_addr_t set dflt_ind='N' where entity_id = newEntityId;
              --reset the default address rec to default
               if mostRecentDfltAddrId is not null then
                update krim_entity_addr_t set dflt_ind='Y' where entity_addr_id = mostRecentDfltAddrId;
               end if;
            end if;
            
            --phone
            if not does_entity_phone_exist(newEntityId) then
              update krim_entity_phone_t set entity_id = newEntityId where entity_id = oldEntityId;

            else
              --get the default entity_phone_id before merging
               mostRecentDfltPhoneId := getDfltPhoneRecForMerge(oldEntityId, newEntityId);
              -- merge 
              update krim_entity_phone_t set entity_id = newEntityId, dflt_ind='N' where entity_id = oldEntityId;
              update krim_entity_phone_t set dflt_ind='N' where entity_id = newEntityId;
              --reset the default phone rec to default
               if mostRecentDfltPhoneId is not null then
                update krim_entity_phone_t set dflt_ind='Y' where entity_phone_id = mostRecentDfltPhoneId;
               end if;
            end if;

            -- affiliation info
            if not does_entity_afltn_exist(newEntityId) then
              update krim_entity_afltn_t set entity_id = newEntityId where entity_id = oldEntityId;
            else
              --get the most recent default entity_afltn_id before merging
               mostRecentDfltAfltnId := getDfltAfltnRecForMerge(oldEntityId, newEntityId);
              -- merge 
              update krim_entity_afltn_t set entity_id = newEntityId, dflt_ind='N' where entity_id = oldEntityId;
              update krim_entity_afltn_t set dflt_ind='N' where entity_id = newEntityId;
              --reset the default afltn rec to default
               if mostRecentDfltAfltnId is not null then
                update krim_entity_afltn_t set dflt_ind='Y' where entity_afltn_id = mostRecentDfltAfltnId;
               end if;
            end if;
            
            
            --employee info
            if not does_entity_empinfo_exist(newEntityId) then
              update krim_entity_emp_info_t set entity_id = newEntityId where entity_id = oldEntityId;
            else
               --get the most recent primary entity_emp_id before merging
                mostRecentPrimEmpId := getPrimEmpRecForMerge(oldEntityId, newEntityId);
              -- merge 
              update krim_entity_emp_info_t set entity_id = newEntityId, prmry_ind='N' where entity_id = oldEntityId;
              update krim_entity_emp_info_t set prmry_ind='N' where entity_id = newEntityId;
              --reset the primary emp rec to primary
               if mostRecentPrimEmpId is not null then
                update krim_entity_emp_info_t set prmry_ind='Y' where entity_emp_id = mostRecentPrimEmpId;
               end if;
            end if;

             -- update remaining krim entity tables and role/grp/dlgn membership tables
            update krim_entity_bio_t set entity_id = newEntityId where entity_id = oldEntityId;
            update krim_entity_ctznshp_t set entity_id = newEntityId where entity_id = oldEntityId;
            update krim_entity_ethnic_t set entity_id = newEntityId where entity_id = oldEntityId;
            update krim_entity_ext_id_t set entity_id = newEntityId where entity_id = oldEntityId;
            update krim_entity_priv_pref_t set entity_id = newEntityId where entity_id = oldEntityId;
            update krim_entity_residency_t set entity_id = newEntityId where entity_id = oldEntityId;
            update krim_entity_visa_t set entity_id = newEntityId where entity_id = oldEntityId;
            update krim_role_mbr_t set mbr_id = newEntityId where mbr_id = oldEntityId;
            update krim_grp_mbr_t set mbr_id = newEntityId where mbr_id = oldEntityId;
            update krim_dlgn_mbr_t set mbr_id = newEntityId where mbr_id = oldEntityId;
         
          --lets update any existing documents for the old id to the new id
          --award person who are not non-employees
            update award_persons set person_id = newEntityId  where rolodex_id is null and person_id = oldEntityId;
            update award_approved_foreign_travel set person_id = newEntityId where rolodex_id is null and person_id = oldEntityId;
            update award_unit_contacts set person_id = newEntityId where person_id = oldEntityId;
            
            -- uh award ext
            update uh_award_ext_t set assigned_to_person_id = newEntityId where assigned_to_person_id = oldEntityId;
            
            -- institutional proposal person who are not non-employees
            update proposal_persons set person_id = newEntityId where rolodex_id is null and person_id = oldEntityId;
            
            -- proposal development  institutional proposal person who are not non-employees
            update eps_prop_person set person_id = newEntityId where rolodex_id is null and person_id = oldEntityId;
            update eps_prop_person_bio set person_id = newEntityId where rolodex_id is null and person_id = oldEntityId;
            -- KC-1105 UHIMS package is failing in KC60 database
            -- update eps_prop_person_ext set person_id = newEntityId where person_id = oldEntityId;
            
            -- budget persons who are not non-employees nor TBAs
            update budget_persons set person_id = newEntityId where rolodex_id is null and person_id is not null and person_id = oldEntityId;
            update budget_per_det_rate_and_base set person_id = newEntityId where person_id = oldEntityId;
            update budget_personnel_details set person_id = newEntityId where person_id = oldEntityId;
             
            -- documents in workflow
            update krew_doc_hdr_t set initr_prncpl_id = newEntityId, rte_prncpl_id = newEntityId where initr_prncpl_id = oldEntityId and rte_prncpl_id = oldEntityId;

            update krew_doc_hdr_t set rte_prncpl_id = newEntityId where rte_prncpl_id != initr_prncpl_id and rte_prncpl_id = oldEntityId;
   
            update krew_doc_hdr_t set initr_prncpl_id = newEntityId  where rte_prncpl_id != initr_prncpl_id and initr_prncpl_id = oldEntityId;

            update krew_doc_hdr_t set rte_prncpl_id = newEntityId where rte_prncpl_id = oldEntityId and initr_prncpl_id is null;
 
            update krew_doc_hdr_t set initr_prncpl_id = newEntityId where initr_prncpl_id = oldEntityId and rte_prncpl_id is null;

            -- routing action requests (pending)
            update krew_actn_rqst_t set prncpl_id = newEntityId where prncpl_id is not null and prncpl_id != '10000000001' and prncpl_id = oldEntityId;
            
            -- routing action item (current)
            update krew_actn_itm_t set prncpl_id = newEntityId where prncpl_id is not null and prncpl_id = oldEntityId;  
            
            -- routing action taken (taken)
            update krew_actn_tkn_t set prncpl_id = newEntityId where prncpl_id is not null and prncpl_id = oldEntityId;
  
            -- proposal logs
            update proposal_log set pi_id = newEntityId where pi_id = oldEntityId;
            
            --comm
            update comm_memberships set person_id = newEntityId where rolodex_id is null and person_id = oldEntityId;
            update comm_schedule_attendance set person_id = newEntityId where person_id = oldEntityId;
            
            --person
            update person_degree set person_id = newEntityId where person_id = oldEntityId;
            update person_appointment set person_id = newEntityId where person_id = oldEntityId;
            update person_ext_t set person_id = newEntityId where person_id = oldEntityId;
            update person_training set person_id = newEntityId where person_id = oldEntityId;
            
          
            --proposal role template
            update prop_role_template set person_id = newEntityId where person_id = oldEntityId;
            
            --proposal unit
            update proposal_unit_credit_split set person_id = newEntityId where person_id = oldEntityId;
            update proposal_unit_contacts set person_id = newEntityId where person_id = oldEntityId;
            update proposal_units set person_id = newEntityId where person_id = oldEntityId;
            
            --protocol
            update protocol_attachment_personnel set person_id = newEntityId where person_id = oldEntityId;
            update protocol_vote_recused set person_id = newEntityId where rolodex_id is null and person_id = oldEntityId;
            update protocol_vote_abstainees set person_id = newEntityId where rolodex_id is null and person_id = oldEntityId;
            update protocol_units set person_id = newEntityId where person_id = oldEntityId;
            update protocol_reviewers set person_id = newEntityId where rolodex_id is null and person_id = oldEntityId;
            update protocol_persons set person_id = newEntityId where rolodex_id is null and person_id = oldEntityId;
            
            --unit admin
            update unit_administrator set person_id = newEntityId where person_id = oldEntityId;
            
            -- attachment reviewer
            update reviewer_attachments set person_id = newEntityId where person_id = oldEntityId;
        
            
            --delete the old entity record from krim_entity_t
            --this will cacade to other krim_entity_tables that have fk delete cascade (krim_prncpl_t, krim_entity_ent_typ_t,etc.)
            delete from krim_entity_t where entity_id = oldEntityId;
            
            -- keep track of uhuuid change history
            insert into uh_uhuuid_change (old_entity_id, new_entity_id, processed_date) values (oldEntityID, newEntityId, sysdate);
            updateStagingStatusAndMessage(stagingRecordId, 'P', 'Successfully changed UhUuid from: ' || oldEntityId || ' to ' || newEntityId);
      
			else
				-- update status/message for auditing purposes
				updateStagingStatusAndMessage(stagingRecordId, 'W', 'Unable to change UhUuid because Old entity ' || oldEntityId || ' does not exist');
			end if;
    
     EXCEPTION
         WHEN OTHERS THEN  -- handles all other errors
      ROLLBACK TO sp_uhuuid_change;
      v_myerrrm  := substr(SQLERRM, 1, 4000);
      updateStagingStatusAndMessage(stagingRecordId, 'E', v_myerrrm);
		end;

	procedure copyEntity(oldEntityid in varchar2, newEntityId in varchar2) is
		firstName		varchar2(100);
		lastName		varchar2(100);
		middleName		varchar2(100);

		begin
			FOR i IN (select first_nm, last_nm, middle_nm from krim_entity_nm_t where entity_id=oldEntityId and dflt_ind='Y') LOOP
				firstName := i.first_nm;
				lastName := i.last_nm;
				middleName := i.middle_nm;
				EXIT;
			end loop;

			-- insert entity record
			insert into krim_entity_t (entity_id) values (newEntityId);

			-- insert entity type recrod
			insert into krim_entity_ent_typ_t (ent_typ_cd, entity_id) values ('PERSON', newEntityId);

			-- insert entity name record
			insert into krim_entity_nm_t (entity_nm_id, entity_id, nm_typ_cd, first_nm, last_nm, middle_nm, dflt_ind) values
  				(krim_entity_nm_id_s.NEXTVAL, newEntityId, 'PRFR', firstName, lastName, middleName, 'Y');
			commit;
		end;

	procedure completelyRemoveEntity(entityId in varchar2) is
  	begin
	  	delete from krim_entity_addr_t where entity_id=entityId;
		delete from krim_entity_emp_info_t where entity_id=entityId;
		delete from krim_entity_afltn_t where entity_id=entityId;
		delete from krim_entity_bio_t where entity_id=entityId;
		--delete from krim_entity_cache_t where entity_id=entityId;
		delete from krim_entity_ctznshp_t where entity_id=entityId;
		delete from krim_entity_email_t where entity_id=entityId;
		delete from krim_entity_ent_typ_t where entity_id=entityId;
		delete from krim_entity_ethnic_t where entity_id=entityId;
		delete from krim_entity_ext_id_t where entity_id=entityId;
		delete from krim_entity_nm_t where entity_id=entityId;
		delete from krim_entity_phone_t where entity_id=entityId;
		delete from krim_entity_priv_pref_t where entity_id=entityId;
		delete from krim_entity_residency_t where entity_id=entityId;
		delete from krim_entity_visa_t where entity_id=entityId;
		delete from krim_grp_mbr_t where mbr_id in (select prncpl_id from krim_prncpl_t where entity_id=entityId);
		delete from krim_role_mbr_t where mbr_id in (select prncpl_id from krim_prncpl_t where entity_id=entityId);
		delete from krim_prncpl_t where entity_id=entityId;
		delete from krim_entity_t where entity_id=entityId;
	end;

	--rbl reviewed
	procedure modifyPersonFullNameOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2) is
		entityId		krim_entity_t.entity_id%TYPE;
		firstName		krim_entity_nm_t.first_nm%TYPE;
		lastName		krim_entity_nm_t.last_nm%TYPE;
		middleName		krim_entity_nm_t.middle_nm%TYPE;

		begin
			select extractValue(xmlMessage, '//messageData/uhUuid') into entityId from dual;

			if does_entity_exist(entityId) then
				-- get entity name
			    select extractValue(xmlMessage, '//messageData/firstName') into firstName from dual;
			    select extractValue(xmlMessage, '//messageData/lastName') into lastName from dual;
			    select extractValue(xmlMessage, '//messageData/middleName') into middleName from dual;

			    -- update name for all active name records but don't overwrite any records inputed by orshelpline/user(nm_typ_cd=OTH)
			    update krim_entity_nm_t set first_nm=firstName, last_nm=lastName, middle_nm=middleName, last_updt_dt=SYSDATE
			    where entity_id = entityId and actv_ind='Y' and nm_typ_cd = 'PRFR';

			    -- update status/message for auditing purposes
				updateStagingStatusAndMessage(stagingRecordId, 'P', 'Name updated on active name records');
			else
      			-- update status/message for auditing purposes
				updateStagingStatusAndMessage(stagingRecordId, 'W', 'Entity does not exist');
			end if;
			commit;
		end;

  -- rbl modified - deactivate the user
	procedure deletePersonOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2) is
		entityId		krim_entity_t.entity_id%TYPE;

		begin
			select extractValue(xmlMessage, '//messageData/uhUuid') into entityId from dual;

			if does_entity_exist(entityId) then
          --updateStagingStatusAndMessage(stagingRecordId, 'A', 'Admin Action Required delete Person with entityID: ' || entityId);
          --rbl 2/27/2013  deactivate the user 
          update krim_prncpl_t set actv_ind = 'N', last_updt_dt = sysdate where prncpl_id = entityId;
          update krim_role_mbr_t set actv_to_dt = sysdate, last_updt_dt = sysdate where mbr_id = entityId;
          update krim_grp_mbr_t set actv_to_dt = sysdate, last_updt_dt = sysdate where mbr_id = entityId;
          
			    -- update status/message for auditing purposes
          updateStagingStatusAndMessage(stagingRecordId, 'P', 'User ' || entityId || ' successfully deactivated');
			else
      			-- update status/message for auditing purposes
				updateStagingStatusAndMessage(stagingRecordId, 'W', 'Entity does not exist');
			end if;
			commit;
		end;

	--rbl reviewed
	procedure addAffiliationOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2) is
		entityId		krim_entity_t.entity_id%TYPE;
		affiliation		krim_afltn_typ_t.afltn_typ_cd%TYPE;
		org				krlc_cmp_t.campus_cd%TYPE;
		ldapOrg			varchar2(15);
		ldapRole		varchar2(40);
		psCampusKey		varchar2(5);
		psEmplRecId		varchar2(2);
		psEmplStatusCode	varchar2(1);
		psEmplTypeCode		varchar2(1);
		psPositionNo		varchar2(40);
		psUhUnitCode		varchar2(40);
		affiliationId	krim_entity_afltn_t.entity_afltn_id%TYPE;
		dataOrigin		varchar2(10);

		begin
			select extractValue(xmlMessage, '//messageData/uhUuid') into entityId from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/campusKey') into psCampusKey from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/employeeRecord') into psEmplRecId from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/employeeStatus') into psEmplStatusCode from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/employeeTypeCode') into psEmplTypeCode from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/positionNumber') into psPositionNo from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/uhUnitCode') into psUhUnitCode from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/org') into ldapOrg from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/role') into ldapRole from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/dataOrigin') into dataOrigin from dual;

			if does_entity_exist(entityId) then
			    -- convert LDAP org and role
			    org := convertLdapOrg(ldapOrg);
			    affiliation := convertLdapRole(ldapRole);
				-- get affiliationId from the affiliation table
				affiliationId := retrieveAffiliationId(entityId, org, affiliation);
				-- change all affiliations default indicator flag to 'N'
				update krim_entity_afltn_t set dflt_ind='N', last_updt_dt=SYSDATE where entity_id = entityId;


				if affiliationId is null then

					-- get a new affiliationId
					select krim_entity_afltn_id_s.NEXTVAL into affiliationId from dual;
					-- add the affiliation
					insert into krim_entity_afltn_t (entity_afltn_id, entity_id, afltn_typ_cd, campus_cd, obj_id)
      				values (affiliationId, entityId, affiliation, org, sys_guid());
      			end if;

      			-- add/update the employment info
      			processEmploymentInfo(entityId, affiliationId, psEmplRecId, psEmplStatusCode, psEmplTypeCode, psCampusKey, psPositionNo, psUhUnitCode, dataOrigin, ldapRole);
      			-- update default indicator after all is said and done
      			-- get affiliationId of the primary employment record
      			-- if no primary, then set the first affiliation as the default
            
      			affiliationId := retrievePrimaryEmplAffId(entityId);
      			if affiliationId is null then
      				update krim_entity_afltn_t set dflt_ind='Y', last_updt_dt=SYSDATE where entity_id = entityId and rownum=1;
      			else
	      			update krim_entity_afltn_t set dflt_ind='Y', last_updt_dt=SYSDATE where entity_id = entityId and entity_afltn_id = affiliationId;
				end if;

        -- update status/message for auditing purposes
         updateStagingStatusAndMessage(stagingRecordId, 'P', 'Affiliation added');
          --rbl KC-557 Deactivate access to myGRANT for users who are assigned the LDAP "Ohana" role because they are no longer active UH faculty,staff,student...
          if (ldapRole = 'ohana' and entityId is not null) then
                update krim_prncpl_t set actv_ind = 'N', last_updt_dt=SYSDATE where prncpl_id = entityId;
                update krim_role_mbr_t set actv_to_dt = sysdate, last_updt_dt=SYSDATE where mbr_id = entityId;
                update krim_grp_mbr_t set actv_to_dt = sysdate, last_updt_dt=SYSDATE where mbr_id = entityId; 
          -- update status/message for auditing purposes
          updateStagingStatusAndMessage(stagingRecordId, 'P', 'ohana affiliation added and user access was deactivated');
          end if;
			else
				-- update status/message for auditing purposes
				updateStagingStatusAndMessage(stagingRecordId, 'W', 'Entity does not exist');
			end if;
			commit;
		end;

  --rbl reviewed
	procedure processEmploymentInfo(entityId in varchar2, affiliationId in varchar2, psEmplRecId in varchar2,
	psEmplStatusCode in varchar2, psEmplTypeCode in varchar2, psCampusKey in varchar2, psPositionNo in varchar2,
	psUhUnitCode in varchar2, dataOrigin in varchar2, ldapRole in varchar2) is

		primaryInd		krim_entity_emp_info_t.prmry_ind%TYPE;
		emplStatus		varchar2(1);
		emplType		varchar2(1);
    kim_primary_dept_code	  varchar2(10);
    dflt_afltn_id	varchar2(40);


		begin
    -- rbl we want to preserve our preloaded primary dept code info
    kim_primary_dept_code := retrive_kim_primary_dept_code(entityId);
			if dataOrigin = 'hris' and psEmplRecId is not null then
				if psEmplRecId = 1 then
	                primaryInd := 'Y';
	                --primary_dept_code := retrive_primary_dept_code(entityId); rbl
	                -- since all of this is run in a transaction, there's a chance that retrievePrimaryEmplAffId() may return multiple values
                  update krim_entity_emp_info_t set prmry_ind='N' where entity_id = entityId;
	            else
	                primaryInd := 'N';
	                --primary_dept_code := null; rbl
	            end if;

	            emplStatus := convertPSEmplStatus(psEmplStatusCode);
              emplType := convertPSEmplType(psEmplTypeCode);


	            if doesEmplRecIdExist(entityId, psEmplRecId) then
	            	-- this may swap the employment record to a different affiliation
      				update krim_entity_emp_info_t set entity_afltn_id=affiliationId, emp_stat_cd=emplStatus, emp_typ_cd=emplType, prmry_ind=primaryInd, last_updt_dt=SYSDATE
      				where entity_id=entityId and emp_rec_id=psEmplRecId;
  				else
      				INSERT INTO krim_entity_emp_info_t
                   (entity_emp_id,
                    entity_id,
                    entity_afltn_id,
                    emp_stat_cd,
                    emp_typ_cd,
                    prmry_ind,
                    prmry_dept_cd,
                    base_slry_amt,
                    emp_id,
                    emp_rec_id,
                    obj_id) values
                   (krim_entity_emp_id_s.NEXTVAL,
                          entityId,
                          affiliationId,
                          emplStatus,
                          emplType,
                          primaryInd,
                          kim_primary_dept_code,
                          null,
                          entityId,
                          psEmplRecId,
                          sys_guid());
            	end if;
            elsif dataOrigin = 'rcuh' then
                -- get afltn_id of the default affiliation
	            dflt_afltn_id := retrievePrimaryEmplAffId(entityId);

	            -- if no default, assign this as the default and make this employment info the primary
	            if dflt_afltn_id is null then
	            	primaryInd := 'Y';
	            else
	            	primaryInd := 'N';
	            end if;


            	-- do we need to create the RCUH employment record
				if not doesAffiliationHaveEmplRecs(entityId, affiliationId) then
          if primaryInd = 'Y' then
                 -- since all of this is run in a transaction, there's a chance that retrievePrimaryEmplAffId() may return multiple values
                  update krim_entity_emp_info_t set prmry_ind='N' where entity_id = entityId;
          end if;
					INSERT INTO krim_entity_emp_info_t
                   (entity_emp_id,
                    entity_id,
                    entity_afltn_id,
                    emp_stat_cd,
                    emp_typ_cd,
                    prmry_ind,
                    prmry_dept_cd,
                    base_slry_amt,
                    emp_id,
                    obj_id) values
                   (krim_entity_emp_id_s.NEXTVAL,
                          entityId,
                          affiliationId,
                          'A',
                          'P',
                          primaryInd,
                          kim_primary_dept_code,
                          null,
                          entityId,
                          sys_guid());
				end if;
			elsif dataOrigin = 'sece' or dataOrigin = 'scopis' then
				if ldapRole = 'studentEmployee.studentHire' or ldapRole = 'studentEmployee.workStudy' then
					-- get afltn_id of the default affiliation
		            dflt_afltn_id := retrievePrimaryEmplAffId(entityId);

		            -- if no default, assign this as the default and make this employment info the primary
		            if dflt_afltn_id is null then
		            	primaryInd := 'Y';
		            else
		            	primaryInd := 'N';
		            end if;

		        	-- do we need to create the student employment record
					if not doesAffiliationHaveStdEmplRecs(entityId, affiliationId) then
						INSERT INTO krim_entity_emp_info_t
		               (entity_emp_id,
		                entity_id,
		                entity_afltn_id,
		                emp_stat_cd,
		                emp_typ_cd,
		                prmry_ind,
                    prmry_dept_cd,
		                base_slry_amt,
		                emp_id,
                    obj_id) values
		               (krim_entity_emp_id_s.NEXTVAL,
		                      entityId,
		                      affiliationId,
		                      'A',
		                      'S',
		                      primaryInd,
                          kim_primary_dept_code,
		                      null,
		                      entityId,
                          sys_guid());
					end if;
				end if;
			end if;
		end;


	--rbl reviewed - per cameron we should process these mgs otherwise our employment info in KIM will become stale
	procedure deleteAffiliationOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2) is
		entityId		krim_entity_t.entity_id%TYPE;
		affiliation		krim_afltn_typ_t.afltn_typ_cd%TYPE;
		org				krlc_cmp_t.campus_cd%TYPE;
		ldapOrg			varchar2(15);
		ldapRole		varchar2(40);
		affiliationId	krim_entity_afltn_t.entity_afltn_id%TYPE;
		psEmplRecId		varchar2(2);
		dataOrigin		varchar2(10);
		remainingAffXml XMLTYPE;
		rmn_affiliation	krim_afltn_typ_t.afltn_typ_cd%TYPE;
		rmn_org			varchar2(5);
		rmn_dataOrigin	varchar2(10);
		msgAppender		varchar2(400);
	    hasEmplRecords   boolean := false;

		begin
			select extractValue(xmlMessage, '//messageData/uhUuid') into entityId from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/org') into ldapOrg from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/role') into ldapRole from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/employeeRecord') into psEmplRecId from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/dataOrigin') into dataOrigin from dual;
			select extract(xmlMessage, '//messageData/remainingAffiliations') into remainingAffXml from dual;

			if does_entity_exist(entityId) then
			    -- convert LDAP org and role
			    org := convertLdapOrg(ldapOrg);
			    affiliation := convertLdapRole(ldapRole);

				-- get affiliationId from the affiliation table
				affiliationId := retrieveAffiliationId(entityId, org, affiliation);

				if affiliationId is not null then
					if dataOrigin = 'hris' then
						-- delete employment record tied to this affiliation with the given employeeRecordNo
						delete from krim_entity_emp_info_t where entity_afltn_id=affiliationId and emp_rec_id=psEmplRecId;
						msgAppender := 'Employment record tied to '||affiliation||'@'||org||' has been deleted. ';
					elsif dataOrigin = 'rcuh' then
						delete from krim_entity_emp_info_t where entity_afltn_id=affiliationId;
						msgAppender := 'Employment record tied to '||affiliation||'@'||org||' has been deleted. ';
					end if;

					-- ignoring remaining affiliations from message queue because we're only concerned with PeopleSoft affiliations;
					-- if there are no employment records remaining, then it's safe to get rid of the affiliation. We're also protected
					-- if an employment record is manually entered through the KFS gui
          			hasEmplRecords := doesAffiliationHaveEmplRecs(entityId, affiliationId);

		            if not hasEmplRecords then
		            	delete from krim_entity_afltn_t where entity_afltn_id=affiliationId;
		            	msgAppender := msgAppender||'Affiliation for '||affiliation||'@'||org||' has been deleted.';
		            end if;

		            -- update default indicator after all is said and done
	      			-- get affiliationId of the primary employment record
	      			-- if no primary, then set the first affiliation as the default
	      			affiliationId := retrievePrimaryEmplAffId(entityId);
	      			if affiliationId is null then
	      				update krim_entity_afltn_t set dflt_ind='Y' where entity_id = entityId and rownum=1;
	      			else
		      			update krim_entity_afltn_t set dflt_ind='Y' where entity_id = entityId and entity_afltn_id = affiliationId;
					end if;

		            -- update status/message for auditing purposes
					updateStagingStatusAndMessage(stagingRecordId, 'P', msgAppender);
				else
					-- update status/message for auditing purposes
					updateStagingStatusAndMessage(stagingRecordId, 'W', 'Ignoring xml message because affiliation: '||affiliation||'@'||org||' could not be located');
      			end if;
			else
				-- update status/message for auditing purposes
				updateStagingStatusAndMessage(stagingRecordId, 'W', 'Entity does not exist');
			end if;
			commit;

		end;

  --rbl reviewed - modified
	procedure  modifyAffiliationOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2) is
		entityId		krim_entity_t.entity_id%TYPE;
		affiliation		krim_afltn_typ_t.afltn_typ_cd%TYPE;
		org				krlc_cmp_t.campus_cd%TYPE;
		ldapOrg			varchar2(15);
		ldapRole		varchar2(40);
		psCampusKey		varchar2(5);
		psEmplRecId		varchar2(2);
		psEmplStatusCode	varchar2(1);
		psEmplTypeCode		varchar2(1);
		psPositionNo		varchar2(40);
		psUhUnitCode		varchar2(40);
		dataOrigin			varchar2(10);
		affiliationId	krim_entity_afltn_t.entity_afltn_id%TYPE;
		empAffiliationId	krim_entity_afltn_t.entity_afltn_id%TYPE;

		begin
			select extractValue(xmlMessage, '//messageData/uhUuid') into entityId from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/campusKey') into psCampusKey from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/employeeRecord') into psEmplRecId from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/employeeStatus') into psEmplStatusCode from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/employeeTypeCode') into psEmplTypeCode from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/positionNumber') into psPositionNo from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/uhUnitCode') into psUhUnitCode from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/org') into ldapOrg from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/role') into ldapRole from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/dataOrigin') into dataOrigin from dual;

			-- NOTE: for a affiliation modification, only the employment information changes, not the affiliation information!

			if does_entity_exist(entityId) then
			    -- convert LDAP org and role
			    org := convertLdapOrg(ldapOrg);
			    affiliation := convertLdapRole(ldapRole);

				-- get the affiliationId of the org and affiliation
				affiliationId := retrieveAffiliationId(entityId, org, affiliation);

				if affiliationId is null then
				    -- get affiliationId of the entityId and the psEmplRecId; may throw exception if there are multiple empl records with the same record number
				    empAffiliationId := retrieveAffIdFromEmpRecord(entityId, psEmplRecId);

					if empAffiliationId is not null then
						-- add/update the employment info
						processEmploymentInfo(entityId, empAffiliationId, psEmplRecId, psEmplStatusCode, psEmplTypeCode, psCampusKey, psPositionNo, psUhUnitCode, dataOrigin, ldapRole);
            -- update status/message for auditing purposes
            updateStagingStatusAndMessage(stagingRecordId, 'P', 'Employment info updated');
          --added by rbl
          elsif empAffiliationId is null then
            -- update status/message for auditing purposes
            updateStagingStatusAndMessage(stagingRecordId, 'W', 'Employment info could NOT be updated - no associative affiliation nor employmentInfo record found');
          end if;

				else
					-- add/update the employment info
					processEmploymentInfo(entityId, affiliationId, psEmplRecId, psEmplStatusCode, psEmplTypeCode, psCampusKey, psPositionNo, psUhUnitCode, dataOrigin, ldapRole);
          -- update status/message for auditing purposes
          updateStagingStatusAndMessage(stagingRecordId, 'P', 'Employment info updated');
        end if;


			else
				-- update status/message for auditing purposes
				updateStagingStatusAndMessage(stagingRecordId, 'W', 'Entity does not exist');
			end if;
			commit;

		end;

  --rbl reviewed
	procedure  addUsernameOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2) is
		entityId		krim_entity_t.entity_id%TYPE;
		princpalName	krim_prncpl_t.prncpl_nm%TYPE;

		begin
			select extractValue(xmlMessage, '//messageData/uhUuid') into entityId from dual;
			select extractValue(xmlMessage, '//messageData/uid') into princpalName from dual;

          --rbl 3/12/13 modified - moved the entity record check/warning msg generation into the processPrincipal method
          processPrincipal(entityId, princpalName, stagingRecordId);
			commit;
		end;

  --rbl reviewed
	procedure retrofitUsernameOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2) is
		entityId		krim_entity_t.entity_id%TYPE;
		princpalName	krim_prncpl_t.prncpl_nm%TYPE;
		retrofitActions	XMLTYPE;
		addUsernameXml	XMLTYPE;
		c_addUsername	number(2) := 1;

		begin

			select extract(xmlMessage, '//messageData/actions') into retrofitActions from dual;

			while retrofitActions.existsNode('//addUsername['||c_addUsername||']') = 1 loop
			  entityId := retrofitActions.extract('//addUsername[' || c_addUsername || ']/messageData/uhUuid/text()').getStringVal();
              princpalName := retrofitActions.extract('//addUsername[' || c_addUsername || ']/messageData/uid/text()').getStringVal();
              dbms_output.put_line('uhuuid = '||entityId);
              dbms_output.put_line('uid = '||princpalName);

              select extract(retrofitActions, '//addUsername['||c_addUsername||']') into addUsernameXml from dual;
              addUsernameOperation(addUsernameXml, stagingRecordId);
              c_addUsername := c_addUsername + 1;
            END LOOP;

		end;

  -- rbl reviewed	- modified
	procedure processPrincipal(entityId in varchar2, principalName in varchar2, stagingRecordId in varchar2) is
	    pExists   boolean;
	    tempEntityId		krim_entity_t.entity_id%TYPE;
      newXmlMsg uh_message_queue_t.xml%TYPE;
	    begin
	        pExists := does_principal_exist(entityId, principalName);
	        if pExists then
                --dbms_output.put_line('principal exists so activate it');
                UPDATE krim_prncpl_t set actv_ind='Y', last_updt_dt=SYSDATE where entity_id = entityId and prncpl_nm = principalName;
                updateStagingStatusAndMessage(stagingRecordId, 'P', 'Principal Activated');

	        else
	            -- is the username tied to another entity
	            tempEntityId := retrieveEntityIdByPrincpalName(principalName);
	            if tempEntityId is null then
                    if does_entity_exist(entityId) then
                      INSERT INTO krim_prncpl_t (prncpl_id, prncpl_nm, entity_id, obj_id) values
                          (entityId, principalName, entityId, sys_guid());
                      updateStagingStatusAndMessage(stagingRecordId, 'P', 'Principal Added');
                      
                      else 
                          -- update status/message for auditing purposes
                          updateStagingStatusAndMessage(stagingRecordId, 'W', 'Entity does not exist');
                      end if;

	            else
	            	-- move principal name to this new entityId
                --rbl cannot do this could potentially result in orphaned pds,ips, awards, action_lists
	            	--update krim_prncpl_t set entity_id=entityId, last_updt_dt=SYSDATE where entity_id = tempEntityId and prncpl_nm = principalName;
                -- we can do this now by creating a modifyPersonUhUuid message and processing that message
                 newXmlMsg := xmltype('<modifyPersonUhUuid><messageData><uhUuid>' || entityId || '</uhUuid></messageData><messageDataBefore><uhUuid>' || tempEntityId || '</uhUuid></messageDataBefore></modifyPersonUhUuid>');
                	modifyPersonUhuuidOperation(newxmlmsg,stagingRecordId);
                 -- updateStagingStatusAndMessage(stagingRecordId, 'A', 'Admin Action required - principalName: ' || principalName || ' is already used by another entity: ' || tempEntityId);
	            end if;
	        end if;
	    end;

	--rbl reviewed
  -- per Cameron Ahana UHIMS has moved the UH username from one UH Number to a different UH Number
  -- So by updating just the entity_id, I'm moving the prncpl_nm from one entity to another.
  procedure modifyUsernameUhUuidOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2) is
		newEntityId		krim_entity_t.entity_id%TYPE;
		oldEntityId		krim_entity_t.entity_id%TYPE;
		newUsername		krim_prncpl_t.prncpl_nm%TYPE;

		begin
			select extractValue(xmlMessage, '//messageDataBefore/uhUuid') into oldEntityId from dual;
			select extractValue(xmlMessage, '//messageData/uhUuid') into newEntityId from dual;
			select extractValue(xmlMessage, '//messageData/uid') into newUsername from dual;
      
        --rbl 3/12/13 modified - we can now process these, also moved the entity record check/warning msg generation into the processPrincipal method
        processPrincipal(newEntityId, newUsername, stagingRecordId);

			commit;
		end;

  --rbl reviewed
	procedure  modifyUsernameUidOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2) is
		oldPrincipalName	krim_prncpl_t.prncpl_nm%TYPE;
		newPrincipalName	krim_prncpl_t.prncpl_nm%TYPE;
		oldEntityId			krim_prncpl_t.entity_id%TYPE;
		newEntityId			krim_prncpl_t.entity_id%TYPE;

		begin
			select extractValue(xmlMessage, '//messageDataBefore/uid') into oldPrincipalName from dual;
			select extractValue(xmlMessage, '//messageData/uid') into newPrincipalName from dual;

			oldEntityId := retrieveEntityIdByPrincpalName(oldPrincipalName);
			newEntityId := retrieveEntityIdByPrincpalName(newPrincipalName);

			if oldEntityId is not null then
				if newEntityId is not null then
        -- rbl modified 3/12/13 - OK to inactivate old username
       
					update krim_prncpl_t set actv_ind='N' where prncpl_nm=oldPrincipalName;
          --updateStagingStatusAndMessage(stagingRecordId, 'A', 'Admin Action Required change of username: deactivation of username');
					updateStagingStatusAndMessage(stagingRecordId, 'P', 'Old username: ' || oldPrincipalName || ' was deactivated');
				else
        --rbl this change is ok
					update krim_prncpl_t set prncpl_nm=newPrincipalName, last_updt_dt=SYSDATE where prncpl_nm=oldPrincipalName;
					updateStagingStatusAndMessage(stagingRecordId, 'P', 'Old username: ' || oldPrincipalName || ' replaced with New username: ' || newPrincipalName);
				end if;
			else
				updateStagingStatusAndMessage(stagingRecordId, 'W', 'Old username: ' || oldPrincipalName || ' does not exist');
			end if;
			commit;
		end;

	--rbl reviewed
	procedure  modifyUsernameAccessOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2) is
		access			varchar2(20);
		principalName	krim_prncpl_t.prncpl_nm%TYPE;

		begin
			select extractValue(xmlMessage, '//messageData/uid') into principalName from dual;
			select extractValue(xmlMessage, '//messageData/access') into access from dual;

			if access = 'normal' then
				update krim_prncpl_t set actv_ind='Y', last_updt_dt=SYSDATE where prncpl_nm=principalName;
				updateStagingStatusAndMessage(stagingRecordId, 'P', 'Principal activated');
			else
				update krim_prncpl_t set actv_ind='N', last_updt_dt=SYSDATE where prncpl_nm=principalName;
				updateStagingStatusAndMessage(stagingRecordId, 'P', 'Principal inactivated');
			end if;
			commit;
		end;

  --rbl modified - deactivate the user
	procedure  deleteUsernameOperation(xmlMessage in XMLTYPE,  stagingRecordId in varchar2) is
		principalName	krim_prncpl_t.prncpl_nm%TYPE;
    entityId		krim_entity_t.entity_id%TYPE;
		begin
			select extractValue(xmlMessage, '//messageData/uid') into principalName from dual;
      if principalName is not null then
        entityId := retrieveEntityIdByPrincpalName(principalName);
        if entityId is not null then

          --rbl 2/27/2013  deactivate the user 
          update krim_prncpl_t set actv_ind = 'N', last_updt_dt=SYSDATE where prncpl_id = entityId;
          update krim_role_mbr_t set actv_to_dt = sysdate, last_updt_dt=SYSDATE where mbr_id = entityId;
          update krim_grp_mbr_t set actv_to_dt = sysdate, last_updt_dt=SYSDATE where mbr_id = entityId;

          updateStagingStatusAndMessage(stagingRecordId, 'P', 'User ' || principalName || ' successfully deactivated');
        --updateStagingStatusAndMessage(stagingRecordId, 'P', 'Principal inactivated');
          --updateStagingStatusAndMessage(stagingRecordId, 'A', 'Admin Action Required deactivate Principal with username: ' || principalName);
        else
          updateStagingStatusAndMessage(stagingRecordId, 'P', 'No Principal with the username: ' || principalName || ' exists to deactivate');
        end if;
      end if;
			commit;
		end;

  --rbl reviewed
	procedure  addEmailOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2) is
		entityId		krim_entity_t.entity_id%TYPE;
		emailAddress	varchar2(40);

		begin
			select extractValue(xmlMessage, '//messageData/uhUuid') into entityId from dual;
			select extractValue(xmlMessage, '//messageData/emailAddress') into emailAddress from dual;
			if does_entity_exist(entityId) then
				processEmailAddress(entityId, emailAddress, 'A');
        
				-- update status/message for auditing purposes
				updateStagingStatusAndMessage(stagingRecordId, 'P', 'Email added');
			else
				-- update status/message for auditing purposes
				updateStagingStatusAndMessage(stagingRecordId, 'W', 'Entity does not exist');
			end if;
			commit;

		end;

	--rbl reviewed
	procedure retrofitEmailOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2) is
		entityId		krim_entity_t.entity_id%TYPE;
		emailAddress	varchar2(40);
		retrofitActions	XMLTYPE;
		addEmailXml		XMLTYPE;
		c_addEmail		number(2) := 1;

		begin

			select extract(xmlMessage, '//messageData/actions') into retrofitActions from dual;

			while retrofitActions.existsNode('//addEmail['||c_addEmail||']') = 1 loop
			  entityId := retrofitActions.extract('//addEmail[' || c_addEmail || ']/messageData/uhUuid/text()').getStringVal();
              emailAddress := retrofitActions.extract('//addEmail[' || c_addEmail || ']/messageData/emailAddress/text()').getStringVal();
              dbms_output.put_line('uhuuid = '||entityId);
              dbms_output.put_line('email = '||emailAddress);
              select extract(retrofitActions, '//addEmail['||c_addEmail||']') into addEmailXml from dual;
              addEmailOperation(addEmailXml, stagingRecordId);
              c_addEmail := c_addEmail + 1;
            END LOOP;

		end;

    -- rbl reviewed
	procedure processEmailAddress(entityId in varchar2, emailAddress in varchar2, operation in varchar2) is
		entityEmailId	krim_entity_email_t.entity_email_id%TYPE;
		username		   krim_prncpl_t.prncpl_nm%TYPE;
  		hasUsernameEmail boolean := false;

		begin
			if emailAddress is not null then
				-- reset default flag to N for all records except those entered by ors helpline/user(email_typ_cd = OTH) which we want to preserve
        -- if they were selected as default
				update krim_entity_email_t set dflt_ind = 'N', last_updt_dt=SYSDATE where entity_id=entityId and email_typ_cd != 'OTH';
				-- pulling this to prevent adding a duplicate email address
				entityEmailId := retrieveEmailId(entityId, emailAddress);
          if operation = 'A' then
  
            if entityEmailId is null then
              INSERT INTO krim_entity_email_t
                      (entity_email_id,
                       entity_id,
                       ent_typ_cd,
                       email_typ_cd,
                       email_addr,
                       dflt_ind,
                       obj_id) values
                      (krim_entity_email_id_s.NEXTVAL,
                              entityId,
                              'PERSON',
                              'WRK',
                              emailAddress,
                              'N',
                              sys_guid());
            end if;
          else
            delete from krim_entity_email_t where entity_email_id=entityEmailId and email_typ_cd != 'OTH';
          end if;

          -- only do this section if a dflt OTH email record is not set - because we want to preserve those which 
          -- get entered by ors helpline/user
          -- now set the default to username@hawaii.edu; if none exists, set default to the first one
            if not doesDfltOtherEmailRecExist(entityId) then
                  select prncpl_nm into username from krim_prncpl_t where entity_id=entityId and actv_ind='Y' and rownum=1;
                  if username is not null then
                    entityEmailId := retrieveEmailId(entityId, username||'@hawaii.edu');
                   
                    if entityEmailId is not null then
                      hasUsernameEmail := true;
                        update krim_entity_email_t set dflt_ind = 'Y' where entity_email_id=entityEmailId;
                    end if;
                  end if;
    
                  if not hasUsernameEmail then
                      -- set first "OFFICIAL" record as default - ie a record not entered through myGRANT by ors helpline/user(email_typ_cd = 'OTH';
                    update krim_entity_email_t set dflt_ind = 'Y' where entity_id=entityId and email_typ_cd !='OTH' and rownum=1;
                  end if;
          end if;
			end if;
      EXCEPTION
      WHEN NO_DATA_FOUND THEN
       dbms_output.put_line('Unable to set first email as default because none existed');
		end;

  -- rbl reviewed
	procedure  deleteEmailOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2) is
		entityId		krim_entity_t.entity_id%TYPE;
		emailAddress	varchar2(40);
		entityEmailId	krim_entity_email_t.entity_email_id%TYPE;

		begin
			select extractValue(xmlMessage, '//messageData/uhUuid') into entityId from dual;
			select extractValue(xmlMessage, '//messageData/emailAddress') into emailAddress from dual;

			if does_entity_exist(entityId) then
				processEmailAddress(entityId, emailAddress, 'D');

				-- update status/message for auditing purposes
				updateStagingStatusAndMessage(stagingRecordId, 'P', 'Email deleted');
			else
				-- update status/message for auditing purposes
				updateStagingStatusAndMessage(stagingRecordId, 'W', 'Entity does not exist');
			end if;
			commit;

		end;

	--rbl reviewed
  -- same routine used for add, modify and delete contactInfo
	procedure  modifyContactInfoOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2) is
		entityId		krim_entity_t.entity_id%TYPE;
		remainingContactInfo  XMLTYPE;

		begin
			select extractValue(xmlMessage, '//messageData/uhUuid') into entityId from dual;
			select extract(xmlMessage, '//messageData/remainingContactInfo') into remainingContactInfo from dual;

			if does_entity_exist(entityId) then
				-- delete the  wrk and fax phone records for this entity
				delete from krim_entity_phone_t	where entity_id = entityId;
				commit;

				-- pass in uhuuid and remaining contact infos
				processPhone(entityId, remainingContactInfo);

				-- update status/message for auditing purposes
				updateStagingStatusAndMessage(stagingRecordId, 'P', 'Contact info retrofited');
			else
				-- update status/message for auditing purposes
				updateStagingStatusAndMessage(stagingRecordId, 'W', 'Entity does not exist');
			end if;
			commit;

		end;

--rbl reviewed
	procedure retrofitContactInfoOperation(xmlMessage in XMLTYPE, stagingRecordId in varchar2) is
		entityId		krim_entity_t.entity_id%TYPE;
		retrofitActions	XMLTYPE;
		addContactXml	XMLTYPE;
		c_addContact	number(2) := 1;

		begin

			select extract(xmlMessage, '//messageData/actions') into retrofitActions from dual;

			while retrofitActions.existsNode('//addContactInfo['||c_addContact||']') = 1 loop

              select extract(retrofitActions, '//addContactInfo['||c_addContact||']') into addContactXml from dual;
              modifyContactInfoOperation(addContactXml, stagingRecordId);
              c_addContact := c_addContact + 1;
            END LOOP;

		end;

   --rbl reviewed
	procedure processPhone(entityId in varchar2, remainingContactInfo in XMLTYPE) is

	    defaultIndicator  varchar2(1) := 'N';
    	phone             varchar2(20);
	    c_remainingContact 	  number(2) := 1;
	    c_phone			  number(2) := 1;
	    phonesXml		  XMLTYPE;

		begin
			while remainingContactInfo.existsNode('//contactInfo['||c_remainingContact||']') = 1 loop
			  -- extract phone elements
			  c_phone := 1;
			  select extract(remainingContactInfo, '//contactInfo['||c_remainingContact||']/phones') into phonesXml from dual;
			  while phonesXml.existsNode('//phone['||c_phone||']') = 1 loop
			  		phone := phonesXml.extract('//phone[' || c_phone || ']/phoneNumber/text()').getStringVal();
			  		dbms_output.put_line('phone = '||phonesXml.extract('//phone[' || c_phone || ']/phoneNumber/text()').getStringVal());
			  		if phone is not null then
			  		    if c_remainingContact = 1 and c_phone = 1 then
			  		    	defaultIndicator := 'Y';
			  		    else
			  		    	defaultIndicator := 'N';
                		end if;
			  		    -- insert phone
			  		    insertPhone(entityId, phone, 'WRK', defaultIndicator);
			  		end if;

			  		c_phone := c_phone + 1;
			  end loop;

			  -- extract fax elements
			  c_phone := 1;
			  defaultIndicator := 'N';
			  select extract(remainingContactInfo, '//contactInfo['||c_remainingContact||']/faxes') into phonesXml from dual;
			  while phonesXml.existsNode('//phone['||c_phone||']') = 1 loop
			  		phone := phonesXml.extract('//phone[' || c_phone || ']/phoneNumber/text()').getStringVal();
			  		dbms_output.put_line('fax = '||phonesXml.extract('//phone[' || c_phone || ']/phoneNumber/text()').getStringVal());

			  		if phone is not null then
			  		    -- insert phone
			  		    insertPhone(entityId, phone, 'FAX', defaultIndicator);
			  		end if;
			  		c_phone := c_phone + 1;
			  end loop;

              c_remainingContact := c_remainingContact + 1;

            END LOOP;

		end;


  -- rbl reviewed
	procedure insertPhone(entityId in varchar2, entityPhone in varchar2, phoneType in varchar2, defaultInd in varchar2) is
    entityPhoneExt    varchar2(20);
    pos_of_ext        number(2);
    hi_area_code CONSTANT varchar2(3) := '808';
    processedPhone    varchar2(50) := entityPhone;

    begin
        if entityPhone is not null then
          -- separates the phone number from the extension
          pos_of_ext := instr(entityPhone, ' ext ', 1);
          if pos_of_ext > 0 then
            processedPhone := substr(entityPhone, 1, pos_of_ext-1);
            entityPhoneExt := substr(entityPhone,  pos_of_ext+5);
          end if;

          -- check if the phone number starts with an area code (
          if substr(processedPhone,1,1) = '(' then
          	  -- strip off the '('
          	  processedPhone := substr(processedPhone, 2);
          	dbms_output.put_line('processedPhone1 = '||processedPhone);
          	  -- trim whitespace
          	  processedPhone := replace(processedPhone, ' ', '');
          	dbms_output.put_line('processedPhone2 = '||processedPhone);
          	  -- replace the ') ' or ')' with a '-'
          	  processedPhone := replace(processedPhone, ')', '-');
          	  dbms_output.put_line('processedPhone3 = '||processedPhone);
          else
          	  processedPhone := trim(processedPhone);
          	  dbms_output.put_line('processedPhone11 = '||processedPhone);
          	  -- UI takes xxx-xxx-xxxx only
          	  -- ignore international numbers
	          --if ((length(processedPhone) - length(replace(processedPhone,'-')) <> 2) or (length(processedPhone) - length(replace(processedPhone,'+')) = 0)) then
	          if (length(processedPhone) = 8) then
	            -- no area code so prefix 808
	            processedPhone := hi_area_code||'-'||processedPhone;
	          else
	            processedPhone := null;
	          end if;
	          dbms_output.put_line('processedPhone22 = '||processedPhone);
          end if;

          --dbms_output.put_line('phone: '|| processedPhone);
          --dbms_output.put_line('ext: '|| entityPhoneExt);
          if processedPhone is not null then
	          INSERT INTO krim_entity_phone_t
	              (ENTITY_PHONE_ID,
	               ENTITY_ID,
	               ent_typ_cd,
	               PHONE_TYP_CD,
	               PHONE_NBR,
	               PHONE_EXTN_NBR,
	               dflt_ind,
                 obj_id) values
	              (krim_entity_phone_id_s.NEXTVAL,
	                      entityId,
	                      'PERSON',
	                      phoneType,
	                      processedPhone,
	                      entityPhoneExt,
	                      defaultInd,
                        sys_guid());
	      end if;
      end if;
    end;



-----------------------
-- Helper functions
-----------------------
-- rbl reviewed
	function does_principal_exist (entityId in varchar2, principalName in varchar2)
			return boolean
			is

          v_count				number(1) := 0;
	        p_exists      boolean := false;

	BEGIN

			select count(*)
	        into v_count
	        from krim_prncpl_t
	        where krim_prncpl_t.entity_id = entityId and
          krim_prncpl_t.prncpl_nm = principalName;

	        if v_count = 0 then
	            p_exists := false;
	        else
	            p_exists := true;
	        end if;
	        return p_exists;

	END does_principal_exist;
  
function does_principal_exist (entityId in varchar2)
			return boolean
			is

          v_count				number(1) := 0;
	        p_exists      boolean := false;

	BEGIN

			select count(*)
	        into v_count
	        from krim_prncpl_t
	        where krim_prncpl_t.prncpl_id = entityId;

	        if v_count = 0 then
	            p_exists := false;
	        else
	            p_exists := true;
	        end if;
	        return p_exists;

	END does_principal_exist;

	function retrieveEntityIdByPrincpalName (principalName in varchar2)
		return varchar2
		is

        entityId		krim_entity_t.entity_id%TYPE;

  		begin

			select ENTITY_ID
	        into entityId
	        from krim_prncpl_t
	        where prncpl_nm=principalName;

          	return entityId;
      	exception
        	WHEN NO_DATA_FOUND THEN
          	return null;

		end retrieveEntityIdByPrincpalName;

	function does_entity_exist (entityId in varchar2)
			return boolean
			is

			v_count				number(1) := 0;
	        e_exists        boolean := false;


	BEGIN
	        select count(*)
	        into v_count
	        from krim_entity_t
	        where krim_entity_t.entity_id = entityId;

	        if v_count = 0 then
	        	  e_exists := false;
	        else
	            e_exists := true;
	        end if;
	        return e_exists;

	END does_entity_exist;
  
  function does_entity_ent_typ_exist(entityId in varchar2, entTypCd in varchar2)
			return boolean
			is

			v_count				number(1) := 0;
	        e_exists        boolean := false;


	BEGIN
	        select count(*)
	        into v_count
	        from krim_entity_ent_typ_t
	        where krim_entity_ent_typ_t.entity_id = entityId and upper(krim_entity_ent_typ_t.ent_typ_cd) = upper(entTypCd);

	        if v_count = 0 then
	        	  e_exists := false;
	        else
	            e_exists := true;
	        end if;
	        return e_exists;

	END does_entity_ent_typ_exist;
  
    function does_entity_nm_exist(entityId in varchar2)
			return boolean
			is

			v_count				number(1) := 0;
	        e_exists        boolean := false;


	BEGIN
	        select count(*)
	        into v_count
	        from krim_entity_nm_t
	        where krim_entity_nm_t.entity_id = entityId;

	        if v_count = 0 then
	        	  e_exists := false;
	        else
	            e_exists := true;
	        end if;
	        return e_exists;

	END does_entity_nm_exist;
  
      function does_entity_address_exist(entityId in varchar2)
			return boolean
			is

			v_count				number(1) := 0;
	        e_exists        boolean := false;


	BEGIN
	        select count(*)
	        into v_count
	        from krim_entity_addr_t
	        where krim_entity_addr_t.entity_id = entityId;

	        if v_count = 0 then
	        	  e_exists := false;
	        else
	            e_exists := true;
	        end if;
	        return e_exists;

	END does_entity_address_exist;
  
     function does_entity_email_exist(entityId in varchar2)
			return boolean
			is

			v_count				number(1) := 0;
	        e_exists        boolean := false;


	BEGIN
	        select count(*)
	        into v_count
	        from krim_entity_email_t
	        where krim_entity_email_t.entity_id = entityId;

	        if v_count = 0 then
	        	  e_exists := false;
	        else
	            e_exists := true;
	        end if;
	        return e_exists;

	END does_entity_email_exist;
  

function does_entity_phone_exist(entityId in varchar2)
			return boolean
			is

			v_count				number(1) := 0;
	        e_exists        boolean := false;


	BEGIN
	        select count(*)
	        into v_count
	        from krim_entity_phone_t
	        where krim_entity_phone_t.entity_id = entityId;

	        if v_count = 0 then
	        	  e_exists := false;
	        else
	            e_exists := true;
	        end if;
	        return e_exists;

	END does_entity_phone_exist;

function does_entity_afltn_exist(entityId in varchar2)
			return boolean
			is

			v_count				number(1) := 0;
	        e_exists        boolean := false;


	BEGIN
	        select count(*)
	        into v_count
	        from krim_entity_afltn_t
	        where krim_entity_afltn_t.entity_id = entityId;

	        if v_count = 0 then
	        	  e_exists := false;
	        else
	            e_exists := true;
	        end if;
	        return e_exists;

	END does_entity_afltn_exist;
  
  function does_entity_empinfo_exist(entityId in varchar2)
			return boolean
			is

			v_count				number(1) := 0;
	        e_exists        boolean := false;


	BEGIN
	        select count(*)
	        into v_count
	        from krim_entity_emp_info_t
	        where krim_entity_emp_info_t.entity_id = entityId;

	        if v_count = 0 then
	        	  e_exists := false;
	        else
	            e_exists := true;
	        end if;
	        return e_exists;

	END does_entity_empinfo_exist;

	function convertLdapOrg(org in varchar2)
		return varchar2
		is

		decodedOrg		krlc_cmp_t.campus_cd%TYPE;

		begin

	        select decode(org,
	            'uhm', 'uhm',
	            'uhh', 'uhh',
	            'uhwo', 'uhwo',
	            'mauicc', 'mauicc',
	            'hawcc', 'hawcc',
	            'hcc', 'hcc',
	            'kcc', 'kcc',
	            'kauaicc', 'kauaicc',
	            'lcc', 'lcc',
	            'wcc', 'wcc',
	            'uhsystem', 'uhsystem',
	            'uh', 'uh',
	            'rcuh', 'rcuh',
	            'uhf', 'uhf',
	            'uh') -- default
	        into decodedOrg from dual;

	        return decodedOrg;

		end convertLdapOrg;


		function convertLdapRole(ldapRole in varchar2)
		return varchar2
		is

		decodedAff		krim_afltn_typ_t.afltn_typ_cd%TYPE;

		begin
			select decode(ldapRole,
	            'faculty.communityCollege', 'faculty',
				'faculty.countyAgent', 'faculty',
				'faculty.courseInstructor', 'faculty',
				'faculty.emeritus', 'faculty',
				'faculty.graduateAssistant.overload', 'faculty',
				'faculty.law', 'faculty',
				'faculty.lecturer', 'faculty',
				'faculty.lecturer.casual', 'faculty',
				'faculty.lecturer.overload', 'faculty',
				'faculty.librarian', 'faculty',
				'faculty.medical', 'faculty',
				'faculty.noDetails', 'faculty',
				'faculty.noDetails.casual', 'faculty',
				'faculty.noDetails.overload', 'faculty',
				'faculty.researchAssistant', 'faculty',
				'faculty.researcher', 'faculty',
				'faculty.specialist', 'faculty',
				'faculty.teachingAssistant', 'faculty',
				'faculty.university', 'faculty',
				'nonCreditStudent.etc', 'other',
				'nonCreditStudent.noDetails', 'student',
				'ohana', 'other',
				'other', 'other',
				'preStudent.accepted', 'other',
				'preStudent.financialAid', 'other',
				'preStudent.noDetails', 'other',
				'retiree', 'other',
				'staff.apt', 'staff',
				'staff.apt.casual', 'staff',
				'staff.apt.overload', 'staff',
				'staff.civilService', 'staff',
				'staff.executive', 'staff',
				'staff.executive.casual', 'staff',
        'staff.executive.overload', 'staff',
				'staff.noDetails', 'staff',
				'staff.noDetails.casual', 'staff',
				'staff.noDetails.overload', 'staff',
				'staff.nonCompensated', 'staff',
				'student.graduate.law', 'student',
				'student.graduate.medical', 'student',
				'student.graduate.noDetails', 'student',
				'student.other.apprenticeship', 'student',
				'student.other.continuingEducation', 'student',
				'student.other.postBaccalaureate', 'student',
				'student.other.professional', 'student',
				'student.other.undeclared', 'student',
				'student.other.vocational', 'student',
				'student.undergraduate.noDetails', 'student',
				'studentEmployee.studentHire', 'other',
				'studentEmployee.workStudy', 'other',
	            'other') -- default
	        into decodedAff from dual;

	        return decodedAff;

		end convertLdapRole;

	function convertPSEmplType(employeeType in varchar2)
		return varchar2
		is

		decodedEmplType		varchar2(1);

		begin

	        select decode(employeeType,
                  'A', 'P',
                  'C', 'N',
                  'E', 'P',
                  'F', 'P',
                  'G', 'N',
                  'L', 'P',
                  'N', 'P',
                  'X', 'N',
                  'O') -- default
              into decodedEmplType from dual;

	        return decodedEmplType;

		end convertPSEmplType;

	function convertPSEmplStatus(employeeStatus in varchar2)
		return varchar2
		is

		decodedEmplStatus		varchar2(1);

		begin

	        select decode(employeeStatus,
                  'A', 'A',
                  'F', 'A',
                  'L', 'L',
                  'T', 'T',
                  null) -- default
              into decodedEmplStatus from dual;

	        return decodedEmplStatus;

		end convertPSEmplStatus;

	function retrieveAffiliationId (entityId in varchar2, campus in varchar2, affiliation in varchar2)
		return varchar2
		is

        afltn_id				varchar2(40);

  		begin

			select ENTITY_AFLTN_ID
	        into afltn_id
	        from krim_entity_afltn_t
	        where entity_id = entityId and afltn_typ_cd = affiliation and campus_cd = campus;

          	return afltn_id;
      exception
        WHEN NO_DATA_FOUND THEN
          return null;

		end retrieveAffiliationId;

  --rbl modified added prmry_ind to select where clause
	function retrieveAffIdFromEmpRecord (entityId in varchar2, employeeRecordNo in varchar2)
		return varchar2
		is

        afltn_id				varchar2(40);

  		begin

			select ENTITY_AFLTN_ID
	        into afltn_id
	        from krim_entity_emp_info_t
	        where entity_id = entityId and emp_rec_id = employeeRecordNo AND prmry_ind='Y';

          	return afltn_id;
      exception
        WHEN NO_DATA_FOUND THEN
          return null;

		end retrieveAffIdFromEmpRecord;


	function doesEmplRecIdExist (entityId in varchar2, employeeRecordId in varchar2)
		return boolean
		is

		v_count			number(1) := 0;
        e_exists        boolean := false;

		begin
	        select count(*)
	        into v_count
	        from krim_entity_emp_info_t
	        where entity_id = entityId and emp_rec_id=employeeRecordId;

	        if v_count = 0 then
	        	e_exists := false;
	        else
	            e_exists := true;
	        end if;
	        return e_exists;

		end doesEmplRecIdExist;

  function doesAffiliationHaveEmplRecs (entityId in varchar2, affiliationId in varchar2)
		return boolean
		is

		v_count			number(1) := 0;
        e_exists        boolean := false;

		begin
	        select count(*)
	        into v_count
	        from krim_entity_emp_info_t
	        where entity_id = entityId and entity_afltn_id = affiliationId;

	        if v_count = 0 then
	        	e_exists := false;
	        else
	            e_exists := true;
	        end if;
	        return e_exists;

		end doesAffiliationHaveEmplRecs;

	function doesAffiliationHaveStdEmplRecs (entityId in varchar2, affiliationId in varchar2)
		return boolean
		is

		v_count			number(1) := 0;
        e_exists        boolean := false;

		begin
	        select count(*)
	        into v_count
	        from krim_entity_emp_info_t
	        where entity_id = entityId and entity_afltn_id = affiliationId and emp_typ_cd='S';

	        if v_count = 0 then
	        	e_exists := false;
	        else
	            e_exists := true;
	        end if;
	        return e_exists;

		end doesAffiliationHaveStdEmplRecs;

  --rbl reviewed
	function retrieveEmailId (entityId in varchar2, emailAddress in varchar2)
		return varchar2
		is

        email_id	krim_entity_email_t.entity_email_id%TYPE;

  		begin

			select ENTITY_EMAIL_ID
	        into email_id
	        from krim_entity_email_t
	        where entity_id = entityId and email_addr = emailAddress;
          	return email_id;
      exception
        WHEN NO_DATA_FOUND THEN
          return null;

		end retrieveEmailId;


	function retrievePrimaryEmplAffId (entityId in varchar2)
		return varchar2
		is

        afltn_id				varchar2(40);

  		begin
			select ENTITY_AFLTN_ID
	        into afltn_id
	        from krim_entity_emp_info_t
	        where entity_id = entityId and prmry_ind='Y';
          	return afltn_id;
      exception
        WHEN NO_DATA_FOUND THEN
          return null;

		end retrievePrimaryEmplAffId;

	procedure testLoop(stagingRecordId in varchar2) is
		xmlMessage		XMLTYPE;
		entityId		krim_entity_t.entity_id%TYPE;
		affiliation		krim_afltn_typ_t.afltn_typ_cd%TYPE;
		org				varchar2(5);
		ldapOrg			varchar2(15);
		ldapRole		varchar2(40);
		affiliationId	krim_entity_afltn_t.entity_afltn_id%TYPE;
		psEmplRecId		varchar2(2);
		dataOrigin		varchar2(10);
		remainingAffXml 		XMLTYPE;
		c_remainingAff	number(2) := 1;
		deleteAff		boolean := false;
	    testVar     varchar2(400);
	    testOrg   varchar2(5);
	    testAff   krim_afltn_typ_t.afltn_typ_cd%TYPE;

		begin
			select xml into xmlMessage from uh_message_queue_t where id=stagingRecordId;

			select extractValue(xmlMessage, '//messageData/uhUuid') into entityId from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/org') into ldapOrg from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/role') into ldapRole from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/employeeRecord') into psEmplRecId from dual;
			select extractValue(xmlMessage, '//messageData/affiliation/dataOrigin') into dataOrigin from dual;
			select extract(xmlMessage, '//messageData/remainingAffiliations') into remainingAffXml from dual;
			dbms_output.put_line('entityId = '||entityId);
			if does_entity_exist(entityId) then
			    -- convert LDAP org and role
			    org := convertLdapOrg(ldapOrg);
			    affiliation := convertLdapRole(ldapRole);
			    dbms_output.put_line('org = '||org);
          		dbms_output.put_line('affiliation = '||affiliation);

				-- get affiliationId from the affiliation table
				affiliationId := retrieveAffiliationId(entityId, org, affiliation);
				dbms_output.put_line('affiliationId = '||affiliationId);

         		dbms_output.put_line('dataOrigin = '||dataOrigin);
				if dataOrigin = 'hris' then
					-- delete employment record tied to this affiliation with the given employeeRecordNo
					-- delete from krim_entity_emp_info_t where entity_afltn_id=affiliationId and emp_rec_id=psEmplRecId;
					dbms_output.put_line('reading remaining affilations');

	            while remainingAffXml.existsNode('//affiliation['||c_remainingAff||']') = 1 loop
	              dbms_output.put_line('org = '||remainingAffXml.extract('//affiliation[' || c_remainingAff || ']/org/text()').getStringVal());
	              dbms_output.put_line('role = '||remainingAffXml.extract('//affiliation[' || c_remainingAff || ']/role/text()').getStringVal());
	              testOrg := convertLdapOrg(remainingAffXml.extract('//affiliation[' || c_remainingAff || ']/org/text()').getStringVal());
	              testAff := convertLdapRole(remainingAffXml.extract('//affiliation[' || c_remainingAff || ']/role/text()').getStringVal());
	              dbms_output.put_line('testOrg = '||testOrg);
	              dbms_output.put_line('testAff = '||testAff);
	              c_remainingAff := c_remainingAff + 1;
	            END LOOP;

				end if;

			end if;

		end;

/*
	procedure processDelta(stagingRecordId in varchar2) is

		xmlMessage		XMLTYPE;
		entityId        krim_entity_t.entity_id%TYPE;
    	rootElementName	varchar2(40);

        operation_addPerson						varchar2(40) := 'addPerson';
        operation_modifyPersonUhUuid			varchar2(40) := 'modifyPersonUhUuid';
        operation_modifyPersonFullName			varchar2(40) := 'modifyPersonFullName';
        operation_modifyPersonSsn				varchar2(40) := 'modifyPersonSsn';
        operation_modifyPersonDob				varchar2(40) := 'modifyPersonDob';
		operation_deletePerson					varchar2(40) := 'deletePerson';
		operation_addAffiliation				varchar2(40) := 'addAffiliation';
		operation_deleteAffiliation				varchar2(40) := 'deleteAffiliation';
		operation_modifyAffiliation				varchar2(40) := 'modifyAffiliation';
		operation_addUsername					varchar2(40) := 'addUsername';
		operation_modifyUsernameUid				varchar2(40) := 'modifyUsernameUid';
		operation_modifyUsernameUhUuid			varchar2(40) := 'modifyUsernameUhUuid';
		operation_modifyUsernameAccess			varchar2(40) := 'modifyUsernameAccess';
		operation_deleteUsername				varchar2(40) := 'deleteUsername';
		operation_addEmail						varchar2(40) := 'addEmail';
		operation_deleteEmail					varchar2(40) := 'deleteEmail';
		operation_addContactInfo				varchar2(40) := 'addContactInfo';
		operation_modifyContactInfo				varchar2(40) := 'modifyContactInfo';
		operation_deleteContactInfo				varchar2(40) := 'deleteContactInfo';
		-- retrofit operations
		operation_retrofitPerson				varchar2(40) := 'retrofitPerson';
		operation_retrofitUsername				varchar2(40) := 'retrofitUsername';
		operation_retrofitEmail					varchar2(40) := 'retrofitEmail';
		operation_retrofitContactInfo			varchar2(40) := 'retrofitContactInfo';
		v_errm		varchar2(4000);

		begin
			select xml into xmlMessage from uh_message_queue_t where id=stagingRecordId;

			dbms_output.enable(buffer_size => NULL);

			select xmlMessage.getRootElement() into rootElementName from dual;
			dbms_output.put_line('Root element of this message is ' || rootElementName);

			select extractValue(xmlMessage, '/'||rootElementName||'/messageData/uhUuid') into entityId from dual;
			dbms_output.put_line('EntityId of this message is ' || entityId);

			-- determine what operation to perform
			if rootElementName = operation_addPerson then
				addPersonOperation(xmlMessage, stagingRecordId);

			elsif rootElementName = operation_modifyPersonUhUuid then
				modifyPersonUhuuidOperation(xmlMessage, stagingRecordId);

			elsif rootElementName = operation_modifyPersonFullName then
				modifyPersonFullNameOperation(xmlMessage, stagingRecordId);

			elsif rootElementName = operation_deletePerson then
				deletePersonOperation(xmlMessage, stagingRecordId);

			elsif rootElementName = operation_addAffiliation then
				addAffiliationOperation(xmlMessage, stagingRecordId);

			elsif rootElementName = operation_deleteAffiliation then
				-- deleteAffiliationOperation(xmlMessage, stagingRecordId);
				updateStagingStatusAndMessage(stagingRecordId, 'P', 'Ignoring operation '||rootElementName);

			elsif rootElementName = operation_modifyAffiliation then
				modifyAffiliationOperation(xmlMessage, stagingRecordId);

			elsif rootElementName = operation_addUsername then
				addUsernameOperation(xmlMessage, stagingRecordId);

			elsif rootElementName = operation_modifyUsernameUid then
				modifyUsernameUidOperation(xmlMessage, stagingRecordId);

			elsif rootElementName = operation_modifyUsernameUhUuid then
				modifyUsernameUhUuidOperation(xmlMessage, stagingRecordId);

			elsif rootElementName = operation_modifyUsernameAccess then
				modifyUsernameAccessOperation(xmlMessage, stagingRecordId);

			elsif rootElementName = operation_deleteUsername then
				deleteUsernameOperation(xmlMessage, stagingRecordId);

			elsif rootElementName = operation_addEmail then
				addEmailOperation(xmlMessage, stagingRecordId);

			elsif rootElementName = operation_deleteEmail then
				deleteEmailOperation(xmlMessage, stagingRecordId);

			elsif rootElementName = operation_addContactInfo then
				modifyContactInfoOperation(xmlMessage, stagingRecordId);

			elsif rootElementName = operation_modifyContactInfo then
				modifyContactInfoOperation(xmlMessage, stagingRecordId);

			elsif rootElementName = operation_deleteContactInfo then
				modifyContactInfoOperation(xmlMessage, stagingRecordId);
			--retrofit operations
			elsif rootElementName = operation_retrofitPerson then
				retrofitPersonOperation(xmlMessage, stagingRecordId);

			elsif rootElementName = operation_retrofitUsername then
				retrofitUsernameOperation(xmlMessage, stagingRecordId);

			elsif rootElementName = operation_retrofitEmail then
				retrofitEmailOperation(xmlMessage, stagingRecordId);

			elsif rootElementName = operation_retrofitContactInfo then
				retrofitContactInfoOperation(xmlMessage, stagingRecordId);
			else
				dbms_output.put_line('ignoring the ' || rootElementName || ' operation');
				updateStagingStatusAndMessage(stagingRecordId, 'P', 'Ignoring operation '||rootElementName);
			end if;
			commit;
		exception
			when others then
            v_errm := substr(SQLERRM, 1, 4000);
	        updateStagingStatusAndMessage(stagingRecordId, 'E', v_errm);
		end;
 */

 /*
    	procedure updateEntities(oldEntityId in varchar2, newEntityId in varchar2) is
	begin
		--rbl need to make sure the new entity_id has a record in krim_entity_t table before updating krim_prncpl_t table to avoid fk constraint error
		if not does_entity_exist(newEntityId)  then
			insert into krim_entity_t (entity_id, obj_id) values (newEntityId, sys_guid());
			insert into krim_entity_ent_typ_t (entity_id, obj_id, last_updt_dt, ent_typ_cd, actv_ind, ver_nbr) select newEntityId, sys_guid(), SYSDATE, ent_typ_cd, actv_ind, ver_nbr from krim_entity_ent_typ_t where entity_id = oldEntityId;
			update krim_prncpl_t set prncpl_id = newEntityId, entity_id = newEntityId, last_updt_dt=SYSDATE where entity_id = oldEntityId;
			update krim_grp_mbr_t set mbr_id = newEntityId, last_updt_dt=SYSDATE where mbr_id = oldEntityId;
			update krim_role_mbr_t set mbr_id = newEntityId, last_updt_dt=SYSDATE where mbr_id = oldEntityId;
			update krim_entity_addr_t set entity_id = newEntityId, last_updt_dt=SYSDATE where entity_id = oldEntityId;
			update krim_entity_emp_info_t set entity_id = newEntityId, emp_id = newEntityId, last_updt_dt=SYSDATE where entity_id = oldEntityId;
			update krim_entity_afltn_t set entity_id = newEntityId, last_updt_dt=SYSDATE where entity_id = oldEntityId;
			update krim_entity_bio_t set entity_id = newEntityId, last_updt_dt=SYSDATE where entity_id = oldEntityId;
			update krim_entity_ctznshp_t set entity_id = newEntityId, last_updt_dt=SYSDATE where entity_id = oldEntityId;
			update krim_entity_email_t set entity_id = newEntityId, last_updt_dt=SYSDATE where entity_id = oldEntityId;
			update krim_entity_ethnic_t set entity_id = newEntityId where entity_id = oldEntityId;
			update krim_entity_ext_id_t set entity_id = newEntityId, last_updt_dt=SYSDATE where entity_id = oldEntityId;
			update krim_entity_nm_t set entity_id = newEntityId, last_updt_dt=SYSDATE where entity_id = oldEntityId;
			update krim_entity_phone_t set entity_id = newEntityId, last_updt_dt=SYSDATE where entity_id = oldEntityId;
			update krim_entity_priv_pref_t set entity_id = newEntityId, last_updt_dt=SYSDATE where entity_id = oldEntityId;
			update krim_entity_residency_t set entity_id = newEntityId where entity_id = oldEntityId;
			update krim_entity_visa_t set entity_id = newEntityId where entity_id = oldEntityId;
		end if;
	end;
  */

	/*
	procedure updateEntities(oldEntityId in varchar2, newEntityId in varchar2, newUserName in varchar2) is
	begin
		--rbl need to make sure the new entity_id has a record in krim_entity_t table before updating krim_prncpl_t table to avoid fk constraint error
		if not does_entity_exist(newEntityId)  then
			insert into krim_entity_t (entity_id, obj_id) values (newEntityId, sys_guid());
			insert into krim_entity_ent_typ_t (entity_id, obj_id, last_updt_dt, ent_typ_cd, actv_ind, ver_nbr) select newEntityId, sys_guid(), SYSDATE, ent_typ_cd, actv_ind, ver_nbr from krim_entity_ent_typ_t where entity_id = oldEntityId;
			update krim_prncpl_t set prncpl_id = newEntityId, entity_id = newEntityId, last_updt_dt=SYSDATE where entity_id = oldEntityId;
			update krim_grp_mbr_t set mbr_id = newEntityId, last_updt_dt=SYSDATE where mbr_id = oldEntityId;
			update krim_role_mbr_t set mbr_id = newEntityId, last_updt_dt=SYSDATE where mbr_id = oldEntityId;
			update krim_entity_addr_t set entity_id = newEntityId, last_updt_dt=SYSDATE where entity_id = oldEntityId;
			update krim_entity_emp_info_t set entity_id = newEntityId, emp_id = newEntityId, last_updt_dt=SYSDATE where entity_id = oldEntityId;
			update krim_entity_afltn_t set entity_id = newEntityId, last_updt_dt=SYSDATE where entity_id = oldEntityId;
			update krim_entity_bio_t set entity_id = newEntityId, last_updt_dt=SYSDATE where entity_id = oldEntityId;
			update krim_entity_ctznshp_t set entity_id = newEntityId, last_updt_dt=SYSDATE where entity_id = oldEntityId;
			update krim_entity_email_t set entity_id = newEntityId, last_updt_dt=SYSDATE where entity_id = oldEntityId;
			update krim_entity_ethnic_t set entity_id = newEntityId where entity_id = oldEntityId;
			update krim_entity_ext_id_t set entity_id = newEntityId, last_updt_dt=SYSDATE where entity_id = oldEntityId;
			update krim_entity_nm_t set entity_id = newEntityId, last_updt_dt=SYSDATE where entity_id = oldEntityId;
			update krim_entity_phone_t set entity_id = newEntityId, last_updt_dt=SYSDATE where entity_id = oldEntityId;
			update krim_entity_priv_pref_t set entity_id = newEntityId, last_updt_dt=SYSDATE where entity_id = oldEntityId;
			update krim_entity_residency_t set entity_id = newEntityId where entity_id = oldEntityId;
			update krim_entity_visa_t set entity_id = newEntityId where entity_id = oldEntityId;
		end if;
	end;
  */
  /*
  procedure insertCachedEntity(entityId in varchar2) is
	v_prncpl_id 		krim_prncpl_t.prncpl_id%TYPE := null;
	v_prncpl_nm 		krim_prncpl_t.prncpl_nm%TYPE := null;
	v_entity_typ_cd krim_entity_ent_typ_t.ent_typ_cd%TYPE := null;
	v_first_nm 			krim_entity_nm_t.first_nm%TYPE := null;
	v_middle_nm 		krim_entity_nm_t.middle_nm%TYPE := null;
	v_last_nm 			krim_entity_nm_t.last_nm%TYPE := null;
	v_campus_cd			krim_entity_cache_t.campus_cd%TYPE := null;
	v_entity_afltn_id 	krim_entity_emp_info_t.entity_afltn_id%TYPE := null;
	v_prmry_dept_cd 	krim_entity_emp_info_t.prmry_dept_cd%TYPE := null;
	v_emp_id			krim_entity_emp_info_t.emp_id%TYPE := null;
	begin

			select prncpl_id, prncpl_nm into v_prncpl_id, v_prncpl_nm from krim_prncpl_t where entity_id = entityId and actv_ind = 'Y';
			select ent_typ_cd into v_entity_typ_cd from krim_entity_ent_typ_t where entity_id = entityId and actv_ind = 'Y';
			select first_nm, middle_nm, last_nm into v_first_nm, v_middle_nm, v_last_nm from krim_entity_nm_t where entity_id = entityId and dflt_ind = 'Y' and actv_ind = 'Y';
			select prmry_dept_cd, emp_id into v_prmry_dept_cd, v_emp_id from krim_entity_emp_info_t where entity_id = entityId and prmry_ind = 'Y' and actv_ind = 'Y';
			select entity_afltn_id into v_entity_afltn_id from krim_entity_emp_info_t where entity_id = entityId and prmry_ind = 'Y' and actv_ind = 'Y';

			if v_entity_afltn_id is not null then
				select campus_cd into v_campus_cd from krim_entity_afltn_t where entity_id = entityId and entity_afltn_id = v_entity_afltn_id and dflt_ind = 'Y' and actv_ind = 'Y';
			end if;

			insert into krim_entity_cache_t (entity_id, prncpl_id, prncpl_nm, entity_typ_cd, first_nm, middle_nm, last_nm, prsn_nm, campus_cd, prmry_dept_cd, emp_id, last_updt_ts, obj_id  ) values (entityId, v_prncpl_id, v_prncpl_nm, v_entity_typ_cd, v_first_nm, v_middle_nm, v_last_nm,  v_last_nm || ', ' || v_first_nm, v_campus_cd, v_prmry_dept_cd, v_emp_id, SYSDATE, sys_guid());
	end;
  */

  /*
  	function does_cached_entity_exist (entityId in varchar2)
			return boolean
			is

			v_count				number(1) := 0;
	        e_exists        boolean := false;


	BEGIN
	        select count(*)
	        into v_count
	        from krim_entity_cache_t
	        where krim_entity_cache_t.entity_id = entityId;

	        if v_count = 0 then
	        	  e_exists := false;
	        else
	            e_exists := true;
	        end if;
	        return e_exists;

	END does_cached_entity_exist;
  */
  ------------------------------------------------------------------------------------------------------
-- This function returns the primary dept code associated with the entityId
------------------------------------------------------------------------------------------------------

	function retrive_kim_primary_dept_code (entityId in varchar2)
			return varchar2
			is

            pdc				varchar2(40);

  	BEGIN
			select prmry_dept_cd into pdc from krim_entity_emp_info_t where entity_id=entityId and
			prmry_ind='Y' and rownum = 1;
          return pdc;
      exception
        WHEN NO_DATA_FOUND THEN
          return null;

	END retrive_kim_primary_dept_code;
  

  function doesDfltOtherEmailRecExist (entityId in varchar2)
			return boolean
			is

			v_count				number(1) := 0;
	        e_exists        boolean := false;


	BEGIN
	        select count(*)
	        into v_count
	        from krim_entity_email_t
	        where krim_entity_email_t.entity_id = entityId and dflt_ind = 'Y' and email_typ_cd = 'OTH';

	        if v_count = 0 then
	        	  e_exists := false;
	        else
	            e_exists := true;
	        end if;
	        return e_exists;

	END doesDfltOtherEmailRecExist;
  
  -- given a change in uhuuid for a user 
  -- check if there was a dflt email with type other 'OTH' for either entity
  -- if only one entity has one return that one, if both entities have one return the email that was most recently updated
  -- if neither are type of other than return the dflt email address that was most recently updated
  function getDfltEmailRecForMerge(oldEntityId in varchar2, newEntityId in varchar2)
    return varchar2
    is
      v_count				number(1) := 0;
      dflt_entity_email_id krim_entity_email_t.entity_email_id%TYPE;
  BEGIN

      select count(*) into v_count from krim_entity_email_t where entity_id in (oldEntityId, newEntityId) and dflt_ind = 'Y' and actv_ind = 'Y' and email_typ_cd='OTH';
      
      if v_count = 1 then 
       select entity_email_id into dflt_entity_email_id from krim_entity_email_t where entity_id in (oldEntityId, newEntityId) and dflt_ind = 'Y' and actv_ind = 'Y' and email_typ_cd='OTH';
       
      else
        select entity_email_id into dflt_entity_email_id from (select * from krim_entity_email_t where entity_id in (oldEntityId, newEntityId) and dflt_ind = 'Y' and actv_ind = 'Y' order by last_updt_dt desc) where rownum=1;
      end if;
      
      return dflt_entity_email_id;
            	exception
        	WHEN NO_DATA_FOUND THEN
          	return null;
      
  END getDfltEmailRecForMerge;
  
    -- given a change in uhuuid for a user 
  -- check if there was a dflt name with type other 'OTH' for either entity
  -- if only one entity has one return that one, if both entities have one return the name that was most recently updated
  -- if neither are type of other than return the dflt name that was most recently updated
  function getDfltNameRecForMerge(oldEntityId in varchar2, newEntityId in varchar2)
    return varchar2
    is
      v_count				number(1) := 0;
      dflt_entity_nm_id krim_entity_nm_t.entity_nm_id%TYPE;
  BEGIN

      select count(*) into v_count from krim_entity_nm_t where entity_id in (oldEntityId, newEntityId) and dflt_ind = 'Y' and actv_ind = 'Y' and nm_typ_cd='OTH';
      
      if v_count = 1 then 
       select entity_nm_id into dflt_entity_nm_id from krim_entity_nm_t where entity_id in (oldEntityId, newEntityId) and dflt_ind = 'Y' and actv_ind = 'Y' and nm_typ_cd='OTH';
       
      else
        select entity_nm_id into dflt_entity_nm_id from (select * from  krim_entity_nm_t where entity_id in (oldEntityId, newEntityId) and dflt_ind = 'Y' and actv_ind = 'Y' order by last_updt_dt desc) where rownum=1;
      end if;
      
      return dflt_entity_nm_id;
            	exception
        	WHEN NO_DATA_FOUND THEN
          	return null;
      
  END getDfltNameRecForMerge;
  
  -- given a change in uhuuid for a user 
  -- check if there was a dflt addr
  -- if only one entity has one return that one, if both entities have one return the address that was most recently updated
  function getDfltAddrRecForMerge(oldEntityId in varchar2, newEntityId in varchar2)
    return varchar2
    is
      v_count				number(1) := 0;
      dflt_entity_addr_id krim_entity_addr_t.entity_addr_id%TYPE;
  BEGIN

      select count(*) into v_count from krim_entity_addr_t where entity_id in (oldEntityId, newEntityId) and dflt_ind = 'Y' and actv_ind = 'Y';
      
      if v_count = 1 then 
       select entity_addr_id into dflt_entity_addr_id from krim_entity_addr_t where entity_id in (oldEntityId, newEntityId) and dflt_ind = 'Y' and actv_ind = 'Y';
       
      else
        select entity_addr_id into dflt_entity_addr_id from (select * from  krim_entity_addr_t where entity_id in (oldEntityId, newEntityId) and dflt_ind = 'Y' and actv_ind = 'Y' order by last_updt_dt desc) where rownum=1 ;
      end if;
      
      return dflt_entity_addr_id;
            	exception
        	WHEN NO_DATA_FOUND THEN
          	return null;
      
  END getDfltAddrRecForMerge;
  
    -- given a change in uhuuid for a user 
  -- check if there was a dflt phone
  -- if only one entity has one return that one, if both entities have one return the phone that was most recently updated
  function getDfltPhoneRecForMerge(oldEntityId in varchar2, newEntityId in varchar2)
    return varchar2
    is
      v_count				number(1) := 0;
      dflt_entity_phone_id krim_entity_phone_t.entity_phone_id%TYPE;
  BEGIN

      select count(*) into v_count from krim_entity_phone_t where entity_id in (oldEntityId, newEntityId) and dflt_ind = 'Y' and actv_ind = 'Y';
      
      if v_count = 1 then 
       select entity_phone_id into dflt_entity_phone_id from krim_entity_phone_t where entity_id in (oldEntityId, newEntityId) and dflt_ind = 'Y' and actv_ind = 'Y';
       
      else
        select entity_phone_id into dflt_entity_phone_id from( select * from  krim_entity_phone_t where entity_id in (oldEntityId, newEntityId) and dflt_ind = 'Y' and actv_ind = 'Y' order by last_updt_dt desc) where rownum=1;
      end if;
      
      return dflt_entity_phone_id;
            	exception
        	WHEN NO_DATA_FOUND THEN
          	return null;
      
  END getDfltPhoneRecForMerge;
  
      -- given a change in uhuuid for a user 
  -- check if there was a dflt afltn
  -- if only one entity has one return that one, if both entities have one return the afltn that was most recently updated
  function getDfltAfltnRecForMerge(oldEntityId in varchar2, newEntityId in varchar2)
    return varchar2
    is
      v_count				number(1) := 0;
      dflt_entity_afltn_id krim_entity_afltn_t.entity_afltn_id%TYPE;
  BEGIN

      select count(*) into v_count from krim_entity_afltn_t where entity_id in (oldEntityId, newEntityId) and dflt_ind = 'Y' and actv_ind = 'Y';
      
      if v_count = 1 then 
       select entity_afltn_id into dflt_entity_afltn_id from krim_entity_afltn_t where entity_id in (oldEntityId, newEntityId) and dflt_ind = 'Y' and actv_ind = 'Y';
       
      else
        select entity_afltn_id into dflt_entity_afltn_id from (select * from krim_entity_afltn_t where entity_id in (oldEntityId, newEntityId) and dflt_ind = 'Y' and actv_ind = 'Y' order by last_updt_dt desc) where rownum=1;
      end if;
      
      return dflt_entity_afltn_id;
            	exception
        	WHEN NO_DATA_FOUND THEN
          	return null;
      
  END getDfltAfltnRecForMerge;
  
  -- given a change in uhuuid for a user 
  -- check if there was a primary emp info rec
  -- if only one entity has one return that one, if both entities have one return the primary emp info rec that was most recently updated
  function getPrimEmpRecForMerge(oldEntityId in varchar2, newEntityId in varchar2)
    return varchar2
    is
      v_count				number(1) := 0;
      prim_entity_emp_id krim_entity_emp_info_t.entity_emp_id%TYPE;
  BEGIN

      select count(*) into v_count from krim_entity_emp_info_t where entity_id in (oldEntityId, newEntityId) and prmry_ind = 'Y' and actv_ind = 'Y';
      
      if v_count = 1 then 
       select entity_emp_id into prim_entity_emp_id from krim_entity_emp_info_t where entity_id in (oldEntityId, newEntityId) and prmry_ind = 'Y' and actv_ind = 'Y';
       
      else
        select entity_emp_id into prim_entity_emp_id from (select * from krim_entity_emp_info_t where entity_id in (oldEntityId, newEntityId) and prmry_ind = 'Y' and actv_ind = 'Y' order by last_updt_dt desc) where rownum=1;
      end if;
      
      return prim_entity_emp_id;
            	exception
        	WHEN NO_DATA_FOUND THEN
          	return null;
      
  END getPrimEmpRecForMerge;
  
    -- given an entityId it searches for and returns the first non-default duplicated name record if found
    -- search excludes recs with nm_typ_cd = 'OTH' since we want to preserve these entries inputed by ors helpline/user
  function getDuplicateNameRec(entityId in varchar2)
    return varchar2
    is
      dup_entity_nm_id krim_entity_nm_t.entity_nm_id%TYPE;
  BEGIN

    select entity_nm_id into dup_entity_nm_id from krim_entity_nm_t where entity_nm_id in (select a.entity_nm_id from krim_entity_nm_t a, krim_entity_nm_t b where upper(nvl(a.first_nm,'null')) = upper(nvl(b.first_nm,'null')) and upper(nvl(a.middle_nm,'null')) = upper(nvl(b.middle_nm,'null')) and upper(nvl(a.last_nm,'null')) = upper(nvl(b.last_nm,'null')) and upper(nvl(a.nm_typ_cd,'null')) = upper(nvl(b.nm_typ_cd,'null')) and upper(nvl(a.suffix_nm,'null')) = upper(nvl(b.suffix_nm,'null')) and upper(nvl(a.title_nm,'null')) = upper(nvl(b.title_nm,'null')) and a.entity_id = b.entity_id and a.entity_nm_id != b.entity_nm_id) and dflt_ind = 'N' and actv_ind = 'Y' and nm_typ_cd != 'OTH' and entity_id = entityId and rownum=1;
      
      return dup_entity_nm_id;
            	exception
        	WHEN NO_DATA_FOUND THEN
          	return null;
      
  END getDuplicateNameRec;
end;
/
