terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "ExamPro"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
  #cloud {
  #  organization = "ExamPro"
  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}

}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  #bucket_name = var.bucket_name
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
}

resource "terratowns_home" "home" {
  name = "Super Mario Odyssey"
  description = <<DESCRIPTION
In the game, Mario explores various kingdoms and collects Power Moons hidden inside them,
used as a fuel source to power an airship known as the Odyssey to travel to new locations.
Cappy's main function is the "capture" ability, 
letting Mario possess enemies and other objects, helping him solve puzzles and progress in the game.
After completing the main story mode, other post-game kingdoms are unlockable as well as an additional minigame,
"Luigi's Balloon World". The game supports multiplayer and virtual reality with a Nintendo Labo virtual reality kit.
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  #domain_name = "6fdq6gz.cloudfront.net"
  town = "missingo"
  content_version = 1
}