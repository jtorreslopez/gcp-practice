#!/bin/bash

# Create the VPC, subnet and firewall rules for the GKE cluster
gcloud compute networks create mynetwork-1 --subnet-mode=custom
gcloud compute networks subnets create mysubnet-1 --network=mynetwork-1 --range=10.90.0.0/24 --region=us-central1
gcloud compute firewall-rules create allow-icmp-mycluster-1 --network=mynetwork-1 --action=ALLOW --direction=INGRESS --rules=icmp
gcloud compute firewall-rules create allow-ssh-mycluster-1 --network=mynetwork-1 --action=ALLOW --direction=INGRESS --rules=tcp:22
gcloud compute firewall-rules create allow-service-nodeport-mycluster-1 --network=mynetwork-1 --action=ALLOW --direction=INGRESS --rules=tcp:30000-32767

# Create the cluster itself
gcloud container clusters create mycluster-1 --num-nodes=1 --machine-type=e2-medium --network=mynetwork-1 --subnetwork=mysubnet-1 --region=us-central1 --node-locations=us-central1-a,us-central1-b

# Create the SQL CLOUD service also on GCP
gcloud sql instances create mysql-1 --zone=us-west1-a --tier=db-n1-standard-1 --assign-ip --authorized-networks=0.0.0.0/0 --database-version=MYSQL_5_6 --root-password=$MYSQL_ROOT_PASSWORD

# Import the test table into the database instance
mysql -u root -h $IP_DB -p < data.sql 

# Use the "flask-simple-app" to build your image and upload to your registry

# Create the deployment
kubectl create -f deployment.yml

# Create the service to test the deployment
kubectl create -f service.yml
