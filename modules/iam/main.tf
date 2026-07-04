####################################
# EKS Cluster Role
####################################

resource "aws_iam_role" "eks_cluster" {
  name = "${var.name}-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "eks.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-cluster-role"
    }
  )
}

####################################
# Cluster Policies
####################################

locals {
  cluster_policies = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  ]
}

resource "aws_iam_role_policy_attachment" "cluster" {
  for_each = toset(local.cluster_policies)

  role       = aws_iam_role.eks_cluster.name
  policy_arn = each.value
}

####################################
# Node Group Role
####################################

resource "aws_iam_role" "node_group" {
  name = "${var.name}-nodegroup-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-nodegroup-role"
    }
  )
}

####################################
# Node Group Policies
####################################

locals {
  node_policies = [
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  ]
}

resource "aws_iam_role_policy_attachment" "node" {
  for_each = toset(local.node_policies)

  role       = aws_iam_role.node_group.name
  policy_arn = each.value
}
