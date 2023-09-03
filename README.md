# aws-eks-with-terraform

Building and Managing Your AWS EKS Cluster
Initializing and Deploying with Terraform

Initialize Terraform:
terraform init

Validate the Configuration:
terraform validate

Plan the Deployment:
terraform plan

Apply the Configuration:
terraform apply

You can also specify a different cluster name:

For development:
terraform apply -var="cluster_name=dev"

For staging:
terraform apply -var="cluster_name=staging"

For production:
terraform apply -var="cluster_name=production"

Configuring Kubernetes

Update Kubeconfig:
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
or
aws eks --region us-east-1 update-kubeconfig --name eks-henry-v3-pi

==============================================================================================================================

Building Your AWS EKS Cluster
To build your AWS EKS cluster, follow these steps:

Install the EKSCTL Plugin (Windows PowerShell Admin):
choco install -y eksctl

Create Your Cluster:
eksctl create cluster --name=svc-eks-app --node-type=t2.medium --nodes=3 --region=us-east-1 --zones=us-east-1a,us-east-1b,us-east-1d --node-ami-family=AmazonLinux2

Managing Pods and Metrics
You can build and monitor your pods with the following commands:

Build Pods:

Example YAML for metrics server:
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
Check Metrics Server Deployment:
kubectl get deployment metrics-server -n kube-system

Kubernetes Dashboard:
Deploy the Kubernetes Dashboard:
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

Deleting Your Cluster
To delete the AWS EKS cluster that was built, use the following command:
eksctl delete cluster --name svc-eks-app --region us-east-1

This guide will help you set up, manage, and delete your AWS EKS cluster efficiently.
