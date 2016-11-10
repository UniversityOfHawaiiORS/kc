#!/bin/bash
# ORDER TO RUN SQL
#VX_oracle_rice_server_upgrade.sql
#VX_oracle_rice_client_upgrade.sql
#VX_oracle_kc_rice_server_upgrade.sql
#VX_oracle_kc_upgrade.sql

CHECK_JAVA=`java -version 2>&1 | grep "java version" | cut -d\" -f2 | cut -d\. -f2`
if [ "${CHECK_JAVA}" != "8" ]
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

PORT=`getAnswer 'Enter KC Database port forwarding port number'`

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

while [ "${ans0}" != "y" ] && [ "${ans0}" != "n" ]
do
    read -p "Run Step 1 - upgrade to 6.1609.56 ? (y/n)" ans0
done

if [ "${ans0}" == "y" ]
then
    # Update to 1606
    sqlplus "${un}"/"${pw}@${DBSvrNm}" < 1606_oracle_kc_rice_server_upgrade.sql
    sqlplus "${un}"/"${pw}@${DBSvrNm}" < 1606_oracle_kc_upgrade.sql

    # Update to 1607
    sqlplus "${un}"/"${pw}@${DBSvrNm}" < 1607_oracle_kc_rice_server_upgrade.sql
    sqlplus "${un}"/"${pw}@${DBSvrNm}" < 1607_oracle_kc_upgrade.sql

    # Update to 1608
    sqlplus "${un}"/"${pw}@${DBSvrNm}" < 1608_oracle_kc_rice_server_upgrade.sql
    sqlplus "${un}"/"${pw}@${DBSvrNm}" < 1608_oracle_kc_upgrade.sql

    # Update to 1609
    sqlplus "${un}"/"${pw}@${DBSvrNm}" < 1609_oracle_kc_rice_server_upgrade.sql
    sqlplus "${un}"/"${pw}@${DBSvrNm}" < 1609_oracle_kc_upgrade.sql

    # UH modificaitons for next target release
    sqlplus "${un}"/"${pw}@${DBSvrNm}" < KC-1508.sql
    sqlplus "${un}"/"${pw}@${DBSvrNm}" < KC-1512.sql
    sqlplus "${un}"/"${pw}@${DBSvrNm}" < KC-1505.sql
    sqlplus "${un}"/"${pw}@${DBSvrNm}" < KC-1500.sql
    sqlplus "${un}"/"${pw}@${DBSvrNm}" < KC-1522.sql
    sqlplus "${un}"/"${pw}@${DBSvrNm}" < KC-1496.sql
    sqlplus "${un}"/"${pw}@${DBSvrNm}" < KC-1516.sql

    echo "Grepping for errors in the logs"
    mv *.log ${LOGDIR}
    grep -i error ${LOGDIR}/*.log
fi

#while [ "${ans1}" != "y" ] && [ "${ans1}" != "n" ]
#do
#    read -p "Run Database Conversion Process Part 1 ? (y/n)" ans1
#done

#if [ "${ans1}" == "y" ]
#then
#    cd ../../../../../../../../../../../coeus-db-data-conv
#    ./runDataConv.sh -u ${un} -p ${pw} -l ${LOGDIR} -n ${PORT} -s ${DBSvrNm}
#
#    cd ${CURRENT_DIR}
#    echo "Grepping for errors in the logs"
#    grep -i error  ${LOGDIR}/*ConvertRun.log
#fi
