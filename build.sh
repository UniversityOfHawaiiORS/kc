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
while getopts "hf" OPTION
do
        case $OPTION in
                h) usage
                   exit 1
                   ;;
                f)
                   PRE_COMPILE=
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


mvn -Dmaven.test.skip=true ${PRE_COMPILE} clean install
