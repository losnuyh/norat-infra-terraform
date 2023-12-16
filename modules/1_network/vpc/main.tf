locals {
  name_prefix = "${var.project}-${var.env}"
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "${local.name_prefix}-vpc"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.name_prefix}-igw"
  }
}

resource "aws_subnet" "public" {
  for_each = {
    for subnet in var.public_subnets:
        subnet.cidr => subnet
  }
  vpc_id = aws_vpc.main.id
  cidr_block = each.value["cidr"]
  availability_zone = each.value["az"]
  map_public_ip_on_launch = false
  tags = {
    Name = "${local.name_prefix} public subnet ${index(var.public_subnets, each.value) + 1}"
  }
}

resource "aws_subnet" "private" {
  for_each = {
    for subnet in var.private_subnets:
        subnet.cidr => subnet
  }
  vpc_id = aws_vpc.main.id
  cidr_block = each.value["cidr"]
  availability_zone = each.value["az"]
  map_public_ip_on_launch = false
  tags = {
    Name = "${local.name_prefix} private subnet ${index(var.private_subnets, each.value) + 1}"
  }
}

resource "aws_eip" "nat_eip" {
  depends_on = [aws_internet_gateway.main]
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.public[var.public_subnets[0].cidr].id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.name_prefix} public rtb"
  }
}

resource "aws_route" "public_ig" {
  route_table_id = aws_route_table.public.id
  gateway_id = aws_internet_gateway.main.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "public" {
  for_each = {
    for subnet in var.public_subnets:
      subnet.cidr => subnet
  }
  route_table_id = aws_route_table.public.id
  subnet_id = aws_subnet.public[each.value.cidr].id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.name_prefix} private rtb"
  }
}

resource "aws_route_table_association" "private" {
  for_each = {
    for subnet in var.private_subnets:
        subnet.cidr => subnet
  }
  route_table_id = aws_route_table.private.id
  subnet_id = aws_subnet.private[each.value.cidr].id
}

resource "aws_route" "private_nat" {
  route_table_id = aws_route_table.private.id
  nat_gateway_id = aws_nat_gateway.main.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_network_acl" "public" {
  vpc_id = aws_vpc.main.id

  subnet_ids = [for subnet in aws_subnet.public : subnet.id]

  egress {
    protocol = -1
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }

  ingress {
    protocol = -1
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }

  tags = {
    Name = "${local.name_prefix}-public-nacl"
  }
}

resource "aws_network_acl" "private" {
  vpc_id = aws_vpc.main.id

  subnet_ids = [for subnet in aws_subnet.private : subnet.id]

  egress {
    protocol = -1
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }

  ingress {
    protocol = -1
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }

  tags = {
    Name = "${local.name_prefix}-private-nacl"
  }
}

####### default

resource "aws_default_route_table" "this" {
  default_route_table_id = aws_vpc.main.default_route_table_id

  tags = {
    Name = "${local.name_prefix} default rtb"
  }
}

resource "aws_default_network_acl" "this" {
  default_network_acl_id = aws_vpc.main.default_network_acl_id

  tags = {
    Name = "${local.name_prefix} default acl"
  }
}

resource "aws_default_security_group" "this" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.name_prefix} default sg"
  }
}