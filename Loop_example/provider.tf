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
  password = "C1s"
  url      = "https://apic1.dcloud.cisco.com/"
  insecure = true
}

