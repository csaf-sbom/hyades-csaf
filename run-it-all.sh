#!/usr/bin/env bash

BASEDIR=$(dirname $(realpath $0))

# Build hyades modules and containers
./build-containers.sh

# Run docker-compose
cd $BASEDIR/hyades
docker compose --profile demo up
