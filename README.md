# HooBank - Modern UI/UX website using React.js & Tailwind CSS

![HooBank](https://i.ibb.co/BK1Hn0x/Screenshot-2022-08-08-at-4-05-48-PM.png)

### [🌟 Become a top 1% Next.js 13 developer in only one course](https://jsmastery.pro/next13)
### [🚀 Land your dream programming job in 6 months](https://jsmastery.pro/masterclass)

### Showcase your dev skills with practical experience and land the coding career of your dreams
💻 JS Mastery Pro - https://jsmastery.pro/youtube
✅ A special YOUTUBE discount code is automatically applied!

📙 Get the Ultimate Frontend & Backend Development Roadmaps, a Complete JavaScript Cheatsheet, Portfolio Tips, and more - https://www.jsmastery.pro/links


# 🚀 Deployment (Docker + GitHub Actions CI/CD + Nginx)

This project is deployed to an **AWS EC2 instance** using **Docker**, **Nginx**, and automated via **GitHub Actions**.

## ✅ Tools & Services Used
- **Docker & Docker Compose** for containerization
- **Nginx** as a reverse proxy to expose the React app
- **GitHub Actions** for CI/CD deployment pipeline
- **AWS EC2** (Ubuntu) as the hosting server

## 📦 Docker Setup
The project uses a `docker-compose.yml` file that builds and serves the React frontend on port `3000`:

```yaml
services:
  frontend:
    build: .
    ports:
      - "3000:3000"
    restart: always
```

## 🌐 Nginx Configuration
Nginx is used to proxy external traffic on **port 80** to the internal React container on **port 3000**:

```nginx
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

## 🔄 GitHub Actions CI/CD
A GitHub Actions workflow (`.github/workflows/deploy.yml`) automatically:
- Builds the Docker container
- SSHes into the EC2 instance
- Pulls the latest code
- Rebuilds and restarts the container using Docker Compose

## 🟢 Live Deployment
The deployed site is live and accessible via the EC2 public IP:

```
http://<your-ec2-ip>
```

> **Note:** The site currently uses **HTTP** (port 80). You can upgrade to HTTPS using a free SSL certificate via [Let's Encrypt](https://letsencrypt.org/) and `certbot`.
<img width="1919" height="935" alt="image" src="https://github.com/user-attachments/assets/05e691c6-4d72-478b-9ea5-484538a64839" />
