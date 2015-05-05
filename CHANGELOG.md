

##coeus-1505.10
* Create and route award placeholder as admin

  * This will avoid the placeholder ever being created as the user who is only trying to create a new award and avoid creating an editable Placeholder as well. This prevents the situation of placeholder award showing up in the users action list as an item to complete. This change also depends on the 'admin' user still existing and still having superuser privileges.
  * blackcathacker on Thu, 30 Apr 2015 15:09:07 -0700 [View Commit](../../commit/71b4839cad80c6af75da7987ee5b809b1e474c67)
* RESKC-291 - Budget summary table ui fix for fa columns
  * bsmith83 on Tue, 5 May 2015 10:10:28 -0700 [View Commit](../../commit/16be4d6e78b2d02ba4225f913cf1e925420eb7c4)
*  Accept lower case characters
  * In the S2S opportunity lookup, if user enters any lower case letters as part of the opportunity id, the system returns an error message.
  * The search field should not be case sensitive.
  * Search field is not case sensitive in 5.2.x.
  * Gayathri on Tue, 5 May 2015 10:51:09 -0700 [View Commit](../../commit/23d7d0490af7dddb180a1dc18e9e70cf5595490a)
* Avoid NullPointerException in KRMS when a narrative does not have a narrative status.
  * Travis Schneberger on Tue, 5 May 2015 14:10:01 -0400 [View Commit](../../commit/85e1c3fb8d3d566c0f1ba92759cb9d5a17966572)
* Fix character encoding in the app.
  * Create or edit award
  * In a Word document, type in: 'single quote' "double quote" long—dash
  * Cut that from Word and past in Award Title
  * Try to save it.
  * Result:
  * "Errors found in this Section: The Award Title (Title) may only consist of visible characters, spaces, or tabs."
  * And Award title is changed to: â€˜singleâ€™ â€œdoubleâ€ longâ€”dash
  * And if the user keeps saving, the system keeps transforming the characters until the maximum allowed characters are reached and an STE occurs: org.springframework.jdbc.UncategorizedSQLException: OJB operation; uncategorized SQLException for SQL []; SQL state [72000]; error code [12899]; ORA-12899: value too large for column "KCSO"."AWARD"."TITLE" (actual: 250, maximum: 200)
  * Expected Result is that KC accepts 'single quote' "double quote" long—dash.
  * Unless there is some technical reason that KC cannot accept (or transform and accept) these characters, based on how we are handling unicode.
  * Gayathri on Tue, 5 May 2015 09:53:42 -0700 [View Commit](../../commit/feb6e0869f5dd368b6f2067b53f7e355757c47a4)

##coeus-1505.9
* fixes STE when editing or adding sponsor templates

  * Maintenance > Awards > Sponsor Template > Create New.
  * Selected and added all required fields in each section:
  * -edit sponsor template - filled in all

    edit sponsor contacts - added a contact
    edit sponsor comments - added a comment
    -edit sponsor template reports - added a report type
    added a report recipient
    Tried to save; got STE

  * java.lang.RuntimeException: Unable to resolve collection property: class org.kuali.kra.award.home.AwardTemplate:templateContacts
  * org.kuali.rice.kns.service.impl.BusinessObjectAuthorizationServiceImpl.addMaintainableItemRestrictions(BusinessObjectAuthorizationServiceImpl.java:519)
  * Joe Williams on Tue, 5 May 2015 09:53:12 -0500 [View Commit](../../commit/80823d2cd8b55530839cc34c2aad91b74c3677bd)
* QuestionResolver contribution

  * https://github.com/kuali/kc/pull/1577
  * KRACOEUS-7230

  * This re-implements some changes to the QuestionResolver code that we contributed before, and which made it into KC 5.2.1 but seem to have been left out of KC 6.0. It also includes a couple of our additional improvements/fixes to the QuestionResolver functionality, such as using the module sub item key when retrieving Answer Headers, filtering retrieved Answer Headers to only include those for the latest versions of Questionnaires, and making sure the Question Seq Id comparison is properly comparing String values.
  * Travis Schneberger on Thu, 30 Apr 2015 12:08:09 -0400 [View Commit](../../commit/e8a5e39b895bfb7a425d7f4a1c1597ca8301aa57)

##coeus-1505.8
* Oracle fixes
  * Our oracle installation scripts had a few issues.
  * 1. The anonymous block was assuming there was only one record in the subawards table while there could be more than one.
  * 2. Constraint was being applied in the wrong order.
  * The errors were
  * ADD CONSTRAINT FK3_BUDGET_SUB_AWARDS
                   *
  * ERROR at line 2:
  * ORA-02298: cannot validate (MG1504.FK3_BUDGET_SUB_AWARDS) - parent keys not
  * found

  * DECLARE
*
  * ERROR at line 1:
  * ORA-01422: exact fetch returns more than requested number of rows
  * ORA-06512: at line 7
  * Gayathri on Mon, 4 May 2015 13:59:37 -0700 [View Commit](../../commit/20babdc1852e11501469e4022a466eca3d8d3759)

##coeus-1505.7
* No Changes


##coeus-1505.6
* fixes issues with printing s2s forms after proposal has been submitted to s2s

  * As a user, I need to be able to open a previously submitted PD and generate the PDF form files. I use this tool to verify the attachments I uploaded are the same as those in the sponsor's grant image, and to reference when I am preparing a resubmitted version of this research project. In the current release, I cannot generate the PDF forms of a submitted proposal. I get an STE.

  * Steps to reproduce:
  * Locate a submitted proposal (example res-demo1: Proposal #65, doc 5146)
  * Navigate to Basics > S2S Opportunity Search > Forms
  * OR Toolbar > Print > Grants.gov forms
  * Select one or all of the available s2s forms
  * use the Generate the PDF file tool

  * Expected result: the PDF file is generated and can be opened, viewed, saved, etc.
  * Actual result: STE appears onscreen.

  * java.lang.NullPointerException at org.kuali.coeus.propdev.impl.s2s.ProposalDevelopmentS2SController.printForms(ProposalDevelopmentS2SController.java:196) at org.kuali.coeus.propdev.impl.s2s.ProposalDevelopmentS2SController$$FastClassBySpringCGLIB$$5f5dd18.invoke(<generated>) at
  * Joe Williams on Mon, 4 May 2015 16:26:12 -0500 [View Commit](../../commit/0b9d8a26de48a35bd0d6ac15975f6c019df988bc)

##coeus-1505.5
* return user to the subaward document from subaward invoice if subaward invoice was opened from the subaward document

  * Create/open subaward document.
  * Use Add Invoice Button on the Financial tab to open an invoice document.
  * At close, submit, or blanket approve, the user is taken back to the KNS maintenance screen instead of the KRAD portal
  * Joe Williams on Mon, 4 May 2015 11:03:48 -0500 [View Commit](../../commit/a4d4f6cca622470bc84d6fc5e1cf955bce375cab)

##coeus-1505.4
* No Changes


##coeus-1505.3
* Custom data escape.

  * https://github.com/kuali/kc/pull/1579

  * [KRAFDBCK-10749] Escaping custom data values so single quotes don't terminate them early.

  * This fixes being able to break out of custom data values with single quotes in the KNS custom data tag (KRAD does this already).
  * Travis Schneberger on Fri, 1 May 2015 14:54:18 -0400 [View Commit](../../commit/5a966812b677c0591014020e365e15f1aa532ba4)
* Sponsor Award ID label.

  * https://github.com/kuali/kc/pull/1578
  * KRAFDBCK-9468

  * Changing "Sponsor Award" label to "Sponsor Award ID" in Negotiation.
  * Travis Schneberger on Fri, 1 May 2015 14:48:22 -0400 [View Commit](../../commit/35bfa7ebd1d70a91bc7932ab5ed5937ceb42ca85)
* Copying award results in read-only award and broken hierarchies

  * This is due to the authorization fields no being populated and only populated during docHandler. Removing this check added fixes this.
  * blackcathacker on Fri, 1 May 2015 15:28:27 -0700 [View Commit](../../commit/a250dbabb0184ea44f5a324e02e641d16278813e)

##coeus-1505.2
* No Changes


##coeus-1505.1
* format currency values with commas

  * Throughout the PD Budget, money values are formatted without any commas (or dollar signs). When populated, money value fields should be formatted with commas and decimal as for currency. And especially when you get into the millions not having the commas becomes a problem.
  * Joe Williams on Thu, 30 Apr 2015 11:24:24 -0500 [View Commit](../../commit/c5d86877ac264163546d13cb259231f96de22d37)
* KRMS - Rule Function 'Incomplete Narrative Rule' has logic reversed

  * The KC KRMS Function "Incomplete Narrative Rule" has logic reversed and is actually checking that narratives are complete.
  * Analogous Coeus function is "Complete Proposal Narratives.
  * Rather than reprogramming the logic of the KC function, the name should be changed to represent what the function actually does.

  * Change name of function to "Complete Narrative Rule"
  * Joe Williams on Thu, 30 Apr 2015 15:43:40 -0500 [View Commit](../../commit/e7cb52c9b5bd23ebf1b714c7eb4394a9033ac402)

##coeus-1504.17
* No Changes


##coeus-1504.16
* RESKC-361 avoiding a NullPointerException on proposal copy.

  * When an attachment exists such as a narrative or biography but the attachment does not have attachment data and the proposal attachment is copied with the copy attachments option then a NullPointerException occurs.  This scenario should not happen under normal circumstances and may indicate bad data in the system.
  * Travis Schneberger on Wed, 29 Apr 2015 15:18:45 -0400 [View Commit](../../commit/cf89f15c4f0ef48d29809933eb6d568a1985c462)
* RESKC-361 avoiding a resource leak that was indicated by a OJB warning message.
  * Travis Schneberger on Wed, 29 Apr 2015 15:19:27 -0400 [View Commit](../../commit/3214d06c87af20c54ff046821a1df6e3942db543)
* Omit questionnaires when related forms are not marked as included
  * Joe Williams on Wed, 29 Apr 2015 15:54:10 -0500 [View Commit](../../commit/040f6e167a863d1d8aa30e567f89d97024b69840)
* Set bounds on DevelopmentProposal lookups

  * When tested originally we were able to repo a outofmemory error and the search taking a LONG time. By setting bounds on the search always the search returns rather quickly. Further work needs to be done to resolve problems when a user has limited access to proposals as none may returned as the first 20 returned don't include any they have permission on.
  * blackcathacker on Wed, 29 Apr 2015 14:11:21 -0700 [View Commit](../../commit/5fa5fff9f459bff9db49cdc183685bef9fdca608)
* Fix unit test related to: Omit questionnaires when related forms are not marked as included
  * Travis Schneberger on Wed, 29 Apr 2015 19:38:44 -0400 [View Commit](../../commit/abac58680d59d3ca592e1740159e9b50ed651785)
* Use awardDocument updated info instead of award

  * Award Time and Money - T&M updates should not alter Award Version update timestamp and user
  * The History view should not reflect the update of the T&M change, but maintain when the award was last updated.
  * Using the awardDocument update timestamp accomplishes this.
  * blackcathacker on Wed, 29 Apr 2015 17:58:30 -0700 [View Commit](../../commit/f03dc89bc3732fbfc12ac87ead09987350ff8b84)
*  Refactoring and small unit test to exercise code
  * blackcathacker on Wed, 29 Apr 2015 20:11:52 -0700 [View Commit](../../commit/31c692bece2a7316e85c62af70b319d7f9d5ef3a)
* Award: Increase system performance on structure with many child accounts
  * Travis Schneberger on Thu, 30 Apr 2015 09:16:14 -0400 [View Commit](../../commit/790971bf9c1e21abbfb82d04b78132aafa35a9db)
* Add contributing file for public contributions
  * blackcathacker on Wed, 29 Apr 2015 10:19:55 -0700 [View Commit](../../commit/5a54613840fd271df6650d4ec9ff54180333f254)
* Review comment updates for CONTRIB file
  * blackcathacker on Thu, 30 Apr 2015 09:13:52 -0700 [View Commit](../../commit/b7605bb14d3a16800523ad86ad7da20a7f7939b9)
* Editing budget category generates STE

  * User Story: As a system administrator, I want to periodically edit budget categories, so our budget calculations are accurate

  * Steps to Reproduce:

  * 1) System Admin Portal > Maintenance > Budget Category
  * 2) Click the 'search'
  * 3) Click 'edit' next to any result
  * 4) Enter a description on the Document Overview tab and then edit the Description in the Edit Budget Category tab
  * 5) Click either 'submit' or ' blanket approve'

  * Actual results:

  * User is redirected to an Incident Report screen with the following error: Error Details: OJB operation; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column 'budgetCategoryTypeCode' in 'where clause'

  * Expected results:

  * Document should go directly to final and record should be updated with the users changes.

  * User acceptance criteria:

  * Given a system administrator has to edit a budget category, when the appropriate edits are made and submitted, then the budget category is updated with my changes.
  * Joe Williams on Thu, 30 Apr 2015 14:20:24 -0500 [View Commit](../../commit/261e859ae06470ad7a7d44c7890d80dabf98f23a)
* https://github.com/kuali/kc/pull/1584
  * KRAFDBCK-12440

  * This enhancement adds a new parameter "IP_INTELLECTUAL_PROPERTY_REVIEW_TAB_ENABLED" to determine whether or not the Intellectual Property Review tab should be shown in IP.
  * Travis Schneberger on Thu, 30 Apr 2015 15:46:24 -0400 [View Commit](../../commit/ebc0f36c251b60ca7465d727787126f601c20491)
* Fixed issue of showing latest version of award instead of Active in Awrd
  * heirarchy view.
  * vineeth on Thu, 2 Oct 2014 10:51:48 -0400 [View Commit](../../commit/4fbb3c6a02ac56af40f52424b5e1e56278943a76)
* Negotiation Unassociated Detail Inquiry Title Change fix
  * Joe Williams on Thu, 30 Apr 2015 16:32:05 -0500 [View Commit](../../commit/f42ff59a3949e71d4baf2e46105a574f47d0ff97)
* SubAward Status is incorporated instead of Award Status in Subaward tab
  * in Award Document.
  * anumole on Mon, 27 Oct 2014 17:33:28 +0530 [View Commit](../../commit/f797df76df53b03bef8fc3fd086f4792c7de8367)
*  Do not regenerate periods if periods already exist!
  * As an award budget user, when I create a rebudget (new version of posted budget with no change to authorized amount), I expect to have all the budget details from the last posted version appear in the rebudget. I should be reducing funds from the existing line items and redistributing that amount to current or new line items, confined to matching the preexisting authorized total.
  * Current (4/29/15) release is not copying the posted budget details to the rebudget; the rebudget is blank, only letting me search for an IP to link details or manually reenter all items. This is not the intended functionality, and not consistent with prior releases.
  * Steps to recreate:
  * Kuali.com demo1 site on 4/29/2015. Award *73-00001, acct id 2533529
  * As Quickstart:
  * Locate an existing award or create a new award with T&M values maintained.
  * Create an initial Award Budget, match to auth total: Actions> submit;
  * As JTester:
  * Action list: Award budget link:Actions> approve the award budget.
  * As Quickstart:
  * Open Award Budget: Actions > post.
  * Open Award > Open Budget Versions
  * To create the rebudget (new AB without change to T&M).
  * -click 'new' to create the rebudget documument
  * result:
  * The new 'rebudget' is not populated with the details entered in the prior approved/posted version.
  * Thus, all the manually entered the details (or modified pulled in PD budget details) are lost, requiring the AB admin to do all the work over again from scratch.
  * The system should be copying the budget line item details forward to the rebudget; users should only be required to shift funds (reduce some line items to rebudget to another) to meet the authorized amount.
  * Rebudget had been working in previous tests: I have done a rebudget where I put in negative value in an existing detail line item to the add that value to another or new line item.
  * Gayathri on Thu, 30 Apr 2015 17:32:16 -0700 [View Commit](../../commit/b4489c9e8c93664f560489a4c41e0df1be229683)

##coeus-1504.15
* No Changes


