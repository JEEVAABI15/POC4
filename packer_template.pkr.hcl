# packer_template.pkr.hcl
packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
    ansible = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

source "amazon-ebs" "my_ami" {
  region        = "us-east-1"      # Change to your desired region
  source_ami   = "ami-085f9c64a9b75eed5"    # Replace with your base AMI
  instance_type = "t2.micro"
  ssh_username   = "ubuntu"
  ami_name       = "custom-ami-vite-{{timestamp}}"
}

build {
  sources = ["source.amazon.my_ami"]

  provisioner "ansible" {
    playbook_file = "./install_dependencies.yml"  # Path to your Ansible playbook
  }
}

