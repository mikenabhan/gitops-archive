resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
    {
      master-dns      = proxmox_vm_qemu.k3s_master_pve[*].name,
      master-ip       = proxmox_vm_qemu.k3s_master_pve[*].default_ipv4_address,
      master-id       = proxmox_vm_qemu.k3s_master_pve[*].name,
      master-dns-pve2 = proxmox_vm_qemu.k3s_master_pve2[*].name,
      master-ip-pve2  = proxmox_vm_qemu.k3s_master_pve2[*].default_ipv4_address,
      master-id-pve2  = proxmox_vm_qemu.k3s_master_pve2[*].name,
      worker-dns      = proxmox_vm_qemu.k3s_worker_pve[*].name,
      worker-ip       = proxmox_vm_qemu.k3s_worker_pve[*].default_ipv4_address,
      worker-id       = proxmox_vm_qemu.k3s_worker_pve[*].name,
      worker-dns-pve2 = proxmox_vm_qemu.k3s_worker_pve2[*].name,
      worker-ip-pve2  = proxmox_vm_qemu.k3s_worker_pve2[*].default_ipv4_address,
      worker-id-pve2  = proxmox_vm_qemu.k3s_worker_pve2[*].name,
      etcd-dns        = proxmox_vm_qemu.k3s_etcd[*].name,
      etcd-ip         = proxmox_vm_qemu.k3s_etcd[*].default_ipv4_address,
      etcd-id         = proxmox_vm_qemu.k3s_etcd[*].name
      network-domain  = var.personal_domain
    }
  )
  filename = "./ansible/hosts.yml"
}

output "playbook_command" {
  value = "ansible-playbook -i ./ansible/hosts.yml ./ansible/ha_cluster.yml --ssh-common-args='-o StrictHostKeyChecking=no'"
}

output "get_kubeconfig" {
  value = "k3sup install --skip-install --host ${proxmox_vm_qemu.k3s_master_pve[0].name}.${var.personal_domain}  --user ansible --local-path ~/.kube/config"
  sensitive = false
}

