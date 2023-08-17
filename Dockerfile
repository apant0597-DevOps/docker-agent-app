FROM tomcat:9

COPY target/docker-agent-app.war /usr/local/tomcat/webapps