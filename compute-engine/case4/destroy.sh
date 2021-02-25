#!/bin/bash

gcloud compute instances delete instance-1 --zone=us-central1-a --quiet
gcloud compute instances delete instance-2 --zone=us-central1-b --quiet
gcloud compute firewall-rules delete allow-ssh --quiet
gcloud compute firewall-rules delete allow-https-apache --quiet
gcloud compute firewall-rules delete allow-http-apache --quiet
gcloud compute networks subnets delete network-1-subnet-a --region=us-central1 --quiet
gcloud compute networks delete network-1 --quiet
