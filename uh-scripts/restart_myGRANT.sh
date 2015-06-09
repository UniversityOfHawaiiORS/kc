#!/bin/bash

#BEGIN Configure these for different machines
export MYGRANT_URL=mygrant.ors.hawaii.edu
export MYGRANT_CONTEXT=mygrant
export REPORT_TO=gouldner@hawaii.edu
#END Configure these for different machines
SHUTDOWN='n'

report_progress()
{
    if [ "${VERBOSE}" == 'y' ]
    then
        echo $*
    fi
}

report_results()
{
    if [ "${VERBOSE}" == 'y' ]
    then
        report_progress "==================="
        cat ${RESULTS}
        report_progress "==================="
        cat ${ERRORS}
        report_progress "==================="
    fi
}

deploy_warfile()
{
    if [ -f ${WAR_FILE} ]
    then
        WAR_BASE_NAME=`basename ${WAR_FILE}`
        CONTEXT_FOLDER=`echo "${WAR_BASE_NAME}" | sed -e 's/\.war$//'`
        #check if file ends in .war
        if [ ${WAR_FILE} != ${CONTEXT_FOLDER} ]
        then
            report_progress "Deploying ${WAR_FILE}"
            if [ -f ~/tomcat/webapps/${WAR_BASE_NAME} ]
            then
                report_progress "removing old war ~/tomcat/webapps/${WAR_BASE_NAME} and context folder ~/tomcat/webapps/${CONTEXT_FOLDER}"
                rm ~/tomcat/webapps/${WAR_BASE_NAME}
                rm -rf ~/tomcat/webapps/${CONTEXT_FOLDER}
                rm -rf ~/tomcat/work/Catalina/localhost/${CONTEXT_FOLDER}
                cp ${WAR_FILE} ~/tomcat/webapps/
            fi
        else
	    report_progress "Deploy Failure.  [${WAR_FILE}] doesn't end in .war"
	    echo "Deploy Failure.  [${WAR_FILE}] doesn't end in .war" >> ${RESULTS}
        fi
    else
	report_progress "Deploy Failure.  War File [${WAR_FILE}] not found"
        echo "Deploy Failure.  War File [${WAR_FILE}] not found" >> ${RESULTS}
    fi 
}

usage()
{
echo "
USAGE ${0} : [-v] [-n] [-d warfile]
        -s = shutdown but don't restart (used for maintenance shutdown)
        -n = disable web check with email notification
        -v = verbose, enable stdout output
        -d = Deploy war file
"
}


