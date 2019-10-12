#!/bin/bash
echo "version:20191011-1723"
aws s3 cp s3://${BUCKETCODE}/label_image.py /tmp/label_image.py
aws s3 cp s3://${BUCKETCODE}/output_graph.pb /tmp/output_graph.pb
aws s3 cp s3://${BUCKETCODE}/output_labels.txt /tmp/output_labels.txt
aws s3 cp s3://${BUCKETPICS}/images/${IMAGE} /tmp/${IMAGE}


python /tmp/label_image.py  \
  --graph=/tmp/output_graph.pb \
  --labels=/tmp/output_labels.txt \
  --input_layer=Placeholder \
  --output_layer=final_result \
  --image=/tmp/${IMAGE}|grep surfing >/tmp/result.txt

aws s3 cp /tmp/result.txt s3://${BUCKETPICS}/results/${IMAGE%.jpeg}.txt
