{{home}}

# Load Sample Tomcat Application log files

## Purpose
Parse Json applciation logs generated from an application running in tomcat. The application is using log4j2 to output logs in ECS format.

## Run the scenario

{{start}}

```
docker-compose -f docker-compose.yml -f tomcat.yml -f tomcat-app-logs.yml up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/tomcat-app-logs.md in your browser to view these instructions."

```

## Configuration
- See [`tomcat-app-logs.yml`](../tomcat-app-logs.yml)
- See [`logstash/logstash_tomcat_app_logs.conf`](../logstash/logstash_tomcat_app_logs.conf)
- See [`mytomcat/src/main/webapp/hello.jsp`](../mytomcat/src/main/webapp/hello.jsp)
- See [`mytomcat/pom.xml`](../mytomcat/pom.xml)
  - Compile dependency: log4j-api:2.20.0
  - Runtime dependency: log4j-core:2.20.0
  - Runtime dependency (for ECS format): ecs-logging-core:1.5.0
  - Runtime dependency (for ECS format): log4j2-ecs-layout:1.5.0
- See [`mytomcat/src/main/resources/log4j2.xml`](../mytomcat/src/main/resources/log4j2.xml)
  - [Log4j2 Configuration Options](https://logging.apache.org/log4j/2.x/manual/configuration.html#automatic-configuration)

## Explore the Dashboard


- Navigate to the [OpenSearch Dashboard Discover Page](http://{{MYHOSTNAME}}:8094/app/discover?security_tenant=global#/?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-15m,to:now))&_a=(columns:!(json_data.log.level,json_data.service.name,json_data.process.thread.name,json_data.log.origin.function,json_data.foo,json_data.ding),filters:!(),index:'ecs-*',interval:auto,query:(language:kuery,query:''),sort:!()))
  - Credentials: `admin:admin`
  - If prompted, choose the "Global" tenant
  - Note the pre-selected fields on the page
- Navigate to the Tomcat Server
  - [static page: foo.txt](http://{{MYHOSTNAME}}:8080/static/foo.txt)
  - [hello.jsp](http://{{MYHOSTNAME}}:8080/hello.jsp)

## Cleanup the Stack

{{stop}}

```
docker-compose -f docker-compose.yml -f tomcat.yml -f tomcat-app-logs.yml down --volume
```
---
[Back](tomcat-access.md) | [Next](tomcat-all-logs.md)
