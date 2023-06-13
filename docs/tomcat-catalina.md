{{home}}

# Load Sample Tomcat Catalina log file

## Purpose
Use logstash grok filters to parse Tomcat catalina log files.

## Run the scenario

{{start}}

```
docker-compose -f docker-compose.yml -f tomcat.yml up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/tomcat-catalina.md in your browser to view these instructions."

```

## Configuration
- See [`tomcat.yml`](../tomcat.yml)
- See [`logstash/logstash_tomcat.conf`](../logstash/logstash_tomcat.conf)
- Retrieval reqeusts [scripts/tomcat-requests.sh](../scripts/tomcat-requests.sh) that will trigger tomcat log messages

## Explore the Dashboard


{{dashboard}}
- Add the following **Available Fields** to the display
  - timestamp
  - level
  - thread
  - class
  - messageText

## Cleanup the Stack


Run the following to stop the stack.

```
docker-compose -f docker-compose.yml -f tomcat.yml down --volume
```

---
[Access Logs from running tomcat](tomcat-access.md)