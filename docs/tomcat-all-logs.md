{{home}}
# Load Sample Tomcat Application log files

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


{{dashboard}}
- Navigate to the Tomcat Server
  - [static page: foo.txt](http://{{MYHOSTNAME}}:8080/static/foo.txt)
  - [hello.jsp](http://{{MYHOSTNAME}}:8080/hello.jsp)
- Add the following **Available Fields** to the display
  - type
  - request_path
  - json_data.ding
  - json_data.foo
  - json_data.message
  - messageText

## Cleanup the Stack

Run the following to stop the stack.

```
docker-compose -f docker-compose.yml -f tomcat.yml -f tomcat-all-logs.yml down --volume
```

---
[Rails logs](rails.md)