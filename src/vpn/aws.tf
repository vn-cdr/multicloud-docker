data "aws_vpc" "main" {
  id = var.aws_vpc_id
}

resource "aws_vpn_gateway" "main" {
  vpc_id = data.aws_vpc.main.id

  tags = {
    Name = "vpn-gateway"
  }
}

resource "aws_vpn_gateway_route_propagation" "main" {
  count = length(var.aws_route_table_ids)

  route_table_id = var.aws_route_table_ids[count.index]
  vpn_gateway_id = aws_vpn_gateway.main.id
}

