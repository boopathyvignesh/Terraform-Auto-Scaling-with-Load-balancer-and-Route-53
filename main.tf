# Create a new load balancer
resource "aws_elb" "terraform-elb" {
  name               = "terra-elb"
  subnets = aws_subnet.public.*.id
  security_groups = [aws_security_group.webservers.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:80/index.html"
    interval            = 30
  }

  instances                   = [aws_instance.webservers[0].id, aws_instance.webservers[1].id]
  cross_zone_load_balancing   = true
  idle_timeout                = 100
  connection_draining         = true
  connection_draining_timeout = 300

  tags = {
    Name = "terraform-elb"
  }
}

output "elb-dns-name" {
  value = aws_elb.terraform-elb.dns_name
}