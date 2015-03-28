#TODO
# add options for DB_PORT and TNS_NAME
# add an argument to remove the dryrun command later when this script is tested

dryrun="-dryrun"

usage()
{
cat << HERE
usage: $0 -u {db_userid} -p {db_password}

Run the data conversion process.

OPTIONS:
        -h show this message
        -u db_userid
        -p db_password
HERE
}

while getopts "u:p:h" OPTION
do
        case $OPTION in
                h) usage
                   exit 1
                   ;;
                u)
                   userid=$OPTARG
                   ;;
                p)
                   password=$OPTARG
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

TIME_STAMP=`date +%y.%m.%d.%H.%M.log`

echo "${HOME}"

java -Djava.util.logging.config.file="${HOME}/github/UhKc/coeus-db/coeus-db-data-conv/src/main/resources/org/kuali/coeus/dc/jul-default.properties"   -cp "target/coeus-db-data-conv-6.0.1.jar" org.kuali.coeus.dc.Main ${dryrun} -dbplatform Oracle -dbricecon jdbc:oracle:thin:@localhost:1530:KCDEV -dbcoeuscon jdbc:oracle:thin:@localhost:1530:KCDEV -dbriceuser ${userid} -dbricepwd ${password}  -dbcoeususer ${userid} -dbcoeuspwd ${password} | tee "${0}.${TIME_STAMP}"
