#!/bin/bash

# This script will build the image a locally deploy a docker container for the enrich api

# build docker images
sudo docker build -t mythos21_enrich_loc_proto:1.0 -f local-enrich-proto.dockerfile .
sudo docker build -t mythos21_enrich_loc_api:1.0 -f local-enrich-api.dockerfile .

