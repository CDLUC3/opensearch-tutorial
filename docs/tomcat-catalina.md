[Home](../README.md)

---

# Load Sample Tomcat Catalina log file

- See [`tomcat.yml`](../tomcat.yml)
- See [`logstash/logstash_tomcat.conf`](../logstash/logstash_tomcat.conf)

Start the Stack

If running locally...
```
export MYHOSTNAME=$(hostname)
```

If running on a server...
```
export MYHOSTNAME=$(hostname).$(domainname)
```

```
docker-compose -f docker-compose.yml -f tomcat.yml up -d --build
echo "Open http://${MYHOSTNAME}:8086/docs/tomcat-catalina.md in your browser to view these instructions."

```

1. Navigate to the [OpenSearch Dashboard Discover Page](http://{{MYHOSTNAME}}:8094/app/discover)
  - Credentials: `admin:admin`
  - If prompted, choose the "Global" tenant
2. Add the following fields to the display
  - timestamp
  - level
  - thread
  - class
  - messageText



Run the following to stop the stack.

```
docker-compose -f docker-compose.yml -f tomcat.yml down --volume
```

---
[Access Logs from running tomcat](tomcat-access.md)