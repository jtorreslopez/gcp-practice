#!/bin/bash

gcloud compute forwarding-rules delete http-group-1-content-rule --global --quiet
gcloud compute target-http-proxies delete http-lb-group-1-proxy --quiet
gcloud compute url-maps delete lb-group-1 --quiet
gcloud compute backend-services remove-backend group-1-backend-service --instance-group-zone=us-central1-a --instance-group=group-1 --global --quiet
gcloud compute backend-services delete group-1-backend-service --global --quiet
gcloud compute health-checks delete group-1-basic-html-check --quiet
gcloud compute instance-groups managed delete group-1 --zone=us-central1-a --quiet
gcloud compute instance-templates delete group-1-template --quiet
gcloud compute networks subnets delete network-group-1-subnet-a --region=us-central1 --quiet
gcloud compute firewall-rules delete allow-ssh-http --quiet
gcloud compute networks delete network-group-1 --quiet
