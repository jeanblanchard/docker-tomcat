## Minimal Docker image with Apache Tomcat [![Build Status](https://travis-ci.org/jeanblanchard/docker-tomcat.svg?branch=master)](https://travis-ci.org/jeanblanchard/docker-tomcat)

Basic [Docker](https://www.docker.com/) image to run [Apache Tomcat](http://tomcat.apache.org/).
This is based on [Alpine Linux](http://alpinelinux.org/) to keep the size minimal.

* Tomcat is installed in `/opt/tomcat`.
* It listens on port 8080.
* A user **admin** is configured, with access to the _manager_ and _host-manager_ apps.
You should remove it, or at least change its password, if you want to use this image in production. 
* Documentation and examples have been removed.


### Tags

* `tomcat8-java8` or `8` or `latest`: Tomcat 8 on Oracle Java 8
* `tomcat7-java8` or `7`: Tomcat 7 on Oracle Java 8
* `tomcat6-java8` or `6`: Tomcat 6 on Oracle Java 8
* `tomcat9-java8` or `6`: Tomcat 9 preview on Oracle Java 8

Please note that Java 7 is unsupported by Oracle, as of April 2015, so the following tags
use Java version 7u80, which has know security issues, and should not be used on a publicly accessible website:

* `tomcat8-java7`: Tomcat 8 on Oracle Java 7
* `tomcat7-java7`: Tomcat 7 on Oracle Java 7

Additionally, tags are created for each tomcat release (e.g. `8.0.24` or `8.0.24-java8`).

Note that the `7` tag used to reference `tomcat7-java7`. It now references `tomcat7-java8`
due to the end of support for java 7.

### Usage

Example: 

    docker run -d -p 8080:8080 jeanblanchard/tomcat:9
