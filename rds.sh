#!/bin/bash

location=$1

echo "$location"
#exit
arn=$(aws rds describe-db-instances --profile "$location" | jq .DBInstances[].DBInstanceArn -r >> arnlist)

for i in $(cat arnlist)
do 
echo DB-ARN: $i
aws rds list-tags-for-resource  --resource-name $i --profile "$location"
done
