# Kafka Basics

Link to project repo - https://github.com/Mamba369x/M10_KafkaBasics_SQL_LOCAL

## Example Usage

* Step 1: To install **kafka-connect-datagen** and **kafka-connect-elasticsearch** following command should be used on Mac:

```bash
podman run -v "$(pwd)/confluent-hub-components:/usr/share/confluent-hub-components" cnfldemos/cp-server-connect-datagen:0.6.0-7.2.1 sh -c "confluent-hub install --no-prompt confluentinc/kafka-connect-elasticsearch:10.0.2 && confluent-hub install --no-prompt confluentinc/kafka-connect-datagen:0.4.0"
```

![Step 1:](confluent_hub_installed.png)

* Step 2: Compose Docker containers

```bash
podman-compose up -d
```

![Step 2:](containers_created.png)

* Step 3: Check containers statuses

```bash
podman-compose ps
```

![Step 3:](containers_running.png)

* Step 4: Run ksql console

```bash
podman exec -it ksqldb-cli ksql http://ksqldb-server:8088
```

![Step 4:](ksqldb_launched.png)

* Step 5: Create connectors

```ksql
RUN SCRIPT '/scripts/create-connectors.sql';

![Step 5:](created_connectors.png)

* Step 6: Validate data from stream

```ksql
print clickstream_users limit 3;

![Step 6:](stream_data.png)

* Step 7: Check running connectors

![Step 7:](three_connectors.png)

* Step 8: Create and load streaming data

```ksql
RUN SCRIPT '/scripts/statements.sql';

![Step 8:](stream_loaded.png)

* Step 9: Create and load bandwidth streaming data

```ksql
RUN SCRIPT '/scripts/bandwidth_statements.sql';

![Step 9:](stream_loaded_bandwidth.png)

* Step 10-11: Verify data and ongoing streaming flow

![Step 10:](verify_data.png)
![Step 11:](verify_data_flow.png)

* Step 12: Run ElasticSeach mapping template setup

```bash
podman exec -it elasticsearch bash -c '/scripts/elastic-dynamic-template.sh'
```

![Step 12:](es_setup.png)

* Step 13: Connect ksqlDB tables to Elasticsearch and Grafana

```bash
podman exec -it ksqldb-server bash -c '/scripts/ksql-tables-to-grafana.sh'
```

![Step 13:](connect_tables.png)

* Step 14: Load dashboards

```bash
podman exec -it grafana bash -c '/scripts/clickstream-analysis-dashboard.sh'
```

![Step 14:](load_dashboard.png)

* Step 15-18: Sessionize data and oberve results in Grafana and Confluent Control Center

```bash
./sessionize-data.sh
```
![Step 15:](twelve_connectors.png)
![Step 15:](connect_tables.png)
![Step 15:](connect_tables.png)
![Step 15:](connect_tables.png)


