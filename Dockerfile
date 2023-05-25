FROM centos:7
LABEL maintainer="kartikeyait@gmail.com"
ARG USERNAME=tomuser
ARG GROUP=tomuser
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o $USERNAME
RUN useradd -u $UID -g $GID -o -s /bin/bash $USERNAME
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.tar.gz /opt/apache-tomcat-9.0.75.tar.gz
ARG TOM_TAR=/opt/apache-tomcat-8.5.81.tar.gz
ARG TOM_SRC=apache-tomcat-8.5.81
ENV TOM_HOME=/opt/tomcat
ENV TOM_SRC1=/opt/apache-tomcat-8.5.81
ARG WAR_PACK=/opt/tomcat/webapps/ks.war
RUN set -eux; \
	yum install java -y; \
	tar -xvf $TOM_TAR; \
	mv $TOM_SRC /opt/tomcat;
	
RUN cd /opt/tomcat/webapps && rm -rf *;

ADD https://raw.githubusercontent.com/kartikeyapro/test/master/ksdemo.war /${WAR_PACK}
RUN chown $USERNAME:$USERNAME $TOM_HOME -R
EXPOSE 8080
USER $USERNAME