resource "local_file" "AnsibleInventory" {
  content = templatefile("./ansible/inventory.tmpl",
    {
      master-dns      = proxmox_vm_qemu.gitops_master_pve[*].name,
      master-ip       = proxmox_vm_qemu.gitops_master_pve[*].default_ipv4_address,
      master-id       = proxmox_vm_qemu.gitops_master_pve[*].name,
      master-dns-pve2 = proxmox_vm_qemu.gitops_master_pve2[*].name,
      master-ip-pve2  = proxmox_vm_qemu.gitops_master_pve2[*].default_ipv4_address,
      master-id-pve2  = proxmox_vm_qemu.gitops_master_pve2[*].name,
      network-domain  = var.personal_domain
    }
  )
  filename = "./ansible/hosts.yml"
}

output "playbook_command" {
  value = "ansible-playbook -i ./ansible/hosts.yml ./ansible/ha_cluster.yml --ssh-common-args='-o StrictHostKeyChecking=no'"
}

output "get_kubeconfig" {
  value     = "k3sup install --skip-install --host ${proxmox_vm_qemu.gitops_master_pve[0].name}.${var.personal_domain}  --user ansible --local-path ~/.kube/config"
  sensitive = false
}

