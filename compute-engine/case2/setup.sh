#!/bin/bash

gcloud compute instances create instance1 --image-family=centos-7 --image-project=centos-cloud --zone=us-central1-a --machine-type=f1-micro --hostname=instance1.example.com --create-disk=name=instance1-boot-disk,mode=rw,image-family=centos-7,image-project=centos-cloud,size=30GB,type=pd-ssd,boot=yes --create-disk=name=instance1-disk1,mode=rw,size=20GB
