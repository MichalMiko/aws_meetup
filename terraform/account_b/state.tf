data "terraform_remote_state" "account_a" {

  backend = "local"



  config = {

    path = "../account_a/terraform.tfstate"

  }

}