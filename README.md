# 🚀 Production-Ready AWS EKS Infrastructure using Terraform

A production-style Infrastructure as Code (IaC) project that provisions a complete Amazon EKS environment using Terraform with a modular architecture.

This project creates a highly organized AWS infrastructure including VPC networking, IAM roles, Amazon EKS Cluster, Managed Node Groups, OIDC Provider, and EKS Add-ons.

---

## 📌 Project Highlights

- Modular Terraform Architecture
- Multi-Environment Support (Development & Test)
- Terraform Workspaces
- Custom VPC
- Public & Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- IAM Roles
- Amazon EKS Cluster
- Managed Node Group
- OIDC Provider
- EKS Add-ons
- Outputs
- Environment Specific Variables

---

## 🏗️ Architecture

```

*(We'll insert the architecture diagram here tomorrow.)*

```
GitHub
    │
    ▼
Terraform
    │
    ▼
AWS
    │
    ├── VPC
    │     ├── Public Subnets
    │     ├── Private Subnets
    │     ├── Internet Gateway
    │     ├── NAT Gateway
    │     └── Route Tables
    │
    ├── IAM
    │     ├── Cluster Role
    │     └── Node Role
    │
    └── Amazon EKS
          ├── Cluster
          ├── Managed Node Group
          ├── OIDC Provider
          └── Add-ons
```

---

## 📂 Project Structure

```text
terraform-aws-eks/
│
├── environments/
│   ├── development.tfvars
│   └── test.tfvars
│
├── modules/
│   ├── vpc/
│   ├── iam/
│   ├── eks/
│   └── addons/
│
├── provider.tf
├── versions.tf
├── backend.tf
├── locals.tf
├── main.tf
├── outputs.tf
├── terraform.tfvars
└── README.md
```
