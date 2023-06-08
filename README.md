# OpenSearch experiments

Experiments configuring OpenSearch to work with our common application patterns

## References
- [Learning the Elastic Stack](https://www.linkedin.com/learning/learning-the-elastic-stack-2?u=76816210)
- [Elastic Search in Depth](https://www.linkedin.com/learning/elasticsearch-in-depth?u=76816210)

## General Instructions

Start the Docker Stack from the `/opensearch/` directory.

```
docker-compose up -d --build
echo "Open http://$(hostname).$(domainname):8086/" in your browser to view these instructions.
```

Run the following to stop the stack.

```
docker-compose down
```

## Demos
- [Explore Kibana / OpenSearch Dashboards](docs/kibana.md)
- [Sample Files - No Json Filter](docs/sample1.md)
- [Sample Files - Json Filter](docs/sample1_with_json.md)
- [ALB Logs](docs/alb.md)
- [ALB Logs from S3](docs/alb_s3.md)
- [Catalina Logs from running tomcat](docs/tomcat-catalina.md)
- [Access Logs from running tomcat](docs/tomcat-access.md)
- [Json Application Logs from running tomcat](docs/tomcat-app-logs.md)
- [Handle 3 types of tomcat logs](docs/tomcat-all-logs.md)