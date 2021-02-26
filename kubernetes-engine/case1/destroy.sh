#!/bin/bash

gcloud container clusters delete mycluster-1 --region=us-central1 --quiet
gcloud compute firewall-rules delete allow-service-nodeport-mycluster-1 --quiet
gcloud compute firewall-rules delete allow-ssh-mycluster-1 --quiet
gcloud compute firewall-rules delete allow-icmp-mycluster-1 --quiet
gcloud compute networks subnets delete mysubnet-1 --region=us-central1 --quiet
gcloud compute networks delete mynetwork-1 --quiet
