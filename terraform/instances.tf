resource "proxmox_vm_qemu" "gitops_master_pve" {
  count        = var.master_count_pve
  name         = "gitops-master${count.index}"
  target_node  = "pve"
  clone        = "ubuntu-20.04-cloudimg"
  preprovision = true
  # os_type = "cloud-init"
  ciuser     = "ansible"
  cipassword = var.random_pass
  ipconfig0  = "ip=dhcp"
  cores      = 2
  memory     = 4096
  balloon    = 4096
  agent      = 1
  sshkeys    = <<EOF
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDfb2uPmXarXXrYmyVn/UNaKLXUS9OkfYsvHeJ9AUoEBM7IMbmTWRQxycsDtZQnfc3+orhHNN/tLXdcR0YMw8CzKH4yob6qcJybzTcdyTcbn11nWHiEpEcYoTqRMSmmM/1aF40Drk+HzBSIDfsxn2W7H2VZdqddyavrrvbyivbirxkkNfit3Gu1bucv88Zm5AX35Bg4f0s777H++xIoJQXxz+HmEF12LODBCqDWgOYrBtZAluyHZCwsMGTogG5a42KWNhVqKyeVAK16wTTQCKCIqSWIb54P2OzP3XR2e6pkYe1wTNiGZunooldgrSuRlNYJqQ3o2oMdjQ807AGJ5c1ljNPkk7KcN8uDLNjzKN5y2qbfbAZcRHYF/7EDKwP4Fkf8qLBMLkjQYHAjHW/sVgU2OPKHk8So05tu5IgTaL1xZGG3OB4DjgLeZJWuV+zIet31dgXUQDfJRHFsmIE7K4YdS7fmXc1SRB0ahPLB0LiHllxI+eTxiKEmAjgy+ljJFG8= ansible@ansible
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCqyHYr9g1sOmikoJ+lUc34CHThqJQHG4ubN/ifDLE2dlyNhugzfcP6exFPwSozBKfIY9VIqXqIg2VWByyXQQGtBKZhYtkf4UprsFxEcOMND5ohjGLp8FspFg8MXf/vbHxK70aKrFhoocLgiVIB8IvqXQq3JwORQRAZeRBpjUOyYr7tVx9sMrJWpdNxalD2/HY3Sfg3w5Q1zfO0y0W4XHmfw7fqXJjKOSU+COYzUqp425wbTOdLWS4TWoUMlaYHv5POU6TjZuthCorLreWmKPFTqbhKwWXKmazQaX2p1HSlKWagl7/LU1Zi+mobpTWr25PtksFarhddhwGX+3okQwd1hqBVRcvPmDu4hLjuK3b39UPDWtj3Wbd/Qs2QTwFN/asfiprbuLUH5o5vYWcdfmq5hrA6Fdk6iqWnZm6+RVUklSt4oDj8gEp8WbzYFChlU0x8IXvlBBWYhE+TIxZtt9YdmFRooDBFH3ugN8yWGZN5TK9JACSRe5jLqxOCPQj7+RM= mike@mike-laptop
    EOF
  disk {
    type    = "scsi"
    storage = "nvme"
    size    = "128G"
  }
  network {
    bridge   = "vmbr0"
    firewall = "false"
    model    = "virtio"
  }
}

