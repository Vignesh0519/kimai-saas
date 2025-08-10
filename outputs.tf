output "eks_cluster_name" {
  value = aws_eks_cluster.cluster.name
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.cluster.endpoint
}

output "rds_endpoint" {
  value = aws_db_instance.kimai.endpoint
}

output "eks_cluster_role_arn" {
  value = aws_iam_role.eks_cluster_role.arn
}

output "eks_node_role_arn" {
  value = aws_iam_role.eks_node_role.arn
}

output "db_password_secret_name" {
  value       = aws_secretsmanager_secret.db_password.name
  description = "AWS Secrets Manager name for DB password"
}

