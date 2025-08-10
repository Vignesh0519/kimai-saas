variable "region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name for tagging and naming resources"
  type        = string
}

variable "db_username" {
  description = "Database master username"
  type        = string
  default     = "kimaiadmin"
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "node_instance_type" {
  description = "EKS node instance type"
  type        = string
}

variable "node_desired_size" {
  description = "Desired number of EKS nodes"
  type        = number
  default     = 2
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}