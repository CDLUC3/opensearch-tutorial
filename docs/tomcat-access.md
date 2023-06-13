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


{{dashboard}}
- Navigate to the Tomcat Server
  - [static page: foo.txt](http://{{MYHOSTNAME}}:8080/static/foo.txt)
  - [hello.jsp](http://{{MYHOSTNAME}}:8080/hello.jsp)
- Add the following **Available Fields** to the display
  - path
  - response

## Cleanup the Stack

Run the following to stop the stack.

```
docker-compose -f docker-compose.yml -f tomcat.yml -f tomcat-access.yml down --volume
```

---
[Json Application Logs from running tomcat](tomcat-app-logs.md)