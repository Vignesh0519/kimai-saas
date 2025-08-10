resource "aws_eks_cluster" "cluster" {
  name     = "${var.project_name}-eks"
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = "1.30"

  vpc_config {
    subnet_ids         = [aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id]
    security_group_ids = [aws_security_group.eks_nodes.id]
  }

  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy,
    aws_iam_role_policy_attachment.eks_service_policy
  ]
}

resource "aws_eks_node_group" "kimai_eks_nodes" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "kimai-nodes"
  node_role_arn   = aws_iam_role.eks_node_role.arn

  subnet_ids = [
    aws_subnet.private_subnet1.id,
    aws_subnet.private_subnet2.id
  ]
  instance_types = ["t3.medium"]

  scaling_config {
    desired_size = var.node_desired_size
    max_size     = 3
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.node_worker,
    aws_iam_role_policy_attachment.node_cni,
    aws_iam_role_policy_attachment.node_ecr
  ]
}
