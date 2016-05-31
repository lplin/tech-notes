#
$ svn diff http://svn/java/cmf/branches/cmf-3.0.12-hotfixes -r 58254:58795  > ../t.diff


# Backward:

If you simply want to go back to an other revision, update it's what you are looking for.

svn update -r 9
(From: http://stackoverflow.com/questions/1096899/back-to-revision-in-subversion)

# Patch:

lplin@dlm47 ~/projects/cmf/trunk $ svn diff -c 57631 > ../debug-operations.diff
lplin@dlm47 ~/projects/cmf/trunk $ patch -R -p0 -i ../debug-operations.diff 
patching file src/db/migration/2016-01-release/CMF-826-add-CIT-operations
(From: https://ariejan.net/2007/07/03/how-to-create-and-apply-a-patch-with-subversion/)
(03:22:15 PM) Alan D. Salewski: In a nutshell you edit the source code to remove the "(0)" and "(C)" bits and (ideally) make a single svn commit
(03:22:57 PM) Alan D. Salewski: That would allow us to then do 'svn diff -c <REVSION>' (or some variant of that) to make a patch, which...
(03:22:58 PM) lplin1@s1-plim00/2o9f26dd84: Already done, a minute ago.
(03:23:09 PM) Alan D. Salewski: we would then apply with 'patch -R...'


# Revision diff:
https://jira.rdc.com/browse/CMF#selectedTab=com.atlassian.jira.plugin.ext.subversion%3Asubversion-project-tab

http://svn.rdc.com/viewvc/java/rdc-web-common/tags/
tags/rdc-web-common-0.1.4/	 42064
tags/rdc-web-common-0.1.8/	 48840 
trunk/	 48841

svn diff -r 42064:48840 http://svn.rdc.com/java/rdc-web-common/trunk
Index: src/test/java/com/rdc/web/util/ValidationUtilsTest.java
===================================================================
--- src/test/java/com/rdc/web/util/ValidationUtilsTest.java	(revision 0)
+++ src/test/java/com/rdc/web/util/ValidationUtilsTest.java	(revision 48840)
==>
http://svn.rdc.com/viewvc/java/rdc-web-common/tags/rdc-web-common-0.1.8/src/test/java/com/rdc/web/util/ValidationUtilsTest.java?view=diff&r1=0&r2=48840&diff_format=h ==> Error
==>
http://svn.rdc.com/viewvc/java/rdc-web-common/tags/rdc-web-common-0.1.8/src/test/java/com/rdc/web/util/ValidationUtilsTest.java 48041:48840
http://svn.rdc.com/viewvc/java/rdc-web-common/tags/rdc-web-common-0.1.8/src/test/java/com/rdc/web/util/ValidationUtilsTest.java?view=diff&r1=48041&r2=48840&diff_format=h
==> Or simply
http://svn.rdc.com/viewvc/java/rdc-web-common/tags/rdc-web-common-0.1.8/src/test/java/com/rdc/web/util/ValidationUtilsTest.java?revision=48840&view=markup

--- src/main/java/com/rdc/web/security/RdcSecurityIpWhitelistInterceptor.java	(revision 42064)
+++ src/main/java/com/rdc/web/security/RdcSecurityIpWhitelistInterceptor.java	(revision 48840)
http://svn.rdc.com/viewvc/java/rdc-web-common/tags/rdc-web-common-0.1.8/src/main/java/com/rdc/web/security/RdcSecurityIpWhitelistInterceptor.java?view=diff&r1=42064&r2=48840&diff_format=h

--- src/main/java/com/rdc/web/security/RdcSecurityInterceptor.java	(revision 42064)
+++ src/main/java/com/rdc/web/security/RdcSecurityInterceptor.java	(revision 48840)
http://svn.rdc.com/viewvc/java/rdc-web-common/tags/rdc-web-common-0.1.8/src/main/java/com/rdc/web/security/RdcSecurityInterceptor.java?view=diff&r1=42064&r2=48840&diff_format=h

--- src/main/java/com/rdc/web/util/ValidationUtils.java	(revision 42064)
+++ src/main/java/com/rdc/web/util/ValidationUtils.java	(revision 48840)
http://svn.rdc.com/viewvc/java/rdc-web-common/tags/rdc-web-common-0.1.8/src/main/java/com/rdc/web/util/ValidationUtils.java?view=diff&r1=42064&r2=48840&diff_format=h


--- pom.xml	(revision 42064)
+++ pom.xml	(revision 48840)
http://svn.rdc.com/viewvc/java/rdc-web-common/tags/rdc-web-common-0.1.8/pom.xml?view=diff&r1=42064&r2=48840&diff_format=h

# Merge to the trunk
lplin@dlm47 ~/projects/cmf/trunk $ svn merge --reintegrate ^/cmf/branches/reset-password-using-email
--- Merging differences between repository URLs into '.':
U    contrib/algo-dev-db-scripts/algo-cmf-normalize-passwords
A    cmf-webapp/src/main/java/com/rdc/cmf/web/action/security/ResetPasswordAction.java
U    cmf-webapp/src/main/java/com/rdc/cmf/web/action/admin/EditUserAction.java
...


# Merge from the trunk
lplin@dlm47 ~/projects/cmf-branches/reset-password-using-email $ svn merge ^/cmf/trunk
svn: E195020: Cannot merge into mixed-revision working copy [54679:54868]; try updating first
lplin@dlm47 ~/projects/cmf-branches/reset-password-using-email $ svn up
Updating '.':
At revision 54884.
lplin@dlm47 ~/projects/cmf-branches/reset-password-using-email $ svn merge ^/cmf/trunk
--- Merging r54679 through r54884 into '.':
U    cmf-webapp/src/main/java/com/rdc/cmf/web/action/report/RunReport2Action.java
U    cmf-webapp/src/main/java/com/rdc/cmf/web/action/report/GetReportByTokenAction.java
U    cmf-webapp/src/main/java/com/rdc/cmf/web/action/report/RunReportAction.java
U    cmf-webapp/src/main/webapp/WEB-INF/pages/view/reports_view.jsp
U    cmf-model/src/main/java/com/rdc/cmfmodel/model/type/ReportFormat.java
U    cmf-middletier/src/main/java/com/rdc/cmf/middletier/services/report/formatters/ReportFormatterFactory.java
U    src/changes/changes.xml
--- Recording mergeinfo for merge of r54679 through r54884 into '.':
 U   .
lplin@dlm47 ~/projects/cmf-branches/reset-password-using-email $ 


# Merge [...](http://svnbook.red-bean.com/en/1.7/svn.branchmerge.basicmerging.html)

lplin@dlm47 ~/projects/cmf/branches/switch-users-without-their-password $ svn merge ^/cmf/trunk
--- Merging r53731 through r53917 into '.':
U    cmf-webapp/pom.xml
U    cmf-model/src/main/java/com/rdc/cmfmodel/model/Inquiry.java
U    cmf-model/src/main/resources/ibatis/CmfModel_Batch.xml
U    cmf-model/src/main/resources/ibatis/CmfModel_Core.xml
U    cmf-model/src/main/resources/SqlQueries/CreateNewQueue.sql
U    cmf-model/pom.xml
U    cmf-middletier/src/main/java/com/rdc/cmf/middletier/model/EtlInquiry.java
U    cmf-middletier/src/main/java/com/rdc/cmf/middletier/util/InquiryValidationEventHandler.java
U    cmf-middletier/src/main/resources/inquiry.xsd
U    cmf-middletier/pom.xml
U    cmf-etl/src/main/java/com/rdc/cmf/etl/model/CmfRecord.java
U    cmf-etl/src/main/java/com/rdc/cmf/etl/filetransformer/impl/XMLFileTransformer.java
U    cmf-etl/src/main/java/com/rdc/cmf/etl/filetransformer/impl/CharacterSeparatedValueFileTransformer.java
U    cmf-etl/src/main/java/com/rdc/cmf/etl/filetransformer/impl/RibPsvFileTransformer.java
U    cmf-etl/src/main/java/com/rdc/cmf/etl/listener/ClientInputFileDirectoryListener.java
U    cmf-etl/src/main/resources/cmf-etl-context.xml
U    cmf-etl/pom.xml
U    src/db/migration/2015-06-release/CMF-708-Lloyds-PEP-disposition_reason
U    src/db/migration/2015-06-release/00-run-all
U    src/db/migration/2015-06-release/CMF-799-BW10000TP-Bank-of-West-initial-database-setup
A    src/db/migration/2015-07-release
A    src/db/migration/2015-07-release/CMF-561-make-WU-inquiry-fields-nullable
A    src/db/migration/2015-07-release/libcmf-db-migration.bash
A    src/db/migration/2015-07-release/00-run-all
A    src/db/migration/2015-07-release/CMF-798-provide-on_hold_report_date_settings-if-missing
A    src/db/migration/2015-09-release
A    src/db/migration/2015-09-release/libcmf-db-migration.bash
A    src/db/migration/2015-09-release/00-run-all
A    src/db/migration/2015-09-release/CMF-561-drop-WU-inquiry-fields
U    src/db/migration/00-run-all.TEMPLATE
U    src/changes/changes.xml
U    pom.xml
U    cmf-cmib1_0_x-api/pom.xml
U    cmf-common/pom.xml
--- Recording mergeinfo for merge of r53460 through r53917 into '.':
 U   .
--- Recording mergeinfo for merge of r53460 through r53917 into 'src/db':
 U   src/db
--- Recording mergeinfo for merge of r53460 through r53917 into 'src/db/migration':
 U   src/db/migration


lplin@dlm47 ~/projects/cmf/trunk $ svn merge --reintegrate ^/cmf/branches/switch-users-without-their-password
--- Merging differences between repository URLs into '.':
U    cmf-webapp/src/main/java/com/rdc/cmf/web/security/CmfSecurityManager.java
U    cmf-webapp/src/main/java/com/rdc/cmf/web/security/CmfSecurityManagerImpl.java
U    cmf-webapp/src/main/java/com/rdc/cmf/web/security/CmfSecurityInterceptor.java
U    cmf-webapp/src/main/java/com/rdc/cmf/web/action/operation/SaveCaseAction.java
U    cmf-webapp/src/main/java/com/rdc/cmf/web/action/BaseActionSupport.java
A    cmf-webapp/src/main/java/com/rdc/cmf/web/action/security/GetUsersByGroupCombo.java
A    cmf-webapp/src/main/java/com/rdc/cmf/web/action/security/SwitchFirmAction.java
A    cmf-webapp/src/main/java/com/rdc/cmf/web/action/security/SwitchUserAction.java
U    cmf-webapp/src/main/java/com/rdc/cmf/web/action/view/CoreCaseNavAction.java
U    cmf-webapp/src/main/resources/rdc.properties
A    cmf-webapp/src/main/webapp/cmf_resources/scripts/switch_user.js
U    cmf-webapp/src/main/webapp/WEB-INF/pages/view/core_view.jsp
U    cmf-webapp/src/main/webapp/WEB-INF/decorators/main.jsp
U    cmf-model/src/main/java/com/rdc/cmfmodel/model/type/AdminEnum.java
U    cmf-model/src/main/java/com/rdc/cmfmodel/model/User.java
U    cmf-model/src/main/java/com/rdc/cmfmodel/model/Audit.java
A    cmf-model/src/main/java/com/rdc/cmfmodel/model/AuditBuilder.java
U    cmf-model/src/main/java/com/rdc/cmfmodel/model/UserGroup.java
U    cmf-model/src/main/java/com/rdc/cmfmodel/service/JasperBeanFactory.java
U    cmf-model/src/main/java/com/rdc/cmfmodel/dao/CmfUserModelDao.java
U    cmf-model/src/main/java/com/rdc/cmfmodel/dao/CmfUserModelDaoImpl.java
U    cmf-model/src/main/java/com/rdc/cmfmodel/dao/CmfModelDaoImpl.java
U    cmf-model/src/main/java/com/rdc/cmfmodel/dao/CmfModelBatchDaoImpl.java
U    cmf-model/src/main/java/com/rdc/cmfmodel/dao/CmfReconciliationDaoImpl.java
U    cmf-model/src/main/resources/ibatis/CmfModel_User.xml
U    cmf-model/src/main/resources/ibatis/CmfModel_Core.xml
U    cmf-middletier/src/main/java/com/rdc/cmf/middletier/operation/impl/PendInquiry.java
U    cmf-middletier/src/main/java/com/rdc/cmf/middletier/operation/impl/InquiryLifecycleCommand.java
U    cmf-middletier/src/main/java/com/rdc/cmf/middletier/operation/impl/AdHocCommentInquiry.java
U    cmf-middletier/src/main/java/com/rdc/cmf/middletier/operation/impl/ReopenCase.java
U    cmf-middletier/src/main/java/com/rdc/cmf/middletier/operation/impl/UnpendCase.java
U    cmf-middletier/src/main/java/com/rdc/cmf/middletier/operation/impl/UnInProcessInquiry.java
U    cmf-middletier/src/main/java/com/rdc/cmf/middletier/operation/impl/CaseLifecycleCommand.java
U    cmf-middletier/src/main/java/com/rdc/cmf/middletier/operation/impl/AdHocCommentCase.java
U    cmf-middletier/src/main/java/com/rdc/cmf/middletier/operation/impl/ReopenInquiry.java
U    cmf-middletier/src/main/java/com/rdc/cmf/middletier/operation/impl/DropPmAlertInquiry.java
U    cmf-middletier/src/main/java/com/rdc/cmf/middletier/operation/impl/UnPendInquiry.java
U    cmf-middletier/src/main/java/com/rdc/cmf/middletier/operation/impl/EscalateCase.java
U    cmf-middletier/src/main/java/com/rdc/cmf/middletier/operation/impl/PendCase.java
U    cmf-middletier/src/main/java/com/rdc/cmf/middletier/operation/impl/DropPmAlertCase.java
U    cmf-middletier/src/main/java/com/rdc/cmf/middletier/services/SecurityManager.java
U    cmf-middletier/src/main/java/com/rdc/cmf/middletier/services/UpdateService.java
U    cmf-middletier/src/main/java/com/rdc/cmf/middletier/services/SecurityManagerImpl.java
U    cmf-middletier/src/main/java/com/rdc/cmf/middletier/services/UpdateServiceImpl.java
U    cmf-middletier/src/main/java/com/rdc/cmf/middletier/services/ETLServiceImpl.java
D    cmf-middletier/src/main/java/com/rdc/cmf/middletier/services/AuditBuilder.java
U    cmf-etl/src/main/java/com/rdc/cmf/etl/listener/RipProcessorDelegate.java
U    cmf-etl/src/main/java/com/rdc/cmf/etl/listener/GridResponseListener.java
 U   src/db/migration/libcmf-db-migration.bash
A    src/db/migration/2015-06-release/CMF-762-RD00000T-RDC-admin-firm-initial-database-setup
 U   src/db/migration
 U   src/db
 U   .
--- Recording mergeinfo for merge between repository URLs into '.':
 U   .
 U   src/db
 U   src/db/migration
 U   src/db/migration/libcmf-db-migration.bash


# # Backup SVN changed files
$ svn st | awk '{ print $2}' | grep src | grep -v '/resources' | xargs -I f1 cp --parents f1 ~/tmp/tt

# SVN propedit
	svn propedit svn:ignore .
	When you run that command svn will open your text editor, and this is where you can define patterns or specific files to ignore. If you place a * in the property file,

	For only one file:
	svn propset svn:ignore .project .

	[llin@llin-lin2 db]$ svn log install/ra_rds/scripts/grant_perms_for_mdb_rds.sql | more

	[llin@llin-lin2 ra]$ svn diff --old=http://svn/svn/riteaid-mdm/tags/riteaid-mdm-1.0.1.5/ --new=.

# SVN Ignore
	$ svn propset svn:ignore "cc" /home/llin/projects/platform/ozone/trunk/ui/cc
		property 'svn:ignore' set on '/home/llin/projects/platform/ozone/trunk/ui/cc'

# Find out which branch and revision number the tagtags it's sufficient to do:
	$ svn log -v -q --stop-on-copy http://svn/svn/datastore/tags/datastore-1.1.7.3 | grep "   A"
	$ svn log -v -q --stop-on-copy http://svn/svn/datastore/tags/datastore-1.1.7.3 | grep "   A"
		 A /datastore/tags/datastore-1.1.7.3 (from /datastore/branches/ds_m1:80055)

# [JBoss 4.2.x Properties File Deployer](https://github.com/aaronwalker/JBoss-Properties-File-Deployer)
	git clone git://github.com/aaronwalker/JBoss-Properties-File-Deployer.git

# CVS
	set CVSROOT=:ext:llin@cvs.hmsonline.com:/home/cvs
	$ cvs co hms_delivery/bin/dp_guid_xwalk
	llin@cvs.hmsonline.com's password:
	U hms_delivery/bin/dp_guid_xwalk

# SVN cannot tag pom.xml, already exists, work around:
	From:
	# mvn release:prepare
	=> fails
	# svn up -r head
	# mvn release:prepare -Dresume

# POM file diff
	svn st -v pom.xml
	svn log pom.xml
	svn diff -r 63476 pom.xml
	svn cat -r 63655 pom.xml

# Branch
	1.svn copy http://svn/svn/riteaid-mdm/tags/riteaid-mdm-1.0.1.5 http://svn/svn/riteaid-mdm/branches/riteaid-mdm-1.0.1.5-PROD
	(from: http://research.mosuma.com/faq/howto/svn_branch_merge)
	2.check out the branch
	3.Batch modification of pom.xml
	perl -i -pe 's/1.0.1.5/1.0.1.5.1-SNAPSHOT/;' `find . -name pom.xml`
	4.modify the scm section of the root pom.xml, to make sure the url exists.
	<scm>
		<url>https://svn.hmsonline.com/svn/riteaid-mdm/branches/riteaid-mdm-1.0.3.0-branch</url>
		<connection>scm:svn:http://svn.hmsonline.com/svn/riteaid-mdm/branches/riteaid-mdm-1.0.3.0-branch</connection>
		<developerConnection>scm:svn:http://svn.hmsonline.com/svn/riteaid-mdm/branches/riteaid-mdm-1.0.3.0-branch</developerConnection>
	</scm>

# Remove Windows ^M:
	$ svn diff | less
	$ svn status | awk '/^M/ {print $2}'
	$ svn status | awk '/^M/ {print $2}' | xargs rm

	svn commit -m 'preparing for next release'

# copy specific files with the structure
	[llin@llin-lin2 riteaid-mdm]$ svn st | awk '{print $2}' | cpio -pavdu ../branches/ra1013

# List changes in a revision
	[llin@llin-lin2 riteaid-mdm]$ svn log -v -r72328
	------------------------------------------------------------------------
	r72328 | llin | 2010-05-20 10:49:48 -0400 (Thu, 20 May 2010) | 1 line
	Changed paths:
		 M /riteaid-mdm/trunk/ejb/loader-service/src/main/resources/com/hmsonline/riteaid/hmsdata/create_fn_on_fullname_at_address.sql
		 M /riteaid-mdm/trunk/ejb/loader-service/src/main/resources/com/hmsonline/riteaid/hmsdata/create_practs_addresses_for_riteaid
		 M /riteaid-mdm/trunk/ejb/loader-service/src/main/resources/com/hmsonline/riteaid/hmsdata/fn_on_fullname_address.sql
		 M /riteaid-mdm/trunk/ejb/loader-service/src/main/resources/com/hmsonline/riteaid/hmsdata/fn_on_fullname_dea.sql
		 M /riteaid-mdm/trunk/ejb/loader-service/src/main/resources/com/hmsonline/riteaid/hmsdata/fn_on_fullname_distance_identifer.sql
		 M /riteaid-mdm/trunk/ejb/loader-service/src/main/resources/com/hmsonline/riteaid/hmsdata/fp_on_npi.sql

	RAMDM-438: Comments and styles.
	------------------------------------------------------------------------



