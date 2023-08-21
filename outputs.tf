output "subnet_id" {
  value = aws_subnet.snet-vpc.id
}

output "vpc_arn" {
  value = aws_vpc.vpc.arn
}

output "security_group_id" {
  value = aws_security_group.security_group.id
}

output "ec2_ip" {
  value = aws_instance.ec2_terraform.public_ip
}

output "vnet" {
  value = azurerm_virtual_network.vnet.id

}

output "resource-group" {
  value = azurerm_resource_group.rg-udemy.name
}

output "vm-ip" {
  value = azurerm_linux_virtual_machine.vm.public_ip_address
}