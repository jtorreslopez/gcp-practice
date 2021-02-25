#!/bin/bash

gcloud compute networks create network-1 --subnet-mode=custom
gcloud compute networks create network-2 --subnet-mode=custom
#
#
gcloud compute networks subnets create network-1-subnet-a --network=network-1 --region=us-central1 --range=10.5.0.0/24
gcloud compute networks subnets create network-2-subnet-a --network=network-2 --region=us-central1 --range=10.6.0.0/24
gcloud compute networks subnets create network-2-subnet-b --network=network-2 --region=us-central1 --range=10.7.0.0/24
#
#
gcloud compute firewall-rules create ssh-icmp-network-1 --direction=INGRESS --priority=1000 --network=network-1 --action=ALLOW --rules=tcp:22,icmp --source-ranges=0.0.0.0/0
gcloud compute firewall-rules create ssh-icmp-network-2 --direction=INGRESS --priority=1000 --network=network-2 --action=ALLOW --rules=tcp:22,icmp --source-ranges=0.0.0.0/0
#
#
gcloud compute addresses create instance-1-local-address --region us-central1 --subnet network-1-subnet-a --addresses=10.5.0.10
gcloud compute addresses create instance-2-local-address --region us-central1 --subnet network-1-subnet-a --addresses=10.5.0.12
#
#
gcloud compute instances create instance1 --image-family=centos-7 --image-project=centos-cloud --zone=us-central1-a --machine-type=f1-micro --boot-disk-size=20GB --hostname=instance1.example.com --network=network-1 --subnet=network-1-subnet-a --private-network-ip=instance-1-local-address
gcloud compute instances create instance2 --image-family=ubuntu-2010 --image-project=ubuntu-os-cloud --zone=us-central1-a --machine-type=f1-micro --boot-disk-size=20GB --hostname=instance2.example.com --network=network-1  --subnet=network-1-subnet-a --private-network-ip=instance-2-local-address
#
#
gcloud compute instances create instance3 --image-family=ubuntu-2010 --image-project=ubuntu-os-cloud --zone=us-central1-a --machine-type=f1-micro --boot-disk-size=20GB --hostname=instance3.example.com --network=network-2 --subnet=network-2-subnet-a
gcloud compute instances create instance4 --image-family=centos-7 --image-project=centos-cloud --zone=us-central1-a --machine-type=f1-micro --boot-disk-size=20GB --hostname=instance4.example.com --network=network-2 --subnet=network-2-subnet-b
#
#
gcloud compute networks peerings create peer-network1-network2 --network=network-1 --peer-network=network-2
gcloud compute networks peerings create peer-network2-network1 --network=network-2 --peer-network=network-1
