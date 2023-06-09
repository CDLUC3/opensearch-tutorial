[Home](../README.md)

---

# Load Sample Tomcat Access log file

## Purpose
Use logstash grok filters to parse Tomcat access logs.

## Configuration
- See [`tomcat-access.yml`](../tomcat-access.yml)
- See [`logstash/logstash_tomcat_access.conf`](../logstash/logstash_tomcat_access.conf)

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
docker-compose -f docker-compose.yml -f tomcat.yml -f tomcat-access.yml up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/tomcat-access.md in your browser to view these instructions."

```

1. Navigate to the Tomcat Server
  - [static page: foo.txt](http://{{MYHOSTNAME}}:8080/static/foo.txt)
  - [hello.jsp](http://{{MYHOSTNAME}}:8080/hello.jsp)
2. Navigate to the [OpenSearch Dashboard Discover Page](http://{{MYHOSTNAME}}:8094/app/discover)
  - Credentials: `admin:admin`
  - If prompted, choose the "Global" tenant

Run the following to stop the stack.

```
docker-compose -f docker-compose.yml -f tomcat.yml -f tomcat-access.yml down --volume
```

---
[Json Application Logs from running tomcat](tomcat-app-logs.md)