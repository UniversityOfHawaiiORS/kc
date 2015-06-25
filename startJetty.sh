# Make sure we are running from JAVA 8 configuration
PATH=${PATH//jdk1.6.0_34/jdk1.8.0_45};JAVA_HOME=${JAVA_HOME//jdk1.6.0_34/jdk1.8.0_45};PATH=${PATH//jdk1.7.0_51/jdk1.8.0_45};JAVA_HOME=${JAVA_HOME//jdk1.7.0_51/jdk1.8.0_45};java -version;JAVA_PROMPT=Java8;JAVA_OPTS=-Xmx  
#export JAVA OPTS needed by KC
export MAVEN_OPTS="-Xmx2048m -javaagent:C:\Users\ronald\.m2\repository\org\springframework\spring-instrument\3.2.12.RELEASE/spring-instrument-3.2.12.RELEASE.jar"
cd coeus-webapp
mvn jetty:run
