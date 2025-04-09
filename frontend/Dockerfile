FROM node:20-alpine

WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application
COPY . .

# Build the application
RUN npm run build

# Create necessary directories
RUN mkdir -p .next/static
RUN mkdir -p public

# Copy standalone output and static files
RUN cp -r .next/standalone/* ./
RUN cp -r .next/static ./.next/
RUN cp -r public ./

EXPOSE 3000

CMD ["node", "server.js"]
