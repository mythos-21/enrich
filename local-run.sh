#!/bin/bash

# This will run a container with the python code to do the enrichment

echo "VERIFY ENVIRONMENT VARIABLES"
echo "ENRICH_PORT=$ENRICH_PORT"
echo "X_API_KEY=$X_API_KEY"
read -p "Press any key to continue..."
echo ""

# deploy a container
sudo docker run \
    -d \
    -p "127.0.0.1:${ENRICH_PORT}:5000" \
    -e "X_API_KEY=${X_API_KEY}" \
    --name mythos21_enrich_local mythos21_enrich_loc_api:1.0 
