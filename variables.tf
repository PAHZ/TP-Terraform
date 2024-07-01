variable "app_instance_count" {
  description = "Number of application instances"
  type        = number
  default     = 2
}

variable "db_instance_count" {
  description = "Number of database instances"
  type        = number
  default     = 1
}

variable "web_instance_count" {
  description = "Number of web server instances"
  type        = number
  default     = 2
}

variable "create_db_instances" {
  description = "Whether to create database instances"
  type        = bool
  default     = true
}

variable "machine_type" {
  description = "Machine type for instances"
  type        = string
  default     = "e2-micro"
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "europe-west1-b"
}