resource "proxmox_vm_qemu" "gitops_master_pve2" {
  count        = var.master_count_pve2
  name         = "gitops-master${length(proxmox_vm_qemu.gitops_master_pve) + count.index}"
  target_node  = "pve2"
  clone        = "ubuntu-template"
  preprovision = true
  # os_type = "cloud-init"
  ciuser     = "ansible"
  cipassword = var.random_pass
  ipconfig0  = "ip=dhcp"
  cores      = 4
  memory     = 4096
  balloon    = 4096
  agent      = 1
  sshkeys    = <<EOF
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDfb2uPmXarXXrYmyVn/UNaKLXUS9OkfYsvHeJ9AUoEBM7IMbmTWRQxycsDtZQnfc3+orhHNN/tLXdcR0YMw8CzKH4yob6qcJybzTcdyTcbn11nWHiEpEcYoTqRMSmmM/1aF40Drk+HzBSIDfsxn2W7H2VZdqddyavrrvbyivbirxkkNfit3Gu1bucv88Zm5AX35Bg4f0s777H++xIoJQXxz+HmEF12LODBCqDWgOYrBtZAluyHZCwsMGTogG5a42KWNhVqKyeVAK16wTTQCKCIqSWIb54P2OzP3XR2e6pkYe1wTNiGZunooldgrSuRlNYJqQ3o2oMdjQ807AGJ5c1ljNPkk7KcN8uDLNjzKN5y2qbfbAZcRHYF/7EDKwP4Fkf8qLBMLkjQYHAjHW/sVgU2OPKHk8So05tu5IgTaL1xZGG3OB4DjgLeZJWuV+zIet31dgXUQDfJRHFsmIE7K4YdS7fmXc1SRB0ahPLB0LiHllxI+eTxiKEmAjgy+ljJFG8= ansible@ansible
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCqyHYr9g1sOmikoJ+lUc34CHThqJQHG4ubN/ifDLE2dlyNhugzfcP6exFPwSozBKfIY9VIqXqIg2VWByyXQQGtBKZhYtkf4UprsFxEcOMND5ohjGLp8FspFg8MXf/vbHxK70aKrFhoocLgiVIB8IvqXQq3JwORQRAZeRBpjUOyYr7tVx9sMrJWpdNxalD2/HY3Sfg3w5Q1zfO0y0W4XHmfw7fqXJjKOSU+COYzUqp425wbTOdLWS4TWoUMlaYHv5POU6TjZuthCorLreWmKPFTqbhKwWXKmazQaX2p1HSlKWagl7/LU1Zi+mobpTWr25PtksFarhddhwGX+3okQwd1hqBVRcvPmDu4hLjuK3b39UPDWtj3Wbd/Qs2QTwFN/asfiprbuLUH5o5vYWcdfmq5hrA6Fdk6iqWnZm6+RVUklSt4oDj8gEp8WbzYFChlU0x8IXvlBBWYhE+TIxZtt9YdmFRooDBFH3ugN8yWGZN5TK9JACSRe5jLqxOCPQj7+RM= mike@mike-laptop
    EOF
  disk {
    type    = "scsi"
    storage = "nvme"
    size    = "128G"
  }
  network {
    bridge   = "vmbr0"
    firewall = "false"
    model    = "virtio"
  }
}

resource "proxmox_vm_qemu" "gitops_worker_pve" {
  count        = var.worker_count_pve
  name         = "gitops-worker${count.index}"
  target_node  = "pve"
  clone        = "ubuntu-20.04-cloudimg"
  preprovision = true
  # os_type = "cloud-init"
  ciuser     = "ansible"
  cipassword = var.random_pass
  ipconfig0  = "ip=dhcp"
  cores      = 2
  memory     = 2048
  balloon    = 1024
  agent      = 1
  sshkeys    = <<EOF
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDfb2uPmXarXXrYmyVn/UNaKLXUS9OkfYsvHeJ9AUoEBM7IMbmTWRQxycsDtZQnfc3+orhHNN/tLXdcR0YMw8CzKH4yob6qcJybzTcdyTcbn11nWHiEpEcYoTqRMSmmM/1aF40Drk+HzBSIDfsxn2W7H2VZdqddyavrrvbyivbirxkkNfit3Gu1bucv88Zm5AX35Bg4f0s777H++xIoJQXxz+HmEF12LODBCqDWgOYrBtZAluyHZCwsMGTogG5a42KWNhVqKyeVAK16wTTQCKCIqSWIb54P2OzP3XR2e6pkYe1wTNiGZunooldgrSuRlNYJqQ3o2oMdjQ807AGJ5c1ljNPkk7KcN8uDLNjzKN5y2qbfbAZcRHYF/7EDKwP4Fkf8qLBMLkjQYHAjHW/sVgU2OPKHk8So05tu5IgTaL1xZGG3OB4DjgLeZJWuV+zIet31dgXUQDfJRHFsmIE7K4YdS7fmXc1SRB0ahPLB0LiHllxI+eTxiKEmAjgy+ljJFG8= ansible@ansible
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCqyHYr9g1sOmikoJ+lUc34CHThqJQHG4ubN/ifDLE2dlyNhugzfcP6exFPwSozBKfIY9VIqXqIg2VWByyXQQGtBKZhYtkf4UprsFxEcOMND5ohjGLp8FspFg8MXf/vbHxK70aKrFhoocLgiVIB8IvqXQq3JwORQRAZeRBpjUOyYr7tVx9sMrJWpdNxalD2/HY3Sfg3w5Q1zfO0y0W4XHmfw7fqXJjKOSU+COYzUqp425wbTOdLWS4TWoUMlaYHv5POU6TjZuthCorLreWmKPFTqbhKwWXKmazQaX2p1HSlKWagl7/LU1Zi+mobpTWr25PtksFarhddhwGX+3okQwd1hqBVRcvPmDu4hLjuK3b39UPDWtj3Wbd/Qs2QTwFN/asfiprbuLUH5o5vYWcdfmq5hrA6Fdk6iqWnZm6+RVUklSt4oDj8gEp8WbzYFChlU0x8IXvlBBWYhE+TIxZtt9YdmFRooDBFH3ugN8yWGZN5TK9JACSRe5jLqxOCPQj7+RM= mike@mike-laptop
    EOF

  disk {
    type    = "scsi"
    storage = "nvme"
    size    = "128G"
  }
  network {
    bridge   = "vmbr0"
    firewall = "false"
    model    = "virtio"
  }
}

