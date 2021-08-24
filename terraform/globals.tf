variable "pmpass" {
  type      = string
  sensitive = true
}

variable "razersshpub" {
  type      = string
  sensitive = true
}

variable "proxmoxapiurl" {
  type      = string
  sensitive = true
}

variable "proxmoxuser" {
  type      = string
  sensitive = true
}

variable "cloudflare_token" {
  type      = string
  sensitive = true
}

variable "random_pass" {
  type      = string
  sensitive = true
}

variable "contact_email" {
  type      = string
  sensitive = true
}

variable "personal_zone_id" {
  type      = string
  sensitive = true
}

variable "personal_domain" {
  type      = string
  sensitive = false
}