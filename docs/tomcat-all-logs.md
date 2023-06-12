[Home](../README.md)

---

# Load Sample Tomcat Application log files

## Purpose
Use logstash to parse multiple types of logfiles generated withing Tomcat.

## Configuration
- See [`tomcat-all-logs.yml`](../tomcat-all-logs.yml)
- See [`logstash/logstash_tomcat_all_logs.conf`](../logstash/logstash_tomcat_all_logs.conf)

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
docker-compose -f docker-compose.yml -f tomcat.yml -f tomcat-all-logs.yml up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/tomcat-all-logs.md in your browser to view these instructions."

```
## Explore the Dashboard


1. Navigate to the Tomcat Server
  - [static page: foo.txt](http://{{MYHOSTNAME}}:8080/static/foo.txt)
  - [hello.jsp](http://{{MYHOSTNAME}}:8080/hello.jsp)
2. Navigate to the [OpenSearch Dashboard Discover Page](http://{{MYHOSTNAME}}:8094/app/discover)
  - Credentials: `admin:admin`
  - If prompted, choose the "Global" tenant
3. Add the following **Available Fields** to the display
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