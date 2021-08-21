#~/bin/bash
for i in `gcloud compute instances list | grep -v NAME | awk '{print $5}'`; do curl http://$i; done
