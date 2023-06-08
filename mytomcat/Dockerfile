FROM maven:3-jdk-8 as build

RUN apt-get update -y && apt-get -y upgrade

WORKDIR /build

COPY . /build/

RUN mvn clean install

FROM tomcat:8-jre8

RUN apt-get update -y && apt-get -y upgrade

COPY --from=build /root/.m2/repository/org/cdlib/mrt/Demo/0.0.1-SNAPSHOT/Demo-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war