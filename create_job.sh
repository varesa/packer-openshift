#!/bin/sh

cat os/job.yml| sed "s/DATE/$(date +%Y%m%d%H%M)/" | oc apply -f -
