#!/bin/bash
set -e

if [ "$#" -lt 2 ]; then
    echo -e\
    "usage info\n\
    build <tagname> <registry>\n\
    example: build latest ssc4033.azurecr.io"
    exit 1
else 
    TAG="$1"
    REGISTRY="$2"
fi

# 1. Container bauen
docker build -t node-app:$TAG .

# 2. Container taggen
docker tag node-app:$TAG $REGISTRY/ssc-node-app:latest
docker tag node-app:$TAG $REGISTRY/ssc-node-app:$TAG

# 3. Docker run
docker run node-app:$TAG $REGISTRY/ssc-node-app:latest

# 3. Container pushen
# docker push $REGISTRY/ssc-node-app:latest
# docker push $REGISTRY/ssc-node-app:$TAG
