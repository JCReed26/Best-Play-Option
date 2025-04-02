# Docker Setup for BPO Game

This document provides instructions for running the BPO Game application using Docker, which allows for consistent environments across different systems.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Development Environment

To run the application in development mode with hot reloading:

```bash
# Start the development server
docker-compose up

# Or run in detached mode
docker-compose up -d

# View logs if running in detached mode
docker-compose logs -f

# Stop the containers
docker-compose down
```

The application will be available at http://localhost:3000.

## Production Environment

To build and run the application in production mode:

```bash
# Build the production image
docker build -t bpo-game .

# Run the container
docker run -p 3000:3000 bpo-game
```

The production build will be available at http://localhost:3000.

## Docker Files

- `Dockerfile.dev`: Used for development environment
- `Dockerfile`: Used for production environment
- `docker-compose.yml`: Configuration for the development environment
- `.dockerignore`: Specifies files to exclude from the Docker build context

## Volumes

The development setup uses volumes to enable hot reloading:

- `./:/app`: Mounts the project directory to the container
- `/app/node_modules`: Preserves the node_modules directory in the container
- `/app/.next`: Preserves the Next.js build cache

## Environment Variables

You can add environment variables in the `docker-compose.yml` file:

```yaml
environment:
  - NODE_ENV=development
  - ANOTHER_VARIABLE=value
```

For production, you can pass environment variables when running the container:

```bash
docker run -p 3000:3000 -e NODE_ENV=production -e ANOTHER_VARIABLE=value bpo-game
```
