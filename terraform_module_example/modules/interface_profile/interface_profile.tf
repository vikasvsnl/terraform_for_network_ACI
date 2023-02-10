resource "aci_leaf_interface_profile" "IPR-L101" {
    name                            = var.ipr
}

## Creating interface or port selector
resource "aci_access_port_selector" "PORT1" {
    leaf_interface_profile_dn      = aci_leaf_interface_profile.IPR-L101.id
    name                           = "PORT1"
    access_port_selector_type      = "range"
    relation_infra_rs_acc_base_grp = var.ipg_output
}

resource "aci_access_port_block" "port_block" {
    access_port_selector_dn = aci_access_port_selector.PORT1.id
    name                    = "port_block"
    from_card               = "1"
    from_port               = "1"
    to_card                 = "1"
    to_port                 = "1"
}


output "ipr_output" {
    value = "${aci_leaf_interface_profile.IPR-L101.id}"
    }
