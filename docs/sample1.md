{{home}}
# Load Sample Files - No Json Filter

## Purpose
Parse and load sample json log files as text files.

## Run the scenario
 
{{start}}

```
docker-compose -f docker-compose.yml -f sample1-json-log.yml up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/sample1.md in your browser to view these instructions."

```

## Configuration
- See [`sample1-json-log.yml`](../sample1-json-log.yml)
- See [`logstash/logstash.conf`](../logstash/logstash.conf)
- See [`data/1_sample/ecs.json.log`](../data/1_sample/ecs.json.log)
  - sample storage log including some log4j2 calls
- See [`data/1_sample/localhost_access_log.2023-04-27.json.log`](../data/1_sample/localhost_access_log.2023-04-27.json.log)
  - tomcat access log

## Explore the Dashboard


- Navigate to the [OpenSearch Dashboard Discover Page](http://{{MYHOSTNAME}}:8094/app/discover?security_tenant=global#/?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-15m,to:now))&_a=(columns:!(message),filters:!(),index:'ecs-*',interval:auto,query:(language:kuery,query:'message:%20200'),sort:!()))
  - Credentials: `admin:admin`
  - If prompted, choose the "Global" tenant
  - Note that a default search `message: 200` has been set
  - Note that the logstash ingest timestamp is currently being used rather than the original timestamp from the log files.
  - Expand the search results.  Note that the contents of the message field are not individually indexed in opensearch.

## Cleanup the Stack

{{stop}}

```
docker-compose -f docker-compose.yml -f sample1-json-log.yml down --volume
```

---
[Back](kibana.md) | [Next](sample1_with_json.md)