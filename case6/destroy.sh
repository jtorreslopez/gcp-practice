#!/bin/bash

gcloud compute forwarding-rules delete internal-frontend --region=us-west1 --quiet
gcloud compute target-http-proxies delete internal-proxy --region=us-west1 --quiet
gcloud compute url-maps remove-path-matcher lb-internal-1 --path-matcher-name=backend-services-rule --region=us-west1 --quiet
gcloud compute url-maps delete lb-internal-1 --region=us-west1 --quiet
gcloud compute backend-services delete backend-service-2 --region=us-west1 --quiet
gcloud compute backend-services delete backend-service-1 --region=us-west1 --quiet
gcloud compute health-checks delete basic-html-check --quiet

gcloud compute instance-groups managed delete backend-1-group --zone=us-west1-b --quiet
gcloud compute instance-groups managed delete backend-2-group --zone=us-west1-b --quiet

gcloud compute instance-templates delete backend-2-template --quiet
gcloud compute instance-templates delete backend-1-template --quiet
gcloud compute instances delete client --zone=us-west1-b --quiet

gcloud compute firewall-rules delete network-1-allow-http --quiet
gcloud compute firewall-rules delete network-1-allow-ssh-icmp --quiet
gcloud compute firewall-rules delete network-1-allow-health-checks --quiet
gcloud compute firewall-rules delete network-1-allow-internal --quiet
gcloud compute networks subnets delete network-1-subnet-proxy-only --region=us-west1 --quiet
gcloud compute networks subnets delete network-1-subnet-backends --region=us-west1 --quiet
gcloud compute networks subnets delete network-1-subnet-clients --region=us-west1 --quiet
gcloud compute networks delete network-1 --quiet
