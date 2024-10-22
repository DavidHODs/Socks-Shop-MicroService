# Description

This is a microservices based architecture project deployed on kubernetes in which two different web applications are deployed on the same AWS EKS cluster

- A personal resume web application
- The [Socks Shop](https://microservices-demo.github.io/) example microservice application

## Technologies

- Backend - Golang
- Frontend - HTML and CSS
- Database - PostgreSQL
- IAC - Terraform
- Containerization - Docker
- Container Ochestration - Kubernetes
- Monitoring - Promethues
- Logging - Loki
- Metrics Visualization - Grafana
- CI/CD - Jenkins
- Hosting - AWS
- Source Code Management - Git
- DNS - NameCheap

## Project Links

[Resume](resume.davidoluwatobi.me) is a simple golang web application hooked up to a postgres database. With Resume, you can check my professional experience, skillset, qualifications. WIth resume, you can also reach out to me for internships, full time roles and gigs. You can also comment advices can encouragemet.

[Socks Shop](socks-shop.davidoluwatobi.me) is the user-facing part of an online shop that sells socks. It is intended to aid the demonstration and testing of microservice and cloud native technologies.

With [Metrics](metrics.davidoluwatobi.me) metrics and logged events for resume and socks shop can be visualized. User details; username - admin, password - password.

## Infrastructure Setup (Architecture Reproducibilty)

cd into the terraform folder and run the following commands;

- terraform init
- terraform plan
- terraform apply

An eks cluster with the needed supporting infrastructure resources will be created. Details needed for kube configuration are also outputted.

Run aws eks update-kubeconfig --name <cluster_name> --region <region>

Confirm the kubectl running on your local machine is now connected to the created aws eks by running; kubectl cluster-info

## Resume Deployment

cd into the kubernets folder and run the following commands;

- <kubectl apply -f namespace.yml> to create a new namespace
- <kubectl apply -f db.yml> to set up the database
- <kubectl apply -f app.yml> to set up the application.

## Socks Shop Deployment

cd into the kubernets folder and run <kubectl apply -f complete-demo.yml>

## Prometheus Deployment

cd into the prometheus folder and run the following commands;

- <kubectl apply -f namespace.yml> to create a new namespace
- <kubectl apply -f configMap.yml> to create the needed configurations details
- <kubectl apply -f deployment.yml> to a prometheus kubernetes deployment
- <kubectl apply -f service.yml> to create a kubernetes prometheus service

## Grafana Deployment

cd into the grafana folder and run the following commands;

- <kubectl apply -f configMap.yml> to create the needed configurations details
- <kubectl apply -f deployment.yml> to a kubernetes grafana deployment
- <kubectl apply -f service.yml> to create a kubernetes grafana service

## Loki Deployment

cd into the loki folder and run the following commands;

- <kubectl apply -f namespace.yml> to create a new namespace
- <helm upgrade --install --values loki-distributed-overrides.yaml loki grafana/loki-distributed -n loki> to install loki
- <helm upgrade --install --values promtail-overrides.yaml promtail grafana/promtail -n loki> to install promtail

## Load Balancing with Ingress

- create 4 domain names or 4 subdomain names for resume, socks shop, prometheus and grafana services
- cd into the ingress folder, replace the host with the created appropriate domain names for each file
- Run kubectl apply -f <.yml file> for all the .yml files in the ingress folder

## CI/CD with Jenkins

- spin up the local instance of your jenkins or cd into the jenkins folder and <docker compose -f docker-compose.yml up>
- Install docker pipeline plugin
- Install kubernetes plugin using the advanced plugin section of jenkins - upload kuberntes-cd.hpi that can be found in the jenkins folder
- Create a username/password login credential for login - set the ID to be dockerhublogin
- Create a kubernetes credential, copy the content of your .kube/config into the content section and set the ID to be kubernetes
- Create a pipeline job and copy the content of jenkinsfile that can be found in the jenkins folder
- Build the created job
  