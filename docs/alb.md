[Home](../README.md)

---

# Load Sample ALB log file

- See [`alb-json-log.yml`](../alb-json-log.yml)
- See [`logstash/logstash_alb.conf`](../logstash/logstash_alb.conf)
- See [`data/2_sample/alb.log`](../data/2_sample/alb.log)

Start the Stack

```
export DOMAINNAME=$(domainname)
docker-compose -f docker-compose.yml -f alb-json-log.yml up -d --build
echo "Open http://$(hostname).$(domainname):8086/ in your browser to view these instructions."
```

1. Navigate to the [OpenSearch Dashboard Discover Page](http://{{MYHOSTNAME}}:8094/app/discover)
  - Credentials: `admin:admin`
2. Sample search
  - `message: 200`



Run the following to stop the stack.

```
docker-compose down
```
