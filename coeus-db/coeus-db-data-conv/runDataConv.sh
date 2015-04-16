#TODO
# add options for DB_PORT and TNS_NAME

usage()
{
cat << HERE
usage: $0 -u {db_userid} -p {db_password}

Run the data conversion process.

OPTIONS:
        -d dryrun
        -h show this message
        -u db_userid
        -p db_password
HERE
}

while getopts "u:p:hd" OPTION
do
        case $OPTION in
                h) usage
		   echo "=====================  Displaying db convert usage now (edit run scipt to use any new arguments) =============="
                   java -Djava.util.logging.config.file="${HOME}/github/UhKc/coeus-db/coeus-db-data-conv/src/main/resources/org/kuali/coeus/dc/jul-default.properties"   -cp "target/coeus-db-data-conv-6.0.1.jar;./ojdbc6-11.2.0.3.jar" org.kuali.coeus.dc.Main -help
                   exit 1
                   ;;
                u)
                   userid=$OPTARG
                   ;;
                p)
                   password=$OPTARG
                   ;;
		d) 
		   dryrun="-dryrun"
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

if test -f ./ojdbc6-11.2.0.3.jar
then
    echo Running proposal Conversion
    java -Djava.util.logging.config.file="${HOME}/github/UhKc/coeus-db/coeus-db-data-conv/src/main/resources/org/kuali/coeus/dc/jul-debug.properties"   -cp "target/coeus-db-data-conv-6.0.1.jar;./ojdbc6-11.2.0.3.jar" org.kuali.coeus.dc.Main ${dryrun} -dbplatform Oracle -dbricecon jdbc:oracle:thin:@localhost:1530:KCDEV -dbcoeuscon jdbc:oracle:thin:@localhost:1530:KCDEV -dbriceuser ${userid} -dbricepwd ${password}  -dbcoeususer ${userid} -dbcoeuspwd ${password} proposal 2>&1 | tee "LOGS/${userid}${dryrun}${TIME_STAMP}.ProposalConvertRun.log"
    echo Running pprole Conversion
    java -Djava.util.logging.config.file="${HOME}/github/UhKc/coeus-db/coeus-db-data-conv/src/main/resources/org/kuali/coeus/dc/jul-debug.properties"   -cp "target/coeus-db-data-conv-6.0.1.jar;./ojdbc6-11.2.0.3.jar" org.kuali.coeus.dc.Main ${dryrun} -dbplatform Oracle -dbricecon jdbc:oracle:thin:@localhost:1530:KCDEV -dbcoeuscon jdbc:oracle:thin:@localhost:1530:KCDEV -dbriceuser ${userid} -dbricepwd ${password}  -dbcoeususer ${userid} -dbcoeuspwd ${password} pprole 2>&1 | tee "LOGS/${userid}${dryrun}${TIME_STAMP}.PpRoleConvertRun.log"
else
    echo "Didn't find oracle jar.  Please copy ojdbc6-11.2.0.3.jar into current directory"
    exit
fi
