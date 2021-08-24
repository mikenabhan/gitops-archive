terraform {
  required_version = ">= 0.14"
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 2.0"
    }
  }
}

provider "proxmox" {
  pm_api_url      = var.proxmoxapiurl
  pm_user         = var.proxmoxuser
  pm_password     = var.pmpass
  pm_tls_insecure = true
}

provider "cloudflare" {
  api_token = var.cloudflare_token
}