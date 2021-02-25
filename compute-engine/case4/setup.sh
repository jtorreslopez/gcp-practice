#!/bin/bash

gcloud compute networks create network-1 --subnet-mode=custom
gcloud compute networks subnets create network-1-subnet-a --region=us-central1 --network=network-1 --range=10.80.0.0/29
gcloud compute firewall-rules create allow-http-apache --action=ALLOW --direction=INGRESS --network=network-1 --rules=tcp:80 --target-tags=http-apache-server
gcloud compute firewall-rules create allow-https-apache --action=ALLOW --direction=INGRESS --network=network-1 --rules=tcp:443 --target-tags=https-apache-server
gcloud compute firewall-rules create allow-ssh --action=ALLOW --direction=INGRESS --network=network-1 --rules=tcp:22
gcloud compute instances create instance-1 --zone=us-central1-a --boot-disk-size=20GB --machine-type=f1-micro --network=network-1 --subnet=network-1-subnet-a --metadata-from-file=startup-script=./install_apache.sh --tags=http-apache-server
gcloud compute instances create instance-2 --zone=us-central1-b --boot-disk-size=20GB --machine-type=f1-micro --network=network-1 --subnet=network-1-subnet-a --metadata-from-file=startup-script=./install_apache.sh --tags=https-apache-server
