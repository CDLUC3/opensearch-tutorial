{{home}}
# Load Sample Files - With Date Normalization

## Purpose
Parse and load sample json log files as json.  

Index date fields using the original dates in the log files (April 2023).

## Run the scenario

{{start}}

```
docker-compose -f docker-compose.yml -f sample1-json-log.yml -f logstash-json-filter-datenorm.yml up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/sample1_with_json_datenorm.md in your browser to view these instructions."

```

## Configuration
- See [`logstash-json-filter-datenorm.yml`](../logstash-json-filter-datenorm.yml)
- See [`logstash/logstash_with_filter_norm.conf`](../logstash/logstash_with_filter_datenorm.conf)

## Explore the Dashboard

- Navigate to the [OpenSearch Dashboard Discover Page](http://{{MYHOSTNAME}}:8094/app/discover?security_tenant=global#/?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:'2023-04-01T22:00:56.742Z',to:now))&_a=(columns:!(json_data.request,json_data.statusCode,tags),filters:!(),index:'ecs-*',interval:auto,query:(language:kuery,query:'json_data.statusCode:%20*'),sort:!()))
  - Credentials: `admin:admin`
  - If prompted, choose the "Global" tenant
  - Note that the data range has been set to look back to April 2023.
- Search access logs
  - `json_data.statusCode:200`

## Cleanup the Stack

{{stop}}

```
docker-compose -f docker-compose.yml -f sample1-json-log.yml -f logstash-json-filter-datenorm.yml down
```

---
[Back](sample1_with_json.md) | [Next](alb.md)