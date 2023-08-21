# resource "aws_key_pair" "key" {
#   key_name   = "aws-key"
#   public_key = var.aws_pub_key
#   tags = {
#     key = "ec2"
#   }
# }

resource "aws_instance" "ec2_terraform" {
  ami                         = "ami-053b0d53c279acc90" # us-east-1
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = aws_subnet.snet-vpc.id
  vpc_security_group_ids      = [aws_security_group.security_group.id]
  associate_public_ip_address = true
  tags = {
    Name = "ec2_terraform"
  }

}