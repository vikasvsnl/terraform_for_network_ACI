

resource "aci_tenant" "tenant_test" {

  name = "tenant_test"

}



resource "aci_vrf" "test_vrfs" {

  for_each  = toset(local.vrfs)

  tenant_dn = aci_tenant.tenant_test.id

  name      = each.value

}



resource "aci_bridge_domain" "test_bds" {

  for_each           = {

    for bd in local.bds:

      bd.bd_name => bd

  }

  tenant_dn          = aci_tenant.tenant_test.id

  name               = each.value.bd_name

  relation_fv_rs_ctx = aci_vrf.test_vrfs[each.value.vrf_name].id

}
