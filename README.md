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
---

# 🛠️ Tech Stack

| Category | Technologies |
|----------|--------------|
| Infrastructure as Code | Terraform |
| Cloud Provider | AWS |
| Container Orchestration | Amazon EKS |
| Networking | Amazon VPC |
| Identity & Access | AWS IAM |
| Compute | Amazon EC2 |
| CLI Tools | AWS CLI, kubectl |
| Version Control | Git & GitHub |

---

# ☁️ AWS Services Used

- Amazon VPC
- Amazon EKS
- Amazon EC2
- IAM
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- Elastic IP
- OIDC Provider

---

# ⚙️ Terraform Concepts Covered

- Terraform Modules
- Variables
- Outputs
- Locals
- Data Sources
- Terraform Workspaces
- Resource Dependencies
- for_each
- count
- Validation
- Dynamic Infrastructure
- Environment Specific Configuration

---

# 🚀 Deployment

### Clone Repository

```bash
git clone <repository-url>

cd terraform-aws-eks
```

### Initialize Terraform

```bash
terraform init
```

### Select Workspace

```bash
terraform workspace select development
```

or

```bash
terraform workspace select test
```

### Plan

```bash
terraform plan \
-var-file="terraform.tfvars" \
-var-file="environments/development.tfvars"
```

### Apply

```bash
terraform apply
```

### Configure kubectl

```bash
aws eks update-kubeconfig \
--region ap-south-1 \
--name <cluster-name>
```

### Verify Cluster

```bash
kubectl get nodes

kubectl get pods -A
```

---

# 📸 Project Screenshots

> Add the screenshots below.

- AWS EKS Cluster
- Managed Node Group
- EC2 Worker Node
- VPC Architecture
- Terraform Apply
- kubectl get nodes
- kubectl get pods -A
- VS Code Project Structure
