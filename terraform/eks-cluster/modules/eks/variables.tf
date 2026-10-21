# Cluster Name
variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

# Kubernetes Version
# Pinned so the node AMI type and the kubectl version in deploy.yml stay
# compatible; bump all three together.
variable "kubernetes_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.36"
}

# Subnets
variable "subnet_ids" {
  description = "Subnets for the EKS cluster and node groups"
  type        = list(string)
}

# Tags
variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

# Node Group Configuration
variable "node_group_min_size" {
  description = "Minimum size of the node group"
  type        = number
  default     = 1
}

variable "node_group_max_size" {
  description = "Maximum size of the node group"
  type        = number
  default     = 3
}

variable "node_group_desired_capacity" {
  description = "Desired size of the node group"
  type        = number
  default     = 2
}

variable "instance_types" {
  description = "EC2 instance types for the node group"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_group_disk_size" {
  description = "Disk size for the node group instances"
  type        = number
  default     = 20
}
