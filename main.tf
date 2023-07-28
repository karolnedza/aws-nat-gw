resource "aws_eip" "example" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.example.id
  subnet_id     = "subnet-080bb524fac00a042"
  tags = {
    Name = "gw NAT"
  }
}
