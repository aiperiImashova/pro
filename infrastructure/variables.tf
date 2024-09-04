variable "project_id" {
  description = "id"
  type        = string
  default = "analog-gearing-434306-b0"
}

variable "region" {
  description = "Регион, в котором будет создан кластер"
  type        = string
  default     = "us-central1" 
}

variable "network_name" {
  description = "Имя VPC сети"
  type        = string
  default     = "i-network"
}

variable "subnet_name" {
  description = "Имя подсети"
  type        = string
  default     = "i-subnet"
}

variable "cluster_name" {
  description = "Имя GKE кластера"
  type        = string
  default     = "i-cluster"
}

variable "node_count" {
  description = "Количество нод в кластере"
  type        = number
  default     = 2
}

variable "node_machine_type" {
  description = "Тип машины для нод"
  type        = string
  default     = "e2-medium" 
}