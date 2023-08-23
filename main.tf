
resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = var.instance_size
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  #db_subnet_group_name = resource.aws_db_subnet_group.default.name
  skip_final_snapshot  = true
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
