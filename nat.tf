# Create Elastic IP for NAT gateway
resource "aws_eip" "nat_eip" {
  vpc = true

  tags = {
    Name = "Nat Gateway IP"
  }
}

# Create an NAT gateway to give our private subnets to access to the outside world

resource "aws_nat_gateway" "default" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id     = "${element(aws_subnet.public.*.id, 0)}"

  tags = {
    Name = "${var.vpc_name}"
  }
}
