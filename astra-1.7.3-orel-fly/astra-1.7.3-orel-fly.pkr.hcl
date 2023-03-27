
source "virtualbox-iso" "astra" {
  boot_command = [
    "<esc><wait>",
    "<esc><wait>",
    "<enter><wait>",
    "/install.amd/vmlinuz ",
    "initrd=/install.amd/initrd.gz ",
    "/netinst/linux ",
    "auto=true ",
    "acpi=force ",
    "interface=eth0 ",
    "net.ifnames=0 ",
    "hostname=${var.name} ",
    "domain=${var.domain} ",
    "debconf/priority=critical ",
    "debian-installer/locale=ru_RU ",
    "debian-installer/keymap=ru ",
    "astra-license/license=true ",
    "preseed/url=${var.preseedurl} ",
    "<enter><wait>"
  ]
  boot_wait = "5s"
  #communicator            = "none"
  #disable_shutdown        = true
  shutdown_timeout     = "30m"
  shutdown_command     = "echo ${var.password} | sudo -S systemctl poweroff"
  ssh_username         = var.user
  ssh_password         = var.password
  ssh_port             = 22
  ssh_wait_timeout     = "240m"
  disk_size            = var.size
  guest_additions_mode = "disable"
  guest_os_type        = "Debian_64"
  headless             = false
  iso_checksum         = "md5:${var.md5sum}"
  iso_url              = var.mirror

  vboxmanage = [
    ["modifyvm", "{{ .Name }}", "--memory", "${var.memory}"],
    ["modifyvm", "{{ .Name }}", "--cpus", "${var.cpus}"]
  ]
  virtualbox_version_file = ""
  vm_name                 = "astra"
}

build {
  sources = ["source.virtualbox-iso.astra"]

  post-processor "vagrant" {
    compression_level = "6"
    include           = ["metadata.json"]
    output            = "..\\output\\astra-1.7.3-orel-fly-{{ .Provider }}-${var.version}.box"
  }
}
