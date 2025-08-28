output "cluster_id" {
  description = "EKS cluster ID"
  value       = aws_eks_cluster.discord_security.id
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = aws_eks_cluster.discord_security.endpoint
}

output "db_endpoint" {
  description = "RDS cluster endpoint"
  value       = aws_rds_cluster.discord_security_db.endpoint
}