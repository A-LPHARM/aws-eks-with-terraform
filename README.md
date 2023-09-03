# aws-eks-with-terraform

Building and Managing Your AWS EKS Cluster
Initializing and Deploying with Terraform
Initialize Terraform:

shell
Copy code
terraform init
Validate the Configuration:

shell
Copy code
terraform validate
Plan the Deployment:

shell
Copy code
terraform plan
Apply the Configuration:

shell
Copy code
terraform apply
You can also specify a different cluster name:

For development:

shell
Copy code
terraform apply -var="cluster_name=dev"
For staging:

shell
Copy code
terraform apply -var="cluster_name=staging"
For production:

shell
Copy code
terraform apply -var="cluster_name=production"
Configuring Kubernetes
Update Kubeconfig:

shell
Copy code
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
Example:

shell
Copy code
aws eks --region us-east-1 update-kubeconfig --name eks-henry-v3-pi
Building Your EKS Cluster
To build your EKS cluster, follow these steps:

Install the EKSCTL Plugin (Windows PowerShell Admin):

shell
Copy code
choco install -y eksctl
Create Your Cluster:

shell
Copy code
eksctl create cluster --name=svc-eks-app --node-type=t2.medium --nodes=3 --region=us-east-1 --zones=us-east-1a,us-east-1b,us-east-1d --node-ami-family=AmazonLinux2
Managing Pods and Metrics
You can build and monitor your pods with the following commands:

Build Pods:

Example YAML for metrics server:

shell
Copy code
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
Check Metrics Server Deployment:

shell
Copy code
kubectl get deployment metrics-server -n kube-system
Kubernetes Dashboard:

Deploy the Kubernetes Dashboard:

shell
Copy code
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
Deleting Your Cluster
To delete the AWS EKS cluster that was built, use the following command:

shell
Copy code
eksctl delete cluster --name svc-eks-app --region us-east-1
This guide will help you set up, manage, and delete your AWS EKS cluster efficiently.
