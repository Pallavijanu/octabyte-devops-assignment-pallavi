terraform {
  backend "s3" {
    bucket = "octabyte-terraform-state" # replace with your bucket
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}
