{{home}}
# Load Sample Tomcat Access log file

## Purpose
Use logstash grok filters to parse Tomcat access logs.

## Run the scenario

{{start}}

```
docker-compose -f docker-compose.yml -f tomcat.yml -f tomcat-access.yml up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/tomcat-access.md in your browser to view these instructions."

```

## Configuration
- See [`tomcat-access.yml`](../tomcat-access.yml)
- See [`logstash/logstash_tomcat_access.conf`](../logstash/logstash_tomcat_access.conf)

## Explore the Dashboard


- Navigate to the [OpenSearch Dashboard Discover Page](http://{{MYHOSTNAME}}:8094/app/discover?security_tenant=global#/?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-15m,to:now))&_a=(columns:!(verb,request,response,received_bytes,serverip),filters:!(),index:'ecs-*',interval:auto,query:(language:kuery,query:''),sort:!()))
  - Credentials: `admin:admin`
  - If prompted, choose the "Global" tenant
  - Note the pre-selected fields on the page
- Navigate to the Tomcat Server
  - [static page: foo.txt](http://{{MYHOSTNAME}}:8080/static/foo.txt)
  - [hello.jsp](http://{{MYHOSTNAME}}:8080/hello.jsp)

## Cleanup the Stack

{{stop}}

```
docker-compose -f docker-compose.yml -f tomcat.yml -f tomcat-access.yml down --volume
```

---
[Back](tomcat-catalina.md) | [Next](tomcat-app-logs.md)