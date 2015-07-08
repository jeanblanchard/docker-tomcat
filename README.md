## Minimal Docker image with Apache Tomcat [![Build Status](https://travis-ci.org/jeanblanchard/docker-tomcat.svg?branch=master)](https://travis-ci.org/jeanblanchard/docker-tomcat)

Basic [Docker](https://www.docker.com/) image to run [Apache Tomcat](http://tomcat.apache.org/).
This is based on [Alpine Linux](http://alpinelinux.org/) to keep the size minimal.

* Tomcat is installed in `/opt/tomcat`.
* It listens on port 8080.
* A user **admin** is configured, with access to the _manager_ and _host-manager_ apps.
* Documentation and examples have been removed.


### Tags

* `tomcat8-java8` or `8` or `latest`: Tomcat 8 on Oracle Java 8
* `tomcat7-java8`: Tomcat 7 on Oracle Java 8
* `tomcat8-java7`: Tomcat 8 on Oracle Java 7
* `tomcat7-java7` or `7`: Tomcat 7 on Oracle Java 7

Additionally, tags are created for each tomcat release (e.g. `8.0.24` or `8.0.24-java8`).

### Usage

Example: 

    docker run -d -p 8080:8080 jeanblanchard/tomcat:8
