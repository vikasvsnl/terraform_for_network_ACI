variable "bridge_domains" {
    type = map
    default = {
        BDI500 = {
            name = "BDI500"
            arp_flood = "no"
            ip = "192.168.1.1/24"
        },
        BDI501 = {
            name = "BDI501"
            arp_flood = "no"
            ip = "193.168.1.1/24"
    }
} 
}

variable "epgs" {
  type = map
  default = {
      epg_web = {
          name = "web",
          bd   = "BDI500"

      },
      epg_app = {
          name = "app",
          bd   = "BDI501"
      }
  }
}


  
