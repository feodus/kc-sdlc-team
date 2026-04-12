---
name: docker-containerization
description: Application containerization using Docker. Use for creating optimized Dockerfiles, image optimization, and container management.
---

# Docker Containerization

> **Meta:** v1.0.0 | 06-04-2026

## Purpose

Skill for containerizing applications using Docker. Includes creating optimized Dockerfiles, multi-stage builds, security best practices, and container management.

## When to Use

Use this skill:
- When creating Dockerfiles from scratch
- For optimizing image sizes
- When setting up Docker Compose
- For implementing security best practices
- When working with Docker Compose in development
- For optimizing build process

## Best Practices for Dockerfile

### Example of optimized Dockerfile

```dockerfile
# Use official minimal images
FROM node:20-alpine AS builder

# Install only necessary dependencies
WORKDIR /app

# Copy only dependency files
COPY package*.json ./
RUN npm ci --only=production

# Copy source code
COPY . .

# Build application
RUN npm run build

# Final image - multi-stage
FROM node:20-alpine AS runner

# Non-root user for security
RUN addgroup -g 1001 -S appgroup && \
    adduser -u 1001 -S appuser -G appgroup

WORKDIR /app

# Copy only necessary files
COPY --from=builder --chown=appuser:appgroup /app/dist ./dist
COPY --from=builder --chown=appuser:appgroup /app/node_modules ./node_modules
COPY --from=builder --chown=appuser:appgroup /app/package*.json ./

USER appuser

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD node -e "require('http').get('http://localhost:3000/health', (r)=>process.exit(r.statusCode===200?0:1))"

CMD ["node", "dist/index.js"]
```

### Anti-patterns

```dockerfile
# ❌ Don't do this
FROM ubuntu
RUN apt-get update
RUN apt-get install -y python3 python3-pip
RUN pip install requirements.txt
COPY . /app
RUN chmod 777 /app
CMD python app.py

# ✅ Do this instead
FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN useradd -m -u 1000 appuser && chown -R appuser:appuser /app
USER appuser
CMD ["python", "app.py"]
```

## Multi-stage Builds

```dockerfile
# Stage 1: Build
FROM golang:1.21-alpine AS builder
WORKDIR /src
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o /app

# Stage 2: Final
FROM alpine:3.18
RUN apk --no-cache add ca-certificates
WORKDIR /app
COPY --from=builder /app .
USER 1000
CMD ["./app"]
```

## Docker Compose for Development

```yaml
version: '3.8'

services:
  app:
    build:
      context: .
      dockerfile: Dockerfile.dev
    ports:
      - "3000:3000"
    volumes:
      - .:/app
      - /app/node_modules
    environment:
      - NODE_ENV=development
      - DATABASE_URL=postgres://user:pass@db:5432/mydb
    depends_on:
      db:
        condition: service_healthy
      redis:
        condition: service_started

  db:
    image: postgres:15-alpine
    volumes:
      - postgres_data:/var/lib/postgresql/data
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pass
      POSTGRES_DB: mydb
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U user -d mydb"]
      interval: 5s
      timeout: 5s
      retries: 5

  redis:
    image: redis:7-alpine
    command: redis-server --appendonly yes
    volumes:
      - redis_data:/data

  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
    volumes:
      - ./nginx.conf:/etc/nginx/conf.d/default.conf
    depends_on:
      - app

volumes:
  postgres_data:
  redis_data:
```

## Security Best Practices

### Dockerfile Security

```dockerfile
# Don't use latest tag
FROM node:20-alpine

# Use specific versions
FROM node:20.10.0-alpine3.19

# Vulnerability scanning
# RUN pip install --no-cache-dir pip-audit

# Don't store secrets in image
# Use build args or mounts instead

# Read-only file system
# HEALTHCHECK only for health checks

# Image scanning
# docker scout cves myimage:latest
```

### Docker Security flags

```bash
# Run in read-only mode
docker run --read-only myimage

# Limit resources
docker run --memory=512m --cpus=0.5 myimage

# Drop all capabilities
docker run --cap-drop all myimage

# Specific capabilities
docker run --cap-add NET_ADMIN myimage

# Seccomp profile
docker run --security-opt seccomp=default.json myimage
```

## Image Optimization

### Size

| Technique | Example |
|-----------|---------|
| Multi-stage builds | Use only necessary artifacts |
| Alpine images | `node:20-alpine` instead of `node:20` |
| .dockerignore | Exclude node_modules, git |
| --mount=type=cache | Package caching |
| Parallel installation | npm ci --prefer-offline |

### .dockerignore

```
# Git
.git
.gitignore

# IDE
.idea
.vscode
*.swp
*.swo

# Dependencies
node_modules
bower_components

# Build
dist
build
*.log
npm-debug.log*

# Environment
.env
.env.local
.env.*.local

# Test
coverage
.nyc_output

# Docs
README.md
docs/
```

## Docker Registry

### Push/Pull

```bash
# Tags and versions
docker build -t myapp:v1.0.0 .
docker build -t myapp:latest .

# Push
docker push myapp:latest

# Pull
docker pull myapp:latest

# Pull with specific registry
docker push registry.example.com/myapp:latest
```

### Docker Compose with registry

```yaml
services:
  app:
    image: registry.example.com/myapp:${VERSION:-latest}
    build: .
```

## Container Monitoring

### Healthchecks

```dockerfile
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:3000/health || exit 1
```

### Logs

```bash
# View logs
docker logs -f container_name
docker logs --tail 100 container_name

# Logs in JSON format
docker run --log-driver=json-file myimage
```

## Quality Criteria

- [ ] Images are minimal
- [ ] Multi-stage used
- [ ] Security best practices followed
- [ ] .dockerignore configured
- [ ] Healthcheck added
- [ ] Non-root user
- [ ] Tags are informative
- [ ] Vulnerability scanning
