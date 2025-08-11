# Kimai SaaS Deployment – DevOps Candidate Assignment

## Overview
This repository contains the Infrastructure-as-Code, Helm charts, and CI/CD pipeline required to deploy [Kimai](https://www.kimai.org/) as a **multi-tenant SaaS application**

The solution is built for **high availability, scalability, observability, and compliance**, allowing deployment in **any AWS region** while avoiding hardcoded secrets.

---


### Components:
1. **AWS VPC** – Isolated networking with public/private subnets.
2. **EKS (Elastic Kubernetes Service)** – Runs Kimai containers across multiple Availability Zones.
3. **RDS (MySQL)** – Persistent database for timesheet data.
4. **S3 Bucket** – Stores uploaded files and backups.
6. **NGINX Ingress** – Manages traffic routing into the cluster.
7. **Prometheus & Grafana** – Observability stack for metrics and dashboards.
8. **GitHub Actions CI/CD** – Automates provisioning and deployment.
9. **Helm Charts** – Kubernetes manifests for Kimai.

---

## 📦 Repository Structure
terraform/ # Infrastructure as Code (VPC, EKS, RDS, S3, Route53, ACM)
helm/kimai/ # Helm chart for Kimai deployment
.github/workflows/ # CI/CD pipeline (Terraform + Helm)
docs/ # Architecture diagram, request flow, cost breakdown
README.md # This file

---

## 🛠 Deployment Guide

### 1. Prerequisites
- AWS account with permissions for EKS, RDS, S3, ACM, Route53.
- A registered domain in Route53.
- GitHub repository with Actions enabled.
- Terraform 1.5+, Helm 3.11+, kubectl 1.27+ (only if deploying locally).

### 2. Set GitHub Secrets
Go to **Settings → Secrets → Actions** and add:

| Secret Name              | Description                       |
|--------------------------|-----------------------------------|
| `AWS_ACCESS_KEY_ID`      | AWS IAM user key                  |
| `AWS_SECRET_ACCESS_KEY`  | AWS IAM user secret               |
| `DB_USERNAME`            | Database username                 |
| `DB_PASSWORD`            | Database password                 |

### 3. Trigger Deployment
Push to the `main` branch or manually trigger the pipeline:

```bash
git add .
git commit -m "Initial Kimai SaaS deployment"
git push origin main
```

The pipeline will, Provision AWS infrastructure (VPC, EKS, RDS, S3, Route53, ACM SSL).

### 4. Deploy Kimai via Helm into the EKS cluster.

Output the public HTTPS URL.

### 5. Access the Application
Once deployment completes, access:

```bash
https://kimai.<domain-name>
```
Default admin credentials are set via Helm values (change after first login).

### 6. 🔍 Observability

Metrics: Prometheus scrapes Kubernetes & Kimai metrics.

Dashboards: Grafana accessible via port-forward:

```bash
kubectl port-forward svc/grafana 3000:3000 -n monitoring
```
## Logs: Retrieved via:
```bash
kubectl logs -l app=kimai
```

### 7. 💰 Cost Breakdown (AWS Free Tier + Low-Traffic Estimate)

Service	Monthly Cost	Notes
EKS	$74	Managed control plane + 2 t3.medium nodes
RDS MySQL	$15	db.t3.micro (multi-AZ optional)
S3	~$1	Storage + requests
ACM	Free	SSL certificates
CloudWatch	~$3	Logs + metrics
Total: ~$93/month (low traffic)		

