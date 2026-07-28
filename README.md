# 🚀 SpotSure Business Assignment – End-to-End AWS DevOps Deployment

A production-ready Dockerized web application deployed on AWS using **GitHub Actions CI/CD**, **Docker**, **Application Load Balancer (ALB)**, **Auto Scaling Group (ASG)**, and a **custom domain**.

---

# 🌐 Live Demo

| Endpoint | URL |
|----------|-----|
| **Custom Domain** | https://gajendra.online |
| **AWS Load Balancer DNS** | http://spotsure-alb-1360286395.ap-south-1.elb.amazonaws.com |

> **Note:** The custom domain (`gajendra.online`) is currently mapped to this project. If it is used for another project in the future, you can still access this deployment using the AWS Application Load Balancer DNS shown above.

---

# 📌 About the Assignment

This project was completed as part of the **SpotSure Business DevOps Assignment**.

The objective was to deploy a Dockerized web application on AWS by implementing a complete production-style DevOps workflow.

The assignment involved:

- Containerizing the application using Docker
- Deploying the application on AWS EC2
- Automating deployments with GitHub Actions
- Configuring an Elastic IP
- Creating an Amazon Machine Image (AMI)
- Creating a Launch Template
- Configuring an Auto Scaling Group
- Configuring an Application Load Balancer
- Mapping a custom domain
- Creating a production-ready deployment

---

# 🎯 Assignment Objectives

The primary goals of this assignment were:

- Deploy a Dockerized application
- Automate deployments using CI/CD
- Reduce manual deployment effort
- Implement Load Balancing
- Configure Auto Scaling
- Improve High Availability
- Configure a custom domain
- Simulate a real production deployment

---

# 🏗️ Solution Architecture

```text
                        Internet
                             │
                             ▼
                 https://gajendra.online
                             │
                             ▼
                  DNS (A/CNAME Record)
                             │
                             ▼
        spotsure-alb-1360286395.ap-south-1.elb.amazonaws.com
                             │
                             ▼
             AWS Application Load Balancer
                             │
          ┌──────────────────┴──────────────────┐
          ▼                                     ▼
  EC2 Instance (Replica-1)              EC2 Instance (Replica-2)
  Docker + Nginx + FastAPI              Docker + Nginx + FastAPI
          ▲                                     ▲
          └──────────────────┬──────────────────┘
                             │
                    Auto Scaling Group
                 (Min:2 | Desired:2 | Max:4)
                             │
                     Launch Template
                             │
                             ▼
                       Amazon Machine Image
                             ▲
                             │
                Original EC2 Instance (t3.micro)
          Docker + Git + GitHub Actions Deployment
                             ▲
                             │
                    GitHub Actions Workflow
                             ▲
                             │
                     GitHub Repository
```

---

# 🚀 Project Workflow

```text
Developer

↓

git add .

↓

git commit

↓

git push

↓

GitHub Repository

↓

GitHub Actions

↓

SSH using Elastic IP

↓

EC2 (Ubuntu t3.micro)

↓

git pull

↓

docker compose down

↓

docker compose up -d --build

↓

Application Running

↓

Create AMI

↓

Launch Template

↓

Auto Scaling Group

↓

Application Load Balancer

↓

gajendra.online
```

---

# 🛠️ Technologies Used

| Category | Technology |
|-----------|------------|
| Cloud | AWS EC2 |
| Containerization | Docker |
| Container Orchestration | Docker Compose |
| Backend | FastAPI |
| Reverse Proxy | Nginx |
| CI/CD | GitHub Actions |
| Version Control | Git & GitHub |
| OS | Ubuntu Linux |
| Load Balancer | AWS Application Load Balancer |
| Auto Scaling | AWS Auto Scaling Group |
| Image | Amazon Machine Image (AMI) |
| DNS | Custom Domain |

---

# ☁️ AWS Services Used

- Amazon EC2
- Elastic IP
- Amazon Machine Image (AMI)
- Launch Template
- Application Load Balancer
- Target Group
- Auto Scaling Group
- Security Groups

---

# ⚙️ CI/CD Pipeline

Every push to the **main** branch automatically deploys the latest version.

```text
Developer

↓

Git Push

↓

GitHub Repository

↓

GitHub Actions

↓

SSH into EC2 using Elastic IP

↓

git pull

↓

docker compose down

↓

docker compose up -d --build

↓

Application Updated
```

---

# 🌍 Domain Configuration

The application is available through both a custom domain and the AWS Load Balancer.

| Endpoint | Purpose |
|----------|---------|
| https://gajendra.online | Public production URL |
| http://spotsure-alb-1360286395.ap-south-1.elb.amazonaws.com | Direct AWS Load Balancer endpoint |

