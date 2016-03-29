FROM jeanblanchard/java:8
MAINTAINER Jean Blanchard <jean@blanchard.io>

# Expose web port
EXPOSE 8080

# Tomcat Version
ENV TOMCAT_VERSION_MAJOR 8
ENV TOMCAT_VERSION_FULL  8.0.33

# Download and install
RUN apk add --update curl &&\
  curl -kLsS https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_VERSION_MAJOR}/v${TOMCAT_VERSION_FULL}/bin/apache-tomcat-${TOMCAT_VERSION_FULL}.tar.gz \
    | gunzip -c - | tar -xf - -C /opt &&\
  ln -s /opt/apache-tomcat-${TOMCAT_VERSION_FULL} /opt/tomcat &&\
  rm -rf /opt/tomcat/webapps/examples /opt/tomcat/webapps/docs

# Configuration
ADD tomcat-users.xml /opt/tomcat/conf/
RUN sed -i 's/52428800/5242880000/g' /opt/tomcat/webapps/manager/WEB-INF/web.xml 

# Set environment
ENV CATALINA_HOME /opt/tomcat

# Launch Tomcat on startup
CMD ${CATALINA_HOME}/bin/catalina.sh run
