usage()
{
cat << HERE
usage: $0 options

Build
OPTIONS:
        -h show this message
        -f faster - don't pre-compile jsp for tomcat
HERE
}

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

PRE_COMPILE=-Pprecompile-jsp-tomcat-7
REJECT_IF_MODIFIED=N
while getopts "hfr" OPTION
do
        case $OPTION in
                h) usage
                   exit 1
                   ;;
                f)
                   PRE_COMPILE=
                   ;;
                r)
                   REJECT_IF_MODIFIED=Y
                   ;;
                ?)
                   usage
                   exit
                   ;;
        esac
done

if [ "${PRE_COMPILE}" == "" ]
then 
    echo "************ Building without precompile for faster build"
else
    echo "************ Building with precompile jsp for tomcat7"
fi

CHECK_ONDECK_HACK=`git status | grep modified | grep web.xml`
if [ "${CHECK_ONDECK_HACK}" != "" ]
then
    ondeck_ans=`getAnswer 'WARNING : web.xml modified, are you sure you want to build with a modified web.xml'`
    if [ "${ondeck_ans}" != "y" ]
    then
        echo "Aborting"
        exit 1
    fi
fi

git_revision=`git rev-parse HEAD`
pom_version=`grep \<version\>16.*\<\/version\> pom.xml | sed -e s/\<version\>//  | sed -e s/\<.version\>// | sed -e s/^\ *16/16/`
date=`date +%y.%m.%d.%H%M`
build_version="6.${pom_version}-uh-build-${date}.${git_revision}"

MODIFIED=`git status --porcelain`

if [ "${REJECT_IF_MODIFIED}" == "Y" ]
then
   if [ "${MODIFIED}" != "" ]
   then
       echo "*****************  Local Modification Found Rejecting Build Request ******************"
       exit 1
   else
       echo "*****************  No local changes.....Building now....."
   fi
fi

if [ -f last_build.sha1 ]
then
    last_revision=`cat last_build.sha1`
fi

echo ${git_revision} > last_build.sha1


mvn -Denvironment=mygrant -Dbuild.version=${build_version} -Dmaven.test.skip=true ${PRE_COMPILE} clean install 2>&1 | tee build.log


if [ "${last_revision}" != "" ] 
then
    #changes since last build
    git log --name-status --oneline ${last_revision}..${git_revision} > git.log
fi

