[Home](../README.md)

---

# Load Sample ALB log file from s3

## Purpose
Load ALB logs from and S3-compatible cloud storage bucket.

## Configuration
- See [`alb-s3-json-log.yml`](../alb-s3-json-log.yml)
- See [`logstash/logstash_alb.conf`](../logstash/logstash_alb_s3.conf)

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
docker-compose -f docker-compose.yml -f alb-s3-json-log.yml up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/alb_s3.md in your browser to view these instructions."

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
[Catalina Logs from running tomcat](tomcat-catalina.md)