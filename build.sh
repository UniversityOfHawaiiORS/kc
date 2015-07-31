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

git_revision=`git rev-parse HEAD`
pom_version=`grep \<version\>15.*\<\/version\> pom.xml | sed -e s/\<version\>//  | sed -e s/\<.version\>// | sed -e s/^\ *15/15/`
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

mvn -Denvironment=mygrant -Dbuild.version=${build_version} -Dmaven.test.skip=true ${PRE_COMPILE} clean install
