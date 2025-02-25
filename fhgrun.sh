#!/usr/bin/env bash
export EXTRA_JAVA_OPTIONS="-Xmx2g"
export ALPINE_DATABASE_URL="jdbc:postgresql://localhost:5432/dtrack?reWriteBatchedInserts=true"
export ALPINE_DATABASE_USERNAME="dtrack"
export ALPINE_DATABASE_PASSWORD="dtrack"
export ALPINE_METRICS_ENABLED="true"
#export ALPINE_SECRET_KEY_PATH="/var/run/secrets/secret.key"
export KAFKA_BOOTSTRAP_SERVERS="localhost:9092" # OUTSIDE://
export INTEGRITY_CHECK_ENABLED="true"
export INIT_TASKS_ENABLED="false" # only use if not using dt-initializer
mvn -Djetty.reload=automatic -Djetty.scanIntervalSeconds=10 jetty:run -P enhance -Dlogback.configurationFile=src/main/docker/logback.xml -Dcheckstyle.skip
