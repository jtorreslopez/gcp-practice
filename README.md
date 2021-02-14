Each case has:
-> setup.sh to create all the GCP resources
-> destroy.sh to delete all the resources created
-> gcp-caseX.pdf which shows a simple diagram of the configuration.

Case 1: Consist of allowing comunication between two VPC networks using VPC Peering service. To test the configuration I used some compute instances in those networks to verify the conectivity using a simple ping.

Case 2: This is a simple use case where I created an instance with 2 disks, one for the boot disk and the other for data 

Case 3: This is a simple External HTTP Load Balancer use case where I created a instance-template to configure basic Apache web server and then use that template to setup 3 instances in a subnet. Finally I configured a external Load Balancer to access the backend services from anywhere in the world.

Case 4: I tried to show the use of the TAGS when you create firewall-rules.  Consist of 2 instances on diferent zones configured with a HTTP and HTTPS servers , these instances were tagged depending what web protocol they are using. Finally I created simple firewall-rules using this tags in order to access the correct service.

Case 5: Consist of a network with 2 subnets in diferent regions. Each subnet has their own configured Cloud Nat service, since the instances does not have External IP addresses they need the Cloud Nat service to get Internet access (for updates for example). Depending of the Cloud Nat mapping subnets, some instances has Internet access while others no.

Case 6: This use case it's a example "hello world" web page hosted on backend services, this services are accesible from an internal client in the same network via an internal load balancer.

Case 7: The same as Case 6 but the instances (backend services) has not have external IP addresses because they dont need to be accesible from INTERNET (since the client are in the same network), thus improve the security. But these instances need Internet connection in order to get packages from repositories (start up script use apt to install apache) so I configured a Cloud NAT service only for the backend services to get Internet access. 
