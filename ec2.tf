resource "aws_instance" "jen-server" {
  ami                    = "ami-05d62b9bc5a6ca605"
  instance_type          = "t3.micro"
  key_name               = "r-key"
  vpc_security_group_ids = ["sg-0a7ae78370632c262"]
  user_data              = <<-EOF
    #!/bin/bash
    sudo -i
    yum install httpd -y
    systemctl start httpd 
    systemctl enable httpd 
    echo "welcome to terraform" > /var/www/html/index.html
    EOF

  tags = {
    Name = "webserver"
  }
}

