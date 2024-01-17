# output "sqlNames" {
#   value = values(module.sql)[*].name
# }

# output "databases" {
#   value = yamlencode(local.databases)
# }

output "vmNames" {
  value = values(module.vm)[*].name
}

# output "vms" {
#   value = yamlencode(local.vms)
# }