# -----------Public Routable Module-----------
resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id

}
}

# -----------Associate Public Route Table with Public Subnets-----------
resource "aws_route_table_association" "public_route_table_association" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = element(var.public_subnet_ids[*], count.index)
  route_table_id = aws_route_table.public_route_table.id
}

#-----------Private Routable Module-----------
resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.nat_gateway_id
  }
}

#-----------Associate Private Route Table with Private Subnets-----------
resource "aws_route_table_association" "private_route_table_association" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = element(var.private_subnet_ids[*], count.index)
  route_table_id = aws_route_table.private_route_table.id
}

#-----------Full Private Routable Module-----------
resource "aws_route_table" "private_full_route_table" {
  vpc_id = var.vpc_id
}

#-----------Associate Full Private Route Table with Full Private Subnets-----------
resource "aws_route_table_association" "private_full_route_table_association" {
  count          = length(var.full_private_subnet_cidrs)
  subnet_id      = element(var.full_private_subnet_ids[*], count.index)
  route_table_id = aws_route_table.private_full_route_table.id
}