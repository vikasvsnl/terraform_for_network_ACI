resource "aci_leaf_access_port_policy_group" "IPG-INFRA" {
    name                            = var.ipg_infra
    relation_infra_rs_att_ent_p     = var.aaep_output
}
output "ipg_output" {
    value = "${aci_leaf_access_port_policy_group.IPG-INFRA.id}"
    }
