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
  password = "C1sco12345"
  url      = "https://apic1.dcloud.cisco.com/"
  insecure = true
}

module "infra_tenant" {
  source = "../modules/cloudtenant"
  tenant = "test_tenant"
}

module "infra_vrf" {
  source = "../modules/vrf"
  vrf = "INFRA"
  tenant_output = module.infra_tenant.tenant_output
}

module "infra_bridge_domain500" {
  source = "../modules/bridge_domain"
  bdi = "BDI500"
  tenant_output = module.infra_tenant.tenant_output
  vrf_output = module.infra_vrf.vrf_output

}
module "infra_bridge_domain501" {
  source = "../modules/bridge_domain"
  count = 100
  bdi = "BDI${count,index}"
  tenant_output = module.infra_tenant.tenant_output
  vrf_output = module.infra_vrf.vrf_output

}
module "infra_epg" {
  source = "../modules/epg"
  epg = "epg1"
  bridge_output = module.infra_bridge_domain500.bridge_output
  application_output = module.infra_epg.application_output
  tenant_output = module.infra_tenant.tenant_output

}
