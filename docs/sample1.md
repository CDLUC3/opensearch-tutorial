[Home](../README.md)

---

# Load Sample Files - No Json Filter

## Purpose
Parse and load sample json log files as text files.

## Configuration
- See [`sample1-json-log.yml`](../sample1-json-log.yml)
- See [`logstash/logstash.conf`](../logstash/logstash.conf)
- See [`data/1_sample/ecs.json.log`](../data/1_sample/ecs.json.log)
  - sample storage log including some log4j2 calls
- See [`data/1_sample/localhost_access_log.2023-04-27.json.log`](../data/1_sample/localhost_access_log.2023-04-27.json.log)
  - tomcat access log

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
docker-compose -f docker-compose.yml -f sample1-json-log.yml up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/sample1.md in your browser to view these instructions."

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
[Sample Files - Json Filter](sample1_with_json.md)