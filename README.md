podman run -v "$(pwd)/confluent-hub-components:/usr/share/confluent-hub-components" cnfldemos/cp-server-connect-datagen:0.6.0-7.2.1 sh -c "confluent-hub install --no-prompt confluentinc/kafka-connect-elasticsearch:10.0.2 && confluent-hub install --no-prompt confluentinc/kafka-connect-datagen:0.4.0"

podman-compose up -d

podman-compose ps

podman exec -it ksqldb-cli ksql http://ksqldb-server:8088

RUN SCRIPT '/scripts/create-connectors.sql';

print clickstream_users limit 3;

RUN SCRIPT '/scripts/statements.sql';

RUN SCRIPT '/scripts/bandwidth_statements.sql';

podman exec -it elasticsearch bash -c '/scripts/elastic-dynamic-template.sh'

podman exec -it ksqldb-server bash -c '/scripts/ksql-tables-to-grafana.sh'

podman exec -it grafana bash -c '/scripts/clickstream-analysis-dashboard.sh'

./sessionize-data.sh

