[Home](../README.md)

---

# Load Sample ALB log file from s3

- See [`alb-s3-json-log.yml`](../alb-s3-json-log.yml)
- See [`logstash/logstash_alb.conf`](../logstash/logstash_alb_s3.conf)

If needed, the following command can be run to create the sample data in s3

```
aws s3 cp data/2_sample/alb.log s3://uc3-s3-dev/test-logs/alb.log
```

Start the Stack

If running locally...
```
export MYHOSTNAME=$(hostname)
```

```
docker-compose -f docker-compose.yml -f alb-s3-json-log.yml up -d --build
echo "Open http://${MYHOSTNAME:-$(hostname).$(domainname)}:8086/ in your browser to view these instructions."

```

1. Navigate to the [OpenSearch Dashboard Discover Page](http://{{MYHOSTNAME}}:8094/app/discover)
  - Credentials: `admin:admin`
2. Sample search
  - `message: 200`



Run the following to stop the stack.

```
docker-compose down
```
