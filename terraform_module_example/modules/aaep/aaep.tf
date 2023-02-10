### AAEP
resource "aci_attachable_access_entity_profile" "AAEP-INFRA" {
  description = "AAEP INFRA"
  name        = var.aaep
  relation_infra_rs_dom_p =       [var.phydm_output]
}

output "aaep_output" {
value = "${aci_attachable_access_entity_profile.AAEP-INFRA.id}"
}
