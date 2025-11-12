variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the instance"
  type        = string
}

variable "key_name" {
  description = "Key pair name to connect via SSH"
  type        = string
}

variable "env" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}
