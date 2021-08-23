resource "cloudflare_record" "gitops_master_pve" {
  zone_id = var.personal_zone_id
  name    = proxmox_vm_qemu.gitops_master_pve[count.index].name
  value   = proxmox_vm_qemu.gitops_master_pve[count.index].default_ipv4_address
  type    = "A"
  ttl     = 60
  proxied = false
  count   = length(proxmox_vm_qemu.gitops_master_pve)
}

resource "cloudflare_record" "gitops_master_pve2" {
  zone_id = var.personal_zone_id
  name    = proxmox_vm_qemu.gitops_master_pve2[count.index].name
  value   = proxmox_vm_qemu.gitops_master_pve2[count.index].default_ipv4_address
  type    = "A"
  ttl     = 60
  proxied = false
  count   = length(proxmox_vm_qemu.gitops_master_pve2)
}