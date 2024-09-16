variable "project_id" {
  description = "id"
  type        = string
  default = "reference-node-434715-i6"
}

variable "region" {
  description = "Регион, в котором будет создан кластер"
  type        = string
  default     = "europe-west1" 
}

variable "network_name" {
  description = "Имя VPC сети"
  type        = string
  default     = "network-aiperi"
}

variable "subnet_name" {
  description = "Имя подсети"
  type        = string
  default     = "subnet-aiperi"
}

variable "cluster_name" {
  description = "Имя GKE кластера"
  type        = string
  default     = "cluster-aiperi"
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