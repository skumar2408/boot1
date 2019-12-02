FROM tomcat:8
copy target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080