##coeus-1504.14
* release workflow pessimistic locks after approval

  * Approvers receive the following error message after approving proposal development document:

  * This document currently has a 160-PROPOSAL DEVELOPMENT lock owned by KR
  * Joe Williams on Tue, 28 Apr 2015 08:39:16 -0500 [View Commit](../../commit/c85a0f15a28626e69ec1bf61468d2d751afa2fb1)
* set correct update user after editing an institutional proposal

  * Edit an IP
  * The Last Update field appropriately indicates the user that is updating the record while it is open.
  * Approve
  * Close
  * Reopen the IP

  * Actual result: Last update shows as performed by "kr"
  * Expected result: Last update should display user not "kr".
  * Joe Williams on Tue, 28 Apr 2015 09:01:05 -0500 [View Commit](../../commit/05d252067cca63f76fa850383904024a17cb476c)
*  IP versioning should not copy award funding proposals over.
  * When a version of IP is linked to a version of the award, only that version needs to be linked instead of all edits of ths IP beling linked to the award. While displaying the awards linked in IP, display all the IP versions linked to awards.
  * Gayathri on Mon, 27 Apr 2015 11:28:20 -0700 [View Commit](../../commit/d7220558d85e3cdd9889898462c87baedcd797a7)
*  Moving schemaspy feature to public release.

* Moving schemaspy initialization logic and dependency info out of the grm profile
* Making schemaspy a compile-time dependency, with current version
* Adding database script with conditional insert for schemaspy auth
* Adding schemaspy instructions to readme.md
* supporting oracle in schemaspy filter and cleanup
* cleanup of poms
* fix incorrect instructions for instrumentation in readme.md
  * Travis Schneberger on Tue, 28 Apr 2015 10:57:12 -0400 [View Commit](../../commit/12995f562722e950f551547999a069b875014137)

##coeus-1504.13
*  added institutional proposal rest service
  * Joe Williams on Thu, 23 Apr 2015 12:30:06 -0400 [View Commit](../../commit/15f392cb5600d3c13017bc2840d0930f7535e6b0)
*  cleanup
  * Travis Schneberger on Wed, 15 Apr 2015 09:02:54 -0400 [View Commit](../../commit/90f296b210c720b318d9eea90379c57676f3f431)
*  make award date change transactions show up with a transaction id in the various history views and transaction print dropdown menus
  * Travis Schneberger on Wed, 15 Apr 2015 15:42:18 -0400 [View Commit](../../commit/89271da4bc2bdc7ced2643f05b5d46200dbebc66)
*  code review comments
  * Travis Schneberger on Fri, 24 Apr 2015 10:18:51 -0400 [View Commit](../../commit/090ce7405cf9ce13a1efe4704b84b456e0d88f23)
*  resequencing sql scripts, adding oracle script
  * Travis Schneberger on Fri, 24 Apr 2015 10:57:40 -0400 [View Commit](../../commit/497023f9082dd4fc2a659d04c17674cbe267e1a2)
* RESKC_352:clean up proposalHierarchyServiceImpl
  * Joe Williams on Mon, 27 Apr 2015 08:18:52 -0500 [View Commit](../../commit/18e3411729d385aaf45ef68227ee2f02c2fff205)
* Fix Wrong Proposal Status after Proposal Approved at Final Stop and Submitted to Sponsor

  * Create Proposal
  * Submit for Review
  * Do approvals
  * At final stop, approve and then automatic submission to sponsor
  * Actual Result: Status is set to 'Approved Post-Submission'
  * Expected Result: Status is set to 'Approved and Submitted'
  * Joe Williams on Mon, 27 Apr 2015 15:35:26 -0500 [View Commit](../../commit/e886230a92b6eff85f03c7c6281038af0d539cca)
*  depending on new kualico build of jasper token auth jar
  * Travis Schneberger on Mon, 27 Apr 2015 17:26:07 -0400 [View Commit](../../commit/c690912d6b92bd4e13dcfa48e2f9977a980cee9b)

##coeus-1504.12
*  added correct s2s error message and fix it link for congressional district errors

  * The Fix button for Validation error on Congressional District in the Grants.gov Errors section takes you to S2S window; it should take you to Organization Tab where error can be fixed.
  * Joe Williams on Fri, 24 Apr 2015 09:40:05 -0400 [View Commit](../../commit/e43cc0dfc627da384a9d38f44400cce0de94a106)
* Make all xmlstream beans prototype scope

  * XMLStream beans contain state which means they all need to be prototype scope to avoid potential clashes when server is under load
  * blackcathacker on Fri, 24 Apr 2015 10:03:02 -0400 [View Commit](../../commit/99f10d6cdf0244dd1d5fa52e80c334f1aea21cf7)

##coeus-1504.11
* HealthCheck now reports configured version and specific database status
  * blackcathacker on Thu, 16 Apr 2015 17:52:24 -0700 [View Commit](../../commit/0f5d4f83b24c46abeaed8f4ebcb755d47bac10a4)

##coeus-1504.10
* Fix update user and date on attachments in PropDev
  * blackcathacker on Thu, 16 Apr 2015 22:28:17 -0700 [View Commit](../../commit/4d820fb8ab3f8ec8a4b879922b8e77aaa9070ccd)
* Code review comments
  * blackcathacker on Fri, 17 Apr 2015 09:25:18 -0700 [View Commit](../../commit/998b02c569c33888517c6b390099c608af2a4a1f)
* add warning message to autocalculate periods
  * Joe Williams on Fri, 17 Apr 2015 15:32:59 -0500 [View Commit](../../commit/ba6d6074d5f63f4a3e54b722726a8f0e1cb12494)
* Remove duplicately versioned sql files
  * blackcathacker on Wed, 22 Apr 2015 16:43:11 -0400 [View Commit](../../commit/79a52c523bd8a4a0d3a0e420ead15ddc848c5313)
* Fix failing integration tests

  * Integration tests are failing as the controllers were the only things setting the upload information in the attachment. By setting the upload info during pre-persist we make sure the info is never null in integration tests or in the case of additional code paths
  * blackcathacker on Thu, 23 Apr 2015 09:30:24 -0400 [View Commit](../../commit/de24948ab4c31f1f667ec43b6c0c63fe9e23764e)

##coeus-1504.9
* Award Placeholder Document fixes

  * When the placeholder doc was created by creating an award and not copying a hierarchy the resulting document doesn't have a valid award. Specifically no sponsor code which was causing an exception. This checks for the placeholder doc before checking for the sponsor groups.
  * blackcathacker on Wed, 22 Apr 2015 11:33:56 -0400 [View Commit](../../commit/bc28f8e7a6016e15b6b550f1c9c906f1100c8422)

##coeus-1504.8
*  Cleaning up commit. Since we are overriding refreshNonUpdateableReferences anyway, we do not need to override method in rule base. Serialization changes also not needed it appears.
  * Gayathri on Wed, 22 Apr 2015 05:59:13 -0700 [View Commit](../../commit/f888b9beac9a478fa7740bb0af028fcbefa37cbd)

##coeus-1504.7
* fix rolodex persistence through sponsor maintenance document

  * Scenario:
  * 1 - Create a new Sponsor
  * 2 - Add Sponsor and Address details
  * 3 - Submit new Sponsor
  * 4 - Search for new Sponsor and open inquiry.

  * Result:
  * When the inquiry is opened you can see that a new rolodex record has been created but there is no address book information. If you try searching for the address book record, you can only copy the record, not edit it.

  * Expected Behavior:
  * 1 - The address book entry details should be saved when the sponsor record saves.
  * 2 - The address book record should be editable from the address book lookup.
  * Joe Williams on Tue, 21 Apr 2015 18:53:04 -0400 [View Commit](../../commit/03d6db21c678c2728cf9d5ca447cd648b735b891)

##coeus-1504.6
* No Changes


##coeus-1504.5
* added update user to data over history
  * Joe Williams on Fri, 17 Apr 2015 13:58:48 -0500 [View Commit](../../commit/c07944d2ec00d457defeb1ce99ccecec973c7e4a)
* added rolodex and ynq inquiry links to organization inquiry view
  * Joe Williams on Fri, 17 Apr 2015 14:59:43 -0500 [View Commit](../../commit/c7cf6e478b5d2a48414ed0ef7c91c94b3495317e)
* Oracle scripts

  * Bring full oracle scripts renamed and numbered back into the project
  * blackcathacker on Tue, 21 Apr 2015 09:15:55 -0400 [View Commit](../../commit/4df62ebd31a478844448a5e7d0a250953058cfc4)
* Allow sponsor code to be smaller than 6 characters

  * A customer ended up with sponsor codes shorter than 6 characters and since it was allowed by the database and a minimal functional change the sponsor code can now be any alphanumeric up to 6 characters
  * blackcathacker on Tue, 21 Apr 2015 16:02:18 -0400 [View Commit](../../commit/0cc7dfba835c8343524a797e540d6d65871ee780)

##coeus-1504.4
* kc-sql version update
  * blackcathacker on Fri, 17 Apr 2015 21:48:12 -0700 [View Commit](../../commit/e0669b0a138ac093a19a33dde380a4f534762e3c)

##coeus-1504.3
* KRAFDBCK-10988: Adding totals to Negotiation Activity sub-tabs
  * rojlarge on Tue, 7 Apr 2015 18:39:30 -0400 [View Commit](../../commit/c0c22a523dc0f8e0c7361343eb0e03af5a5d4b75)

##coeus-1504.2
*  Adding 1504 mysql and oracle release scripts
  * Gayathri on Fri, 17 Apr 2015 15:23:03 -0700 [View Commit](../../commit/cc29093c62e019bb200c83a02d8088137a407be5)
* renaming files and removing temp files
  * Gayathri on Fri, 17 Apr 2015 15:45:36 -0700 [View Commit](../../commit/bcb851a18f8bbde30d3df87fa1bc4e083debd1c3)
* Documentation for public release and build
  * blackcathacker on Fri, 17 Apr 2015 16:04:52 -0700 [View Commit](../../commit/80748ea9cb76f523f7d50f4a6b975aec7c96263f)
*  Renaming log files to right version
  * Gayathri on Fri, 17 Apr 2015 16:19:58 -0700 [View Commit](../../commit/aaa91348c850f74e22f028619b714954ccb15c6b)

##coeus-1504.1
* moving away from sem ver
  * Travis Schneberger on Fri, 17 Apr 2015 18:30:33 -0400 [View Commit](../../commit/d0596b11edec6e28577a48b08f26ad065304191f)

##coeus-6.0.2.27
* updating dependencies and plugins in pom file
  * Travis Schneberger on Thu, 16 Apr 2015 19:48:55 -0400 [View Commit](../../commit/56974b1f0ed5bd1440569d2ad0b6fbb307e0557b)

##coeus-6.0.2.26
* populated budget formulated costs from unit formulated cost tables
  * Joe Williams on Wed, 15 Apr 2015 09:46:54 -0500 [View Commit](../../commit/47bdb61e409299b37e172b931d8970b6846c435b)
* allow printing of sponsor form when view only
  * Joe Williams on Wed, 15 Apr 2015 13:03:16 -0500 [View Commit](../../commit/d4321526420059f0232fb283391ebb2461d34c03)
* fix report tracking to hide update user and timestamp when date entry hasn't been entered
  * Joe Williams on Thu, 16 Apr 2015 12:20:32 -0500 [View Commit](../../commit/fd64b8d58279084f53791420b1746ae10b73b205)

##coeus-6.0.2.25
* No Changes


##coeus-6.0.2.24
*  upgrade rice
  * Joe Williams on Thu, 16 Apr 2015 08:22:34 -0500 [View Commit](../../commit/8bae0b0bdc31c5833a25aa5f7f42a92c44e8a569)

##coeus-6.0.2.23
* Move rest service dependency out of grm profile

  * The moo and mvel dependencies are always required so move them into the main dependency section
  * blackcathacker on Wed, 15 Apr 2015 17:59:49 -0700 [View Commit](../../commit/985d7f88218dd871624148d4faa2ec84ca152d55)

##coeus-6.0.2.22
* Update rice version
  * Joe Williams on Wed, 15 Apr 2015 17:03:38 -0500 [View Commit](../../commit/bf02c41a3b57ecc550aaf04ee416e959c5debf00)

##coeus-6.0.2.21
*  rice upgrade
  * Gayathri on Wed, 15 Apr 2015 08:37:43 -0700 [View Commit](../../commit/95dc07436f1afb7fcd8d5414ca83801fd943e591)

##coeus-6.0.2.20
*  fixing date calculation
  * Travis Schneberger on Tue, 14 Apr 2015 09:13:19 -0400 [View Commit](../../commit/8d546ff3ffc857bc2507d8f6fe0390a4a26905ff)

##coeus-6.0.2.19
*  moving rejected docs to saved state
  * Gayathri on Mon, 13 Apr 2015 10:34:44 -0700 [View Commit](../../commit/8e741a6bcc9030cd8f0883138b01026eb181f91c)
* review comments
  * Gayathri on Mon, 13 Apr 2015 16:55:43 -0700 [View Commit](../../commit/a1a7ed197223235358f56d9aadbbd8947a77c04f)

##coeus-6.0.2.18
* Update Rice Version
  * blackcathacker on Mon, 13 Apr 2015 14:07:58 -0700 [View Commit](../../commit/aa01f02f4b30a4cef77f9bfe333829eabb27275c)

##coeus-6.0.2.17
*  PSU Award Summary Service
  * blackcathacker on Wed, 18 Feb 2015 15:40:02 -0800 [View Commit](../../commit/a35bf7b3a4d80385e0ccbcdc2cd712bfe35ad371)
* Code review comments and copyright notices
  * blackcathacker on Mon, 13 Apr 2015 13:04:01 -0700 [View Commit](../../commit/c829857a50660bd18ad5a996665f937fdd02bd13)

##coeus-6.0.2.16
* fix people flow member require validation on add line on submit
  * Joe Williams on Mon, 13 Apr 2015 11:11:00 -0500 [View Commit](../../commit/733b6f6a9cd23d536427815261db896f9b2756f5)

##coeus-6.0.2.15
*  fixing key person unit validation
  * Travis Schneberger on Mon, 13 Apr 2015 11:07:51 -0400 [View Commit](../../commit/74065cd3dc7c96c0216ec2235fd8ae2e72d3575a)

##coeus-6.0.2.14
* make personnel details viewable in view mode
  * Joe Williams on Fri, 10 Apr 2015 13:33:55 -0500 [View Commit](../../commit/4f6ab6dd0ef5b843815a615bd91573d9a834c62a)
* make non personnel budget line items detail viewable when budget is readOnly
  * Joe Williams on Fri, 10 Apr 2015 10:44:30 -0500 [View Commit](../../commit/858e55f9b573132f6673f5d4d4c7ddb5f7d32f6e)

##coeus-6.0.2.13
*  upgrading rice
  * Gayathri on Fri, 10 Apr 2015 09:14:14 -0700 [View Commit](../../commit/814d625c456c7c9c12a1dc8d29d0103120264169)
* remove narrative locking region
  * Joe Williams on Fri, 10 Apr 2015 12:38:06 -0500 [View Commit](../../commit/a15fc1881b9d22be5da065cd6e1bf430ab9c4179)
* Jasper Report Links
  * blackcathacker on Fri, 10 Apr 2015 12:41:03 -0700 [View Commit](../../commit/dec341bf9aed3ce0c2f175760636c453e1d0da46)

##coeus-6.0.2.12
* No Changes


##coeus-6.0.2.11
* add warning message when adding a narrative type to the child that is already on the parent
  * Joe Williams on Thu, 9 Apr 2015 09:19:57 -0500 [View Commit](../../commit/f7ddacadd29371782ffa032c7d992cb3edb1464a)
* removed duplicate headers on krms and people flow documents
  * Joe Williams on Fri, 10 Apr 2015 10:08:02 -0500 [View Commit](../../commit/926204a501f784b198b07b46fe70fa887bcef87d)

##coeus-6.0.2.10
* Make PD unit number search field uniform and not restricted
  * blackcathacker on Thu, 9 Apr 2015 22:06:18 -0700 [View Commit](../../commit/f9021255f95f95f159989f5a831eb6209f5c3ab4)

