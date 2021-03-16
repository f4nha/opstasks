#!/bin/bash

ROOT_DIR=/tmp/data
FILES_MAX=15

for sub_dir in pod-{a..h}
do
  POD_DIR=${ROOT_DIR}/${sub_dir}
  mkdir -p $POD_DIR
  for i in $(seq 1 $FILES_MAX)
  do
    touch $POD_DIR/access-$(date -d "-$(shuf -i 0-1825 -n 1) days -$(shuf -i 0-23 -n 1) hours -$(shuf -i 0-59 -n 1) minutes" +%Y%m%d%H%M).log
  done
done
