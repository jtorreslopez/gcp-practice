#!/bin/bash

# Remove the instances
# ''''''''''''''''''''
gcloud compute instances delete instance-1 --zone=us-east1-c --quiet
gcloud compute instances delete instance-2 --zone=us-east1-b --quiet
gcloud compute instances delete instance-3 --zone=us-east1-b --quiet
gcloud compute instances delete instance-4 --zone=europe-west1-c --quiet

# Remove the NATS, routers and reserved addresses
# '''''''''''''''''''''''''''''''''''''''''''''''
gcloud compute routers nats delete nat-gw-eu-west --router=router-2 --region=europe-west1 --quiet
gcloud compute routers nats delete nat-gw-us-east --router=router-1 --region=us-east1 --quiet
gcloud compute routers delete router-2 --region=europe-west1 --quiet
gcloud compute routers delete router-1 --region=us-east1 --quiet
gcloud compute addresses delete nat-gw-us-east-address --region=us-east1 --quiet
gcloud compute addresses delete nat-gw-eu-west-address --region=europe-west1 --quiet

# Remove the networks, subnets and firewall rules
# ''''''''''''''''''''''''''''''''''''''''''''''
gcloud compute networks subnets delete network-1-subnet-c --region=europe-west1 --quiet
gcloud compute networks subnets delete network-1-subnet-b --region=us-east1 --quiet
gcloud compute networks subnets delete network-1-subnet-a --region=us-east1 --quiet
gcloud compute firewall-rules delete network-1-allow-icmp-ssh --quiet
gcloud compute networks delete network-1 --quiet
