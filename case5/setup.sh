#!/bin/bash

# Create the VPC and subnets
# ''''''''''''''''''''''''''
gcloud compute networks create network-1 --subnet-mode=custom
gcloud compute firewall-rules create network-1-allow-icmp-ssh --network=network-1 --direction=INGRESS --action=ALLOW --rules=tcp:22,icmp
gcloud compute networks subnets create network-1-subnet-a --network=network-1 --region=us-east1 --range=10.240.0.0/29
gcloud compute networks subnets create network-1-subnet-b --network=network-1 --region=us-east1 --range=172.16.1.0/29
gcloud compute networks subnets create network-1-subnet-c --network=network-1 --region=europe-west1 --range=192.168.1.0/29

# Setup the Cloud NAT configuration
# '''''''''''''''''''''''''''''''''
# -> Reserve static external IP address for the NAT gateways on each region
gcloud compute addresses create nat-gw-us-east-address  --region=us-east1
gcloud compute addresses create nat-gw-eu-west-address  --region=europe-west1
# -> Create the routers needed on each region
gcloud compute routers create router-1 --network=network-1 --region=us-east1
gcloud compute routers create router-2 --network=network-1 --region=europe-west1
# -> Create the NAT's services
gcloud compute routers nats create nat-gw-us-east --router=router-1 --nat-external-ip-pool=nat-gw-us-east-address --nat-custom-subnet-ip-ranges=network-1-subnet-a --region=us-east1
gcloud compute routers nats create nat-gw-eu-west --router=router-2 --nat-external-ip-pool=nat-gw-eu-west-address --nat-all-subnet-ip-ranges --region=europe-west1

# Create the instances
# ''''''''''''''''''''
# -> us-east1
gcloud compute instances create instance-1 --zone=us-east1-c --no-address --machine-type=f1-micro --boot-disk-size=20GB --network=network-1 --subnet=network-1-subnet-a
gcloud compute instances create instance-2 --zone=us-east1-b --no-address --machine-type=f1-micro --boot-disk-size=20GB --network=network-1 --subnet=network-1-subnet-a
gcloud compute instances create instance-3 --zone=us-east1-b --no-address --machine-type=f1-micro --boot-disk-size=20GB --network=network-1 --subnet=network-1-subnet-b
#
# -> europe-west1
gcloud compute instances create instance-4 --zone=europe-west1-c --no-address --machine-type=f1-micro --boot-disk-size=20GB --network=network-1 --subnet=network-1-subnet-c

