// Common Resource for demo


// Default Resource : it is not destroyed
resource "aws_default_vpc" "default" {

}

resource "aws_s3_bucket" "terraform-state-bucket" {
  bucket = "terraform-state-dghg"
}