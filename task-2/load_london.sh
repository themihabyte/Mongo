#!/bin/bash

FILENAME="london_postcodes-ons-postcodes-directory-feb22.csv"

cd ../task-1
docker-compose exec router01 mongosh --port 27017 --eval "sh.enableSharding('london'); sh.shardCollection('london.postcodes', {_id: 'hashed'})"
docker-compose exec router01 mongoimport --port 27017 -d london -c postcodes --type csv --file /data/$FILENAME --headerline