##coeus-6.0.2.9
*  Award authorization issue
  * Gayathri on Thu, 9 Apr 2015 12:11:36 -0700 [View Commit](../../commit/0df17791f67164c47d6b08e4130f8ec49b973c1f)

##coeus-6.0.2.8
* fixed lookups on people flow members section
  * Joe Williams on Thu, 9 Apr 2015 13:42:24 -0500 [View Commit](../../commit/d42d12a23f0eb631ca324174af5702bd26ac670d)

##coeus-6.0.2.7
* make personnel budget line items details viewable when budget is readOnly
  * Joe Williams on Thu, 9 Apr 2015 12:52:40 -0500 [View Commit](../../commit/436b252792a8d6bed66678b6c7b3a95dcabb5b0c)

##coeus-6.0.2.6
*  Budget STE fix
  * Gayathri on Wed, 8 Apr 2015 10:55:26 -0700 [View Commit](../../commit/ba7600fabcee66f9673d8c09fcbddbbc40a65b40)

##coeus-6.0.2.5
*  Add fyi and acknowledge to action list.
  * Gayathri on Wed, 8 Apr 2015 09:21:18 -0700 [View Commit](../../commit/3f8bfb1d44a959edd717a52544ddac1ac492f104)

##coeus-6.0.2.4
* Fix sql to avoid primary key conflicts
  * blackcathacker on Tue, 7 Apr 2015 20:33:23 -0700 [View Commit](../../commit/22a4b96beaed5dc64aba04825f751192094f0e56)

##coeus-6.0.2.3
* Fix attachment problem by never doing orphanRemoval
  * blackcathacker on Tue, 7 Apr 2015 16:50:30 -0700 [View Commit](../../commit/ea2f774303c1b476579ebf90155be07e334a4108)
* Fix integration test
  * blackcathacker on Tue, 7 Apr 2015 18:02:21 -0700 [View Commit](../../commit/d056987b4666d51b996e984854df5904e6381370)

##coeus-6.0.2.2
* rename asdf custrom attribute group name to additional data
  * Joe Williams on Mon, 6 Apr 2015 16:07:16 -0500 [View Commit](../../commit/0c6c27bb02bb3c7543f7338be56f653769fe6665)
* apply unit agenda to all units in hierarchy
  * Joe Williams on Mon, 6 Apr 2015 15:06:51 -0500 [View Commit](../../commit/06939b293f62441f7acf74f549439ec4be32d81b)
*  making PeopleFlow lookup not open in an iframe
  * Travis Schneberger on Tue, 7 Apr 2015 10:47:00 -0400 [View Commit](../../commit/883318884f03f90eab034b83b01f53967b9c2715)
* fix broken test
  * Joe Williams on Tue, 7 Apr 2015 09:57:15 -0500 [View Commit](../../commit/1f8f4ffe0e61702bc04d00f1e41741cb2fa7d259)
*  displaying sponsor award id not sponsor code
  * Travis Schneberger on Tue, 7 Apr 2015 16:23:56 -0400 [View Commit](../../commit/3a5288b201bc8f7540f332c5e6215e3b19a95fe2)
*  nsf cover page 1-6
  * Gayathri on Wed, 25 Mar 2015 12:22:35 -0700 [View Commit](../../commit/b00fdc8f2e00e08da81104485e8502f53b299f4e)
*  updating pom, fixing db scripts that were changed as a part of a code review
  * Travis Schneberger on Tue, 7 Apr 2015 16:58:28 -0400 [View Commit](../../commit/d468f72bc90cdc47f8266e19b7c355fbef075d5b)

##coeus-6.0.2.1
* release process
  * Travis Schneberger on Mon, 6 Apr 2015 21:36:12 -0400 [View Commit](../../commit/7313e436dac0e1dec0d339a982bd13678937e935)

##coeus-6.0.2.0
* KRACOUES-8764:fix additional equipment system generated attachments
  * Joe Williams on Mon, 2 Feb 2015 10:21:53 -0600 [View Commit](../../commit/36480a289ba551da181442a5dc052c9fecb809dd)
* KRACOEUS-8775: next iteration
  * Travis Schneberger on Mon, 2 Feb 2015 17:41:56 -0500 [View Commit](../../commit/154a686f9289c09ae865376763d561c11e068038)
* KRACOEUS-8775: setting the s2sgen lib to next iteration
  * Travis Schneberger on Mon, 2 Feb 2015 17:44:29 -0500 [View Commit](../../commit/defd2f9b95e391079eb3b1f681594d2aeffd0e3d)
* KRACOEUS-8784:make sub award line items non editable from periods page
  * Joe Williams on Tue, 3 Feb 2015 14:23:22 -0600 [View Commit](../../commit/7ea052db65075ce4d3958d30df2fa1005e53a7f4)
* KRACOEUS-8760:moved version and sql info to footer
  * Joe Williams on Fri, 30 Jan 2015 16:30:35 -0600 [View Commit](../../commit/d9b846d119222ba6ead2697277fd63d815b62a5e)
* KRACOEUS-8776: lic header issue
  * Travis Schneberger on Tue, 3 Feb 2015 17:01:14 -0500 [View Commit](../../commit/b29c8f46fd05b1a958ba23b4dbac3febf1025771)
* KRACOEUS-8786:fixed subaward close out date constraint issues
  * Joe Williams on Wed, 4 Feb 2015 08:31:23 -0600 [View Commit](../../commit/b0e5a9abcf8053371659df415c8082422671b645)
* KRACOEUS-8783:allow routing actions for proposals accessed through proposal search
  * Joe Williams on Wed, 4 Feb 2015 09:43:34 -0600 [View Commit](../../commit/bd780608c82c5dcda20fdc637e4cd9dc239c8cfb)
* KRACOEUS-7863
  * Implement Budget Non-Personnel Costs - Formulated Costs
  * rmancher on Wed, 4 Feb 2015 15:54:32 -0500 [View Commit](../../commit/ef3d3ba03a72a3b0596d4dbce870a41a9fa7ee45)
* KRACOEUS-8773: fixing a NPE
  * Travis Schneberger on Wed, 4 Feb 2015 16:07:40 -0500 [View Commit](../../commit/0f6e2b771e5e2d9bfb95401cbb60e75a64d7ccfc)
* KRACOEUS-8789:subaward sync from pdf refreshes details section
  * Joe Williams on Wed, 4 Feb 2015 16:39:15 -0600 [View Commit](../../commit/b20d724872eda17cc19650ce53ee3f5ceb74ecd4)
* CX Version Changes -- Primarily Bug Fixes

  * g diff -w kc-release-5_2_1-tag..rsmart-5.2.1 --stat=999 >! git_diff_kc-release-5_2_1-tag..rsmart-5.2.1_stat.txt

  * Removed all files we do not want to consider for merge

  * normalize changed files we want to merge

  * Create patches for kc-release-5_2_1-tag..rsmart-5.2.1 diffs

  * map relocated path for files that could not be automatically matched

  * Added missing patches from: Create patches for kc-release-5_2_1-tag..rsmart-5.2.1 diffs

  * removed trailing space from patch file

  * basic patch rewriting script ready

