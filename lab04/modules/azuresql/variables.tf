variable "prefix" {
  type = string
}

variable "location" {
  type = string
}

variable "resourceGroupName" {
  type = string
}

variable "keyVaultId" {
  type = string
}

variable "subnetId" {
  type = string
}

variable "dnsZoneId" {
  type = string
}

variable "readScale" {
  type = bool
  default = false
}

variable "zoneRedundant" {
  type = bool
  default = false
}

variable "skuName" {
  type = string
  default = "S0"
}

variable "dbName" {
  type = string
}

variable "logWorkspaceId" {
  type = string
  default = "/subscriptions/e97932fb-27a0-4b77-9e88-816d9a93bc60/resourceGroups/rg-lab03/providers/Microsoft.OperationalInsights/workspaces/zejadozn1k0wzjbf"
}

variable "enableAudit" {
  type = bool
  default = false
}