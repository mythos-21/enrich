#!/bin/bash
# This file builds the lambda layer

# exit early on any issues
set -e

LAYER="mythos21_enrich_layer"
ZIPFILE="${LAYER}.zip"

# Delete any previous version
rm -rf $ZIPFILE

# Build the image and run a container
sudo docker build -t $LAYER -f aws_lambda_layer.dockerfile .
CONTAINER=$(sudo docker run -d $LAYER false)
echo "Copying layer.zip from the docker container"
sudo docker cp ${CONTAINER}:/layer.zip "${ZIPFILE}"
sudo chown -R "${USER}:${USER}" "${ZIPFILE}"
sudo docker container rm  ${CONTAINER}
echo "Created $ZIPFILE"


