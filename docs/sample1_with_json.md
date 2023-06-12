[Home](../README.md)

---

# Load Sample Files - With Json Filter

## Purpose
Parse and load sample json log files as json.

Notice that individual json fields are searchable in opensearch.

## Configuration
- See [`logstash-json-filter.yml`](../logstash-json-filter.yml)
- See [`logstash/logstash_with_filter.conf`](../logstash/logstash_with_filter.conf)
  - Note the filter instructs opensearch to parse the logs as json files.

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
docker-compose -f docker-compose.yml -f sample1-json-log.yml -f logstash-json-filter.yml up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/sample1_with_json.md in your browser to view these instructions."

```
## Explore the Dashboard


1. Navigate to the [OpenSearch Dashboard Discover Page](http://{{MYHOSTNAME}}:8094/app/discover)
  - Credentials: `admin:admin`
  - If prompted, choose the "Global" tenant
2. Sample search 
  - Click `DQL` and update the data range to look at the past week
3. Search access logs
  - Note that the logstash ingest timestamp is currently being used
  - `json_data.statusCode:200`
  - `json_data.statusCode:404`
  - `json_data.statusCode:*`
  - `json_data.request:*/store/hostname*`
      - pulled from tomcat access log
4. Search custom metadata inserted with log4j2
  - `json_data.ding:dong`
      - Using log4j2, inserted as `org.apache.logging.log4j.ThreadContext.put("ding", "dong");`

## Cleanup the Stack

Run the following to stop the stack.

```
docker-compose down
```

---
[ALB Logs](alb.md)