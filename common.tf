// Common Resource for demo


// Default Resource : it is not destroyed
resource "aws_default_vpc" "default" {

}

resource "aws_s3_bucket" "terraform-state-bucket" {
  bucket = "terraform-state-dghg"
}

resource "aws_subnet" "myprivate" {
  vpc_id = aws_default_vpc.default.id
  cidr_block = "172.31.112.0/24"
}

resource "aws_subnet" "mypublic" {
  vpc_id = aws_default_vpc.default.id
  cidr_block = "172.31.212.0/24"
}