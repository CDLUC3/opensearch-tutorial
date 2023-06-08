[Home](../README.md)

---

# Load Sample Files - No Json Filter

- See [`sample1-json-log.yml`](../sample1-json-log.yml)
- See [`logstash/logstash.conf`](../logstash/logstash.conf)
- See [`data/1_sample/ecs.json.log`](../data/1_sample/ecs.json.log)
  - sample storage log including some log4j2 calls
- See [`data/1_sample/localhost_access_log.2023-04-27.json.log`](../data/1_sample/localhost_access_log.2023-04-27.json.log)
  - tomcat access log

Start the Stack

```
docker-compose -f docker-compose.yml -f sample1-json-log.yml up -d --build
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