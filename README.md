# 🚀 SpotSure Business Assignment – Production Ready AWS Deployment

A production-ready Dockerized web application deployed on AWS with automated CI/CD using GitHub Actions, Application Load Balancer, Auto Scaling Group, and a custom domain.

## 🌐 Live Demo

**Website:** https://gajendra.online

---

# 📌 Project Overview

This project demonstrates a complete DevOps deployment pipeline on AWS.

The application is containerized using Docker and automatically deployed to an AWS EC2 instance through GitHub Actions. High availability is achieved using an Application Load Balancer (ALB) and Auto Scaling Group (ASG). The application is accessible through a custom domain.

---

# 🏗️ Architecture

```
                        Internet
                            │
                            ▼
                  gajendra.online
                            │
                            ▼
              Application Load Balancer
                            │
             ┌──────────────┴──────────────┐
             ▼                             ▼
      EC2 Instance (Replica 1)      EC2 Instance (Replica 2)
          Docker Containers            Docker Containers
             ▲                             ▲
             └──────────────┬──────────────┘
                            │
                   Auto Scaling Group
             (Min:2 | Desired:2 | Max:4)
                            │
                     Launch Template
                            │
                            ▼
                           AMI
                            ▲
                            │
                 Original EC2 (t3.micro)
                     Docker + Nginx
                            ▲
                            │
                    GitHub Actions CI/CD
                            ▲
                            │
                     GitHub Repository
```

---

# 🛠️ Technologies Used

| Category | Technology |
|----------|------------|
| Cloud | AWS EC2 |
| Containerization | Docker |
| Orchestration | Docker Compose |
| CI/CD | GitHub Actions |
| Reverse Proxy | Nginx |
| Backend | FastAPI |
| Load Balancer | AWS Application Load Balancer |
| Auto Scaling | AWS Auto Scaling Group |
| Image | Amazon Machine Image (AMI) |
| Version Control | Git & GitHub |
| Operating System | Ubuntu Linux |
| Domain | Custom Domain (gajendra.online) |

---

# 🚀 Features

- Dockerized Application
- GitHub Actions CI/CD
- Automatic Deployment to AWS EC2
- Nginx Reverse Proxy
- FastAPI Backend
- Custom Domain Configuration
- Application Load Balancer
- Auto Scaling Group
- High Availability
- Production Ready Infrastructure

---

# ⚙️ CI/CD Workflow

Every push to the **main** branch automatically deploys the latest version of the application.

```
Developer
    │
    │ git push
    ▼
GitHub Repository
    │
    ▼
GitHub Actions
    │
    ▼
SSH to EC2
    │
    ▼
git pull
    │
    ▼
docker compose down
    │
    ▼
docker compose up -d --build
    │
    ▼
Application Updated
```

---

# ☁️ AWS Infrastructure

## EC2

- Ubuntu Server
- Docker Installed
- Docker Compose Installed
- Git Installed

---

## Networking

- Elastic IP
- Security Groups
- HTTP
- HTTPS
- SSH

---

## High Availability

- Application Load Balancer
- Target Group
- Health Checks
- Auto Scaling Group

---

# 🚀 Auto Scaling Configuration

| Setting | Value |
|----------|-------|
| Minimum Capacity | 2 |
| Desired Capacity | 2 |
| Maximum Capacity | 4 |

Scaling Policy

- Target Tracking
- Average CPU Utilization
- Target CPU: 70%

---

# 🌍 Domain Configuration

| Configuration | Value |
|--------------|-------|
| Domain | https://gajendra.online |
| DNS Target | http://spotsure-alb-1360286395.ap-south-1.elb.amazonaws.com/ |

---

# 📂 Project Structure

```
.
├── backend/
├── frontend/
├── nginx/
├── docker-compose.yml
├── Dockerfile
├── .github/
│   └── workflows/
│       └── deploy.yml
├── README.md
└── requirements.txt
```

---

# 🚀 Local Setup

Clone the repository

```bash
git clone https://github.com/<your-username>/<repository-name>.git
```

```bash
cd <repository-name>
```

Build the application

```bash
docker compose up --build
```

Open in browser

```
http://localhost
```

---

# 🚀 Deployment Process

The deployment process is completely automated.

1. Push code to GitHub
2. GitHub Actions starts automatically
3. Connects to AWS EC2 using SSH
4. Pulls latest source code
5. Rebuilds Docker images
6. Restarts Docker containers
7. Deploys updated application

---

# 📸 Infrastructure Flow

```
GitHub Repository
        │
        ▼
GitHub Actions
        │
        ▼
SSH using Elastic IP
        │
        ▼
Original EC2 (t3.micro)
        │
        ▼
Docker Containers
        │
        ▼
Create AMI
        │
        ▼
Launch Template
        │
        ▼
Auto Scaling Group
        │
        ▼
Application Load Balancer
        │
        ▼
gajendra.online
```

---

# 📈 Production Features

- Automated CI/CD Pipeline
- Containerized Deployment
- Zero Manual Deployment
- High Availability
- Automatic Scaling
- Load Balancing
- Health Checks
- Custom Domain
- Production Ready Infrastructure


---

# ✅ Assignment Completed

- ✔ Dockerized Application
- ✔ GitHub Actions CI/CD
- ✔ AWS EC2 Deployment
- ✔ Elastic IP Configuration
- ✔ Docker Compose
- ✔ FastAPI + Nginx
- ✔ Amazon Machine Image (AMI)
- ✔ Launch Template
- ✔ Application Load Balancer
- ✔ Auto Scaling Group
- ✔ Custom Domain Configuration
- ✔ Production Ready Deployment

---

## ⭐ If you found this project helpful, don't forget to star the repository!