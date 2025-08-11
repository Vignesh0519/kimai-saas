# Kimai SaaS Deployment – DevOps Candidate Assignment

## Overview
This repository contains the Infrastructure-as-Code, Helm charts, and CI/CD pipeline required to deploy [Kimai](https://www.kimai.org/) as a **multi-tenant SaaS application** in a cloud production-ready environment.

The solution is built for **high availability, scalability, observability, and compliance**, allowing deployment in **any AWS region** while avoiding hardcoded secrets.

---


### Components:
1. **AWS VPC** – Isolated networking with public/private subnets.
2. **EKS (Elastic Kubernetes Service)** – Runs Kimai containers across multiple Availability Zones.
3. **RDS (MySQL)** – Persistent database for timesheet data.
4. **S3 Bucket** – Stores uploaded files and backups.
5. **Route53 + ACM** – DNS & SSL for secure HTTPS access.
6. **NGINX Ingress** – Manages traffic routing into the cluster.
7. **Prometheus & Grafana** – Observability stack for metrics and dashboards.
8. **GitHub Actions CI/CD** – Automates provisioning and deployment.
9. **Helm Charts** – Kubernetes manifests for Kimai.

---

## 📦 Repository Structure