resource "proxmox_vm_qemu" "gitops_worker_pve2" {
  count        = var.worker_count_pve2
  name         = "gitops-worker${length(proxmox_vm_qemu.gitops_worker_pve) + count.index}"
  target_node  = "pve2"
  clone        = "ubuntu-template"
  preprovision = true
  ciuser       = "ansible"
  cipassword   = var.random_pass
  ipconfig0    = "ip=dhcp"
  cores        = 2
  memory       = 4096
  balloon      = 2048
  agent        = 1
  sshkeys      = <<EOF
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDfb2uPmXarXXrYmyVn/UNaKLXUS9OkfYsvHeJ9AUoEBM7IMbmTWRQxycsDtZQnfc3+orhHNN/tLXdcR0YMw8CzKH4yob6qcJybzTcdyTcbn11nWHiEpEcYoTqRMSmmM/1aF40Drk+HzBSIDfsxn2W7H2VZdqddyavrrvbyivbirxkkNfit3Gu1bucv88Zm5AX35Bg4f0s777H++xIoJQXxz+HmEF12LODBCqDWgOYrBtZAluyHZCwsMGTogG5a42KWNhVqKyeVAK16wTTQCKCIqSWIb54P2OzP3XR2e6pkYe1wTNiGZunooldgrSuRlNYJqQ3o2oMdjQ807AGJ5c1ljNPkk7KcN8uDLNjzKN5y2qbfbAZcRHYF/7EDKwP4Fkf8qLBMLkjQYHAjHW/sVgU2OPKHk8So05tu5IgTaL1xZGG3OB4DjgLeZJWuV+zIet31dgXUQDfJRHFsmIE7K4YdS7fmXc1SRB0ahPLB0LiHllxI+eTxiKEmAjgy+ljJFG8= ansible@ansible
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCqyHYr9g1sOmikoJ+lUc34CHThqJQHG4ubN/ifDLE2dlyNhugzfcP6exFPwSozBKfIY9VIqXqIg2VWByyXQQGtBKZhYtkf4UprsFxEcOMND5ohjGLp8FspFg8MXf/vbHxK70aKrFhoocLgiVIB8IvqXQq3JwORQRAZeRBpjUOyYr7tVx9sMrJWpdNxalD2/HY3Sfg3w5Q1zfO0y0W4XHmfw7fqXJjKOSU+COYzUqp425wbTOdLWS4TWoUMlaYHv5POU6TjZuthCorLreWmKPFTqbhKwWXKmazQaX2p1HSlKWagl7/LU1Zi+mobpTWr25PtksFarhddhwGX+3okQwd1hqBVRcvPmDu4hLjuK3b39UPDWtj3Wbd/Qs2QTwFN/asfiprbuLUH5o5vYWcdfmq5hrA6Fdk6iqWnZm6+RVUklSt4oDj8gEp8WbzYFChlU0x8IXvlBBWYhE+TIxZtt9YdmFRooDBFH3ugN8yWGZN5TK9JACSRe5jLqxOCPQj7+RM= mike@mike-laptop
    EOF

  disk {
    type    = "scsi"
    storage = "nvme"
    size    = "128G"
  }
  network {
    bridge   = "vmbr0"
    firewall = "false"
    model    = "virtio"
  }
}