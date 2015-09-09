#!/bin/bash
# ORDER TO RUN SQL
#VX_oracle_rice_server_upgrade.sql
#VX_oracle_rice_client_upgrade.sql
#VX_oracle_kc_rice_server_upgrade.sql
#VX_oracle_kc_upgrade.sql

CHECK_JAVA=`which java`
if [ "${CHECK_JAVA}" != "/cygdrive/c/Program Files/Java/jdk1.8.0_51/bin/java" ]
then
    echo "Java 8 not detected....exiting"
    exit
fi



CURRENT_DIR=`pwd`

getAnswer() {
        answer=''
        while [ -z "${answer}" ]
        do
                printf "$1: " 1>&2
                read answer
        done
        echo "${answer}"
        echo 1>&2
        }

if [ -f ../../../../../../../../../../../coeus-db-data-conv/ojdbc7-12.1.0.2.jar ]
then
    echo "found ojdbc file proceeding"
else
    echo "ERROR: didn't find ojdbc file in coeus-db-conv directory aborting"
    exit 1
fi


un=`getAnswer 'Enter KC Database Username'`

pw=`getAnswer 'Enter KC Database Password'`

DBSvrNm=`getAnswer 'Enter KC Database TNS Name'`

PORT=`getAnswer 'Enter Database portforwarding PORT'`

# Make sure username has kcxxxx name
if [ "${un}" == "${un/kc//}" ]
then
    echo "*************************************************"
    echo "ERROR:user name doesn't contain kc"
    echo "aborting: this doesn't seem to be a demo database"
    echo "*************************************************"
    exit 1
fi

if [ "${DBSvrNm}" != "kcdev" ] && [ "${DBSvrNm}" != "kc" ]
then
    echo "db server name not valid must be kcdev or kc"
    exit
fi

if [ "${DBSvrNm}" == "kc" ]
then 
    echo "DB SERVER SELECTED WAS kc"
    while [ "${ans}" != "y" ] && [ "${ans}" != "n" ]
    do
        read -p "***** REALLY WORK IN PRODUCTION *****   Continue ? (y/n)" ans
    done

    if [ "${ans}" == "n" ]
    then
        exit 1
    fi
fi


timestamp=`date +%Y%m%d%H%M`
LOGDIR=${CURRENT_DIR}/LOGS.${un}.${timestamp}
mkdir -p ${LOGDIR}

# DEMO IS ALREADY created at 6.0 level so skip
echo "Skipping upgrades from 520-600 since demo database should be 6.0 already"
# Update to 5.2.0
#sqlplus "${un}"/"${pw}@${DBSvrNm}" < 520_oracle_rice_server_upgrade.sql
#sqlplus "${un}"/"${pw}@${DBSvrNm}" < 520_oracle_rice_client_upgrade.sql
#sqlplus "${un}"/"${pw}@${DBSvrNm}" < 520_oracle_kc_rice_server_upgrade.sql
#sqlplus "${un}"/"${pw}@${DBSvrNm}" < 520_oracle_kc_upgrade.sql

# Update to 5.2.1
#sqlplus "${un}"/"${pw}@${DBSvrNm}" < 521_oracle_kc_rice_server_upgrade.sql
#sqlplus "${un}"/"${pw}@${DBSvrNm}" < 521_oracle_kc_upgrade.sql

# Update to 6.0.0
#sqlplus "${un}"/"${pw}@${DBSvrNm}" < 600_oracle_rice_server_upgrade.sql
#sqlplus "${un}"/"${pw}@${DBSvrNm}" < 600_oracle_rice_client_upgrade.sql
#sqlplus "${un}"/"${pw}@${DBSvrNm}" < 600_oracle_kc_rice_server_upgrade.sql
#sqlplus "${un}"/"${pw}@${DBSvrNm}" < 600_oracle_kc_upgrade.sql

#echo "Grepping for errors in the logs"
#mv *.log ${LOGDIR}
#grep -i error ${LOGDIR}/*.log

#while [ "${ans}" != "y" ] && [ "${ans}" != "n" ]
#do
#    read -p "Next Step Run Database Conversion Process Continue ? (y/n)" ans
#done

#if [ "${ans}" == "n" ]
#then
#    exit 1
#fi

cd ../../../../../../../../../../../coeus-db-data-conv
./runDataConv.sh -u ${un} -p ${pw} -l ${LOGDIR} -n ${PORT} -s ${DBSvrNm}

cd ${CURRENT_DIR}

echo "Grepping for errors in the logs"
grep -i error  ${LOGDIR}/*ConvertRun.log

while [ "${ans2}" != "y" ] && [ "${ans2}" != "n" ]
do
    read -p "Next Step Run Post 6.0 upgrade scripts Continue ? (y/n)" ans2
done

if [ "${ans2}" == "n" ]
then
    exit 1
fi

# Update to 6.0.1
sqlplus "${un}"/"${pw}@${DBSvrNm}" < 601_oracle_kc_rice_server_upgrade.sql
sqlplus "${un}"/"${pw}@${DBSvrNm}" < 601_oracle_kc_upgrade.sql

# Update to 6.0.2
sqlplus "${un}"/"${pw}@${DBSvrNm}" < 602_oracle_kc_rice_server_upgrade.sql
sqlplus "${un}"/"${pw}@${DBSvrNm}" < 602_oracle_kc_upgrade.sql

# Update to 1505
sqlplus "${un}"/"${pw}@${DBSvrNm}" < 1505_oracle_kc_rice_server_upgrade.sql
sqlplus "${un}"/"${pw}@${DBSvrNm}" < 1505_oracle_kc_upgrade.sql

#Update to 1506
sqlplus "${un}"/"${pw}@${DBSvrNm}" < 1506_oracle_rice_server_upgrade.sql
sqlplus "${un}"/"${pw}@${DBSvrNm}" < 1506_oracle_kc_rice_server_upgrade.sql
sqlplus "${un}"/"${pw}@${DBSvrNm}" < 1506_oracle_kc_upgrade.sql
sqlplus "${un}"/"${pw}@${DBSvrNm}" < 1506_oracle_kc_demo.sql

#Update to 1507
sqlplus "${un}"/"${pw}@${DBSvrNm}" < 1507_oracle_kc_rice_server_upgrade.sql
sqlplus "${un}"/"${pw}@${DBSvrNm}" < 1507_oracle_kc_upgrade.sql

#Update to 1508
sqlplus "${un}"/"${pw}@${DBSvrNm}" < 1508_oracle_kc_rice_server_upgrade.sql 
sqlplus "${un}"/"${pw}@${DBSvrNm}" < 1508_oracle_kc_upgrade.sql


sqlplus "${un}"/"${pw}@${DBSvrNm}" < uh_fixes.sql

echo "Done Grepping for errors in the logs"
mv *.log ${LOGDIR}
grep -i error ${LOGDIR}/*.log
