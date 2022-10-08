resource "aws_instance" "ubuntu-instance" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = "ubuntu-key"
  security_groups = ["${aws_security_group.Ubuntu_security_group.name}"]

  tags  = {
    Name  = "Ubuntu-EC2"
  }
}