{{home}}
# Load Sample Files - With Json Filter

## Purpose
Parse and load sample json log files as json.

Notice that individual json fields are searchable in opensearch.

## Run the scenario

{{start}}

```
docker-compose -f docker-compose.yml -f sample1-json-log.yml -f logstash-json-filter.yml up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/sample1_with_json.md in your browser to view these instructions."

```

## Configuration
- See [`logstash-json-filter.yml`](../logstash-json-filter.yml)
- See [`logstash/logstash_with_filter.conf`](../logstash/logstash_with_filter.conf)
  - Note the filter instructs opensearch to parse the logs as json files.

## Explore the Dashboard

{{dashboard}}
- Sample search 
  - Click `DQL` and update the data range to look at the past week
- Search access logs
  - Note that the logstash ingest timestamp is currently being used
  - `json_data.statusCode:200`
  - `json_data.statusCode:404`
  - `json_data.statusCode:*`
  - `json_data.request:*/store/hostname*`
      - pulled from tomcat access log
- Search custom metadata inserted with log4j2
  - `json_data.ding:dong`
      - Using log4j2, inserted as `org.apache.logging.log4j.ThreadContext.put("ding", "dong");`

## Cleanup the Stack

Run the following to stop the stack.

```
docker-compose down
```

---
[ALB Logs](alb.md)