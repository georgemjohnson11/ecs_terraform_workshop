output "alb_dns" {
  value = aws_lb.test-lb.dns_name
}

output "eugenelab_dns" {
  value = aws_lb.eugenelab-lb.dns_name
}

output "fpselection_dns" {
  value = aws_lb.fpselection-lb.dns_name
}

output "parchmint_dns" {
  value = aws_lb.parchmint-lb.dns_name
}

output "minieugene_dns" {
  value = aws_lb.minieugene-lb.dns_name
}

output "cellov1_dns" {
  value = aws_lb.cellov1-lb.dns_name
}

output "cellov2_dns" {
  value = aws_lb.cellov2-lb.dns_name
}

output "clothov4_dns" {
  value = aws_lb.clothov4-lb.dns_name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "igw_id" {
  value = module.vpc.igw_id
}