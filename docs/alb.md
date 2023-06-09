[Home](../README.md)

---

# Load Sample ALB log file

## Purpose
Parse and search AWS Application Load Balancer logs using logstash grok filters.

## Configuration
- See [`alb-json-log.yml`](../alb-json-log.yml)
- See [`logstash/logstash_alb.conf`](../logstash/logstash_alb.conf)
- See [`data/2_sample/alb.log`](../data/2_sample/alb.log)

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
docker-compose -f docker-compose.yml -f alb-json-log.yml up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/alb.md in your browser to view these instructions."

```
## Explore the Dashboard


1. Navigate to the [OpenSearch Dashboard Discover Page](http://{{MYHOSTNAME}}:8094/app/discover)
  - Credentials: `admin:admin`
  - If prompted, choose the "Global" tenant
2. Sample search
  - `message: 200`


## Cleanup the Stack

Run the following to stop the stack.

```
docker-compose down
```

---
[ALB Logs from S3](alb_s3.md)