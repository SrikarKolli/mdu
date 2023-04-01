variable "azure_client_id" {
  type = string
}

variable "azure_client_secret" {
  type = string
}

variable "azure_subscription_id" {
  type = string
}

variable "azure_tenant_id" {
  type = string
}

variable "root_id" {
  type    = string
  default = "SanOrg"
}

variable "root_name" {
  type    = string
  default = "Sandbox Organization"
}