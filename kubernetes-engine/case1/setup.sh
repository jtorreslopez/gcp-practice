#!/bin/bash

gcloud compute networks create mynetwork-1 --subnet-mode=custom
gcloud compute networks subnets create mysubnet-1 --network=mynetwork-1 --range=10.90.0.0/24 --region=us-central1
gcloud compute firewall-rules create allow-icmp-mycluster-1 --network=mynetwork-1 --action=ALLOW --direction=INGRESS --rules=icmp
gcloud compute firewall-rules create allow-ssh-mycluster-1 --network=mynetwork-1 --action=ALLOW --direction=INGRESS --rules=tcp:22
gcloud compute firewall-rules create allow-service-nodeport-mycluster-1 --network=mynetwork-1 --action=ALLOW --direction=INGRESS --rules=tcp:30000-32767
gcloud container clusters create mycluster-1 --num-nodes=1 --machine-type=e2-medium --network=mynetwork-1 --subnetwork=mysubnet-1 --region=us-central1 --node-locations=us-central1-a,us-central1-b,us-central1-c,us-central1-f
