# Creating application profile
resource "aci_application_profile" "ap_web_server" {
  tenant_dn  = var.tenant_output
  name       = var.app_epg
  description = "from terraform"
}

resource "aci_application_epg" "epg" {
    application_profile_dn  = var.application_output
    name                              = var.epg
    relation_fv_rs_bd      = var.bridge_output
}

output "application_output" {
    value = "${aci_application_profile.ap_web_server.id}"
    }

resource "aci_epg_to_domain" "ap_epg_phy_domain" {
  application_epg_dn    = aci_application_epg.epg.id
  tdn                   = var.phydm_output

  }
