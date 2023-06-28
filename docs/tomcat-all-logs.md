{{home}}
# Load Multiple Tomcat log files

## Purpose
Use logstash to parse multiple types of logfiles generated withing Tomcat.

## Run the scenario

{{start}}

```
docker-compose -f docker-compose.yml -f tomcat.yml -f tomcat-all-logs.yml up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/tomcat-all-logs.md in your browser to view these instructions."

```

## Configuration
- See [`tomcat-all-logs.yml`](../tomcat-all-logs.yml)
- See [`logstash/logstash_tomcat_all_logs.conf`](../logstash/logstash_tomcat_all_logs.conf)

## Explore the Dashboard


- Navigate to the [OpenSearch Dashboard Discover Page](http://{{MYHOSTNAME}}:8094/app/discover?security_tenant=global#/?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-15m,to:now))&_a=(columns:!(type,verb,messageText,level,json_data.log.level,request,response),filters:!(),index:'ecs-*',interval:auto,query:(language:kuery,query:''),sort:!()))
  - Credentials: `admin:admin`
  - If prompted, choose the "Global" tenant
  - Note that several fields have been configured to display by default
  - Note that the `type` fields indicates the source of each log message
  - Note that "Log Level" has not been consistently mapped across log file sources
- Navigate to the Tomcat Server
  - [static page: foo.txt](http://{{MYHOSTNAME}}:8080/static/foo.txt)
  - [hello.jsp](http://{{MYHOSTNAME}}:8080/hello.jsp)

## Cleanup the Stack

{{stop}}

```
docker-compose -f docker-compose.yml -f tomcat.yml -f tomcat-all-logs.yml down --volume
```

---
[Back](tomcat-app-logs.md) | [Next](rails.md)