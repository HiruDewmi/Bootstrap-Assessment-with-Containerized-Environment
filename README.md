# Bootstrap Web Server with Docker

This project is a simple **Bootstrap-based web page** deployed using a **Docker containerized environment**.  
It demonstrates how to build, run, and manage a lightweight web server using Docker.

---

## Project Overview

The web application is packaged inside a Docker container that serves static HTML/CSS content styled with **Bootstrap**.  
This setup ensures easy deployment and a consistent development environment.

---

## Setup Instructions

### 1. Build the Docker Image
Open a terminal inside the project folder (where your `Dockerfile` and resource files are located):

```bash
docker build -t webserver .
```

### 2. Run the Container

Start the container and map it to port 8080 on your local machine:
```bash
docker run -it --rm -d -p 8080:80 --name web webserver
```
Now open your browser and go to:
```bash
http://localhost:8080
```
You should see your Bootstrap web page running!

## Troubleshooting

### Check running containers
```bash
docker ps
```
### Access the container shell
```bash
docker exec -u 0 -it <container_id> /bin/bash
```
### Stop the container
```bash
docker stop web
```

## Folder Structure
```bash
bootstrap-docker-assignment/
│
├── Dockerfile              # Docker build instructions
├── crontab source
├── bootstrap script                  
├── Documentation.pdf                    
└── README.md               # Documentation
```

## Author

**Hiruni Dewmini**  
AI/ML Engineer | Researcher 
  
[GitHub](https://github.com/HiruDewmi) · [LinkedIn](https://www.linkedin.com/in/hiruni-udarika-dewmini/) · [ResearchGate](https://www.researchgate.net/profile/Hiruni-Dewmini)


---

*If you find this research insightful, please consider giving the repository a star on GitHub!*


