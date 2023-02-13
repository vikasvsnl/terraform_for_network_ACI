# Provider block

terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
      version = "2.6.0"
    }
  }
}

provider "aci" {
  username = "admin"
  password = "C1"
  url      = "https://apic.cisco.com/"
  insecure = true
}

module "infra_vlan_pool" {
  source = "../modules/vlan_pool"
  phydm_output = module.phydomain.phydm_output
}

module "phydomain" {
  source = "../modules/phydomain"
  vlan_output = module.infra_vlan_pool.vlan_output
}

module "aaep" {
  source = "../modules/aaep"
  phydm_output = module.phydomain.phydm_output

}
module "interface_policy_group" {
  source = "../modules/interface_policy_group"
  aaep_output = module.aaep.aaep_output

}
module "interface_profile" {
  source = "../modules/interface_profile"
  ipg_output = module.interface_policy_group.ipg_output

}
  
module "Leaf_profile" {
  source = "../modules/Leaf_profile"
  ipr_output = module.interface_profile.ipr_output
  leaf_profile_name = "L101_PROFILE"
  leaf_block = "101"
  leaf_name = "L101"
  leaf_number = "101"
}

