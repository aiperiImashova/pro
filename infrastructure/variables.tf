variable "project_id" {
  description = "analog-gearing-434306-b0"
  type        = string
  # default = "--"
}

variable "region" {
  description = "Регион, в котором будет создан кластер"
  type        = string
  default     = "us-central1" 
}

variable "network_name" {
  description = "Имя VPC сети"
  type        = string
  default     = "aiko-network"
}

variable "subnet_name" {
  description = "Имя подсети"
  type        = string
  default     = "aiko-subnet"
}

variable "cluster_name" {
  description = "Имя GKE кластера"
  type        = string
  default     = "aiko-cluster"
}

variable "node_count" {
  description = "Количество нод в кластере"
  type        = number
  default     = 3
}

variable "node_machine_type" {
  description = "Тип машины для нод"
  type        = string
  default     = "e2-medium" 
}