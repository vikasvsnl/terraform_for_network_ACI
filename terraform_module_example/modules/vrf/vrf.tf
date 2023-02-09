resource "aci_vrf" "vrf" {
    tenant_dn             = var.tenant_output
    name                  = var.vrf
    }

output "vrf_output" {
    value = "${aci_vrf.vrf.id}"
    }
