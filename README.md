# DevOps Pipeline Assignment

## Project Overview

This project demonstrates a **basic DevOps pipeline** for deploying a Python Flask application using modern DevOps tools.

The objective is to simulate how an organization with **no DevOps practices** can implement a simple CI/CD pipeline to automate application build, testing, containerization, and deployment.

The application is deployed on **AWS EC2** using **Docker**, and the infrastructure is provisioned using **Terraform**.

---
## Tools & Technologies Used
| Tool | Purpose |
|-----|--------|
| Jenkins | CI/CD pipeline automation |
| Docker | Containerization |
| Terraform | Infrastructure as Code |
| AWS | Cloud Infrastructure |
| Python / Flask | Sample Web Application |
---

## Project Architecture
```
GitHub Repository
        │
        ▼
     Jenkins Pipeline
        │
        ├── Install Dependencies
        ├── Lint
        ├── Run Tests
        ├── Build Docker Image
        └── Deploy Container
               │
               ▼
          Docker Container
               │
               ▼
             AWS EC2
```
Infrastructure is created using **Terraform**, which provisions:
- VPC
- Subnet
- Security Group
- EC2 Instance
- S3 Bucket
---
## Project Structure
```
DevOps-Assignment
│
├── app
│   └── app.py
│
├── tests
│   └── test_app.py
│
├── Dockerfile
├── Jenkinsfile
├── requirements.txt
│
├── terraform
│   ├── provider.tf
│   ├── variables.tf
│   ├── main.tf
│   ├── dev.tfvars
│   └── outputs.tf
│
└── README.md
```
---
## CI/CD Pipeline (Jenkins)
The Jenkins pipeline automates the following steps:

1. Install dependencies
2. Run lint checks
3. Execute unit tests
4. Build Docker image
5. Deploy Docker container to EC2
Pipeline Stages:
```
Install Dependencies
Lint
Test
Build Docker Image
Run Container
```
---

## Docker Setup

The application is containerized using Docker.

### Build Docker Image

```bash
docker build -t devops-app .
```
### Run Docker Container

```bash
docker run -p 5000:5000 devops-app
```
Application will be available at:
```
http://localhost:5000
```
---
## Infrastructure Provisioning (Terraform)
Terraform is used to provision AWS infrastructure.
### Resources Created

- VPC
- Subnet
- Security Group
- EC2 Instance
- S3 Bucket

### Initialize Terraform

```bash
terraform init
```
### Plan Infrastructure

```bash
terraform plan -var-file="dev.tfvars"
```
### Apply Infrastructure

```bash
terraform apply -var-file="dev.tfvars"
```
---
## Application Deployment

After the Jenkins pipeline runs successfully, the application will be available using the **EC2 Public IP**.

Example:
```
http://<EC2-PUBLIC-IP>:5000
```
Example Output:
```
DevOps Pipeline Working!
```
---
## Conclusion

This project demonstrates a **basic DevOps pipeline implementation** using:

- CI/CD automation (Jenkins)
- Containerization (Docker)
- Infrastructure as Code (Terraform)
- Cloud deployment (AWS EC2)

It shows how DevOps practices can automate application deployment and infrastructure management efficiently.

---
