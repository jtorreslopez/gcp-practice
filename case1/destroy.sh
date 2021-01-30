#!/bin/bash

gcloud compute networks peerings delete peer-network1-network2 --network=network-1 --quiet
gcloud compute networks peerings delete peer-network2-network1 --network=network-2 --quiet
#
#
gcloud compute instances delete instance1 --zone=us-central1-a --quiet
gcloud compute instances delete instance2 --zone=us-central1-a --quiet
gcloud compute instances delete instance3 --zone=us-central1-a --quiet
gcloud compute instances delete instance4 --zone=us-central1-a --quiet
#
#
gcloud compute addresses delete instance-1-local-address --region=us-central1 --quiet
gcloud compute addresses delete instance-2-local-address --region=us-central1 --quiet
#
#
gcloud compute firewall-rules delete ssh-icmp-network-1 --quiet
gcloud compute firewall-rules delete ssh-icmp-network-2 --quiet
#
#
gcloud compute networks subnets delete network-1-subnet-a --region=us-central1 --quiet
gcloud compute networks subnets delete network-2-subnet-a --region=us-central1 --quiet
gcloud compute networks subnets delete network-2-subnet-b --region=us-central1 --quiet
#
#
gcloud compute networks delete network-1 --quiet
gcloud compute networks delete network-2 --quiet
