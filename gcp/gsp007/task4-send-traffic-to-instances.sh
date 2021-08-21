#!/bin/bash
while true; do curl -m1 `gcloud compute forwarding-rules describe www-rule --region us-central
1 | grep IPAddress | awk '{print $NF}'`; done
