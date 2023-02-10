# creating vlan pool
resource "aci_vlan_pool" "INFRA" {
  name  = var.vlan_pool
  description = "From Terraform"
  alloc_mode  = "static"
}

resource "aci_ranges" "range_1" {
  vlan_pool_dn  = aci_vlan_pool.INFRA.id
  description   = "From Terraform"
  from          = "vlan-100"
  to            = "vlan-200"
  alloc_mode    = "inherit"
  role          = "external"
}

output "vlan_output" {
    value = "${aci_vlan_pool.INFRA.id}"
    }
