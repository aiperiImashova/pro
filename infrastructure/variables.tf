variable "project_id" {
  description = "id"
  type        = string
  default = "analog-gearing-434306-b0"
}

variable "region" {
  description = "Регион, в котором будет создан кластер"
  type        = string
  default     = "us-west2" 
}

variable "network_name" {
  description = "Имя VPC сети"
  type        = string
  default     = "network-2"
}

variable "subnet_name" {
  description = "Имя подсети"
  type        = string
  default     = "subnet-2"
}

variable "cluster_name" {
  description = "Имя GKE кластера"
  type        = string
  default     = "cluster-2"
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