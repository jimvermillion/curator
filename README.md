# Curator: run daily
While setting up fluentd/elasticsearch/kibana I found it useful to have an instance of curator that ran every day to delete old logs.

## Required environment variables when running container of this docker image:
- ELASTICSEARCH_HOST - the connected host for elasticsearch
- TIME_UNIT - unit of time; ie hours, days (see curator docs for valid params)
- TIME_COUNT - quantity of time units in past to delete

### Sample docker-compose with this curator image
The following curator image will delete elasticsearch logs that are older than one day old.
```docker
version: '3'
services:
  [... other services ...]
  curator:
    build: curator
    environment:
      - ELASTICSEARCH_HOST=ms-elastic
      - TIME_UNIT=days
      - TIME_COUNT=1
    links:
      - elasticsearch:ms-elastic
```