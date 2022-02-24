resource "aws_security_group" "bastion" {
	name = "bastion"
	vpc_id = aws_default_vpc.default.id

	ingress {
		description = "Ingress from Anywhere"
		from_port = 0
		to_port = "22"
		protocol = "tcp"
		cidr_blocks = ["118.32.135.194/32"]
	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
}

data "aws_ami" "ubuntu" {
	most_recent = true
	filter {
	  	name = "name"
		values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"] 
	}
	owners = ["099720109477"] // Canonical
}

module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.4.0"

  name = "bastion"
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "donghyeong"
  monitoring = true
  subnet_id = aws_subnet.mypublic.id
  vpc_security_group_ids = [aws_security_group.bastion.id]
  associate_public_ip_address = true
}