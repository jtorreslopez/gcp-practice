#!/bin/bash

# Create the VPC and subnets
# ''''''''''''''''''''''''''
gcloud compute networks create network-1 --subnet-mode=custom
gcloud compute networks subnets create network-1-subnet-backends --region=us-west1 --network=network-1 --range=10.20.0.0/29
gcloud compute networks subnets create network-1-subnet-clients --region=us-west1 --network=network-1 --range=10.30.0.0/24
gcloud compute networks subnets create network-1-subnet-proxy-only --region=us-west1 --purpose=INTERNAL_HTTPS_LOAD_BALANCER --role=ACTIVE --network=network-1 --range=10.50.0.0/26
gcloud compute firewall-rules create network-1-allow-ssh-icmp --network=network-1 --direction=INGRESS --action=ALLOW --rules=tcp:22,icmp
gcloud compute firewall-rules create network-1-allow-http --network=network-1 --direction=INGRESS --action=ALLOW --rules=tcp:80

# Create the Instance-Templates for the backends machines
# '''''''''''''''''''''''''''''''''''''''''''''''''''''''
gcloud compute instance-templates create backend-1-template --machine-type=f1-micro --boot-disk-size=20GB --network=network-1 --subnet=network-1-subnet-backends --metadata-from-file=startup-script=./install_apache_backend1.sh --region=us-west1
gcloud compute instance-templates create backend-2-template --machine-type=f1-micro --boot-disk-size=20GB --network=network-1 --subnet=network-1-subnet-backends --metadata-from-file=startup-script=./install_apache_backend2.sh --region=us-west1

# Create the managed Instance-Groups
# ''''''''''''''''''''''''''''''''''
gcloud compute instance-groups managed create backend-1-group --zone=us-west1-b --template=backend-1-template --base-instance-name=backend-1 --size=2
gcloud compute instance-groups managed create backend-2-group --zone=us-west1-b --template=backend-2-template --base-instance-name=backend-2 --size=2

# Create the backends services, frontends and load balancer
# '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
gcloud compute health-checks create http basic-html-check --port 80
gcloud compute backend-services create backend-service-1 --load-balancing-scheme="INTERNAL_MANAGED" --protocol=HTTP --port-name=http --health-checks=basic-html-check --region=us-west1
gcloud compute backend-services add-backend backend-service-1 --instance-group=backend-1-group --instance-group-zone=us-west1-b --region=us-west1
gcloud compute backend-services create backend-service-2 --load-balancing-scheme=INTERNAL_MANAGED --protocol=HTTP --port-name=http --health-checks=basic-html-check --region=us-west1
gcloud compute backend-services add-backend backend-service-2 --instance-group=backend-2-group --instance-group-zone=us-west1-b --region=us-west1
gcloud compute url-maps create lb-internal-1 --default-service=backend-service-1 --region=us-west1
gcloud compute url-maps add-path-matcher lb-internal-1 --path-matcher-name=backend-services-rule --default-service=backend-service-1 --backend-service-path-rules='/backend2/*=backend-service-2' --region=us-west1
gcloud compute target-http-proxies create internal-proxy --url-map=lb-internal-1 --region=us-west1
gcloud compute forwarding-rules create internal-frontend --load-balancing-scheme=INTERNAL_MANAGED --target-http-proxy=internal-proxy --target-http-proxy-region=us-west1 --network=network-1 --subnet=network-1-subnet-clients --ports=80 --address=10.30.0.50
 
# Create the instance to test the load balancer
# '''''''''''''''''''''''''''''''''''''''''''''
gcloud compute instances create client --zone=us-west1-b --machine-type=f1-micro --boot-disk-size=20GB --network=network-1 --subnet=network-1-subnet-clients
