usage()
{
cat << HERE
usage: $0 options

Build
OPTIONS:
        -h show this message
        -f faster - don't pre-compile jsp for tomcat
        -n build node js (needed for first time, or after 'mvn clean" or if node.js is updated)
        -r reject if modifed (check if non-commited code exists, to be used for automated build)
HERE
}


PRE_COMPILE=-Pprecompile-jsp-tomcat-7
PREVENT_NODE_JS_BUILD=-Dclean-jsfrontend-node.off=true
REJECT_IF_MODIFIED=N
while getopts "hfrn" OPTION
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
                n)
                   PREVENT_NODE_JS_BUILD=
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

if [ -f last_build.sha1 ]
then
    last_revision=`cat last_build.sha1`
fi

echo ${git_revision} > last_build.sha1


cmd /C build.bat mvn ${PREVENT_NODE_JS_BUILD} -Denvironment=mygrant -Dbuild.version=${build_version} -Dmaven.test.skip=true ${PRE_COMPILE} clean install


if [ "${last_revision}" != "" ] 
then
    #changes since last build
    git log --name-status --oneline ${last_revision}..${git_revision} > git.log
fi

