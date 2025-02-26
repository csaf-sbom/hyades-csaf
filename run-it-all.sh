#!/usr/bin/env bash
BASEDIR=$(dirname $(realpath $0))

# Build hyades modules
cd $BASEDIR/hyades
mvn clean package \
  -Dquarkus.container-image.build=true \
  -Dquarkus.container-image.additional-tags=csaf-local \
  -DskipTests=true

# Build hyades-apiserver
cd $BASEDIR/hyades-apiserver
mvn clean package \
  -Pclean-exclude-wars \
  -Penhance \
  -Pembedded-jetty \
  -DskipTests \
  -Dcheckstyle.skip \
  -Dlogback.configuration.file=src/main/docker/logback.xml
docker build \
  --build-arg WAR_FILENAME=dependency-track-apiserver.jar \
  -t ghcr.io/dependencytrack/hyades-apiserver:csaf-local \
  -f ./src/main/docker/Dockerfile \
  .

# Build hyades-frontend
cd $BASEDIR/hyades-frontend
npm install
npm run build
docker build -f docker/Dockerfile.alpine -t ghcr.io/dependencytrack/hyades-frontend:csaf-local .

# Run docker-compose
cd $BASEDIR
docker compose --profile csaf up