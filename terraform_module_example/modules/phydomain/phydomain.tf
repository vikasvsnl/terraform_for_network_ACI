
### Physical domain
resource "aci_physical_domain" "PHYDOM-INFRA" {
  name        = var.phydm
  relation_infra_rs_vlan_ns = var.vlan_output
}

output "phydm_output" {
    value = "${aci_physical_domain.PHYDOM-INFRA.id}"
    }
