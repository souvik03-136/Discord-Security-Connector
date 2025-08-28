param([string]$environment = "staging")
Write-Host "Deploying to $environment environment"

# Pull latest image
docker pull $env:DOCKERHUB_USERNAME/discord-security-connector:latest

# Stop and remove existing container
docker stop discord-security-connector; docker rm discord-security-connector

# Run new container
docker run -d `
  --name discord-security-connector `
  -p 8080:8080 `
  --env-file .env `
  $env:DOCKERHUB_USERNAME/discord-security-connector:latest