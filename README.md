# OpenSearch experiments

Experiments configuring OpenSearch to work with our common application patterns

## References
- [Learning the Elastic Stack](https://www.linkedin.com/learning/learning-the-elastic-stack-2?u=76816210)
- [Elastic Search in Depth](https://www.linkedin.com/learning/elasticsearch-in-depth?u=76816210)

## General Instructions

Docker is required for this tutorial.  See our [docker tutorial](https://cdluc3.github.io/docker-tutorial/) for background.

These examples should work on Linux or Mac.  Contributions are welcome to make these examples work on Windows.

These instructions presume that ports 8080-8099 are open to internet.  

- Ports 8086, 8094 and 8080 are used in these examples.

## Run each example of interest
- Start the docker stack
- Explore the configuration files
- Explore the open search dashboard to see the results
- Stop the docker stack
- Continue to the next example


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
- [Rails logs](docs/rails.md)

