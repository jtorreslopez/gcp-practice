#!/bin/bash

gcloud compute networks create network-group-1 --subnet-mode=custom
gcloud compute firewall-rules create allow-ssh-http --network=network-group-1 --allow=tcp:22,tcp:80,icmp
gcloud compute networks subnets create network-group-1-subnet-a --network=network-group-1 --region=us-central1 --range=10.50.0.0/24
gcloud compute instance-templates create group-1-template --region=us-central1 --boot-disk-size=20GB --machine-type=f1-micro --network=network-group-1 --subnet=network-group-1-subnet-a --metadata-from-file=startup-script=./install_apache.sh
gcloud compute instance-groups managed create group-1 --zone=us-central1-a --template=group-1-template --base-instance-name=instance --size=3
gcloud compute health-checks create http group-1-basic-html-check --port 80
gcloud compute backend-services create group-1-backend-service --protocol=HTTP --port-name=http --health-checks=group-1-basic-html-check --global
gcloud compute backend-services add-backend group-1-backend-service --instance-group=group-1 --instance-group-zone=us-central1-a --global
gcloud compute url-maps create lb-group-1 --default-service=group-1-backend-service
gcloud compute target-http-proxies create http-lb-group-1-proxy --url-map=lb-group-1
gcloud compute forwarding-rules create http-group-1-content-rule --global --target-http-proxy=http-lb-group-1-proxy --ports=80
