resource "aws_s3_bucket" "bucket" {
  bucket = "my-bucket-fersgfsergversv"
}


resource "aws_s3_bucket_lifecycle_configuration" "bucket-config" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    id = "log"

    expiration {
      days = 90
    }

    filter {
      and {
        prefix = "log/"

        tags = {
          rule      = "log"
          autoclean = "true"
        }
      }
    }

    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }
  }
}


# resource "aws_eip" "example" {
#   domain   = "vpc"
# }
# 
# resource "aws_nat_gateway" "example" {
#   allocation_id = aws_eip.example.id
#   subnet_id     = "subnet-080bb524fac00a042"
#   tags = {
#     Name = "gw NAT"
#   }
# }
