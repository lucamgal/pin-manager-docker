FROM tomcat:9-jdk11-corretto

COPY ./config/* /usr/local/tomcat/conf/Catalina/localhost/

COPY ./dist/* $CATALINA_HOME/webapps/

EXPOSE 8080