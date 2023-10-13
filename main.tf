terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  # backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "ExamPro"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  # }
  cloud {
   organization = "Demo-Test321"
   workspaces {
     name = "terra-house-1"
   }
  }

}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "home_supermario_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.supermario.public_path
  content_version = var.supermario.content_version
  
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
  domain_name = module.home_supermario_hosting.domain_name
  town = "missingo"
  content_version = var.supermario.content_version
}

module "home_pizza_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.pizza.public_path
  content_version = var.pizza.content_version
}

resource "terratowns_home" "home_pizza_hosting" {
  name = "Making you own pizza at home"
  description = <<DESCRIPTION
Make perfect pizza at home with this classic homemade pizza recipe, including a pizza dough recipe, 
topping suggestions, and step-by-step instructions with photos.
DESCRIPTION
  domain_name = module.home_pizza_hosting.domain_name
  town = "missingo"
  content_version = var.pizza.content_version
}