resource "aci_tenant" "tenant" {
    name                  = var.tenant
    }

output "tenant_output" {
    value = "${aci_tenant.tenant.id}"
    }
