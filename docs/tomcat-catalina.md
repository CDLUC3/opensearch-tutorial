[Home](../README.md)

---

# Load Sample Tomcat Catalina log file

## Purpose
Use logstash grok filters to parse Tomcat catalina log files.

## Configuration
- See [`tomcat.yml`](../tomcat.yml)
- See [`logstash/logstash_tomcat.conf`](../logstash/logstash_tomcat.conf)

## Run the scenario

If running locally...

```
export MYHOSTNAME=$(hostname)
```

If running on a server...

```
export MYHOSTNAME=$(hostname).$(domainname)
```

Start the docker stack

```
docker-compose -f docker-compose.yml -f tomcat.yml up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/tomcat-catalina.md in your browser to view these instructions."

```
## Explore the Dashboard


1. Navigate to the [OpenSearch Dashboard Discover Page](http://{{MYHOSTNAME}}:8094/app/discover)
  - Credentials: `admin:admin`
  - If prompted, choose the "Global" tenant
2. Add the following fields to the display
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