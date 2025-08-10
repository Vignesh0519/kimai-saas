# provider "kubernetes" {
#   host                   = aws_eks_cluster.cluster.endpoint
#   cluster_ca_certificate = base64decode(aws_eks_cluster.cluster.certificate_authority[0].data)
#   token                  = data.aws_eks_cluster_auth.cluster.token
# }

# data "aws_eks_cluster_auth" "cluster" {
#   name = aws_eks_cluster.cluster.name
# }

# data "aws_secretsmanager_secret" "db_password" {
#   name = "k8s-secret-db-password"
# }

# data "aws_secretsmanager_secret_version" "db_password_version" {
#   secret_id = data.aws_secretsmanager_secret.db_password.id
# }

# resource "kubernetes_namespace" "kimai" {
#   metadata {
#     name = "kimai"
#   }
# }

# resource "kubernetes_secret" "kimai_db" {
#   metadata {
#     name      = "kimai-db-secret"
#     namespace = kubernetes_namespace.kimai.metadata[0].name
#   }
#   data = {
#     DATABASE_PASSWORD = jsondecode(data.aws_secretsmanager_secret_version.db_password_version.secret_string)["password"]
#   }
# }
