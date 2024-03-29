{{home}}

# Explore Kibana

## Purpose
Install the sample data files provided with OpenSearch Dashboards. 

Navigate the Examples that illustrate a full-featured custom dashboard configuration.
## Run the scenario

{{start}}

```
docker-compose up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/kibana.md" in your browser to view these instructions.

```
## Explore the OpenSearch Dashboards

- Navigate to the [OpenSearch Dashboard Discover Page](http://{{MYHOSTNAME}}:8094/app/discover)
  - Credentials: `admin:admin`
  - If prompted, choose the "Global" tenant
  - Click `Add Sample Data`
  - Add each sample dataset one by one
  - Click `View Data` explore what a custom dashboard can do
- From the main menu or from the dashboard page, click `Discover` to view the raw json entries
  - Expand specific entries to view the data as JSON or as a table.
- From the Discover page, select the `...opensearch_dashboards_sample_data_logs` index
  - verify that the date/time range for your query covers several hours
  - search: `response: 200`
  - search: `response: 404`
  - search: `NOT response:(404 OR 200)`
- Explore the Advanced Settings for the Dashboard

## Cleanup the Stack

{{stop}}

```
docker-compose down --volume
```

---
[Home](../README.md) | [Next](sample1.md)
