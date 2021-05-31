terraform {
  required_providers {
    //vra = "0.3.1"
    vra = {
      source = "terraform-providers/vra"
    }
  }
}



provider "vra" {
	url = var.vra_url
	refresh_token=var.vra_refresh_token
	insecure=true

}

# Define data resource for an existing cloud zone
data "vra_zone" "this" {
   name = var.cloud_zone
}

# Create new project
resource "vra_project" "this" {
   name = "AK_Terraform"
   description = "Configured by terraform"
   administrators = ["knighta@vmware.com"]
    
   zone_assignments {
      zone_id = data.vra_zone.this.id
   }
}