resource "aci_leaf_profile" "LEAF_PROFILE" {
    name                         = var.leaf_profile_name
    relation_infra_rs_acc_port_p = var.ipr_output
}

resource "aci_leaf_selector" "Leaf_selector" {
    leaf_profile_dn         = aci_leaf_profile.LEAF_PROFILE.id
    name                    = var.leaf_name
    switch_association_type = "range"
}

resource "aci_node_block" "LEAF_BLOCK" {
    switch_association_dn = aci_leaf_selector.Leaf_selector.id
    name                  = var.leaf_block
    from_                 = var.leaf_number
    to_                   = var.leaf_number
}
