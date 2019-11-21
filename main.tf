provider "aws" {
  access_key = "${var.scalr_aws_access_key}"
  secret_key = "${var.scalr_aws_secret_key}"
  region     = "us-east-1"
}

resource "aws_instance" "scalr" {
  ami                    = "ami-2757f631"
  instance_type          = "t2.small"
  subnet_id              = "subnet-0ebb1058ad727cfdb"
  vpc_security_group_ids = ["sg-0880cfdc546b123ba"]
  key_name               = "ryan"
}

terraform {
  backend "remote" {
    hostname = "my.scalr.com:443"
    organization = "org-sgncvo4mr5l4na0"
    workspaces {
      name = "vcs_cost_demo"
    }
  }
}
