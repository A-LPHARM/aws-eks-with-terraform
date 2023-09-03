variable "region" {
  description = "Default region for my s3 bucket"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  default = "henry-v3-pi"
}
