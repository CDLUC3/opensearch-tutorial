{{home}}

# Load Sample ALB log file

## Purpose
Parse and search AWS Application Load Balancer logs using logstash grok filters.

## Run the scenario

{{start}}

```
docker-compose -f docker-compose.yml -f alb-json-log.yml up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/alb.md in your browser to view these instructions."

```

## Configuration
- See [`alb-json-log.yml`](../alb-json-log.yml)
- See [`logstash/logstash_alb.conf`](../logstash/logstash_alb.conf)
- See [`data/2_sample/alb.log`](../data/2_sample/alb.log)
  - The comments link to an [article](https://medium.com/@sameera.godakanda/alb-access-logs-in-elasticsearch-69b1acaa6b55) illustrating how to construct a grok filter for these AWS logs

## Explore the Dashboard


{{dashboard}}
- Sample search
  - clientip:	10.10.11.218`
  - Note that the logstash ingest timestamp is currently being used


## Cleanup the Stack

Run the following to stop the stack.

```
docker-compose down
```

---
[ALB Logs from S3](alb_s3.md)