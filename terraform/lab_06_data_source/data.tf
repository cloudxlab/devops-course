# Find the latest available AMI that is tagged with Component = web

data "aws_ami" "web" {
  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "tag:Name"
    values = ["web"]
  }

  most_recent = true
  owners      = ["self"]
}
