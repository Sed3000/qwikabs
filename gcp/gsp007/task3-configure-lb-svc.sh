#~/bin/bash
echo "Create a static external IP address for your load balancer"
gcloud compute addresses create network-lb-ip-1 \
 --region us-central1

echo "Add a legacy HTTP health check resource"
gcloud compute http-health-checks create basic-check

echo "Add a target pool in the same region as your instances. Run the following to create the target pool and use the health check, which is required for the service to function"
gcloud compute target-pools create www-pool \
    --region us-central1 --http-health-check basic-check

echo "Add the instances to the pool"
gcloud compute target-pools add-instances www-pool \
    --instances www1,www2,www3

echo "Add a forwarding rule"
gcloud compute forwarding-rules create www-rule \
    --region us-central1 \
    --ports 80 \
    --address network-lb-ip-1 \
    --target-pool www-pool
