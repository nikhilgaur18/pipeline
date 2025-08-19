provider "aws" {
region = "us-east-1"
}

resource "aws_security_group" "my_server1" {
name = "myserver-sg"
description = "tcp port config"
ingress {
description = "all incoming traffic"
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
egress {
description = "outbound traffic"
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
}

resource "aws_instance" "pipline-ec2" {
ami = "ami-020cba7c55df1f615"
instance_type = "t3.medium"
vpc_security_group_ids = [aws_security_group.my_server1.id]
key_name = "key"
}

output "ec2_public_ip" {
value = aws_instance.pipline-ec2.public_ip
}
