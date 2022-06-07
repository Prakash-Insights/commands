#!/bin/bash
date_now=`date +%s%3N`
date_2weeks_ago=$[date_now - 14 * 24 * 60 * 60 * 1000]
query=$(printf '{ createdAt: { $gte: Date(%d) } }' $date_2weeks_ago)
echo $query > query.json
mongodump \
--collection=data \
--queryFile=query.json
rm query.json