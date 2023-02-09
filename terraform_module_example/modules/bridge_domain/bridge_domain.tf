resource "aci_bridge_domain" "bd" {
  name = var.bdi
  tenant_dn = var.tenant_output
  arp_flood = var.arp_flood
  relation_fv_rs_ctx    = var.vrf_output
}
output "bridge_output" {
    value = "${aci_bridge_domain.bd.id}"
    }
