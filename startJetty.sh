# Make sure we are running from JAVA 7
PATH=${PATH//jdk1.6.0_34/jdk1.7.0_51};JAVA_HOME=${JAVA_HOME//jdk1.6.0_34/jdk1.7.0_51};
#export JAVA OPTS needed by KC
export MAVEN_OPTS="-Xmx2048m -XX:MaxPermSize=512m -javaagent:C:\Users\ronald\.m2\repository\org\springframework\spring-instrument\3.2.12.RELEASE/spring-instrument-3.2.12.RELEASE.jar"
cd coeus-webapp
mvn jetty:run
