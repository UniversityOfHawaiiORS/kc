#NOTE: -cp option needs to be changed to ; delimited for running on windows : delimited for unix
JARFILE=coeus-db-data-conv-1509.57.jar
ROOT_PATH=/Users/gouldner/github/kc
logdir="LOGDIR"

usage()
{
cat << HERE
usage: $0 -u {db_userid} -p {db_password} -l {log dir}

Run the data conversion process.

OPTIONS:
        -d dryrun
        -h show this message
        -u db_userid
        -p db_password
        -l logdir
        -s database sid
        -n database port
HERE
}

while getopts "s:l:u:p:hdn:" OPTION
do
        case $OPTION in
                h) usage
		   echo "=====================  Displaying db convert usage now (edit run scipt to use any new arguments) =============="
                   java -Djava.util.logging.config.file="${ROOT_PATH}/coeus-db/coeus-db-data-conv/src/main/resources/org/kuali/coeus/dc/jul-default.properties"   -cp "target/${JARFILE}:./ojdbc7-12.1.0.2.jar" org.kuali.coeus.dc.Main -help
                   exit 1
                   ;;
                u)
                   userid=$OPTARG
                   ;;
                p)
                   password=$OPTARG
                   ;;
                l)
                   logdir=$OPTARG
                   ;;
		d) 
		   dryrun="-dryrun"
		   ;;
                s) 
                   database_sid=$OPTARG
                   ;;
                n) 
                   database_port=$OPTARG
                   ;;
                ?)
                   usage
                   exit
                   ;;
        esac
done

if [ "${userid}" == "" ] || [ "${password}" == "" ]
then
    usage
    exit 1
fi

TIME_STAMP=`date +%y.%m.%d.%H.%M`

if [ "${database_sid}" != "kcdev" ] && [ "${database_sid}" != "kc" ]
then
    echo "db server name not valid must be kcdev or kc"
    exit
fi

if [ "${database_sid}" == "kc" ]
then
    echo "DB SERVER SELECTED WAS kc"
    echo "Setting port to 1531"
    database_port=1531
    while [ "${ans}" != "y" ] && [ "${ans}" != "n" ]
    do
        read -p "***** REALLY WORK IN PRODUCTION *****   Continue ? (y/n)" ans
    done

    if [ "${ans}" == "n" ]
    then
        exit 1
    fi
fi

if test -f ./ojdbc7-12.1.0.2.jar
then
    echo Running proposal Conversion
    mkdir -p $logdir
    java -Djava.util.logging.config.file="${ROOT_PATH}/coeus-db/coeus-db-data-conv/src/main/resources/org/kuali/coeus/dc/jul-debug.properties"   -cp "target/${JARFILE}:./ojdbc7-12.1.0.2.jar" org.kuali.coeus.dc.Main ${dryrun} -dbplatform Oracle -dbricecon jdbc:oracle:thin:@localhost:${database_port}:${database_sid} -dbcoeuscon jdbc:oracle:thin:@localhost:${database_port}:${database_sid} -dbriceuser ${userid} -dbricepwd ${password}  -dbcoeususer ${userid} -dbcoeuspwd ${password} proposal 2>&1 | tee "${logdir}/${userid}${dryrun}${TIME_STAMP}.ProposalConvertRun.log"
    echo Running pprole Conversion
    java -Djava.util.logging.config.file="${ROOT_PATH}/coeus-db/coeus-db-data-conv/src/main/resources/org/kuali/coeus/dc/jul-debug.properties"   -cp "target/${JARFILE}:./ojdbc7-12.1.0.2.jar" org.kuali.coeus.dc.Main ${dryrun} -dbplatform Oracle -dbricecon jdbc:oracle:thin:@localhost:${database_port}:${database_sid} -dbcoeuscon jdbc:oracle:thin:@localhost:${database_port}:${database_sid} -dbriceuser ${userid} -dbricepwd ${password}  -dbcoeususer ${userid} -dbcoeuspwd ${password} pprole 2>&1 | tee "${logdir}/${userid}${dryrun}${TIME_STAMP}.PpRoleConvertRun.log"
    echo "Done logs placed in ${logdir}"
else
    echo "Didn't find oracle jar.  Please copy ojdbc7-12.1.0.2.jar into current directory"
    exit
fi