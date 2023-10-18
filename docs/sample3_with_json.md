{{home}}
# Load Sample Files - With Json Filter

## Purpose
Parse and load sample json log files as json.

Documents will be updated based on a document id "myid".

Notice that individual json fields are searchable in opensearch.

## Run the scenario

{{start}}

```
docker-compose -f docker-compose.yml -f sample3-json-log.yml -f logstash-json-filter.yml up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/sample3_with_json.md in your browser to view these instructions."

```

## Configuration
- See [`logstash-json-filter.yml`](../logstash-json-filter.yml)
- See [`logstash/logstash_with_filter.conf`](../logstash/logstash_with_filter.conf)
  - Note the filter instructs opensearch to parse the logs as json files.

## Explore the Dashboard

- Navigate to the [OpenSearch Dashboard Discover Page](http://{{MYHOSTNAME}}:8094/app/discover?security_tenant=global#/?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-15m,to:now))&_a=(columns:!(myid,name,description,foo),filters:!(),index:'ecs-*',interval:auto,query:(language:kuery,query:''),sort:!()))
  - Credentials: `admin:admin`
  - If prompted, choose the "Global" tenant
  - Note that the sample search is looking for records with a `json_data.statusCode`
  - Note that 3 fields have been selected for default display
  - Note that the logstash ingest timestamp is currently being used rather than the original timestamp from the log files
- Other interesting Searches
  - `json_data.statusCode:200`
  - `json_data.statusCode:404`
  - `json_data.request:*/store/hostname*`
      - pulled from tomcat access log
- Search custom metadata inserted with log4j2
  - `json_data.ding:dong`
      - Using log4j2, inserted as `org.apache.logging.log4j.ThreadContext.put("ding", "dong");`

## Cleanup the Stack

{{stop}}

```
docker-compose -f docker-compose.yml -f sample1-json-log.yml -f logstash-json-filter.yml down --volume
```

---
[Back](sample1.md) | [Next](sample1_with_json_datenorm.md)