### DNS Flow

```text
Browser
   │
   ▼
gajendra.online
   │
   ▼
DNS Record
   │
   ▼
AWS Application Load Balancer
(spotsure-alb-1360286395.ap-south-1.elb.amazonaws.com)
   │
   ▼
Auto Scaling Group
   │
┌──┴──┐
▼     ▼
EC2   EC2
```

---

# 🚀 Auto Scaling Configuration

| Setting | Value |
|----------|-------|
| Minimum Capacity | 2 |
| Desired Capacity | 2 |
| Maximum Capacity | 4 |
| Scaling Policy | Target Tracking |
| Target CPU Utilization | 70% |

---

# 🚀 Features

- Dockerized Application
- FastAPI Backend
- Nginx Reverse Proxy
- GitHub Actions CI/CD
- Automated Deployment
- Elastic IP Configuration
- Amazon Machine Image
- Launch Template
- Auto Scaling Group
- Application Load Balancer
- Custom Domain
- High Availability
- Production Ready Infrastructure

---

# ⚠️ Challenges Faced During the Assignment

## 1. Docker Permission Issue

### Problem

While starting Docker containers, Docker returned a permission denied error.

```bash
permission denied while trying to connect to the Docker daemon socket
```

### Solution

- Added the Ubuntu user to the Docker group.
- Restarted the session.
- Verified Docker installation.
- Successfully started the containers.

---

## 2. GitHub Actions SSH Authentication

### Problem

GitHub Actions failed with SSH authentication errors.

Issues included:

- Invalid SSH key
- Missing GitHub Secrets
- Authentication failure

### Solution

- Added the EC2 private key to GitHub Secrets.
- Configured:
  - EC2_HOST
  - EC2_USERNAME
  - EC2_SSH_KEY
- Updated the workflow.

Deployment became fully automated.

---

## 3. Incorrect EC2 Host

### Problem

Initially, the **Private IP** of the EC2 instance was configured in GitHub Actions.

GitHub runners cannot access private IP addresses.

### Solution

Replaced the private IP with the **Elastic IP**.

The deployment pipeline started working successfully.

---

## 4. Docker Deployment

### Problem

The application was not updating after code changes.

### Solution

The deployment workflow was updated to:

```bash
git pull
docker compose down
docker compose up -d --build
```

This ensured that every push rebuilt and redeployed the application.

---

## 5. High Availability

### Problem

Running the application on a single EC2 instance created a single point of failure.

### Solution

Implemented:

- AMI
- Launch Template
- Auto Scaling Group
- Application Load Balancer

The infrastructure can now automatically launch new EC2 instances and distribute traffic across healthy instances.

---

## 6. Custom Domain Configuration

### Problem

Users had to access the application using the AWS Load Balancer DNS.

### Solution

Configured the custom domain:

**https://gajendra.online**

to point to the AWS Application Load Balancer.

---

# 📂 Project Structure

```text
.
├── backend/
├── frontend/
├── nginx/
├── docker-compose.yml
├── Dockerfile
├── requirements.txt
├── .github/
│   └── workflows/
│       └── deploy.yml
└── README.md
```

---

# 🚀 Local Setup

Clone the repository

```bash
git clone https://github.com/<your-github-username>/<repository-name>.git
```

Navigate into the project

```bash
cd <repository-name>
```

Run the application

```bash
docker compose up --build
```

Open:

```
http://localhost
```

---

# 📚 Key Learnings

This assignment provided practical experience with:

- Docker
- Docker Compose
- GitHub Actions
- Linux Administration
- SSH Authentication
- AWS EC2
- Elastic IP
- AMI
- Launch Templates
- Auto Scaling Groups
- Application Load Balancer
- DNS Configuration
- Production Deployment
- CI/CD Automation

---

# ✅ Assignment Outcome

Successfully implemented:

- ✅ Dockerized Application
- ✅ AWS EC2 Deployment
- ✅ GitHub Actions CI/CD
- ✅ Elastic IP Configuration
- ✅ FastAPI + Nginx
- ✅ Docker Compose
- ✅ Amazon Machine Image (AMI)
- ✅ Launch Template
- ✅ Auto Scaling Group
- ✅ Application Load Balancer
- ✅ Custom Domain
- ✅ High Availability
- ✅ Production-Ready Infrastructure

---

# 👨‍💻 Author

**Gajendra Punekar**

**DevOps Engineer | AWS | Docker | GitHub Actions | Linux | FastAPI**

🌐 **Live Demo:** https://gajendra.online

☁️ **AWS ALB:** http://spotsure-alb-1360286395.ap-south-1.elb.amazonaws.com

---

