# Best-Play-Option AWS Deployment

This project is configured for deployment on AWS using EC2, RDS, and SageMaker.

## Project Structure

```
project-root/
├── backend/               # FastAPI Python backend
│   ├── main.py            # Main application file
│   ├── requirements.txt   # Python dependencies
│   └── Dockerfile         # Backend Docker configuration
├── frontend/              # Next.js frontend
│   ├── public/            # Static assets
│   ├── src/               # Source code
│   ├── package.json       # Node.js dependencies
│   ├── nginx.conf         # Nginx configuration for production
│   └── Dockerfile         # Frontend Docker configuration
├── .env.example           # Example environment variables
└── docker-compose.yml     # Docker Compose configuration
```

## Local Development

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd Best-Play-Option
   ```

2. Create a `.env` file from the example:
   ```bash
   cp .env.example .env
   ```

3. Update the `.env` file with your configuration.

4. Start the application using Docker Compose:
   ```bash
   docker-compose up --build
   ```

5. Access the application:
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:8000
