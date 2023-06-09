[Home](../README.md)

---

# Explore Kibana
## Purpose
Install the sample data files provided with OpenSearch Dashboards.  Navigate the Examples.
## Run the scenario

If running locally...
```
export MYHOSTNAME=$(hostname)
```

If running on a server...
```
export MYHOSTNAME=$(hostname).$(domainname)
```

Start the docker Stack.
```
docker-compose up -d --build
echo "Open http://${MYHOSTNAME}:8086/" in your browser to view these instructions.

```
## Explore the Dashboard

1. Navigate to the [OpenSearch Dashboard](http://{{MYHOSTNAME}}:8094)
  - Credentials: `admin:admin`
  - If prompted, choose the "Global" tenant
2. Click `Add Sample Data`
  - Add each sample dataset one by one
  - Click `View Data` explore what a custom dashboard can do
3. From the main menu or from the dashboard page, click `Discover` to view the raw json entries
  - Expand specific entries to view the data as JSON or as a table.
4. From the Discover page, select the `...sample_data_logs` index
  - search: `response: 200`
  - search: `response: 404`
  - search: `NOT response:(404 OR 200)`
5. Explore the Advanced Settings for the Dashboard

## Cleanup the Stack
Run the following to stop the stack.

```
docker-compose down
```

---
[Sample Files - No Json Filter](sample1.md)