squashed some path rewriting logic bugs; smoke testing LGTM

  * ./rewrite_patches.rb

  * add CX_PORTING.md

  * Manually merged `cb38ce9` KualiCo pom.xml changes.

  * Conflicts:
	pom.xml

  * updated CX_PORTING for cx_patches/pom.xml.patch

  * applied cx_patches/src/main/config/kew/xml/2/AwardDocument.xml.patch

  * cx_patches/src/main/config/sql/current/5.2.1/dml/KR_DML_01_KRACOEUS-6640_B000.sql.patch

  * cx_patches/src/main/config/sql/current/5.2.1/sequences/KC_SEQ_S2S_USER_ATTACHED_FORM_ID.sql.patch

  * cx_patches/src/main/config/sql/current/5.2.1/sequences/KC_SEQ_S2S_USER_ATTD_FORM_ATT_ID.sql.patch

  * cx_patches/src/main/config/sql/current_mysql/0.0.0/dml/KR_DML_01_KCINFR-1018_B000.sql.patch

  * cx_patches/src/main/config/sql/current_mysql/5.2.1/dml/KR_DML_01_KRACOEUS-6640_B000.sql.patch

  * cx_patches/src/main/config/sql/current_mysql/5.2.1/sequences/KC_SEQ_S2S_USER_ATTACHED_FORM_ATT_ID.sql.patch

  * cx_patches/src/main/config/sql/current_mysql/5.2.1/sequences/KC_SEQ_S2S_USER_ATTACHED_FORM_ID.sql.patch

  * cx_patches/src/main/config/sql/current_mysql/5.2.1/tables/KC_TBL_CONTACT_USAGE.sql.patch
  * Fixes: Caused by: java.sql.SQLException: Can't create table `coeus`.`#sql-c8e0_78` (errno: 150 "Foreign key constraint is incorrectly formed")
  * Caused by: com.googlecode.flyway.core.command.FlywaySqlScriptException: Error executing statement at line 3: ALTER TABLE CONTACT_USAGE

  * cx_patches/src/main/config/sql/RELEASE-SCRIPTS/KC_Install.sh.patch

  * cx_patches/src/main/java/com/rsmart/kuali/kra/workflow/UnitAdministratorRoleAttribute.java.patch

  * cx_patches/src/main/java/org/kuali/kra/award/contacts/AwardSponsorContactAuditRule.java.patch
  * Adding rule to check for Country Code. If a country code is not found, an error is reported and the user is taken to the Award Contacts tab to handle it.
  * fixes rSmart/issues#448

  * cx_patches/src/main/java/org/kuali/kra/award/document/authorization/AwardDocumentAuthorizer.java.patch

  * cx_patches/src/main/java/org/kuali/kra/award/home/Award.java.patch

  * cx_patches/src/main/java/org/kuali/kra/award/home/AwardAmountInfo.java.patch
  * Default all award amount info amounts to zero when null.
  * Fixes rSmart/issues#503

  * cx_patches/src/main/java/org/kuali/kra/award/lookup/AwardLookupableHelperServiceImpl.java.patch
  * Ignore missing person/entity for https://github.com/rSmart/issues/issues/179

  * cx_patches/src/main/java/org/kuali/kra/award/printing/xmlstream/AwardBaseStream.java.patch
  * Make rolodex country code optional for Award printing.
  * fixes rSmart/issues#448

  * cx_patches/src/main/java/org/kuali/kra/award/web/struts/action/AwardActionsAction.java.patch
  * Adding rule to check for Country Code. If a country code is not found, an error is reported and the user is taken to the Award Contacts tab to handle it.

  * fixes rSmart/issues#448

  * cx_patches/src/main/java/org/kuali/kra/award/web/struts/action/AwardHomeAction.java.patch
  * CCU STE on Document #9532
  * java.lang.NullPointerException
        at org.kuali.kra.award.web.struts.action.AwardHomeAction.save(AwardHomeAction.java:240)
  * https://github.com/rSmart/issues/issues/468

  * Adding null checks to fix NPE.

  * fixes rSmart/issues#270

  * cx_patches/src/main/java/org/kuali/kra/bo/KcPerson.java.patch
  * Return a new empty KcPerson from fromEntityAndPersonId when entity is null.

  * cx_patches/src/main/java/org/kuali/kra/bo/Rolodex.java.patch

  * Commit: edf06332fe7d3cb3940e9353434523fab5d25033
  * Date:   2014-06-30 11:43:17 -0700 (5 months ago)

  * Patching fix from changeset 19864. This patch adds back the isSponsorAddress property to Rolodex. When isSponsorAddress is
  * "N", the behavior changes so the Rolodex reflects the Organization address. For this, organizations had to be added to
  * Rolodex. The maintainable also needed to be modified to recognize isSponsorAddress functionality.

  * fixes rSmart/issues#201

  * cx_patches/src/main/java/org/kuali/kra/bo/RolodexMaintainableImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/bo/UnitAdministrator.java.patch

  * cx_patches/src/main/java/org/kuali/kra/budget/printing/xmlstream/BudgetBaseStream.java.patch

  * cx_patches/src/main/java/org/kuali/kra/budget/printing/xmlstream/BudgetCumilativeXmlStream.java.patch

  * cx_patches/src/main/java/org/kuali/kra/budget/printing/xmlstream/BudgetSummaryXmlStream.java.patch

  * cx_patches/src/main/java/org/kuali/kra/budget/printing/xmlstream/IndustrialBudgetXmlStream.java.patch

  * cx_patches/src/main/java/org/kuali/kra/budget/web/struts/action/BudgetAction.java.patch
  * java.lang.NullPointerException
        at org.kuali.kra.budget.web.struts.action.BudgetAction.execute(BudgetAction.java:189)
  * https://github.com/rSmart/issues/issues/417

  * cx_patches/src/main/java/org/kuali/kra/coi/disclosure/CoiDisclosureServiceImpl.java.patch
  * Ignore missing person/entity from org.kuali.kra.protocol.ProtocolActionBase.permissions(ProtocolActionBase.java:123)

  * cx_patches/src/main/java/org/kuali/kra/coi/notification/CoiNotificationRoleQualifierServiceImpl.java.patch
  * java.lang.NullPointerException
    at org.kuali.kra.coi.notification.CoiNotificationRoleQualifierServiceImpl.getRoleQualifierValue(CoiNotificationRoleQualifierServiceImpl.java:47)
    at org.kuali.kra.common.notification.NotificationContextBase.populateRoleQualifiers(NotificationContextBase.java:85)
    at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.getRoleRecipients(KcNotificationServiceImpl.java:434)
    at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.getNotificationRecipients(KcNotificationServiceImpl.java:352)
    at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.fillinNotificationObject(KcNotificationServiceImpl.java:623)
    at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.sendNotificationAndPersist(KcNotificationServiceImpl.java:638)
    at org.kuali.kra.coi.personfinancialentity.FinancialEntityAction.sendNotificationAndPersist(FinancialEntityAction.java:444)
    at org.kuali.kra.coi.personfinancialentity.FinancialEntityEditNewAction.submit(FinancialEntityEditNewAction.java:60)

  * Fixes https://github.com/rSmart/issues/issues/377

  * cx_patches/src/main/java/org/kuali/kra/coi/notification/FinancialEntityNotificationRenderer.java.patch
  * java.lang.NullPointerException
    at org.kuali.kra.coi.notification.FinancialEntityNotificationRenderer.getDefaultReplacementParameters(FinancialEntityNotificationRenderer.java:56)
  * Fixes https://github.com/rSmart/issues/issues/377

  * cx_patches/src/main/java/org/kuali/kra/coi/service/impl/CoiMessagesServiceImpl.java.patch
  * When setting ANNUAL_DISCLOSURE_RENEWAL_DATE system parameter, the year is not parsed correctly.
  * https://github.com/rSmart/issues/issues/470

  * Fixes java.lang.NullPointerException in CoiMessagesServiceImpl

  * java.sql.Timestamp.compareTo(Timestamp.java:477)
  * java.sql.Timestamp.before(Timestamp.java:447)
  * org.kuali.kra.coi.service.impl.CoiMessagesServiceImpl.getMessages(CoiMessagesServiceImpl.java:75)

  * Fixes https://github.com/rSmart/issues/issues/240

  * cx_patches/src/main/java/org/kuali/kra/committee/lookup/CommitteeLookupableHelperServiceImpl.java.patch
  * Adding fix so that iacuc committees now use proper url for resume edit

  * fixes rSmart/issues#201

  * cx_patches/src/main/java/org/kuali/kra/common/committee/bo/CommitteeBase.java.patch
  * java.lang.NullPointerException
  * at org.kuali.kra.common.committee.bo.CommitteeBase.compareTo(CommitteeBase.java:356)
  * at org.kuali.kra.common.committee.bo.CommitteeBase.compareTo(CommitteeBase.java:38)
  * Fixes https://github.com/rSmart/issues/issues/335

  * cx_patches/src/main/java/org/kuali/kra/common/committee/lookup/CommitteeLookupableHelperServiceImplBase.java.patch
  * Adding fix so that iacuc committees now use proper url for resume edit

  * fixes rSmart/issues#201

  * cx_patches/src/main/java/org/kuali/kra/common/committee/meeting/CommitteeScheduleAttachmentsBase.java.patch

  * cx_patches/src/main/java/org/kuali/kra/common/committee/meeting/MeetingActionBase.java.patch
  * NPE When Accessing Meeting Actions Tab on IRB Schedule
  * https://github.com/rSmart/issues/issues/449

  * cx_patches/src/main/java/org/kuali/kra/common/committee/meeting/MeetingActionsActionBase.java.patch
  * java.lang.ArrayIndexOutOfBoundsException: Array index out of range: 0 at java.util.Vector.get(Vector.java:744)
  * at org.kuali.kra.common.committee.meeting.MeetingActionsActionBase.viewAgenda(MeetingActionsActionBase.java:205)
  * Fixes https://github.com/rSmart/issues/issues/307

  * cx_patches/src/main/java/org/kuali/kra/common/committee/notification/AgendaCreatedNotificationRenderer.java.patch

  * cx_patches/src/main/java/org/kuali/kra/common/notification/service/impl/KcNotificationServiceImpl.java.patch
  * Fixes https://github.com/rSmart/issues/issues/377

  * org.kuali.rice.core.api.exception.RiceIllegalArgumentException: principalName was blank
        at org.kuali.rice.kim.impl.identity.IdentityServiceImpl.incomingParamCheck(IdentityServiceImpl.java:1566)
        at org.kuali.rice.kim.impl.identity.IdentityServiceImpl.getEntityByPrincipalName(IdentityServiceImpl.java:125)
  * ...
        at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.getRecipientEmailAddresses(KcNotificationServiceImpl.java:542)
        at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.sendEmailNotification(KcNotificationServiceImpl.java:524)
        at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.sendNotification(KcNotificationServiceImpl.java:184)
        at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.sendNotificationAndPersist(KcNotificationServiceImpl.java:630)
        at org.kuali.kra.coi.personfinancialentity.FinancialEntityAction.sendNotificationAndPersist(FinancialEntityAction.java:444)
        at org.kuali.kra.coi.personfinancialentity.FinancialEntityEditNewAction.submit(FinancialEntityEditNewAction.java:60)

  * Workaround https://github.com/rSmart/issues/issues/158 ; added try/catch to be more forgiving.

  * cx_patches/src/main/java/org/kuali/kra/iacuc/actions/IacucProtocolActionsAction.java.patch

  * cx_patches/src/main/java/org/kuali/kra/iacuc/committee/lookup/IacucCommitteeLookupableHelperServiceImpl.java.patch
  * Adding fix so that iacuc committees now use proper url for resume edit

  * fixes rSmart/issues#201

  * cx_patches/src/main/java/org/kuali/kra/iacuc/protocol/IacucProtocolProtocolAction.java.patch
  * Adding fixes specific to IACUC

  * fixes rSmart/issues#299

  * cx_patches/src/main/java/org/kuali/kra/institutionalproposal/contacts/InstitutionalProposalPerson.java.patch

  * cx_patches/src/main/java/org/kuali/kra/institutionalproposal/contacts/InstitutionalProposalProjectPersonnelBean.java.patch
  * UMC - NPE when editing a new Institutional Proposal.
  * https://github.com/rSmart/issues/issues/492

  * cx_patches/src/main/java/org/kuali/kra/institutionalproposal/proposallog/ProposalLogMergeAction.java.patch
  * [SO-27] The session is clearing out the value of the proposal log number before the action can handle it. I switched to by more synchronous
  * using request parameters instead of session data. This is more intuitive to how lookups work anyway. I also added a null check just in case.

  * cx_patches/src/main/java/org/kuali/kra/institutionalproposal/proposallog/service/impl/ProposalLogServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/institutionalproposal/service/impl/InstitutionalProposalLookupableHelperServiceImpl.java.patch
  * [SO-27] The session is clearing out the value of the proposal log number before the action can handle it. I switched to by more synchronous
  * using request parameters instead of session data. This is more intuitive to how lookups work anyway. I also added a null check just in case.

  * STE when PD "Submit to Sponsor"
  * java.lang.NullPointerException
  * at org.kuali.kra.institutionalproposal.service.impl.InstitutionalProposalServiceImpl.doBudgetDataFeed(InstitutionalProposalServiceImpl.java:539)
  * Prop Dev submitted. (PD 104)
  * approvals bypassed.
  * try to submit to sponsor as admin.
  * get the following STE.
  * this has happened more than once, but not every time.
  * http://jira.s2.rsmart.com:8080/browse/SO-32

  * cx_patches/src/main/java/org/kuali/kra/institutionalproposal/service/impl/InstitutionalProposalServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/irb/actions/IrbProtocolActionRequestServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/irb/actions/notification/ProtocolWithdrawnNotificationRenderer.java.patch
  * Adding new notification renderer to handle reason and action date types. I tried adding unit tests for this, but they're not working. I'll have to commit those at a later date once I get them to work.

  * fixes rsmart/issues#414

  * cx_patches/src/main/java/org/kuali/kra/irb/actions/ProtocolProtocolActionsAction.java.patch

  * cx_patches/src/main/java/org/kuali/kra/irb/protocol/ProtocolProtocolAction.java.patch

  * cx_patches/src/main/java/org/kuali/kra/negotiations/notifications/NegotiationNotificationRenderer.java.patch

  * cx_patches/src/main/java/org/kuali/kra/proposaldevelopment/document/authorizer/NarrativeReplaceAuthorizer.java.patch

  * cx_patches/src/main/java/org/kuali/kra/proposaldevelopment/document/authorizer/PersonnelAttachmentReplaceAuthorizer.java.patch

  * cx_patches/src/main/java/org/kuali/kra/proposaldevelopment/notification/ProposalDevelopmentNotificationRenderer.java.patch

  * cx_patches/src/main/java/org/kuali/kra/proposaldevelopment/rules/ProposalDevelopmentDocumentRule.java.patch

  * cx_patches/src/main/java/org/kuali/kra/proposaldevelopment/service/impl/ProposalCopyServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/proposaldevelopment/web/struts/form/ProposalDevelopmentForm.java.patch

  * cx_patches/src/main/java/org/kuali/kra/protocol/actions/ActionHelperBase.java.patch

  * cx_patches/src/main/java/org/kuali/kra/protocol/notification/ProtocolReplacementParameters.java.patch

  * cx_patches/src/main/java/org/kuali/kra/questionnaire/answer/QuestionnaireAnswerServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/s2s/service/impl/S2SUtilServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/service/impl/KraAuthorizationServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/subaward/web/struts/action/SubAwardAction.java.patch

  * cx_patches/src/main/java/org/kuali/kra/subaward/web/struts/action/SubAwardActionsAction.java.patch

  * cx_patches/src/main/java/org/kuali/kra/subawardReporting/printing/service/impl/SubAwardPrintingServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/subawardReporting/printing/xmlstream/SubAwardFDPPrintXmlStream.java.patch

  * cx_patches/src/main/java/org/kuali/kra/timeandmoney/transactions/TransactionRuleImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/web/filter/PerformanceLoggingFilter.java.patch

  * cx_patches/src/main/java/org/kuali/kra/web/struts/action/KraTransactionalDocumentActionBase.java.patch

  * cx_patches/src/main/resources/ApplicationResources.properties.patch

  * cx_patches/src/main/resources/org/kuali/kra/CoreSpringBeans.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/Award.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/AwardPerson.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/Budget.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/CustReportDetails.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/CustReportType.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/CustRptDefaultParms.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/CustRptTypeDocument.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/DevelopmentProposal.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/docs/RolodexMaintenanceDocument.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/docs/SponsorMaintenanceDocument.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/IacucProtocol.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/InstitutionalProposal.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/InstitutionalProposalPerson.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/LookupableDevelopmentProposal.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/Negotiation.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/NegotiationActivity.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/NegotiationUnassociatedDetail.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/ProposalDevelopmentDocument.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/Protocol.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/Rolodex.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/Sponsor.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/SponsorSpecial.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/SubAward.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/SubAwardCopyRightsType.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/SubAwardCostType.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/SubAwardFundingSource.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/printing/stylesheet/AwardNotice.xsl.patch

  * cx_patches/src/main/resources/org/kuali/kra/printing/stylesheet/BudgetSummaryTotalPage.xsl.patch

  * cx_patches/src/main/resources/org/kuali/kra/printing/stylesheet/FDP_Modification_Template.xsl.patch

  * cx_patches/src/main/resources/org/kuali/kra/printing/stylesheet/FDP_Template_Agreement.xsl.patch

  * cx_patches/src/main/resources/org/kuali/kra/RiceOverridesSpringBeans.xml.patch

  * cx_patches/src/main/resources/repository.xml.patch

  * begin phase 2 of CX merges

  * cx_patches/src/main/config/sql/RELEASE-SCRIPTS/KC_Install.sh.patch pass 2

  * cx_patches/src/main/java/com/rsmart/kuali/kra/workflow/UnitAdministratorRoleAttribute.java.patch

  * updated CX_PORTING for files that cannot be found in pass 2

  * updated CX_PORTING after pass 2 TODO inspection

  * [ERROR] /Develop/Kuali/svn_kuali_org_kc/coeus-impl/src/main/java/org/kuali/coeus/common/notification/impl/service/impl/KcNotificationServiceImpl.java:[451,16] error: 'catch' without 'try'

  * [ERROR] /Develop/Kuali/svn_kuali_org_kc/coeus-impl/src/main/java/org/kuali/coeus/common/framework/person/KcPerson.java:[75,29] error: variable LOG is already defined in class KcPerson

  * Revert "cx_patches/src/main/java/org/kuali/kra/award/web/struts/action/AwardActionsAction.java.patch"

  * This reverts commit 6602461f15248817d029d055c62b9d694677941d.

  * Conflicts:
	CX_PORTING.md

  * revert changes to cx_patches/src/main/java/org/kuali/kra/award/web/struts/action/AwardActionsAction.java.patch and update CX_PORTING

  * Fixed: AuthTokenGenerator cannot be resolved to a type

  * Fixed: Duplicate field CoiMessagesServiceImpl.LOG

  * Fixed: ProposalPerson cannot be resolved to a type

  * Updated object references for com/rsmart/kuali/kra/workflow/UnitAdministratorRoleAttribute.java. A couple of errors remain that need attention

  * Fixed: The import org.kuali.kra.bo.Unit cannot be resolved

  * Fixed: Unit cannot be resolved to a type

  * Revert "cx_patches/src/main/java/org/kuali/kra/bo/RolodexMaintainableImpl.java.patch"

  * This reverts commit 3aa4c838aae72ce5f0173761a980fa146db83967.

  * Conflicts:
	CX_PORTING.md

  * [ERROR] /Develop/Kuali/svn_kuali_org_kc/coeus-impl/src/main/java/com/rsmart/kuali/kra/workflow/UnitAdministratorRoleAttribute.java:[111,130] error: cannot find symbol
  * [ERROR] symbol:   method getUnitAdministratorTypeCode()
  * [ERROR] location: class UnitAdministratorType
  * [ERROR] /Develop/Kuali/svn_kuali_org_kc/coeus-impl/src/main/java/com/rsmart/kuali/kra/workflow/UnitAdministratorRoleAttribute.java:[128,135] error: cannot find symbol

  * CX 6 now compiles! w00t! Next bind to our fork of rice

  * bind to CX rice version 2.5.2.0-kualico-SNAPSHOT

  * Fixes: Caused by: java.lang.ClassNotFoundException: com.rsmart.kuali.coeus.data.migration.FlywayMigrator

  * very close to getting CX6 to start

  * Disable HR REST API until we can resolve: org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'hrImportService' defined in class path resource [com/rsmart/kuali/coeus/hr/JerseyBeans.xml]: Instantiation of bean failed; nested exception is org.springframework.beans.BeanInstantiationException: Could not instantiate bean class [com.rsmart.kuali.coeus.hr.service.impl.HRImportServiceImpl]: Constructor threw exception; nested exception is java.lang.NoClassDefFoundError: org/kuali/kra/bo/PersonAppointment

  * Fixes ERROR 1064 (42000) at line 17: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '--creates additional attribute for krms data validation rules

  * Added a quick hack to apply KC6 upgrade SQL/DML

  * updated CX_PORTING with new SQL error info

  * Fixes dml/KC_DML_02_KCINFR-979_B000.sql error

  * Erronous duplicate entry in mysql file

  * updated CX_PORTING.md for REST API progress

  * added todo for REST API spring context errors

  * Manually merged PD authorizer changes into PDDocAuthorizer

  * Merged in changes to KcAuthorizationBase and KcTransDocActionBase

  * resolved REST API startup issue

  * AwardActionsAction merged and other files confirmed

  * Relevant changes from patch applied to Rolodex.java

  * S2SUtil patch changes being applied upstream in KC
  * Lance Speelmon on Tue, 25 Nov 2014 10:53:18 -0700 [View Commit](../../commit/1ae2630486ac0ef911c1ffa8127b9e15ae60d1ce)
* CX Reporting Framework

  * cx_patches/src/main/webapp/WEB-INF/struts-config.xml.patch

  * cx_patches/src/main/webapp/WEB-INF/web.xml.patch

  * cx_patches/src/main/java/com/rsmart/kuali/kra/reporting/web/struts/action/ReportForwardAction.java.patch

  * cx_patches/src/main/java/com/rsmart/kuali/kra/reporting/web/struts/form/ReportFormwardForm.java.patch
  * Lance Speelmon on Mon, 8 Dec 2014 16:46:02 -0700 [View Commit](../../commit/af713a3c60c7b2ab3c738854ddcd08d1ad16f000)
