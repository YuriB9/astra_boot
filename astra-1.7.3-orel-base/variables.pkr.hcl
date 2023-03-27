
variable "version" {
  type    = string
  default = "1.0.0"
}

variable "mirror" {
  type    = string
  default = "C:\\iso\\astra-1.7.3-03.11.2022_15.53.iso"
}

variable "cpus" {
  type    = string
  default = "2"
}

variable "domain" {
  type    = string
  default = "undefined"
}

variable "md5sum" {
  type    = string
  default = "7bb8d6ee6716af47739c6a2940a14c56"
}

variable "memory" {
  type    = string
  default = "2048"
}

variable "name" {
  type    = string
  default = "astra"
}

variable "password" {
  type    = string
  default = "vagrant"
}

variable "size" {
  type    = string
  default = "30000"
}

variable "user" {
  type    = string
  default = "vagrant"
}

variable "preseedurl" {
  type = string
}
