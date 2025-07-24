variable "fevm_name" {
  type = string
}
variable "fevm_rg_name" {
  type = string
}
variable "fevm_location" {
  type = string
}
variable "fevm_size" {
  type = string
}
variable "fevm_username" {
  type = string
}
variable "fevm_password" {
  type = string
}
variable "fevm_caching" {
  type = string
}
variable "fevm_storage_account_type" {
  type = string
}
variable "fevm_publisher" {
  type = string
}
variable "fevm_offer" {
  type = string
}
variable "fevm_sku" {
  type = string
}
variable "fevm_version" {
  type = string
}
variable "network_interface_id" {
    type = list(string)
}