* CX Skinning Changes from 5.2.1

  * cx_patches/src/main/java/com/rsmart/kuali/kra/web/jstl/PortalFunctions.java.patch

  * cx_patches/src/main/resources/META-INF/kc-config-defaults.xml.patch

  * cx_patches/src/main/webapp/css/bootstrap/css/bootstrap-skinned.css.patch

  * cx_patches/src/main/webapp/css/bootstrap/css/bootstrap.css.patch

  * cx_patches/src/main/webapp/css/bootstrap/*

  * cx_patches/src/main/webapp/css/images/bl-bevel-focus.gif.patch

  * cx_patches/src/main/webapp/css/rsmart.css.patch

  * cx_patches/src/main/webapp/rice-portal/scripts/easyXDM/resize_intermediate.html.patch

  * cx_patches/src/main/webapp/scripts/bootstrap/bootstrap.js.patch

  * cx_patches/src/main/webapp/sponsorHierarchyMaint.jsp.patch

  * cx_patches/src/main/webapp/static/images/checkbox.gif.patch

  * cx_patches/src/main/webapp/static/images/checked.gif.patch

  * cx_patches/src/main/webapp/unitHierarchy.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/award/awardHierarchyAwardActionsAjax.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/coi/FinancialEntityEditList.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/coi/FinancialEntityEditNew.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/coi/FinancialEntityManagement.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/coi/FinancialEntityView.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/coi/ViewNotification.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/iacuc/IacucResearchAreaAjax.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/irb/researchAreaAjax.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/meeting/IacucMeetingActions.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/meeting/IacucMeetingCorrespondenceAction.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/meeting/IacucMeetingManagement.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/meeting/meetingActions.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/meeting/meetingCorrespondenceAction.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/meeting/meetingManagement.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/multicampus_dummy_login.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/proposaldevelopment/ProposalDevelopmentKeyPersonnel.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/proposaldevelopment/ProposalDevelopmentProposal.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/timeandmoney/awardHierarchyTimeAndMoneyAjax.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/budget/budgetVersions.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/coi/approveAction.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/iacuc/onlinereview/onlineReview.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/infopage.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/irb/onlinereview/onlineReview.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/medusa/medusaNegotiationSummary.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/questionnaire/qnInfopage.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/channel/researcherAwards.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/channel/researcherCompliance.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/channel/researcherPersonnel.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/channel/researcherQuicklinks.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/channel/researcherReportLinks.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/channel/unitQuicklinks.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/portalBody.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/portalResearcherBody.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/portalTabs.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tlds/portal-func.tld.patch

switch back to more genric version of CX skin

  * replace rsmart logos with kualico
  * Lance Speelmon on Mon, 1 Dec 2014 14:03:22 -0700 [View Commit](../../commit/2cb2af80492a7d8488be14f8bcc05b80e9fd73d8)
* Standardizing version
  * blackcathacker on Tue, 13 Jan 2015 19:57:12 -0800 [View Commit](../../commit/6105b56370890029df004a4ac62aa114f1322d19)
* Updates to sites styles to match cx-qa
  * Brandon Nicholls on Wed, 21 Jan 2015 11:50:32 -0700 [View Commit](../../commit/70c9a2749eed3c541f5659b271b6ce01bf5d3e6a)
* Updates to flyway db conversion
  * blackcathacker on Tue, 3 Feb 2015 12:41:43 -0800 [View Commit](../../commit/03b556e3509b8c5a2c906410fcc17e2492ea0bfd)
* Rewrite login page to assist styling
  * blackcathacker on Thu, 22 Jan 2015 17:18:05 -0800 [View Commit](../../commit/db15cc386c8fdf6fea3b6301357be22d4b5398fd)
* Fixes several styling issues:
* Logo is now the KualiCo logo
* Login page not table based anymore, styled correctly (although still hacked)
* Dropdown menus now look correct on large screens as well as small
* Colors on the proposal screens are now longer red.
  * Brandon Nicholls on Tue, 27 Jan 2015 21:40:08 -0700 [View Commit](../../commit/6f5d666b4dc4a472d17c2ad73754ab2138fc9e6a)
* Repackage com.rsmart
  * blackcathacker on Tue, 3 Feb 2015 17:54:57 -0800 [View Commit](../../commit/6500799ded24611653a7f43ca29d99af41b2fa38)
* CX Merge Code Review Comment Changes
  * blackcathacker on Wed, 4 Feb 2015 11:41:45 -0800 [View Commit](../../commit/0024f17123dd4eb3b7f98e79e20dd63adcfb3f15)
* KRACOEUS-8791: Adding copy info to header
  * Gayathri on Thu, 5 Feb 2015 12:12:39 -0700 [View Commit](../../commit/681017e8fd4adf29bef691f17c85b2d5f36a6321)
* KRACOEUS-7992: adding copy message
  * Gayathri on Thu, 5 Feb 2015 15:01:35 -0700 [View Commit](../../commit/866c1b1e16b1e7d79cbdc3c3ca7109b56e58081f)
* KRACOUES-8792:fixed first period budget copy
  * Joe Williams on Thu, 5 Feb 2015 16:51:34 -0600 [View Commit](../../commit/c84f24c626a0f3bcffddfcdc875a246b03d352eb)
* KRACOEUS-8777:added hierarchy summary to budget module
  * Joe Williams on Thu, 5 Feb 2015 16:59:13 -0600 [View Commit](../../commit/6a7c972a649924e6f2fe54ef094e20b6e890294d)
* KRACOEUS-8799 : Style footer for KualiCo
  * blackcathacker on Thu, 5 Feb 2015 17:34:49 -0800 [View Commit](../../commit/3e137f8236e46611612fda0465f6d9cdb01e9e46)
* KRACOEUS-8782:updated access collection to add with dialog, fixed check that roles have changed
  * Joe Williams on Fri, 6 Feb 2015 08:57:47 -0600 [View Commit](../../commit/77b7a237415ac133a3f3c978ea9ec4dabb173de2)
* KRACOEUS-8777:add missing hierarchybudgetsummary xml
  * Joe Williams on Fri, 6 Feb 2015 09:38:30 -0600 [View Commit](../../commit/ddeef4767f90d78823d609060d60cf0a702ec028)
* KRACOEUS-8796:fix attachment errors preventing canEdit from being evaluated
  * Joe Williams on Fri, 6 Feb 2015 10:12:40 -0600 [View Commit](../../commit/9a2919bd1ad560f40101b3fcb39e0e6fb53df466)
* KRACOEUS-8813: fixing wilcard search
  * Travis Schneberger on Fri, 6 Feb 2015 11:40:54 -0500 [View Commit](../../commit/b3079ac2b27ef71777bfdaf8acb217a7d594393b)
* KRACOEUS-8812:fixed sub award validation error
  * Joe Williams on Fri, 6 Feb 2015 11:17:58 -0600 [View Commit](../../commit/ab0d4124e54a7a3bbdbf177a00074f9ef0b0cc34)
* KRACOEUS-8176
  * Save new line items - budget personnel and non-personnel costs
  * rmancher on Fri, 6 Feb 2015 12:51:31 -0500 [View Commit](../../commit/365819f4f7436bf011a65499d28d4cd192e08275)
* KRACOEUS-8661-fixing personnel sync
  * Gayathri on Fri, 6 Feb 2015 11:45:28 -0700 [View Commit](../../commit/11edfe1104b5ae21b5fe981a6320b08cf61e16bd)
* KRACOEUS-8811: Copy parent changes
  * Gayathri on Fri, 6 Feb 2015 12:27:29 -0700 [View Commit](../../commit/0300c0dda1b7f3cc50c9df39026faaae46f3a96c)
* KRACOEUS-8810:fixed error with non compliance entries not having special review numbers
  * Joe Williams on Fri, 6 Feb 2015 14:38:55 -0600 [View Commit](../../commit/a8a949f31b7212ded0c7d33f1853c0a67305b77b)
* KRACOEUS-8730: Fix copy in view mode
  * Gayathri on Fri, 6 Feb 2015 13:42:07 -0700 [View Commit](../../commit/d49ea5bb0f1d2181dbf6519072ded55bf8b91422)
* KRACOEUS-8820 : Make flyway process configurable
  * blackcathacker on Sat, 7 Feb 2015 23:28:38 -0800 [View Commit](../../commit/b5b6ff7812634ea4d0b94db36c8702ab21c48489)
* KRACOEUS-8817:added create xml to s2s forms page
  * Joe Williams on Mon, 9 Feb 2015 10:41:51 -0600 [View Commit](../../commit/3f10a750c67b1c5f29e9169278db559a8556963f)
* KRACOEUS-8801:add remove from submission to deselect final budget
  * Joe Williams on Mon, 9 Feb 2015 11:36:16 -0600 [View Commit](../../commit/286f70da31a3598cebb4eb11274ad3ed5abe9daf)
* KRACOEUS-8814: adding billing frequency, fixing dd config
  * Travis Schneberger on Mon, 9 Feb 2015 10:32:20 -0500 [View Commit](../../commit/d350ec53a6d05d3474e74d7685beaeac65927003)
* KRACOEUS-8814: deleting sql scripts
  * Travis Schneberger on Mon, 9 Feb 2015 18:30:42 -0500 [View Commit](../../commit/7c762e65956086c235b1c73c7ef8a5146f1fcc2f)
* Revert "KRACOEUS-8814: adding billing frequency, fixing dd config"
  * Travis Schneeberger on Mon, 9 Feb 2015 18:32:53 -0500 [View Commit](../../commit/4093692a6ac9a92993d0c4a30501a15a813ad05d)
* KRACOEUS-8827: returning title
  * Travis Schneberger on Tue, 10 Feb 2015 12:56:00 -0500 [View Commit](../../commit/bb5277eb281bedefeef9c4905a7c6058863036ad)
* KRACOEUS-8829: making krad award lookup use custom lookupable
  * Travis Schneberger on Tue, 10 Feb 2015 18:55:39 -0500 [View Commit](../../commit/6e0b0a1888b1f3914a366d6a625ab5090ac4f716)
* KRACOEUS-6639:code changes for proposal person effort
  * Joe Williams on Thu, 5 Feb 2015 16:48:56 -0600 [View Commit](../../commit/6358143733c126062353a6a5264d27d110878a66)
* KRACOEUS-7942
  * Reset compliance modal.
  * rmancher on Tue, 10 Feb 2015 14:34:37 -0500 [View Commit](../../commit/d4b76c1d8d1998020e9f2e4d039bfbaff6c2576e)
* KRACOEUS-8286
  * Fix to add new period to person salary details when dates change in proposal
  * and default periods are triggered.
  * rmancher on Thu, 5 Feb 2015 11:44:27 -0500 [View Commit](../../commit/9ca70b8dde6e804372c3c4c022a3829ba35414c0)
* KRACOEUS-8833: keyword display fix
  * Gayathri on Wed, 11 Feb 2015 12:43:07 -0700 [View Commit](../../commit/aa6ece39878187077e5edbe5297e174e1796e2cb)
* KRACOEUS-8782:changed access screen add button dynamic to be similiar to key personnel
  * Joe Williams on Wed, 11 Feb 2015 15:21:38 -0600 [View Commit](../../commit/40de74403b250cfeea3961a3200ea63b4cafc17c)
* KRACOEUS-8798: Recall fix
  * Gayathri on Wed, 11 Feb 2015 15:19:56 -0700 [View Commit](../../commit/2bad6c9d84fd9ac02f5b5a6eabff5ab0532319df)
* KRACOEUS-8835: handling delete line from the wizard
  * Travis Schneberger on Wed, 11 Feb 2015 17:35:06 -0500 [View Commit](../../commit/74ec4ecf082dc5e5637b70380431765c2f3608e2)
* KRACOEUS-8832: Linking back
  * Gayathri on Wed, 11 Feb 2015 15:47:33 -0700 [View Commit](../../commit/4145aea9cf3d52b03e0955d40a3085a44a205dd3)
* KRACOEUS-8835: fix cancel button
  * Travis Schneberger on Thu, 12 Feb 2015 07:46:31 -0500 [View Commit](../../commit/7702d508133ab412950a13e6414d8be4edc558bb)
* KRACOEUS-8838: adding missing dd file
  * Travis Schneberger on Thu, 12 Feb 2015 08:54:53 -0500 [View Commit](../../commit/f689f4758b3c211c327a43482e2f123a08cc1ce0)
* KRACOEUS-8761
  * Custom data fields erased when editing Institutional Proposals or Awards
  * rmancher on Thu, 12 Feb 2015 09:48:29 -0500 [View Commit](../../commit/ae7a2246eced3a00815f2e38154ce1cd148e1547)
* KRACOEUS-8826: fixing DD file descriptions
  * Travis Schneberger on Thu, 12 Feb 2015 10:14:18 -0500 [View Commit](../../commit/c6a1c21b8183d08d5d8d3d12d9ddfafc26de1639)
* KRACOEUS-8819: Fixing STE
  * Gayathri on Tue, 10 Feb 2015 13:20:06 -0700 [View Commit](../../commit/fdadea0ffd7af550bbfd1221b6f5055d2d6ed204)
* KRACOEUS-8841: fixing jobCode force uppercase
  * Travis Schneberger on Thu, 12 Feb 2015 11:49:04 -0500 [View Commit](../../commit/7e9fa3528b1261756fa3a8c5bb48aa236642214b)
* KRACOEUS-8301
  * Required fields in custom data is preventing from navigating away from
supplemental information page.
  * rmancher on Thu, 5 Feb 2015 16:24:05 -0500 [View Commit](../../commit/aa036ad77118a40b1877a3447f2b885e1a55acd3)
* KRACOEUS-8842
  * Fix issue - Missing parts of screen on report COI in New projects to disclose
  * rmancher on Thu, 12 Feb 2015 14:47:30 -0500 [View Commit](../../commit/aa9ac53acc3a7d66d24ced90b729c8972b640251)
* KRACOEUS-8815: Fix authorizer
  * Gayathri on Thu, 12 Feb 2015 17:47:41 -0700 [View Commit](../../commit/2639d2171382f75d2060053d394fff39288377c4)
* KRACOEUS-8824 : Auto ingestion changes
  * blackcathacker on Thu, 12 Feb 2015 16:26:04 -0700 [View Commit](../../commit/9b8536d3c2e02b2880b3a0bc8224e98b833bf2b3)
* KRACOEUS-8844: Fixing reject action
  * Gayathri on Thu, 12 Feb 2015 17:53:33 -0700 [View Commit](../../commit/6a6c89efcdb38b7e57c518827e73a7d1657dacf4)
* KRACOEUS-8828:hide s2s opportunity if non-federal sponsor is selected
  * Joe Williams on Tue, 10 Feb 2015 16:15:19 -0600 [View Commit](../../commit/7e3ed1bb2c684f6b126715fa211ed0d828fdd865)
* KRACOEUS-8841:update criteria input field to retreive force upper case from dd attribute defintion
  * Joe Williams on Fri, 13 Feb 2015 11:55:17 -0600 [View Commit](../../commit/8522588893434bce41bf552480a072e7e93e05c0)
* KRACOEUS-8847:add validation to check for multiple units on the same key person
  * Joe Williams on Fri, 13 Feb 2015 15:00:14 -0600 [View Commit](../../commit/d89cdfe65f8f701351ce1c51c2fd4f9fe30fd90e)
* KRACOEUS-8849:perform client side validation on budget navigation
  * Joe Williams on Fri, 13 Feb 2015 15:24:18 -0600 [View Commit](../../commit/429cb74decfcc83a22df67fee3bec93d76990a1a)
* KRACOEUS-8830: removing old files
  * Travis Schneberger on Wed, 11 Feb 2015 10:07:10 -0500 [View Commit](../../commit/1f798e481a3f74e753cf83205617072d5d8308bc)
* KRACOEUS-8830: cleanup, move out grm specific files, setting migration path
  * Travis Schneberger on Fri, 13 Feb 2015 10:43:38 -0500 [View Commit](../../commit/2676d331048081acb13d25fcc6a6cc71a88b2ff1)
* KRACOEUS-8830: moving sql scripts
  * Travis Schneberger on Fri, 13 Feb 2015 10:48:50 -0500 [View Commit](../../commit/e98c9278716bbd83409af7be09486f27180f52f5)
* KRACOEUS-8830: code review comments
  * Travis Schneberger on Fri, 13 Feb 2015 17:16:23 -0500 [View Commit](../../commit/8826a37317b722de934484bef01b01d629447493)
* KRACOEUS-8850: Fix cong districts while copying
  * Gayathri on Fri, 13 Feb 2015 15:25:08 -0700 [View Commit](../../commit/f4998a888d44264cbc84f40d9fbe3e6df3a86b50)
* KRACOEUS-8853: moving data conversion program into kc as a submodule
  * Travis Schneberger on Sat, 14 Feb 2015 11:57:29 -0500 [View Commit](../../commit/3fa7244db48400216cd97424d0c22f55b93b854c)
* KRACOEUS-8837: fixing parameter text
  * Travis Schneberger on Mon, 16 Feb 2015 09:43:43 -0500 [View Commit](../../commit/73abe72776a9a8645c7c33098512d58eb2a44be9)
* KRACOEUS-8454: fix notifications
  * Gayathri on Mon, 16 Feb 2015 08:07:34 -0700 [View Commit](../../commit/614a66ac13d2ec6044bbd021c0f7c6090e7f735a)
* KRACOEUS-8454: Adding SQL
  * Gayathri on Mon, 16 Feb 2015 09:37:08 -0700 [View Commit](../../commit/219679a04a8c9737829af689b6fe8171cf5daae5)
* KRACOEUS-8824 : Fix duplicate current KualiDocument
  * blackcathacker on Mon, 16 Feb 2015 11:05:42 -0800 [View Commit](../../commit/89ab12b325629b7addfd253ca0a942468abdddea)
* KRACOEUS-8824 : Fix duplicate version
  * blackcathacker on Mon, 16 Feb 2015 11:27:01 -0800 [View Commit](../../commit/38f1bf82c7e17a2936d2ca48ea8130c99e9329c1)
* KRACOEUS-8855 : Use more realistic workflow for PD
  * blackcathacker on Mon, 16 Feb 2015 11:54:22 -0800 [View Commit](../../commit/e55925955e02a902144bf9df928035580566c092)
* KRACOEUS-8851:run budget save event when save method is called, fixed issue with non-employee code not being set on new budget person
  * Joe Williams on Mon, 16 Feb 2015 08:33:09 -0600 [View Commit](../../commit/25e170c6cbe957acbaf0dd7f52977c5793b88221)
* KRACOEUS-8840: convert budget periods page to inline editing
  * Joe Williams on Thu, 12 Feb 2015 12:24:35 -0600 [View Commit](../../commit/b84a140d68912968e662843003756473bc019155)
* KRACOEUS-8856: changing message
  * Travis Schneberger on Mon, 16 Feb 2015 16:15:18 -0500 [View Commit](../../commit/50c26e5a2ab6cc530ca6e579ab0bea6fdffdc1d2)
* KRACOEUS-8857:fix styling of add button on subaward page to not display in header of the table
  * Joe Williams on Mon, 16 Feb 2015 15:36:01 -0600 [View Commit](../../commit/4e3ef2d9fa4861773a7242fda85cdb2b879da73a)
* KRACOEUS-8806:disabled subaward view xml if attached file does not contain xml data
  * Joe Williams on Mon, 16 Feb 2015 16:03:35 -0600 [View Commit](../../commit/09e32237e30db33f08c3bd508ad62b5a6212dec5)
* KRACOEUS-8745:added client side file size validation
  * Joe Williams on Mon, 16 Feb 2015 09:26:01 -0600 [View Commit](../../commit/5c22bfd5faa016d1ea0483d0372726f47b71b1a9)
* KRACOEUS-8855 : Code review changes
  * blackcathacker on Mon, 16 Feb 2015 14:38:04 -0800 [View Commit](../../commit/123feac228fe2d12a2935c364f68d79cb150940a)
* KRACOEUS-8860: changing help link
  * Travis Schneberger on Tue, 17 Feb 2015 08:55:19 -0500 [View Commit](../../commit/b640c0324f4985d878baa13126380bb87662289b)
* KRACOEUS-8861:fix progressive navigation to supplement info
  * Joe Williams on Tue, 17 Feb 2015 09:14:48 -0600 [View Commit](../../commit/74caa9abc9edee5e8ab403ca8399cd1d43d79b48)
* KRACOEUS-8862:fix send personnel cert notification buttons to always display, and save personnel when they are sent
  * Joe Williams on Tue, 17 Feb 2015 09:45:48 -0600 [View Commit](../../commit/25f8a157f93808346418bddb07737e2dfc485f32)
* KRACOEUS-8863: changing button text
  * Travis Schneberger on Tue, 17 Feb 2015 10:58:06 -0500 [View Commit](../../commit/936a6420f2d83d23776453c94c8168dea91111f9)
* KRACOEUS-8865: adding budget version
  * Travis Schneberger on Tue, 17 Feb 2015 11:23:28 -0500 [View Commit](../../commit/6b438adb9fbb047f56d9cee26fd8f3e744563c5f)
* ISO-135
  * Gayathri on Tue, 17 Feb 2015 10:28:50 -0700 [View Commit](../../commit/ab01366fed35124d11f2855281cb4163c7abfe0f)
* KRACOEUS-8845: Adding ScaleTwo and ScaleThree decimal support.
  * Gayathri on Mon, 16 Feb 2015 16:32:28 -0700 [View Commit](../../commit/6b6a0ca6a1c5f3b3257c343b98d05b3aac4ac132)
* KRACOEUS-8860: making old portal and new portal use the same help link properties
  * Travis Schneberger on Tue, 17 Feb 2015 12:55:35 -0500 [View Commit](../../commit/68b57ec73e2bc0cdc0bda6d6bc2cbc4d28bd7c45)
* KRACOEUS-8805
  * Budget Settings labels disappear when marked complete
  * rmancher on Tue, 17 Feb 2015 13:43:58 -0500 [View Commit](../../commit/663e502ce022593513764921673b4e9b70c3b6f1)
* SO-138 : Make questionnaire certifcation generic
  * blackcathacker on Tue, 17 Feb 2015 10:46:55 -0800 [View Commit](../../commit/6fcfdb0c9c3e8cbda759d8df9c9f96f59a1fb240)
* KRACOEUS-8846: Question edit fix
  * Gayathri on Tue, 17 Feb 2015 12:58:00 -0700 [View Commit](../../commit/bba344a7045ca0a06422db7c0ec42aff0bf728f6)
* KRACOEUS-8866: increasing column length
  * Travis Schneberger on Tue, 17 Feb 2015 15:14:17 -0500 [View Commit](../../commit/79f2da88961cf53f8ca2bc752fd13268109471df)
* KRACOEUS-8869: prevent PD from opening in iframe
  * Travis Schneberger on Tue, 17 Feb 2015 15:39:37 -0500 [View Commit](../../commit/15c7cd7f1726c4437aa75995901341dd0b9df4aa)
* Set default.htm as an index file so help works when null
  * Even when the help url is null, in the case of a missing help parameter
  * the help index will still show up. Partial fix for rSmart/issues#512
  * blackcathacker on Tue, 17 Feb 2015 13:42:49 -0800 [View Commit](../../commit/132c215f0efdd2067276490813dfb253717e26b6)
* Notification renderer unused
  * Related to investigating rsmart/issues#307 it was noticed this renderer is never referenced or used
  * blackcathacker on Tue, 17 Feb 2015 13:48:24 -0800 [View Commit](../../commit/fcdc0adeae27563e075fdf55fdd78e2ac951959b)
* Workaround OJB bug that causes wrong class to be cached
  * Whenever the Budget.class is cached instead of AwardBudgetExt
  * OJB will only return Budget.class for that ID.

  * Fixes rSmart/issues#510
  * blackcathacker on Tue, 17 Feb 2015 13:54:03 -0800 [View Commit](../../commit/c31c842be236e5dbed45dacc6c5408a1e050b677)
* KRACOEUS-7443: Fix notification email address
  * Gayathri on Tue, 17 Feb 2015 15:58:48 -0700 [View Commit](../../commit/63cebfa4ef6ca0a67405ed3c18b6b2cb4fee12dd)
* KRACOEUS-8870: Set demo cost elements to be active
  * At some point during the 4.0 release cost elements where changed from using 'N' to indicate active to 'Y' being active. Due to the oddities with the old sql scripts the bootstrap script that did this now runs before the demo data that inserts these records. This enables all the demo cost elements.
  * blackcathacker on Tue, 17 Feb 2015 15:25:31 -0800 [View Commit](../../commit/11d1407549ed2fd3e7735abf79e2b5b388214e3d)
* KRACOEUS-8872: Adding warning while deleting attachments.
  * Gayathri on Tue, 17 Feb 2015 16:53:32 -0700 [View Commit](../../commit/a7f4624e65a97dd5b49d0a7a119a48b8eee02271)
* KRACOEUS-8855:Make PD KEW doc standalone and repackage KEW related class
  * The PD KEW File that was being used by CX was apparently dependent on the previous foundation KEW file being ingested. I have copied relevant elements from it such that this file can be ingested into an empty database.
  * blackcathacker on Tue, 17 Feb 2015 16:09:27 -0800 [View Commit](../../commit/a9aa1c154a1c26ddefd29c47a5656dde06922025)
* KRACOEUS-8854 : Fix issue with bad data so script can apply
  * blackcathacker on Sun, 15 Feb 2015 14:15:05 -0800 [View Commit](../../commit/0a1da018c96c302f26a5482783bef36c7582953c)
* KRACOEUS-8871:implement budget progressive navigation
  * Joe Williams on Tue, 17 Feb 2015 16:53:05 -0600 [View Commit](../../commit/6c16496c904410f221b4ea171df6e770ad99feb4)
* KRACOEUS-8875: resequence sql file
  * Travis Schneberger on Wed, 18 Feb 2015 09:05:12 -0500 [View Commit](../../commit/96d2509bd4b56038cd2f5a96564564aa6af91eb4)
* KRACOEUS-8856: fix grammar
  * Travis Schneberger on Wed, 18 Feb 2015 11:26:23 -0500 [View Commit](../../commit/e20cc1e98f1cb6c2b8fb96e43969b4d073fd28d3)
* KRACOEUS-8873: Delivery info changes
  * Gayathri on Wed, 18 Feb 2015 08:46:30 -0700 [View Commit](../../commit/10d0b073f7cc16f70861064ae77df9c3188a2908)
* KRACOEUS-8879: adding header text
  * Travis Schneberger on Wed, 18 Feb 2015 13:38:52 -0500 [View Commit](../../commit/f444865410b1b61e2b9d18f4eb85a2e9e2f2f11e)
* KRACOEUS-8802 Subaward refresh on delete and replace
  * Fix to refresh the modal and clear current period details.

  * update review comments
  * rmancher on Tue, 17 Feb 2015 11:25:39 -0500 [View Commit](../../commit/ac92585b9089a377eb91126d843122b629065e27)
* KRACOEUS-8873: Removing validation while deleting.
  * Gayathri on Wed, 18 Feb 2015 15:49:58 -0700 [View Commit](../../commit/81dd6283ec6ca5918425ad18b575c194f70be92d)
* KRACOEUS-8881:Support for MySQL5.6/MariaDB10
  * This primarily involved making sure to drop the foreign key before modifying a referenced column and limited indexes to 767 bytes.
  * In order to still support Mysql5.5 you also have to make sure that when dropping the foreign keys the names of the contrainsts match exactly.
  * blackcathacker on Wed, 18 Feb 2015 16:21:42 -0800 [View Commit](../../commit/7b9c9681eb223dd81c5697e614c8f6b3880f1ed9)
* KRACOEUS-8880: adding validation to s2s opportunity lookup fields
  * Travis Schneberger on Thu, 19 Feb 2015 09:18:44 -0500 [View Commit](../../commit/149877bcab443afce145477c8a223916e14b89a3)
* KRACOEUS-8809 Refresh budget summary during sync
  * Budget summary is not updated while performing sync operation in parent
  * proposal budget
  * rmancher on Wed, 18 Feb 2015 14:44:38 -0500 [View Commit](../../commit/d3d7d3008b26b67f992ccb5e1269387be80a99e1)
* KRACOEUS-8864:added special review validation
  * Joe Williams on Thu, 19 Feb 2015 10:07:37 -0600 [View Commit](../../commit/ea8a24d2591296408d1d9d5050ca4d649b8e5091)
* KRACOEUS-8831:moved div and program code validation to audit errors
  * Joe Williams on Thu, 19 Feb 2015 12:54:42 -0600 [View Commit](../../commit/6a468602f6ee4f8157edcbce35d6312fdcfa0092)
* KRACOEUS-8876:fix text area inline edit fieldwidth
  * Joe Williams on Thu, 19 Feb 2015 14:22:20 -0600 [View Commit](../../commit/63c925b8fa4657574ba457212bc164559b02a6f0)
* KRACOEUS-8883:implement widget input only for questions with lookups
  * Joe Williams on Thu, 19 Feb 2015 15:50:04 -0600 [View Commit](../../commit/79eeb151b269c8a4cb876ccc5135cd95677bd8e0)
* KRACOEUS-8884:fixed non personnel budget rates
  * Joe Williams on Thu, 19 Feb 2015 16:45:09 -0600 [View Commit](../../commit/fbf28001e2295e48c087c0511d8475def3dd41ab)
* KRACOEUS-8770: KNS, Proposal and Budget Online help
  * Gayathri on Thu, 19 Feb 2015 17:53:00 -0700 [View Commit](../../commit/60f52092152454f2158ba1055bc9662c5d6a33c1)
* KRACOEUS-8885: Removing notify from child proposals
  * Gayathri on Thu, 19 Feb 2015 18:38:57 -0700 [View Commit](../../commit/660cc615e0a7bf2f0baf41f4d15be0748467342c)
* KRACOEUS-7453 Enable unit inquiry
  * Display unit and administrator details
  * rmancher on Fri, 20 Feb 2015 10:36:00 -0500 [View Commit](../../commit/53bd1e178c81b53d714aaa6d7b4b66e1273dfbd8)
* KRACOEUS-8886:perform client side validation on navigation back to proposal
  * Joe Williams on Fri, 20 Feb 2015 09:49:55 -0600 [View Commit](../../commit/0d24748200d4bb6934d2f114f51636761724bff8)
* KRACOEUS-8889: fixing PD routing
  * Gayathri on Fri, 20 Feb 2015 11:07:45 -0700 [View Commit](../../commit/aef03439164dcfd8f23cf32b14cfae76fc8c900f)
* KRACOEUS-8888:create unique id and person name for tbn persons
  * Joe Williams on Fri, 20 Feb 2015 14:35:03 -0600 [View Commit](../../commit/f4be0deee195052ccf31b6e34756450d52cfd32a)
* KRACOEUS-8891:Health Check Page
  * Simple health check page that return 200 on success and 417 on failure.
  * Does simple query against the KC and Rice database to confirm they are accessible
  * blackcathacker on Sun, 22 Feb 2015 15:34:14 -0800 [View Commit](../../commit/cf65617ece8b605feba4a9fe92e7bf31d7ef3728)
* KRACOUES-8890:set budget creator role to only edit budgets
  * Joe Williams on Mon, 23 Feb 2015 09:16:46 -0600 [View Commit](../../commit/cb97f0619570b40f427a42960ce1b3bd1794f916)
* KRACOEUS-7451 Add status option for internal attachments
  * Include status option for add attachments and in the list.
  * Also add mark all status option.
  * rmancher on Mon, 23 Feb 2015 10:59:58 -0500 [View Commit](../../commit/7a5fd354b2fc149ea5d82c9eb769729f1f5ee5cf)
* KRACOEUS-8739: Fixing lookup sort
  * Gayathri on Mon, 23 Feb 2015 11:26:37 -0700 [View Commit](../../commit/54342126657e501a0d40074b068c510e5192616c)
* KRACOEUS-8897: removing references to old commons-lang
  * Travis Schneberger on Mon, 23 Feb 2015 13:26:16 -0500 [View Commit](../../commit/b77d55410c839d411ce40541a8bbd5b1b25e70e7)
* KRACOEUS-8894:allow add viewer permission when document is enroute
  * Joe Williams on Mon, 23 Feb 2015 13:04:28 -0600 [View Commit](../../commit/2df23475e2b3871adb8f16d9cca5f7d488d0845d)
* KRACOEUS-8895:Add CAS as dependency
  * blackcathacker on Mon, 23 Feb 2015 10:49:49 -0800 [View Commit](../../commit/384a628f51858d9b508cda8078da05483f6c4f47)
* KRACOEUS-8682: Hiding create proposal button
  * Gayathri on Mon, 23 Feb 2015 16:27:06 -0700 [View Commit](../../commit/6e3a6ae210449cc6b5d796efbb2d079578063a38)
* KRACOEUS-8892:Various db issues
  * V600_067__KC_DML_01_KRACOEUS-7014_B000.sql and others failed due to the coeus_module description being modified so the module_code as harded as was done during insert and in other locations in code, additionally they modified the special review type 'Animal Subjects' to 'Live Vertebrate Studies' and again this is a code hard-code in sql and in code so no reason to query for it.
  * V601_017__KRACOEUS-8864.sql failed because of conflicting primary keys so using new procedure to find first unused id
  * V600_046__KC_TBL_AWARD_BUDGET_EXT.sql needed to orphan the records in award_budget_limit as well
  * V600_063__KC_DML_01_KFSMI-11381_B000.sql failed because customer had inserted extra record at 999 which meant the next value was 1000. Instead using new procedure to find first available id
  * V300_002__schema.sql and V300_107__schema.sql were modified because of previously unseen errors with mysql 5.6
  * V600_054__KC_TBL_EPS_PROPOSAL_BUDGET_EXT.sql is another example of orphaned records where the proposal was deleted but the budgets weren't
  * blackcathacker on Mon, 23 Feb 2015 18:00:05 -0800 [View Commit](../../commit/2b15e79bb9bd3fce04684bfc914e4e4c05dfd2a8)
* KRACOEUS-8896:fix research strategy s2s error
  * Joe Williams on Tue, 24 Feb 2015 08:32:58 -0600 [View Commit](../../commit/a121f6d39f35b131d789ee8a2434aa5f7ecae777)
* KRACOEUS-8887:add confirmation dialog to complete budget
  * Joe Williams on Fri, 20 Feb 2015 14:17:53 -0600 [View Commit](../../commit/ce21ff2c850c80d7fe9ea33e66bad6225d0b1a3a)
* KRACOEUS-7438: Fixing PI certification while routing
  * Gayathri on Mon, 23 Feb 2015 14:02:03 -0700 [View Commit](../../commit/686f68da9f24934237b5ec8fa5fb800152aa9bc3)
* KRACOEUS-8899:fixed client side date validation
  * Joe Williams on Tue, 24 Feb 2015 11:48:22 -0600 [View Commit](../../commit/29e973127d24d62320b428e32e9f476945f7a401)
* KRACOEUS-8874 Incorrect distributable amount when editing amount in award
  * rmancher on Tue, 24 Feb 2015 09:10:27 -0500 [View Commit](../../commit/61a0bb8e31e55885c90265a1ae253e9ad662915b)
* KRACOEUS-8898:Update doc typ to use new PD URL
  * blackcathacker on Tue, 24 Feb 2015 14:27:33 -0800 [View Commit](../../commit/f036776180f5395a6fdfa63b16f1ead007bd41a2)
* KRACOEUS-8904: adding missing closing tag
  * Travis Schneberger on Wed, 25 Feb 2015 08:40:34 -0500 [View Commit](../../commit/2982988cd70a11dc486396ec50b6c8b0f7bbef28)
* KRACOEUS-8903:complete budget from budget versions page
  * Joe Williams on Wed, 25 Feb 2015 09:22:34 -0600 [View Commit](../../commit/2e7a378487226ad17b067829f68116c0426722e2)
* KRACOEUS-8878: moving external stuff back to the old package
  * Travis Schneberger on Fri, 20 Feb 2015 15:26:35 -0500 [View Commit](../../commit/9b74b87dd1511e6101e11a0e088629809ceebf02)
* KRACOEUS-8878: moving external stuff back to the old package
  * Travis Schneberger on Fri, 20 Feb 2015 16:13:46 -0500 [View Commit](../../commit/53147ca389922676a65bd5982b37f6add5c57de6)
* KRACOEUS-8878: rolling back cgb api changes, fixing external DD files
  * Travis Schneberger on Mon, 23 Feb 2015 13:21:19 -0500 [View Commit](../../commit/61197fd08ace4b6de7dfdffdfc724f6acda648b5)
* KRACOEUS-8878: resequencing sql file
  * Travis Schneberger on Tue, 24 Feb 2015 09:47:46 -0500 [View Commit](../../commit/3c844db62debb972ea9cd32b1aa944cfc81712d7)
* KRACOEUS-8878: fixing package
  * Travis Schneberger on Wed, 25 Feb 2015 11:13:03 -0500 [View Commit](../../commit/f0f7870f82ebb0359611af92533043663a38564f)
* KRACOEUS-8878: code review comments
  * Travis Schneberger on Wed, 25 Feb 2015 14:27:07 -0500 [View Commit](../../commit/17ea473279f11bc95fbd1dc285b4616b8f92c131)
* KRACOEUS-8878: resequencing sql file
  * Travis Schneberger on Wed, 25 Feb 2015 15:35:25 -0500 [View Commit](../../commit/72b396be6de6fb7ef9c881a31f554694d22f7fdb)
* KRACOEUS-8902: Add notification when changing narratives
  * Gayathri on Wed, 25 Feb 2015 13:56:14 -0700 [View Commit](../../commit/7baf3d22ae28b92e6ea61126944c9dae314616c6)
* KRACOEUS-8739: Adding missed change
  * Gayathri on Wed, 25 Feb 2015 14:51:58 -0700 [View Commit](../../commit/706f2b6579f3e94b68bf7cc70452833204bf5a6b)
* KRACOEUS-8909: make sponsor maintenance work without KFS integration
  * Travis Schneberger on Thu, 26 Feb 2015 08:26:31 -0500 [View Commit](../../commit/aa7e7969c3b76b78a0c1f91e18139028512b0320)
* KRACOEUS-8909: fixing role qualifiers for sponsor for quickstart
  * Travis Schneberger on Thu, 26 Feb 2015 09:54:07 -0500 [View Commit](../../commit/0da1feff9db96c9e9e2cccfafb8ca47c242f8a5b)
* KRACOEUS-8909: fixing constraint violation on save
  * Travis Schneberger on Thu, 26 Feb 2015 10:12:46 -0500 [View Commit](../../commit/1a0386df6b515ad6964a609e5fa58a2746c3d589)
* KRACOEUS-8913: swapping field locations
  * Travis Schneberger on Thu, 26 Feb 2015 11:01:29 -0500 [View Commit](../../commit/bee646b0273fa9d4305a8779c45bce1c2929104e)
* KRACOEUS-8914: changing fixed point number message
  * Travis Schneberger on Thu, 26 Feb 2015 11:14:27 -0500 [View Commit](../../commit/1556750bcc25b76d2921da9ab74b781e32fe4d9c)
* KRACOEUS-8390 Add close button to superuser action page
  * rmancher on Thu, 26 Feb 2015 11:28:51 -0500 [View Commit](../../commit/5d072dbc7b87fd9960f67c5c7c51e6c2a0eca394)
* KRACOEUS-8803 Fix unauthorized lead unit options
  * Currently KIM is not checking whether user is associated with the
  * new group. We need a rice fix.
  * This is an interim solution.
  * rmancher on Wed, 25 Feb 2015 14:51:18 -0500 [View Commit](../../commit/dc158b3403c8ccd6e8d366ca9ca4a320f8914b9c)
* KRACOEUS-8905:display s2s errors when print invalid xml
  * Joe Williams on Fri, 27 Feb 2015 08:08:31 -0600 [View Commit](../../commit/638e3c932d570f06c7b0dd3ad34b41520af829a2)
* KRACOEUS-8918: adding not found message
  * Travis Schneberger on Fri, 27 Feb 2015 10:18:19 -0500 [View Commit](../../commit/fcc1b86707b791c3ece17c13411b68dc4c89aa3b)
* KRACOEUS-8919: changing field length
  * Travis Schneberger on Fri, 27 Feb 2015 10:25:46 -0500 [View Commit](../../commit/a9abe0e82e3b014d7c93200a905d8039f1081c8d)
* KRACOEUS-8920:added inquiry link to arg value custom data
  * Joe Williams on Fri, 27 Feb 2015 12:15:03 -0600 [View Commit](../../commit/55f79fe4c5ba3b6addabca216d5117cd781b4e8d)
* KRACOEUS-8176 Save budget to reflect totals in periods and budget
  * Adding a line item and closing window should recalcuate budget and
  * persist line item. We need to persist budget in this scenario since
  * we need to update periods and totals and budget totals.
  * rmancher on Fri, 27 Feb 2015 16:23:15 -0500 [View Commit](../../commit/c5daab6f9d347b1a7da0371e4726794eca2de41b)
* KRACOEUS-8767: Fixing help links
  * Gayathri on Fri, 27 Feb 2015 15:51:20 -0700 [View Commit](../../commit/8ec7e5887978dbcfacf80d85e6d134283364f357)
* KRACOEUS-8868: increasing reqID length
  * Gayathri on Fri, 27 Feb 2015 16:38:09 -0700 [View Commit](../../commit/b67b44adbef02c03923ecf14168095b9f2a56f1e)
* Revert "KRACOEUS-8803 Fix unauthorized lead unit options"
  * Douglas Pace on Fri, 27 Feb 2015 18:00:16 -0800 [View Commit](../../commit/87d09dd52eccab5e742b742d2b4017b5c541b547)
* KRACOEUS-8905:generate module periods when chnage budget settings
  * Joe Williams on Mon, 2 Mar 2015 09:56:03 -0600 [View Commit](../../commit/5faa4fda4c723dae30f5614006bb709113e21bb7)
* KRACOEUS-8903:mark budget incomplete from budget versions
  * Joe Williams on Mon, 2 Mar 2015 11:35:11 -0600 [View Commit](../../commit/9cb329e277eed5700e37736df73f66ab3ceed3d8)
* KRACOEUS-8839:fix attachment data
  * Joe Williams on Mon, 2 Mar 2015 13:21:19 -0600 [View Commit](../../commit/617054110223f667970ccf22e90a5186b23127ed)
* KRACOEUS-8920:added arg value inquiries to questionnaire
  * Joe Williams on Mon, 2 Mar 2015 14:20:54 -0600 [View Commit](../../commit/94307eb585e2032318147bfbed3413437d38c11a)
* KRACOEUS-8839:Fix up commit related to attachments
  * Rename base class to match up with attachment dao given other different usages for AttachmentDataSource.java
  * Add javadoc and other clean up.
  * blackcathacker on Mon, 2 Mar 2015 18:04:13 -0700 [View Commit](../../commit/942939dcd5c4d986603923b41a09184a572339e6)
* KRACOEUS-8839:Code review changes
  * blackcathacker on Mon, 2 Mar 2015 21:10:30 -0700 [View Commit](../../commit/48644b1636a1f90e03a96ab708a49a164615497e)
* KRACOEUS-8891:Reduce logging on health checks
  * We are using the health check to make sure elb knows the server is up, but the performance logging log messages showing up every couple of seconds is annoying and expensive.
  * blackcathacker on Mon, 2 Mar 2015 22:39:43 -0700 [View Commit](../../commit/3241887a1167910856445eb7c8497ed253f1f2c9)
* KRACOEUS-8925:save budget on modular sync
  * Joe Williams on Tue, 3 Mar 2015 08:29:45 -0600 [View Commit](../../commit/6647d3a68e113c7c721d494697a8007104480843)
* KRACOEUS-8740:wrap long medusa text fields
  * Joe Williams on Tue, 3 Mar 2015 12:58:04 -0600 [View Commit](../../commit/2591263e27575bcf0eed36df2a242e0c550fcff4)
* KRACOEUS-8927:removed broken budget rule
  * Joe Williams on Tue, 3 Mar 2015 13:30:45 -0600 [View Commit](../../commit/f27cd8389153dc3ea47c07d8ba6446d5853887e6)
* KRACOEUS-8912: Add ability to certify enroute proposal
  * Gayathri on Tue, 3 Mar 2015 12:35:29 -0700 [View Commit](../../commit/ba4503daf9afdcc963dc0b414640135a109647b2)
* KRACOEUS-8924: hierarchy sync trace fix
  * Gayathri on Wed, 4 Mar 2015 09:23:35 -0700 [View Commit](../../commit/efddcd6130634812811f75975136ad74cad95125)
* KRACOEUS-8929:resize navigation menu drop downs when window size changes
  * Joe Williams on Wed, 4 Mar 2015 10:23:57 -0600 [View Commit](../../commit/7a4d6bac1635c7d4c009358a7bfee01c781b3414)
* KRACOEUS-8748, KRACOEUS-8930:
* Adding rule to check if a record can be deleted before submit (supports OJB, JPA, and DD relationships)
* Making all KC maintenance docs inherit from KcMaintenanceDocumentEntry (ensures that all maintenance docs use KcMaintenanceDocumentRuleBase if not specified
* Making all Kc Rules extend from KcMaintenanceDocumentRuleBase
* Fixing bootstrap skinning so that GLOBAL_ERRORS are visible
  * Travis Schneberger on Wed, 4 Mar 2015 14:03:04 -0500 [View Commit](../../commit/45168d24cc4a151c04e2e84c44918d48e815c7a8)
* KRACOEUS-8928: upgrading wss4j
  * Travis Schneberger on Wed, 4 Mar 2015 16:05:26 -0500 [View Commit](../../commit/f4ca95b06fa49cb90fd0ce9dabaeec6fa41309a2)
* KRACOEUS-8933: data cleanup, add constraints
  * Travis Schneberger on Thu, 5 Mar 2015 09:59:08 -0500 [View Commit](../../commit/3962401b85a683270189c2c784349ede962289cb)
* KRACOEUS-8748: code review comments
  * Travis Schneberger on Thu, 5 Mar 2015 10:14:50 -0500 [View Commit](../../commit/12fd321b813b96f3d59a29789c4fed23600e9841)
* KRACOEUS-8935: adding logging
  * Travis Schneberger on Thu, 5 Mar 2015 11:45:08 -0500 [View Commit](../../commit/cec39f1e9a42f6efe3947994b83a9529a58cddd0)
* KRACOEUS-8839:Ensure validations don't grab attachments
  * blackcathacker on Thu, 5 Mar 2015 12:10:37 -0700 [View Commit](../../commit/fb4e7689345b38158183c91ac5e6fc8927e1bba1)
* KRACOEUS_8938:fix some integration tests
  * Joe Williams on Fri, 6 Mar 2015 10:34:09 -0600 [View Commit](../../commit/2ba3289808dafaad309644ab7964e3fd1b9252d9)
* KRACOEUS-8940:fix reject action
  * Joe Williams on Fri, 6 Mar 2015 16:11:20 -0600 [View Commit](../../commit/9716421d803246f6a9ae4cbbadec758d604cae91)
* KRACOEUS-8937: avoiding an NPE on orphaned records
  * Travis Schneberger on Fri, 6 Mar 2015 20:20:25 -0500 [View Commit](../../commit/60e96b1d29bb46cabaeb9520c3aae72fe8aea0e4)
* KRACOEUS-8934: grm profiles
* moved grm specific items to a profile (maven and spring)
* fixed several pom issue from code merge
* fixed the ReportAction that is clearly broken
* made all grm internal dependencies runtime scope so we do not have compile time dependencies
* confirmed app builds and starts with the grm profile enabled and disabled with the correct functionality
  * Travis Schneberger on Fri, 6 Mar 2015 13:01:36 -0500 [View Commit](../../commit/af7ae9c108a974a814c1bc5a2741f40255984be9)
* KRACOEUS-8786:fix subaward validation
  * Joe Williams on Mon, 9 Mar 2015 09:44:03 -0500 [View Commit](../../commit/597228500c5053ea41146fb9c25c352669e421ea)
* KRACOEUS-8936:fix unit hierarchy view
  * Joe Williams on Mon, 9 Mar 2015 11:35:15 -0500 [View Commit](../../commit/5763260fdcbdca17f1b3c97dccfea92dafe7ea39)
*  fixing hr import
  * Travis Schneberger on Mon, 9 Mar 2015 15:33:38 -0400 [View Commit](../../commit/d11559e28810e38dcc86878e07311f74dda7b1a9)
* KRACOEUS-8931: fixing mysql file placement
  * Gayathri on Mon, 9 Mar 2015 15:15:44 -0700 [View Commit](../../commit/67d49af07d9490a5b477abf71732d666d983b51f)
*  supporting grm sql files
  * Travis Schneberger on Mon, 9 Mar 2015 23:41:30 -0400 [View Commit](../../commit/c15970262dc57fc22f473437ec2b1992ebf5e12f)
* KRACOEUS-8931: oracle scripts for release 6.0.1
  * Gayathri on Mon, 9 Mar 2015 14:40:01 -0700 [View Commit](../../commit/deb2667c659616e8e11e7481791a287e9f7e36b1)
*  Award locks fix
  * Gayathri on Tue, 10 Mar 2015 15:04:11 -0700 [View Commit](../../commit/42ef8b17a34420e6bff58d6d1c69f4a3822ffcd3)
* fix attachment errors when linking to child from parent
  * Joe Williams on Wed, 11 Mar 2015 10:33:15 -0500 [View Commit](../../commit/5beb381422c896a3623eaa0908d536e9e22731eb)
*  using a set to remove duplicate unit qualifications
  * Travis Schneberger on Wed, 11 Mar 2015 13:58:12 -0400 [View Commit](../../commit/f55da36e837ffdcc39b89760753940b5d8ca9603)
*  fixing int tests for the grm profile
  * Travis Schneberger on Wed, 11 Mar 2015 21:23:10 -0400 [View Commit](../../commit/db2eea4081080f78157a08669d4a1cccd3224e93)
* KRACOEUS-8902: fix notification text
  * Gayathri on Thu, 12 Mar 2015 10:54:23 -0700 [View Commit](../../commit/a4484743ea134628ed757d6fc1c64bdddd0fabba)
* KRACOEUS-8947: fixing data length problems, a serialization issue after submit, no need for oracle script change
  * Travis Schneberger on Thu, 12 Mar 2015 17:34:41 -0400 [View Commit](../../commit/8d4191bf20a98bbac28fb060c3b4903d0831b14d)
* Fix license in files
  * blackcathacker on Thu, 12 Mar 2015 11:24:03 -0700 [View Commit](../../commit/237357f04bff1866ab6a099c184f19786924a7cd)
* fix enroute attachment saving
  * Joe Williams on Fri, 13 Mar 2015 09:16:56 -0500 [View Commit](../../commit/d779cdb339a5adb7365e6a1a938d666c39a4e41c)
* return authorization exception messaeg instead of STE
  * Joe Williams on Fri, 13 Mar 2015 15:22:01 -0500 [View Commit](../../commit/bc1a27dc1dbeec2eb35aabc71946f4746698ed19)
* KCSUPPORT-661: adding documentation, fixing bug related to http://bugs.java.com/view_bug.do?bug_id=6476706
  * Travis Schneberger on Fri, 13 Mar 2015 21:09:05 -0400 [View Commit](../../commit/662d50db4abbe64022a44a7ffae43ff6f24fbf6c)
*  adding documentation
  * Travis Schneberger on Fri, 13 Mar 2015 21:48:55 -0400 [View Commit](../../commit/e63af1d39cecdfbc28e064d7ea6039efcdfcb59c)
* fix STE on unlink hierarchy
  * Joe Williams on Mon, 16 Mar 2015 09:06:49 -0500 [View Commit](../../commit/133f49a1f5053263661403c2b33ff8f8f2f930f1)
* KRACOEUS-8949: releasing s2s
  * Travis Schneberger on Mon, 16 Mar 2015 10:18:12 -0400 [View Commit](../../commit/4bf6fc11c1d7e71abb46a4260e01b00781dea35d)
* Make debug logging debug
  * blackcathacker on Mon, 16 Mar 2015 09:56:34 -0700 [View Commit](../../commit/dc19e393ad5def2beeb2ffb12240865082d238ab)
* Update pom.xml  * Travis Schneeberger on Mon, 16 Mar 2015 14:24:25 -0400 [View Commit](../../commit/4580ff0b6e7541519476735526612290a0fb3dbb)
* next iteration
  * Travis Schneberger on Mon, 16 Mar 2015 15:23:47 -0400 [View Commit](../../commit/0bf3f2b0b75a36de50a19ac259c5a537f8cfad0a)
* Support supplying test config via -Dvar=value
  * In order to support more easily configuring the CI server we want to move to -Dvar=value configuration for integration tests. By making these params not override previous values the -Dvar values are automatically pulled in and used.
  * blackcathacker on Mon, 16 Mar 2015 13:43:03 -0700 [View Commit](../../commit/bd7b6d440875a4bf445347aa6cdcda3ca702aa99)
* fix subaward attachment data
  * Joe Williams on Tue, 10 Mar 2015 16:55:33 -0500 [View Commit](../../commit/3b8220e13d57a0c148d55eecb1db52620e39d378)
* fix attachment deletion on copy and hierarchy
  * Joe Williams on Wed, 11 Mar 2015 13:24:19 -0500 [View Commit](../../commit/b3488496f6b224525b13f433eb95cdaae2a865b0)
* added budget category to non-budget add and edit modals
  * Joe Williams on Thu, 12 Mar 2015 14:34:01 -0500 [View Commit](../../commit/9b978e22af59cfa60c3b4b720495eaf70d7203cd)
* fixed extended attribute biosketch validation
  * Joe Williams on Tue, 17 Mar 2015 10:11:25 -0500 [View Commit](../../commit/6a4a190622ad563ad15fdc94d246acb5226038cc)
*  fixing budget rules
  * Gayathri on Mon, 16 Mar 2015 15:19:26 -0700 [View Commit](../../commit/f1be1a318f120bf0f3b9b9e62ed9b6688a2ae40b)
*  info text
  * Gayathri on Tue, 17 Mar 2015 12:28:12 -0700 [View Commit](../../commit/1dfae9b559380ca2c39e22b286c7d684b7cd317c)
*  IACUC and IRB help fixes
  * Gayathri on Wed, 11 Mar 2015 17:10:28 -0700 [View Commit](../../commit/f7e55fa9231bfd5d074ac54d8140489ad4b36113)
* fix sql scripts
  * Joe Williams on Wed, 18 Mar 2015 08:33:28 -0500 [View Commit](../../commit/98f7c4632c10426a1b688eb9d8613f442c001bb7)
* dismiss add person modal on add person request
  * Joe Williams on Wed, 18 Mar 2015 12:39:36 -0500 [View Commit](../../commit/47bc4c819ca6f8d87854d6a1a61760ee20ed9595)
*  approver cannot view budget
  * Gayathri on Wed, 18 Mar 2015 15:28:39 -0700 [View Commit](../../commit/ab3135b5d0e8e0e3d451bc860c071c4f640b03ed)
*  more help fixes
  * Gayathri on Thu, 12 Mar 2015 15:38:39 -0700 [View Commit](../../commit/e4be54df3781059509869faf9ce205be8388ec3b)
*  adding schemaspy to our project
  * Travis Schneberger on Wed, 18 Mar 2015 17:36:02 -0400 [View Commit](../../commit/f453ad29308a3220c8b5affe202f7f058fe62bd7)
* KCSUPPORT-661: properly reading logging files from the classpath
  * Travis Schneberger on Wed, 18 Mar 2015 20:18:57 -0400 [View Commit](../../commit/d9c57d4c0e914e71839cdd6e29ceebffc58edfd2)
*  turning on flyway grm by default
  * Travis Schneberger on Thu, 19 Mar 2015 08:08:02 -0400 [View Commit](../../commit/dba00aac7ff22230ddda6560ab5983056502e95a)
*  fixing coeus-it dependency and build order
  * Travis Schneberger on Thu, 19 Mar 2015 10:00:35 -0400 [View Commit](../../commit/e4cdd867c4ef8de28e23205626097cb5e26d62a3)
*  fixing staging data
  * Travis Schneberger on Thu, 19 Mar 2015 10:41:56 -0400 [View Commit](../../commit/4338fdb21b561862ba26e8ede085c28102aa91d6)
*  resequencing db script
  * Travis Schneberger on Thu, 19 Mar 2015 10:44:03 -0400 [View Commit](../../commit/8e5c516212ec97cb1250c717efa9eedb550cc48c)
* Disable OJB mappings for subaward attachments
  * Subawards are only used by prop dev and therefore only relevent under JPA
  * blackcathacker on Thu, 19 Mar 2015 11:01:33 -0700 [View Commit](../../commit/6ad78c73a8bc378d3bd1011014478ac582c6c330)
* OJB mapping test configurable by system prop
  * In order to support configuring Jenkins CI test runs through Jenkins itself we need to be able to configure the OJB mapping test through system props
  * blackcathacker on Thu, 19 Mar 2015 11:04:51 -0700 [View Commit](../../commit/4edf73fa983f9bed8da46e8f0de29a9298dedf3f)
* Fix remaining integration tests
  * This also makes it so system properties always override configuration params
  * blackcathacker on Thu, 19 Mar 2015 20:02:06 -0700 [View Commit](../../commit/97d189cb3f616109c3f363bf62ec9467b06f9966)
* get xml file from subaward
  * Joe Williams on Fri, 20 Mar 2015 08:34:58 -0500 [View Commit](../../commit/13c43dc9386e327e7eb1929d57af27554c631493)
*  updating error prone compiler, fixing several bugs found by compiler
  * Travis Schneberger on Fri, 20 Mar 2015 09:41:19 -0400 [View Commit](../../commit/1ef2966853ddc1328f74fc02ada486a926340dee)
* allow edit/copy of person training
  * Joe Williams on Fri, 20 Mar 2015 11:06:09 -0500 [View Commit](../../commit/9e29536a64c4d0cffe4eaf25cc6d456b359575ac)
* fix STE on award notice print
  * Joe Williams on Fri, 20 Mar 2015 15:40:06 -0500 [View Commit](../../commit/adc64c4239a0b93f2f4a9df97a944f4062c5bed0)
* set default period to calendar
  * Joe Williams on Fri, 20 Mar 2015 17:01:31 -0500 [View Commit](../../commit/5b4be2c7bf7c82dc432f76182d9d8bda7ce1f8cc)
*  Verify that the Instrumentation Configuration is correct
  * Travis Schneberger on Sat, 21 Mar 2015 21:21:40 -0400 [View Commit](../../commit/e208c6be03ab8e444a5254083b3e98714bd2890e)
* add inflation rate info to add budget line item modals
  * Joe Williams on Thu, 19 Mar 2015 16:09:11 -0500 [View Commit](../../commit/40561a4ba47d0cf06a7b9e53ceeb9643a6c58bec)
* create s2s error for missing citizenshiptype instead of throwing exception
  * Joe Williams on Mon, 23 Mar 2015 10:16:26 -0500 [View Commit](../../commit/80c865922b44fb588e89a14d69bf4665248ca649)
* fix award labels on medusa view
  * Joe Williams on Mon, 23 Mar 2015 14:22:30 -0500 [View Commit](../../commit/32163e1b7400461130fde7d17293242cb9f1a799)
* fix STE on navigation to award budget summary
  * Joe Williams on Tue, 24 Mar 2015 09:33:42 -0500 [View Commit](../../commit/7dded8ecc47fcb1575a887b4d6e8150fb2a0049d)
* added campus code and unit quickfinders to add personnel wizard
  * Joe Williams on Tue, 24 Mar 2015 10:21:29 -0500 [View Commit](../../commit/27e5fec98788f52c467d05666babee428da27e39)
* filter on inflation rateClassType and add ID to table
  * Joe Williams on Tue, 24 Mar 2015 11:43:16 -0500 [View Commit](../../commit/b5be2afb71ccbe6cc22dd148535812ded8e0aeec)
* fix STE on award budget navigation
  * Joe Williams on Tue, 24 Mar 2015 16:41:34 -0500 [View Commit](../../commit/4c1371b4689abd9ea38d842d37adbe0917e1c739)
* fix print s2s xml button
  * Joe Williams on Wed, 25 Mar 2015 13:15:33 -0500 [View Commit](../../commit/572e2d6cf531cba3c986cb7a86a81c38d95a09ca)
* RESKC_239:update attachment handling to be compatible with oracle and mysql
  * Joe Williams on Wed, 25 Mar 2015 12:34:23 -0500 [View Commit](../../commit/40bf50c3ab7ed4ee560a20ef6a908f43f6a89008)
* fix issue with escalating award budget total costs
  * Joe Williams on Wed, 25 Mar 2015 14:34:40 -0500 [View Commit](../../commit/f07ed082e40e3fecce2923c64f07a02fbf85c942)
* save budget when applying rates to later periods
  * Joe Williams on Wed, 25 Mar 2015 16:23:20 -0500 [View Commit](../../commit/2e7aa920e36fe2ffb550b73e1fc797a679e8117a)
* once a budget line item is added summary rows are no longer editable
  * Joe Williams on Wed, 25 Mar 2015 16:33:47 -0500 [View Commit](../../commit/e3ba5d7beb67c6f5600561ad2095d590296b3a5b)
* Fix GRM SQL Error
  * blackcathacker on Thu, 26 Mar 2015 16:44:04 -0700 [View Commit](../../commit/c7113ca039623421b63f44ac81f51e1ea0706ef9)
* View questionnaire using table instead of doc
  * This is to avoid serialization issues that occur due to questionnaire class repackaging
  * blackcathacker on Thu, 26 Mar 2015 17:52:57 -0700 [View Commit](../../commit/f0a41a0001fa963fe965483c29b3686aec0d92bb)
* Add citizenship type to clear error
  * blackcathacker on Thu, 26 Mar 2015 19:51:35 -0700 [View Commit](../../commit/a73050fea047564acbeefa8569ffa86990b3c2ce)
* Modify and refactor unit and jetty memory arguments
  * blackcathacker on Fri, 27 Mar 2015 15:36:55 -0700 [View Commit](../../commit/4e7152bf30f5a6f8a8863bba3b10cb993d366396)
* Refactoring UnitServiceImpl
  * Travis Schneberger on Tue, 31 Mar 2015 11:43:05 -0400 [View Commit](../../commit/f4b6e5137e7c601695ce9d58417484cb16af9721)
* Refactor/test time and money trans history
  * blackcathacker on Tue, 31 Mar 2015 16:52:08 -0600 [View Commit](../../commit/1f39073e2a318206b794ea2fe3eb737addeb5055)
* Fix up abstractBudgetService
  * Joe Williams on Thu, 2 Apr 2015 13:01:34 -0600 [View Commit](../../commit/3a9dc171391f24bbfb27a2b46fb998672504a7d6)
* Cleanup dead code in TimeAndMoneyHistoryServiceImpl
  * blackcathacker on Wed, 1 Apr 2015 15:59:19 -0600 [View Commit](../../commit/5a6f2e5102bd766a450cf6a3ec35723fc5a8d69e)
* cleanup dead pd code, fixing precompilation step, fixing jsp compilation failures
  * Travis Schneberger on Fri, 3 Apr 2015 10:39:19 -0400 [View Commit](../../commit/b8280d98a718769e4be368fa4580998ba6273e94)
* dead js cleanup
  * Travis Schneberger on Fri, 3 Apr 2015 11:40:05 -0400 [View Commit](../../commit/59baafe9d00379094d7d7073e974ed291bba7e23)
* attempting to fix precompile
  * Travis Schneberger on Fri, 3 Apr 2015 14:10:28 -0400 [View Commit](../../commit/88de6f425229e94204c491ec313fb6f5627e5839)
* Revert "attempting to fix precompile"
  * Travis Schneeberger on Fri, 3 Apr 2015 14:19:23 -0400 [View Commit](../../commit/0bb8dd92b3f020ed3bf5b558f13d0fde5a1dc97f)
* attempting to fix precompile
  * Travis Schneberger on Fri, 3 Apr 2015 16:24:44 -0400 [View Commit](../../commit/c121570946cd8c1a4672ba3ade7ec2630ec8b86d)
* attempting to fix precompile
  * Travis Schneberger on Fri, 3 Apr 2015 17:17:51 -0400 [View Commit](../../commit/d18ad43b5ef50726b0e463c9f695a47f153fb4a1)
* attempting to fix precompile
  * Travis Schneberger on Fri, 3 Apr 2015 18:09:57 -0400 [View Commit](../../commit/778e3d1004c1786f7ae65da72a40d031af8ad4fb)
* Revert "attempting to fix precompile"
  * Travis Schneeberger on Fri, 3 Apr 2015 18:15:28 -0400 [View Commit](../../commit/aee775ffe111bdcbb7e417ae4a7750300e688042)
* Update pom.xml  * Travis Schneeberger on Fri, 3 Apr 2015 20:30:22 -0400 [View Commit](../../commit/8e0e708802ae702e1f64ea6e6cf4bcf4806d3a1f)
* Update pom.xml  * Travis Schneeberger on Sat, 4 Apr 2015 00:50:06 -0400 [View Commit](../../commit/35e0dd33e841e1c606fad02734d802332e9773ab)
* Update pom.xml  * Travis Schneeberger on Sat, 4 Apr 2015 09:28:24 -0400 [View Commit](../../commit/768e003ff526fc0a826f7d5916491db80ccf46ba)
* release process
  * Travis Schneberger on Mon, 6 Apr 2015 10:16:45 -0400 [View Commit](../../commit/69b167e22afd71c8ea6dbbab40fd38ec777e635b)
* fix issues with person biosketch on prop dev
  * Joe Williams on Mon, 6 Apr 2015 08:28:26 -0500 [View Commit](../../commit/4a9d5ee0c8fb954e22a6d17f63619ab1e22582b3)
* Fix questionnaire test
  * Test was broken when switching viewing questionnaires from using the last document verison to using the database version always
  * blackcathacker on Mon, 6 Apr 2015 10:15:07 -0700 [View Commit](../../commit/8529b0d786b69d04ed2a98bced752aac7f7360e3)
* Fix questionnaire test -- apparently didn't stage changes
  * blackcathacker on Mon, 6 Apr 2015 16:09:09 -0700 [View Commit](../../commit/7ebc716812c82ca06b83d46783beb77d26326b4a)