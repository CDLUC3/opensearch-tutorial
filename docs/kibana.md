[Home](../README.md)

---

# Explore Kibana

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

---
[Sample Files - No Json Filter](sample1.md)