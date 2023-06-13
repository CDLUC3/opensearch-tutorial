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

{{dashboard}}
- Sample search 
  - Click `DQL` and update the data range to look back to April 2023.
- Search access logs
  - `json_data.statusCode:200`

## Cleanup the Stack

{{stop}}

```
docker-compose -f docker-compose.yml -f sample1-json-log.yml -f logstash-json-filter-datenorm.yml down
```

---
[ALB Logs](alb.md)