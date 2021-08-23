variable "master_count_pve" {
  type      = string
  sensitive = false
  default   = 2
}

variable "master_count_pve2" {
  type      = string
  sensitive = false
  default   = 1
}

variable "worker_count_pve" {
  type      = string
  sensitive = false
  default   = 0
}

variable "worker_count_pve2" {
  type      = string
  sensitive = false
  default   = 0
}