resource "aws_eks_node_group" "eks_nodes" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "eks-ng-${var.env}"
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = [
    var.private_1a_subnet_id,
    var.private_1b_subnet_id
  ]

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 1
  }

  instance_types = ["t3.medium"]
  ami_type       = "AL2_x86_64"

  tags = {
    Name = "eks-node-${var.env}"
    Env  = var.env
  }

  depends_on = [
    aws_iam_role_policy_attachment.node_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.node_AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.node_AmazonEKS_CNI_Policy
  ]

  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }
}