#process arguments
while (($#)); do
        report_progress "Processing arg ${1}"
        case "${1}" in
                "-s" ) SHUTDOWN='y';shift;;
                "-v" ) VERBOSE='y';shift;;
                "-n" ) NO_CHECK_EMAIL='y';shift;;
                "-d" ) DEPLOY_WAR='y'
                       shift
                       if (($#))
                       then
                           WAR_FILE=$1
                           shift
                       else
                            echo "ERROR: -d requires warfile argument"
                            usage
                            exit
                       fi;;
                *) usage;exit;;
        esac
done

report_progress "SHUTDOWN=${SHUTDOWN}"
report_progress "VERBOSE=${VERBOSE}"
report_progress "NO_CHECK_EMAIL=${NO_CHECK_EMAIL}"
report_progress "DEPLOY_WAR=${DEPLOY_WAR}"
report_progress "WAR_FILE=${WAR_FILE}"

#Cron runs with profile or bashrc load
export JAVA_HOME=/opt/jdk
export PATH=${JAVA_HOME}/bin:$PATH

HOSTNAME=`hostname`
RESULTS=${0}.${$}.log
ERRORS=${0}.${$}.err

echo "Results of script ${0}" > ${RESULTS}
echo "Errors from script ${0}" > ${ERRORS}

#write hostname and paramaters to results
#for compare in case of failure to config the script
echo "HOSTNAME=[${HOSTNAME}]" 2>>${ERRORS} >> ${RESULTS}
echo "MYGRANT_URL=[${MYGRANT_URL}]" 2>>${ERRORS} >> ${RESULTS}
echo "MYGRANT_CONTEXT=[${MYGRANT_CONTEXT}]" 2>>${ERRORS} >> ${RESULTS}

# Stop httpd and wait 5 min to allow any pending processes to complete
# During this window users will fail to connect but tomcat will continue
# to process
sudo /sbin/service httpd stop 2>>${ERRORS} >> ${RESULTS}
sleep 300

#stop tomcat using shutdown
report_progress "shutting down tomcat"
/bin/bash /home/kualicoe/tomcat/bin/shutdown.sh 2>>${ERRORS} >> ${RESULTS}

report_progress "sleeping 20 seconds"
#wait for it to receive shutdown signal
sleep 20

report_progress "killing remaining tomcat process"
#myGRANT seems to keep the tomcat java process from shutting down so kill it now
ps -ef | grep tomcat | grep -v grep | awk "{print \$2}" | xargs kill -9 2>>${ERRORS} >> ${RESULTS}

# if -s shutdown option provided don't restart tomcat or check
# used for maintenance to shutdown in middle of the night 
if [ "${SHUTDOWN}" == 'y' ]
then
    report_progress "Shutdown requested not restarting tomcat"
    cat ${RESULTS} ${ERRORS} | mailx -s "myGRANT SHUTDOWN REQUEST success on ${HOSTNAME}" gouldner@hawaii.edu
    rm ${RESULTS}
else
    #archive logs
    report_progress "Archiving logs"
    cd /home/kualicoe/tomcat
    ARCHIVE_STAMP=`date +%Y%m%d.%H%M`
    if [ ! -d logarchive ]
    then
        report_progress "logarchive folder not found creating folder"
        mkdir logarchive 2>>${ERRORS} >> ${RESULTS}
    fi
    LOG_ARCHIVE="logarchive/logs.${ARCHIVE_STAMP}.tar"
    tar -cvf ${LOG_ARCHIVE} ./logs/* 2>>${ERRORS} >> ${RESULTS}
    gzip ${LOG_ARCHIVE} 2>>${ERRORS} >> ${RESULTS}
    rm ./logs/* 2>>${ERRORS} >> ${RESULTS}
    
    if [ "${DEPLOY_WAR}" == 'y' ]
    then
        deploy_warfile
    else
        report_progress "Deploy war not requested"
    fi
    
    #restart tomcat
    report_progress "Starting tomcat"
    /home/kualicoe/tomcat/bin/startup.sh 2>>${ERRORS} >> ${RESULTS}

    # Restart httpd
    sudo /sbin/service httpd start 2>>${ERRORS} >> ${RESULTS}
    
    # write current tomcat process to the results log
    ps -ef | grep tomcat | grep -v grep 2>>${ERRORS} >> ${RESULTS}
    
    report_results
    if [ "${NO_CHECK_EMAIL}" == 'y' ]
    then
            #no check or email
            rm ${RESULTS}
            rm ${ERRORS}
    else
        report_progress "Sleeping 5 min before testing web connection"
        #sleep 300 seconds to allow mygrant to start
        sleep 300
    
        #test website and return status
        wget --no-check-certificate --secure-protocol=TLSv1 -q -O - https://${MYGRANT_URL}/${MYGRANT_CONTEXT} >/dev/null
        result=$?
        if [ ${result} != 0 ]
        then
            cat ${RESULTS} ${ERRORS} | mailx -s "myGRANT restart failed on ${HOSTNAME} result=${result}" ${REPORT_TO} 
        else
            cat ${RESULTS} ${ERRORS} | mailx -s "myGRANT restart success on ${HOSTNAME}" gouldner@hawaii.edu
            rm ${RESULTS}
            rm ${ERRORS}
        fi
    fi
 
    
    #output results of commands if in verbose mode
    report_progress "${0} Done"
fi
