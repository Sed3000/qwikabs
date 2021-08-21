#!/bin/bash
# Creating 3 Web Server instances
for i in `seq 1 3`; do echo "Creating Web Server Instance $i"; gcloud compute instances create www$i \
  --image-family debian-9 \
  --image-project debian-cloud \
  --zone us-central1-a \
  --tags network-lb-tag \
  --metadata startup-script="#! /bin/bash
    sudo apt-get update
    sudo apt-get install apache2 -y
    sudo service apache2 restart
    echo '<!doctype html><html><body><h1>www$i</h1></body></html>' | tee /var/www/html/index.html"; done
