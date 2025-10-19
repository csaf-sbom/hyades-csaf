#!/usr/bin/env bash
BASEDIR=$(dirname $(realpath $0))


FRONTEND=$BASEDIR/hyades-frontend
if [ -d "$FRONTEND" ]; then
  echo Cleaning frontend dir
  cd $FRONTEND
  git clean -f
fi

# Checkout git submodules
cd $BASEDIR
git submodule update --init --recursive --remote

# Build hyades modules
cd $BASEDIR/hyades
mvn clean package -DskipTests=true

# Build hyades-apiserver
cd $BASEDIR/hyades-apiserver
mvn install -DskipTests -Dcheckstyle.skip

cd $BASEDIR/hyades-apiserver
mvn -pl apiserver -am clean package -P quick
docker build -t ghcr.io/dependencytrack/hyades-apiserver:local -f apiserver/src/main/docker/Dockerfile apiserver

# Build hyades-frontend
cd $BASEDIR/hyades-frontend
npm install
npm run build
docker build -f docker/Dockerfile.alpine -t ghcr.io/dependencytrack/hyades-frontend:local .

# Run docker-compose
cd $BASEDIR/hyades
docker compose --profile demo up
